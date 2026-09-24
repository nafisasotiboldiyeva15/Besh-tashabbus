import { DatabaseSchema, User, Club, ScheduleSlot, Session, Membership, Report, AnnualReport, Submission, FileItem, FileMeta, AppNotification, Role } from '../types';
import { CATEGORIES } from './i18n';
import { generateSeedData } from './seedData';

const LS_KEY = 'besh_tashabbus_nsifl_db_v4';

export function uid(prefix: string = 'id'): string {
  return `${prefix}_${Math.random().toString(16).slice(2, 9)}_${Date.now().toString(16).slice(-5)}`;
}

export function nowISO(): string {
  return new Date().toISOString();
}

export function pad2(n: number): string {
  return (n < 10 ? '0' : '') + n;
}

export function ymd(d: Date): string {
  return `${d.getFullYear()}-${pad2(d.getMonth() + 1)}-${pad2(d.getDate())}`;
}

export function parseYMD(s: string): Date | null {
  const m = /^(\d{4})-(\d{2})-(\d{2})$/.exec(s || '');
  return m ? new Date(+m[1], +m[2] - 1, +m[3]) : null;
}

export function weekdayOf(s: string): number {
  const d = parseYMD(s);
  return d ? (d.getDay() || 7) : 0;
}

export function fmtD(s: string): string {
  const d = parseYMD(s);
  return d ? `${pad2(d.getDate())}.${pad2(d.getMonth() + 1)}.${d.getFullYear()}` : '—';
}

function liteHash(s: string): string {
  let h = 5381;
  const str = String(s);
  for (let i = 0; i < str.length; i++) {
    h = ((h << 5) + h) ^ str.charCodeAt(i);
  }
  return 'h' + (h >>> 0).toString(16);
}

// Initial data with authentic 5 muhim tashabbus clubs for NamDChTI
function seedInitialData(): DatabaseSchema {
  return generateSeedData();
}

export function calculateSlotDates(slot: { weekday: number; startDate: string; endDate: string }): string[] {
  const a = parseYMD(slot.startDate);
  const b = parseYMD(slot.endDate);
  if (!a || !b || b < a || !(slot.weekday >= 1 && slot.weekday <= 7)) return [];
  const d = new Date(a);
  d.setDate(d.getDate() + (((slot.weekday - (d.getDay() || 7)) + 7) % 7));
  const out: string[] = [];
  while (d <= b && out.length < 60) {
    out.push(ymd(d));
    d.setDate(d.getDate() + 7);
  }
  return out;
}

class StorageManager {
  private db: DatabaseSchema;
  private subscribers: Array<() => void> = [];
  private isSyncing = false;
  private lastServerHash = '';
  private pollInterval: any = null;

  constructor() {
    this.db = this.load();
    this.initSync();
  }

  public subscribe(callback: () => void): () => void {
    this.subscribers.push(callback);
    return () => {
      this.subscribers = this.subscribers.filter((cb) => cb !== callback);
    };
  }

  public notifySubscribers(): void {
    this.subscribers.forEach((cb) => {
      try {
        cb();
      } catch (e) {
        console.error('Subscriber callback error:', e);
      }
    });
  }

  private computeHash(d: DatabaseSchema): string {
    if (!d) return '';
    const uStr = (d.users || []).map((u) => `${u.id}:${u.username}:${u.password}:${u.active}`).join(',');
    const cStr = (d.clubs || []).map((c) => `${c.id}:${c.statuteStatus}:${c.statuteFileId}:${c.statuteFile?.name || ''}:${c.adminComment || ''}`).join(',');
    const fCount = (d.files || []).length;
    const sCount = (d.sessions || []).length;
    const rCount = (d.reports || []).length;
    const arCount = (d.annualReports || []).length;
    const subCount = (d.submissions || []).length;
    const mCount = (d.memberships || []).length;
    const notifCount = (d.notifications || []).map((n) => `${n.id}:${n.read}`).join(',');
    return `${uStr}##${cStr}##${fCount}##${sCount}##${rCount}##${arCount}##${subCount}##${mCount}##${notifCount}`;
  }

  private mergeDatabases(local: DatabaseSchema, remote: DatabaseSchema): DatabaseSchema {
    if (!remote || !Array.isArray(remote.users)) return local;
    if (!local || !Array.isArray(local.users)) return remote;

    // Users
    const userMap = new Map<string, User>();
    (remote.users || []).forEach((u) => userMap.set(u.id, u));
    (local.users || []).forEach((u) => {
      if (!userMap.has(u.id)) userMap.set(u.id, u);
    });

    // Clubs - remote approved/rejected statuses have absolute priority over pending
    const clubMap = new Map<string, Club>();
    (remote.clubs || []).forEach((c) => clubMap.set(c.id, { ...c }));
    (local.clubs || []).forEach((c) => {
      if (!clubMap.has(c.id)) {
        clubMap.set(c.id, c);
      } else {
        const remClub = clubMap.get(c.id)!;
        // Never revert an approved or rejected statute back to pending
        if (remClub.statuteStatus === 'approved' || remClub.statuteStatus === 'rejected') {
          // Keep remote status
        } else if (c.statuteStatus === 'approved' || c.statuteStatus === 'rejected') {
          remClub.statuteStatus = c.statuteStatus;
          remClub.adminComment = c.adminComment;
          remClub.statuteReviewedAt = c.statuteReviewedAt;
        }

        if (!remClub.statuteFileId && c.statuteFileId) {
          remClub.statuteFileId = c.statuteFileId;
          remClub.statuteFile = c.statuteFile;
        }
        if (!remClub.room && c.room) remClub.room = c.room;
        if (!remClub.weekdays && c.weekdays) remClub.weekdays = c.weekdays;
        if (!remClub.timeStart && c.timeStart) remClub.timeStart = c.timeStart;
        if (!remClub.timeEnd && c.timeEnd) remClub.timeEnd = c.timeEnd;
      }
    });

    const mergedDeletedClubIds = Array.from(new Set([
      ...(Array.isArray(local._deletedClubIds) ? local._deletedClubIds : []),
      ...(Array.isArray(remote._deletedClubIds) ? remote._deletedClubIds : []),
    ]));
    mergedDeletedClubIds.forEach((id: string) => clubMap.delete(id));
    const isDeletedClub = (clubId?: string) => clubId && mergedDeletedClubIds.includes(clubId);

    // Files
    const fileMap = new Map<string, FileItem>();
    (remote.files || []).forEach((f) => fileMap.set(f.id, f));
    (local.files || []).forEach((f) => {
      if (!fileMap.has(f.id)) {
        fileMap.set(f.id, f);
      } else {
        const remFile = fileMap.get(f.id)!;
        if (!remFile.data && f.data) {
          remFile.data = f.data;
        }
      }
    });

    // Sessions
    const sessionMap = new Map<string, Session>();
    (remote.sessions || []).forEach((s) => {
      if (!isDeletedClub(s.clubId)) sessionMap.set(s.id, s);
    });
    (local.sessions || []).forEach((s) => {
      if (!isDeletedClub(s.clubId) && !sessionMap.has(s.id)) sessionMap.set(s.id, s);
    });

    // Schedules
    const scheduleMap = new Map<string, ScheduleSlot>();
    (remote.schedules || []).forEach((s) => {
      if (!isDeletedClub(s.clubId)) scheduleMap.set(s.id, s);
    });
    (local.schedules || []).forEach((s) => {
      if (!isDeletedClub(s.clubId) && !scheduleMap.has(s.id)) scheduleMap.set(s.id, s);
    });

    // Memberships
    const membershipMap = new Map<string, Membership>();
    (remote.memberships || []).forEach((m) => {
      if (!isDeletedClub(m.clubId)) membershipMap.set(m.id, m);
    });
    (local.memberships || []).forEach((m) => {
      if (!isDeletedClub(m.clubId)) {
        if (!membershipMap.has(m.id)) {
          membershipMap.set(m.id, m);
        } else if (m.status === 'approved') {
          membershipMap.get(m.id)!.status = 'approved';
        }
      }
    });

    // Reports
    const reportMap = new Map<string, Report>();
    (remote.reports || []).forEach((r) => {
      if (!isDeletedClub(r.clubId)) reportMap.set(r.id, r);
    });
    (local.reports || []).forEach((r) => {
      if (!isDeletedClub(r.clubId) && !reportMap.has(r.id)) reportMap.set(r.id, r);
    });

    // Annual Reports
    const annualMap = new Map<string, AnnualReport>();
    (remote.annualReports || []).forEach((r) => {
      if (!isDeletedClub(r.clubId)) annualMap.set(r.id, r);
    });
    (local.annualReports || []).forEach((r) => {
      if (!isDeletedClub(r.clubId) && !annualMap.has(r.id)) annualMap.set(r.id, r);
    });

    // Submissions
    const subMap = new Map<string, Submission>();
    (remote.submissions || []).forEach((s) => {
      if (!isDeletedClub(s.clubId)) subMap.set(s.id, s);
    });
    (local.submissions || []).forEach((s) => {
      if (!isDeletedClub(s.clubId) && !subMap.has(s.id)) subMap.set(s.id, s);
    });

    // Notifications
    const notifMap = new Map<string, AppNotification>();
    (remote.notifications || []).forEach((n) => notifMap.set(n.id, n));
    (local.notifications || []).forEach((n) => {
      if (!notifMap.has(n.id)) {
        notifMap.set(n.id, n);
      } else {
        const remN = notifMap.get(n.id)!;
        if (n.read) remN.read = true;
      }
    });

    // Tokens
    const tokens = { ...(local.tokens || {}), ...(remote.tokens || {}) };

    return {
      users: Array.from(userMap.values()),
      clubs: Array.from(clubMap.values()),
      sessions: Array.from(sessionMap.values()),
      schedules: Array.from(scheduleMap.values()),
      memberships: Array.from(membershipMap.values()),
      reports: Array.from(reportMap.values()),
      annualReports: Array.from(annualMap.values()),
      submissions: Array.from(subMap.values()),
      files: Array.from(fileMap.values()),
      notifications: Array.from(notifMap.values()),
      tokens,
      _serverUpdatedAt: remote._serverUpdatedAt || new Date().toISOString(),
      _deletedClubIds: mergedDeletedClubIds,
    };
  }

  private async initSync(): Promise<void> {
    await this.syncWithServer();

    // Start background sync polling every 3 seconds for instant multi-device sync
    if (typeof window !== 'undefined' && !this.pollInterval) {
      this.pollInterval = setInterval(() => {
        this.pollServer();
      }, 3000);

      window.addEventListener('focus', () => {
        this.pollServer();
      });

      window.addEventListener('online', () => {
        this.pollServer();
      });
    }
  }

  public async syncWithServer(): Promise<boolean> {
    if (this.isSyncing) return false;
    this.isSyncing = true;
    try {
      // Push local data to server for merging, and receive full merged DB
      const res = await fetch('/api/sync', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(this.db),
      });
      if (res.ok) {
        const json = await res.json();
        if (json && json.db && Array.isArray(json.db.users)) {
          this.db = json.db;
          this.saveLocal();
          this.lastServerHash = this.computeHash(this.db);
          this.notifySubscribers();
          return true;
        }
      }

      // Fallback: GET /api/data
      const getRes = await fetch('/api/data');
      if (getRes.ok) {
        const serverData: DatabaseSchema | null = await getRes.json();
        if (serverData && typeof serverData === 'object' && Array.isArray(serverData.users)) {
          this.db = this.mergeDatabases(this.db, serverData);
          this.saveLocal();
          this.lastServerHash = this.computeHash(this.db);
          this.notifySubscribers();
          return true;
        }
      }
      return false;
    } catch (e) {
      console.warn('[Sync] Server sync unavailable, using local cache:', e);
      return false;
    } finally {
      this.isSyncing = false;
    }
  }

  public async forceSync(): Promise<boolean> {
    return this.syncWithServer();
  }

  public async pollServer(): Promise<void> {
    if (this.isSyncing) return;
    try {
      const res = await fetch('/api/data');
      if (!res.ok) return;
      const serverData: DatabaseSchema | null = await res.json();
      if (!serverData || !Array.isArray(serverData.users)) return;

      const newHash = this.computeHash(serverData);
      const currentHash = this.computeHash(this.db);

      if (newHash !== currentHash && newHash !== this.lastServerHash) {
        console.log('[Sync] New changes received from server, updating...');
        this.db = this.mergeDatabases(this.db, serverData);
        this.lastServerHash = newHash;
        this.saveLocal();
        this.notifySubscribers();
      }
    } catch {
      // ignore network errors
    }
  }

  private saveLocal(): void {
    try {
      localStorage.setItem(LS_KEY, JSON.stringify(this.db));
    } catch (e) {
      try {
        // Fallback for quota issues: remove heavy base64 strings from localStorage
        const lightDb = {
          ...this.db,
          files: (this.db.files || []).map((f) => ({
            ...f,
            data: f.data && f.data.length > 30000 ? '' : f.data,
          })),
        };
        localStorage.setItem(LS_KEY, JSON.stringify(lightDb));
      } catch (err2) {
        console.warn('LocalStorage save failed:', err2);
      }
    }
  }

  private async postToServer(): Promise<void> {
    try {
      const res = await fetch('/api/sync', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(this.db),
      });
      if (res.ok) {
        const json = await res.json();
        if (json && json.db && Array.isArray(json.db.users)) {
          this.db = json.db;
          this.saveLocal();
          this.lastServerHash = this.computeHash(this.db);
          this.notifySubscribers();
          return;
        }
      }
      this.lastServerHash = this.computeHash(this.db);
    } catch (e) {
      console.warn('[Sync] Failed to post to /api/sync:', e);
    }
  }

  public save(): boolean {
    this.saveLocal();
    this.postToServer();
    this.notifySubscribers();
    return true;
  }

  private load(): DatabaseSchema {
    try {
      // Clear legacy demo databases
      ['besh_tashabbus_nsifl_db_v1', 'besh_tashabbus_nsifl_db_v2', 'besh_tashabbus_nsifl_db_v3'].forEach((k) => {
        try { localStorage.removeItem(k); } catch {}
      });

      const raw = localStorage.getItem(LS_KEY);
      if (raw) {
        const parsed: DatabaseSchema = JSON.parse(raw);
        if (parsed.users && Array.isArray(parsed.users) && parsed.clubs && Array.isArray(parsed.clubs)) {
          // Remove all old demo accounts
          parsed.users = parsed.users.filter(
            (u) =>
              u.username !== 'rahbar1' &&
              u.username !== 'talaba1' &&
              !u.fullName.toLowerCase().includes('ergashev') &&
              !u.fullName.toLowerCase().includes('dotsent')
          );

          // Update admin profile to Hamidulla Abdualiyev
          const adminUser = parsed.users.find((u) => u.role === 'admin' || u.username === 'admin');
          if (adminUser) {
            adminUser.fullName = 'Hamidulla Abdualiyev';
            adminUser.username = 'admin';
            adminUser.faculty = 'Institut Maʼmuriyati';
            adminUser.groupName = 'Yoshlar bilan ishlash bo‘limi';
          } else {
            parsed.users.unshift({
              id: 'u_admin_001',
              username: 'admin',
              password: liteHash('admin123'),
              fullName: 'Hamidulla Abdualiyev',
              role: 'admin',
              faculty: 'Institut Maʼmuriyati',
              groupName: 'Yoshlar bilan ishlash bo‘limi',
              clubId: null,
              active: true,
              createdAt: nowISO(),
            });
          }

          // Ensure 5 tashabbus clubs exist if clubs list is empty
          if (!parsed.clubs || parsed.clubs.length === 0) {
            const seed = generateSeedData();
            parsed.clubs = seed.clubs;
            parsed.schedules = seed.schedules;
            parsed.sessions = seed.sessions;
            parsed.memberships = seed.memberships;
            parsed.reports = seed.reports;

            // Merge seed users
            const existingUnameMap = new Set(parsed.users.map((u) => u.username));
            seed.users.forEach((su) => {
              if (!existingUnameMap.has(su.username)) {
                parsed.users.push(su);
              }
            });
          } else {
            // Ensure all seed leaders and students exist in users
            const seed = generateSeedData();
            const existingUnameMap = new Set(parsed.users.map((u) => u.username));
            seed.users.forEach((su) => {
              if (!existingUnameMap.has(su.username)) {
                parsed.users.push(su);
              }
            });
          }

          if (!parsed.annualReports) parsed.annualReports = [];
          if (!parsed.submissions) parsed.submissions = [];
          if (!parsed.files) parsed.files = [];
          if (!parsed.tokens) parsed.tokens = {};

          return parsed;
        }
      }
    } catch {
      // ignore
    }
    const initial = seedInitialData();
    try {
      localStorage.setItem(LS_KEY, JSON.stringify(initial));
    } catch {
      // ignore
    }
    return initial;
  }

  public getDB(): DatabaseSchema {
    return this.db;
  }

  public setDB(newDb: DatabaseSchema): boolean {
    this.db = newDb;
    return this.save();
  }

  // --- Auth ---
  public login(username: string, pass: string): { user: User; token: string } {
    const usr = this.db.users.find((x) => x.username.toLowerCase() === username.trim().toLowerCase());
    if (!usr || usr.password !== liteHash(pass)) {
      throw new Error('Login yoki parol noto‘g‘ri.');
    }
    if (!usr.active) {
      throw new Error('Hisobingiz administrator tomonidan bloklangan.');
    }
    const token = uid('token');
    this.db.tokens[token] = usr.id;
    this.save();
    return { user: usr, token };
  }

  public register(data: {
    username: string;
    password: string;
    fullName: string;
    role: 'leader' | 'student';
    faculty?: string;
    groupName?: string;
  }): User {
    const uname = data.username.trim().toLowerCase();
    if (!uname || !data.password) {
      throw new Error('Majburiy maydonlar to‘ldirilmagan.');
    }
    if (this.db.users.some((x) => x.username.toLowerCase() === uname)) {
      throw new Error('Bu login allaqachon ro‘yxatdan o‘tgan.');
    }
    const newUser: User = {
      id: uid('u'),
      username: uname,
      password: liteHash(data.password),
      fullName: data.fullName.trim() || uname,
      role: data.role,
      faculty: data.faculty?.trim() || '',
      groupName: data.groupName?.trim() || '',
      clubId: null,
      active: true,
      createdAt: nowISO(),
    };
    this.db.users.push(newUser);
    this.save();
    return newUser;
  }

  public getUserByToken(token: string): User | null {
    if (!token) return null;
    const userId = this.db.tokens[token];
    if (!userId) return null;
    const u = this.db.users.find((x) => x.id === userId);
    return u || null;
  }

  public logout(token: string): void {
    if (this.db.tokens[token]) {
      delete this.db.tokens[token];
      this.save();
    }
  }

  public createUserByAdmin(data: {
    username: string;
    password: string;
    fullName: string;
    role: Role;
    faculty?: string;
    groupName?: string;
  }): User {
    const uname = data.username.trim().toLowerCase();
    if (!uname || !data.password) {
      throw new Error('Login va parol kiritilishi shart.');
    }
    if (this.db.users.some((x) => x.username.toLowerCase() === uname)) {
      throw new Error('Bu login nomi allaqachon ro‘yxatdan o‘tgan.');
    }
    const newUser: User = {
      id: uid('u'),
      username: uname,
      password: liteHash(data.password),
      fullName: data.fullName.trim() || uname,
      role: data.role,
      faculty: data.faculty?.trim() || '',
      groupName: data.groupName?.trim() || '',
      clubId: null,
      active: true,
      createdAt: nowISO(),
    };
    this.db.users.push(newUser);
    this.save();
    return newUser;
  }

  public resetOrSeed5TashabbusClubs(): { addedClubs: number; addedUsers: number } {
    const seed = generateSeedData();
    let addedClubs = 0;
    let addedUsers = 0;

    const existingClubIds = new Set(this.db.clubs.map((c) => c.id));
    const existingClubNames = new Set(this.db.clubs.map((c) => c.name.toLowerCase()));
    seed.clubs.forEach((sc) => {
      if (!existingClubIds.has(sc.id) && !existingClubNames.has(sc.name.toLowerCase())) {
        this.db.clubs.push(sc);
        addedClubs++;
      }
    });

    const existingSlotIds = new Set((this.db.schedules || []).map((s) => s.id));
    seed.schedules.forEach((ss) => {
      if (!existingSlotIds.has(ss.id)) {
        if (!this.db.schedules) this.db.schedules = [];
        this.db.schedules.push(ss);
      }
    });

    const existingSessionIds = new Set((this.db.sessions || []).map((s) => s.id));
    seed.sessions.forEach((se) => {
      if (!existingSessionIds.has(se.id)) {
        if (!this.db.sessions) this.db.sessions = [];
        this.db.sessions.push(se);
      }
    });

    const existingUsernames = new Set(this.db.users.map((u) => u.username.toLowerCase()));
    seed.users.forEach((su) => {
      if (!existingUsernames.has(su.username.toLowerCase())) {
        this.db.users.push(su);
        addedUsers++;
      }
    });

    const existingMembershipIds = new Set((this.db.memberships || []).map((m) => m.id));
    seed.memberships.forEach((sm) => {
      if (!existingMembershipIds.has(sm.id)) {
        if (!this.db.memberships) this.db.memberships = [];
        this.db.memberships.push(sm);
      }
    });

    this.save();
    this.notifySubscribers();
    return { addedClubs, addedUsers };
  }

  public updateUserPassword(userId: string, newPass: string): void {
    const user = this.db.users.find((x) => x.id === userId);
    if (!user) throw new Error('Foydalanuvchi topilmadi');
    if (!newPass || newPass.trim().length < 4) {
      throw new Error('Parol kamida 4 ta belgidan iborat bo‘lishi kerak');
    }
    user.password = liteHash(newPass.trim());
    this.save();
  }

  public updateAdminCredentials(newUsername: string, newPass?: string): void {
    const admin = this.db.users.find((x) => x.role === 'admin');
    if (!admin) throw new Error('Admin foydalanuvchisi topilmadi');
    const cleanUname = newUsername.trim().toLowerCase();
    if (cleanUname) {
      const clash = this.db.users.find((x) => x.id !== admin.id && x.username.toLowerCase() === cleanUname);
      if (clash) throw new Error('Ushbu login nomi allaqachon band');
      admin.username = cleanUname;
    }
    if (newPass && newPass.trim().length >= 4) {
      admin.password = liteHash(newPass.trim());
    }
    this.save();
  }

  // --- Files ---
  public storeFile(fileData: { name: string; mime: string; data: string }, ownerId?: string): string {
    const fId = uid('f');
    const size = Math.floor((fileData.data.length - fileData.data.indexOf(',') - 1) * (3 / 4));
    const item: FileItem = {
      id: fId,
      name: fileData.name || 'fayl',
      mime: fileData.mime || 'application/octet-stream',
      size: size > 0 ? size : fileData.data.length,
      data: fileData.data,
      owner: ownerId || null,
      createdAt: nowISO(),
    };
    this.db.files.push(item);
    this.save();
    return fId;
  }

  public getFileMeta(fileId: string | null | undefined): FileMeta | null {
    if (!fileId) return null;
    const f = this.db.files.find((x) => x.id === fileId);
    if (!f) return null;
    return {
      id: f.id,
      name: f.name,
      mime: f.mime,
      size: f.size,
      url: f.data,
      createdAt: f.createdAt,
    };
  }

  // --- Clubs ---
  public getClubs(leaderId?: string): Club[] {
    let list = this.db.clubs;
    if (leaderId) {
      list = list.filter((c) => c.leaderId === leaderId);
    }
    return list.map((c) => this.enrichClub(c));
  }

  public getClubById(id: string): Club | null {
    const c = this.db.clubs.find((x) => x.id === id);
    return c ? this.enrichClub(c) : null;
  }

  public createClub(data: {
    name: string;
    category: string;
    description: string;
    faculty: string;
    leaderId: string;
    room?: string;
    startDate?: string;
    endDate?: string;
    weekdays?: number[];
    timeStart?: string;
    timeEnd?: string;
    statuteFile?: { name: string; mime: string; data: string };
    statuteStatus?: 'pending' | 'approved' | 'rejected';
    adminComment?: string;
  }): Club {
    const statuteFileId = data.statuteFile ? this.storeFile(data.statuteFile, data.leaderId) : null;
    const clubId = uid('c');
    const newClub: Club = {
      id: clubId,
      name: data.name.trim(),
      category: data.category,
      description: data.description.trim(),
      faculty: data.faculty.trim(),
      leaderId: data.leaderId,
      room: data.room?.trim() || '',
      startDate: data.startDate || '',
      endDate: data.endDate || '',
      weekdays: data.weekdays || [],
      timeStart: data.timeStart || '',
      timeEnd: data.timeEnd || '',
      statuteFileId,
      statuteStatus: data.statuteStatus || (statuteFileId ? 'pending' : 'pending'),
      adminComment: data.adminComment || '',
      statuteReviewedAt: data.statuteStatus === 'approved' ? nowISO() : undefined,
      createdAt: nowISO(),
    };
    this.db.clubs.push(newClub);

    // Link leader's default club
    const leader = this.db.users.find((u) => u.id === data.leaderId);
    if (leader && !leader.clubId) {
      leader.clubId = newClub.id;
    }

    // If schedule details are provided upon creation, automatically generate schedule slots and sessions!
    if (data.weekdays && data.weekdays.length > 0 && data.startDate && data.endDate && data.timeStart) {
      data.weekdays.forEach((day) => {
        const slot: ScheduleSlot = {
          id: uid('slot'),
          clubId,
          weekday: day,
          timeStart: data.timeStart || '15:00',
          timeEnd: data.timeEnd || '16:30',
          room: data.room || '204-auditoriya',
          startDate: data.startDate!,
          endDate: data.endDate!,
          createdAt: nowISO(),
        };
        this.db.schedules.push(slot);

        // Generate sessions for this slot
        const dates = calculateSlotDates(slot);
        dates.forEach((dStr, idx) => {
          this.db.sessions.push({
            id: uid('ses'),
            clubId,
            slotId: slot.id,
            topic: `${newClub.name}: ${idx + 1}-amaliy mashg‘ulot`,
            date: dStr,
            time: slot.timeStart,
            timeEnd: slot.timeEnd,
            location: slot.room,
            status: 'planned',
            heldNote: '',
            createdAt: nowISO(),
          });
        });
      });
    }

    this.save();
    return this.enrichClub(newClub);
  }

  public uploadStatute(clubId: string, file: { name: string; mime: string; data: string }, ownerId: string): Club {
    const c = this.db.clubs.find((x) => x.id === clubId);
    if (!c) throw new Error('To‘garak topilmadi.');
    c.statuteFileId = this.storeFile(file, ownerId);
    c.statuteStatus = 'pending';
    c.adminComment = '';
    this.save();
    return this.enrichClub(c);
  }

  public reviewStatute(clubId: string, status: 'approved' | 'rejected', comment: string, reviewerName?: string): Club {
    const c = this.db.clubs.find((x) => x.id === clubId);
    if (!c) throw new Error('To‘garak topilmadi.');
    c.statuteStatus = status;
    c.adminComment = comment.trim();
    c.statuteReviewedAt = new Date().toISOString();

    // Create in-app notification for the club leader
    const isApproved = status === 'approved';
    if (c.leaderId) {
      this.addNotification({
        userId: c.leaderId,
        targetRole: 'leader',
        title: isApproved ? '🎉 To‘garagingiz tasdiqlandi!' : '⚠️ To‘garak nizomi qaytarildi',
        message: isApproved
          ? `Tabriklaymiz! Sizning «${c.name}» to‘garagingiz va nizomi institut Bosh admini (${reviewerName || 'Hamidulla Abdualiyev'}) tomonidan rasman tasdiqlandi. Endi mashg‘ulotlarni o‘tkazishingiz va talabalarni qabul qilishingiz mumkin.${comment ? ` Admin izohi: "${comment}"` : ''}`
          : `Sizning «${c.name}» to‘garagingiz nizomi bo‘yicha kamchiliklar ko‘rsatildi.${comment ? ` Izoh: "${comment}"` : ''}`,
        type: isApproved ? 'success' : 'warning',
        linkTab: 'myClubs',
        clubId: c.id,
      });
    }

    // Create notifications for students!
    if (isApproved) {
      // Broadcast to students
      this.addNotification({
        userId: 'students',
        targetRole: 'student',
        title: `📢 Yangi to‘garak tasdiqlandi: «${c.name}»`,
        message: `Institutda «${c.name}» to‘garagi rasman tasdiqlandi! To‘garak rahbari: ${c.leaderName || 'Ustoz'}. Mashg‘ulotlar dars jadvaliga muvofiq o‘tkaziladi. Talabalar qabuli ochiq!`,
        type: 'info',
        linkTab: 'browse',
        clubId: c.id,
      });

      // Also specifically notify any students who already submitted an application to this club
      const applicants = this.db.memberships.filter((m) => m.clubId === c.id);
      applicants.forEach((m) => {
        this.addNotification({
          userId: m.studentId,
          targetRole: 'student',
          title: `🎉 «${c.name}» to‘garagi tasdiqlandi!`,
          message: `Siz ariza topshirgan «${c.name}» to‘garagi Bosh admin tomonidan tasdiqlandi va faoliyatini boshladi!`,
          type: 'success',
          linkTab: 'browse',
          clubId: c.id,
        });
      });
    }

    this.save();

    // Fire direct API review for instantaneous server update
    try {
      fetch('/api/clubs/review', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          clubId,
          status,
          comment,
          reviewerName,
        }),
      }).catch((e) => console.warn('[ReviewStatute] Server sync warning:', e));
    } catch {
      // ignore
    }

    return this.enrichClub(c);
  }

  public deleteClub(clubId: string, reason?: string, adminName: string = 'Hamidulla Abdualiyev'): boolean {
    const clubIndex = this.db.clubs.findIndex((c) => c.id === clubId);
    if (clubIndex === -1) return false;

    const club = this.db.clubs[clubIndex];
    this.db.clubs.splice(clubIndex, 1);

    if (!Array.isArray(this.db._deletedClubIds)) {
      this.db._deletedClubIds = [];
    }
    if (!this.db._deletedClubIds.includes(clubId)) {
      this.db._deletedClubIds.push(clubId);
    }

    // Clean up dependent resources
    this.db.schedules = (this.db.schedules || []).filter((s) => s.clubId !== clubId);
    this.db.sessions = (this.db.sessions || []).filter((s) => s.clubId !== clubId);
    this.db.memberships = (this.db.memberships || []).filter((m) => m.clubId !== clubId);
    this.db.reports = (this.db.reports || []).filter((r) => r.clubId !== clubId);
    this.db.annualReports = (this.db.annualReports || []).filter((a) => a.clubId !== clubId);
    this.db.submissions = (this.db.submissions || []).filter((s) => s.clubId !== clubId);

    (this.db.users || []).forEach((u) => {
      if (u.clubId === clubId) {
        u.clubId = null;
      }
    });

    // Notify leader if exists
    if (club.leaderId) {
      this.addNotification({
        userId: club.leaderId,
        targetRole: 'leader',
        title: `🗑️ «${club.name}» to‘garagi o‘chirildi`,
        message: `Sizning «${club.name}» to‘garagingiz Bosh admin (${adminName}) tomonidan tizimdan butunlay o‘chirib tashlandi.${reason ? ` Sabab: "${reason}"` : ''}`,
        type: 'warning',
        linkTab: 'myClubs',
      });
    }

    this.save();

    // Call server API for immediate multi-device propagation
    try {
      fetch('/api/clubs/delete', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          clubId,
          reason,
          adminName,
        }),
      }).catch((e) => console.warn('[deleteClub] Server sync error:', e));
    } catch {
      // ignore
    }

    return true;
  }

  public deleteAllRejectedClubs(adminName: string = 'Hamidulla Abdualiyev'): number {
    const rejected = this.db.clubs.filter((c) => c.statuteStatus === 'rejected');
    const count = rejected.length;
    rejected.forEach((c) => {
      this.deleteClub(c.id, 'Rad etilgan to‘garak tizimdan butunlay o‘chirildi', adminName);
    });
    return count;
  }

  public enrichClub(c: Club): Club {
    const leader = this.db.users.find((u) => u.id === c.leaderId);
    const cat = CATEGORIES.find((cat) => cat.id === c.category);
    const statuteFile = this.getFileMeta(c.statuteFileId);
    const memberCount = this.db.memberships.filter((m) => m.clubId === c.id && m.status === 'approved').length;
    const sessionCount = this.db.sessions.filter((s) => s.clubId === c.id).length;
    const heldSessionCount = this.db.sessions.filter((s) => s.clubId === c.id && s.status === 'held').length;
    const photoCount = this.db.sessions.filter((s) => s.clubId === c.id && s.photoFileId).length;

    return {
      ...c,
      leaderName: leader?.fullName || 'Nomaʼlum',
      categoryName_uz: cat?.name_uz || c.category,
      categoryName_ru: cat?.name_ru || c.category,
      categoryBall: cat?.ball || 10,
      statuteFile,
      memberCount,
      sessionCount,
      heldSessionCount,
      photoCount,
    };
  }

  // --- Schedules (Slots) ---
  public getSchedules(clubId?: string, leaderId?: string): ScheduleSlot[] {
    let list = this.db.schedules;
    if (clubId) {
      list = list.filter((s) => s.clubId === clubId);
    } else if (leaderId) {
      const leaderClubs = this.db.clubs.filter((c) => c.leaderId === leaderId).map((c) => c.id);
      list = list.filter((s) => leaderClubs.includes(s.clubId));
    }

    return list
      .map((s) => {
        const c = this.db.clubs.find((x) => x.id === s.clubId);
        const l = c ? this.db.users.find((u) => u.id === c.leaderId) : null;
        const count = this.db.sessions.filter((ses) => ses.slotId === s.id).length;
        return {
          ...s,
          clubName: c?.name || '',
          category: c?.category || '',
          leaderName: l?.fullName || '',
          sessionCount: count,
        };
      })
      .sort((a, b) => a.weekday - b.weekday || a.timeStart.localeCompare(b.timeStart));
  }

  public saveScheduleSlot(data: {
    id?: string;
    clubId: string;
    weekday: number;
    timeStart: string;
    timeEnd: string;
    room: string;
    startDate: string;
    endDate: string;
  }): ScheduleSlot {
    let slot: ScheduleSlot;
    if (data.id) {
      const existing = this.db.schedules.find((x) => x.id === data.id);
      if (!existing) throw new Error('Grafik topilmadi.');
      slot = Object.assign(existing, {
        weekday: data.weekday,
        timeStart: data.timeStart,
        timeEnd: data.timeEnd,
        room: data.room,
        startDate: data.startDate,
        endDate: data.endDate,
      });
    } else {
      slot = {
        id: uid('slot'),
        clubId: data.clubId,
        weekday: data.weekday,
        timeStart: data.timeStart,
        timeEnd: data.timeEnd,
        room: data.room,
        startDate: data.startDate,
        endDate: data.endDate,
        createdAt: nowISO(),
      };
      this.db.schedules.push(slot);
    }

    this.regenSlotSessions(slot);
    this.save();
    return slot;
  }

  public deleteScheduleSlot(id: string): void {
    const slot = this.db.schedules.find((x) => x.id === id);
    if (!slot) return;
    this.db.sessions = this.db.sessions.filter(
      (s) => !(s.slotId === id && s.status === 'planned' && !s.photoFileId)
    );
    this.db.schedules = this.db.schedules.filter((x) => x.id !== id);
    this.save();
  }

  private regenSlotSessions(slot: ScheduleSlot): void {
    this.db.sessions = this.db.sessions.filter(
      (s) => !(s.slotId === slot.id && s.status === 'planned' && !s.photoFileId)
    );

    const dates = calculateSlotDates(slot);
    const existingDates = new Set(
      this.db.sessions.filter((s) => s.slotId === slot.id).map((s) => s.date)
    );

    const club = this.db.clubs.find((c) => c.id === slot.clubId);
    const clubTitle = club?.name || 'Mashg‘ulot';

    dates.forEach((dStr, idx) => {
      if (!existingDates.has(dStr)) {
        this.db.sessions.push({
          id: uid('ses'),
          clubId: slot.clubId,
          slotId: slot.id,
          topic: `${clubTitle}: ${idx + 1}-amaliy mashg‘ulot`,
          date: dStr,
          time: slot.timeStart,
          timeEnd: slot.timeEnd,
          location: slot.room,
          status: 'planned',
          heldNote: '',
          createdAt: nowISO(),
        });
      }
    });
  }

  // --- Sessions & Photo Evidence ---
  public getSessions(clubId?: string, leaderId?: string): Session[] {
    let list = this.db.sessions;
    if (clubId) {
      list = list.filter((s) => s.clubId === clubId);
    } else if (leaderId) {
      const leaderClubs = this.db.clubs.filter((c) => c.leaderId === leaderId).map((c) => c.id);
      list = list.filter((s) => leaderClubs.includes(s.clubId));
    }

    return list
      .map((s) => {
        const c = this.db.clubs.find((x) => x.id === s.clubId);
        const reportCount = this.db.reports.filter((r) => r.sessionId === s.id).length;
        const submissionCount = this.db.submissions.filter((sub) => sub.sessionId === s.id).length;
        const photoFile = this.getFileMeta(s.photoFileId);
        return {
          ...s,
          rawTopic: s.topic,
          topic: s.topic || 'Haftalik mashg‘ulot',
          clubName: c?.name || '',
          photoFile,
          reportCount,
          submissionCount,
        };
      })
      .sort((a, b) => (a.date + a.time).localeCompare(b.date + b.time));
  }

  public addExtraSession(data: {
    clubId: string;
    topic: string;
    date: string;
    time: string;
    timeEnd?: string;
    location: string;
    conductorName?: string;
  }): Session {
    const s: Session = {
      id: uid('ses'),
      clubId: data.clubId,
      slotId: null,
      topic: data.topic.trim(),
      date: data.date,
      time: data.time,
      timeEnd: data.timeEnd || '',
      location: data.location.trim(),
      conductorName: data.conductorName?.trim() || '',
      status: 'planned',
      heldNote: '',
      createdAt: nowISO(),
    };
    this.db.sessions.push(s);
    this.save();
    return s;
  }

  public updateSessionStatus(id: string, status: 'held' | 'missed' | 'planned', note: string = ''): Session {
    const s = this.db.sessions.find((x) => x.id === id);
    if (!s) throw new Error('Mashg‘ulot topilmadi.');
    s.status = status;
    s.heldNote = note.trim();
    if (status === 'held') {
      s.heldDate = nowISO();
    }
    this.save();
    return s;
  }

  public markSessionHeldWithPhoto(data: {
    sessionId: string;
    status: 'held' | 'missed';
    note?: string;
    topic?: string;
    attendeeCount?: number;
    conductorName?: string;
    photoFile?: { name: string; mime: string; data: string };
    userId?: string;
  }): Session {
    const s = this.db.sessions.find((x) => x.id === data.sessionId);
    if (!s) throw new Error('Mashg‘ulot topilmadi.');

    s.status = data.status;
    if (data.note) s.heldNote = data.note.trim();
    if (data.topic) s.topic = data.topic.trim();
    if (data.attendeeCount !== undefined) s.attendeeCount = data.attendeeCount;
    if (data.conductorName) s.conductorName = data.conductorName.trim();
    s.heldDate = nowISO();

    if (data.photoFile) {
      s.photoFileId = this.storeFile(data.photoFile, data.userId);
    }

    this.save();
    return s;
  }

  public updateSessionTopic(id: string, topic: string): Session {
    const s = this.db.sessions.find((x) => x.id === id);
    if (!s) throw new Error('Mashg‘ulot topilmadi.');
    s.topic = topic.trim();
    this.save();
    return s;
  }

  public deleteSession(id: string): void {
    this.db.sessions = this.db.sessions.filter((x) => x.id !== id);
    this.save();
  }

  // --- Memberships ---
  public getMemberships(opts?: { studentId?: string; leaderId?: string; clubId?: string }): Membership[] {
    let list = this.db.memberships;
    if (opts?.studentId) {
      list = list.filter((m) => m.studentId === opts.studentId);
    } else if (opts?.leaderId) {
      const leaderClubs = this.db.clubs.filter((c) => c.leaderId === opts.leaderId).map((c) => c.id);
      list = list.filter((m) => leaderClubs.includes(m.clubId));
    }
    if (opts?.clubId) {
      list = list.filter((m) => m.clubId === opts.clubId);
    }

    return list
      .map((m) => {
        const c = this.db.clubs.find((x) => x.id === m.clubId);
        const st = this.db.users.find((u) => u.id === m.studentId);
        const applicationFile = this.getFileMeta(m.applicationFileId);
        return {
          ...m,
          clubName: c?.name || '',
          studentName: st?.fullName || '',
          studentGroup: st?.groupName || '',
          studentFaculty: st?.faculty || '',
          applicationFile,
        };
      })
      .sort((a, b) => b.createdAt.localeCompare(a.createdAt));
  }

  public applyForClub(data: {
    clubId: string;
    studentId: string;
    note: string;
    applicationFile?: { name: string; mime: string; data: string };
  }): Membership {
    const existing = this.db.memberships.find(
      (m) => m.clubId === data.clubId && m.studentId === data.studentId && m.status !== 'rejected'
    );
    if (existing) {
      throw new Error('Siz allaqachon ushbu to‘garakka ariza topshirgansiz.');
    }

    const applicationFileId = data.applicationFile
      ? this.storeFile(data.applicationFile, data.studentId)
      : null;

    const m: Membership = {
      id: uid('m'),
      clubId: data.clubId,
      studentId: data.studentId,
      applicationFileId,
      note: data.note.trim(),
      status: 'pending',
      adminComment: '',
      createdAt: nowISO(),
    };
    this.db.memberships.push(m);
    this.save();
    return m;
  }

  public reviewMembership(
    membershipId: string,
    status: 'approved' | 'rejected',
    comment: string,
    reviewerName?: string
  ): Membership {
    const m = this.db.memberships.find((x) => x.id === membershipId);
    if (!m) throw new Error('Ariza topilmadi.');
    m.status = status;
    m.adminComment = comment.trim();

    if (status === 'approved') {
      const student = this.db.users.find((u) => u.id === m.studentId);
      if (student && !student.clubId) {
        student.clubId = m.clubId;
      }
    }

    const club = this.db.clubs.find((c) => c.id === m.clubId);
    const clubName = club?.name || 'to‘garak';
    const isApproved = status === 'approved';

    // DIRECT NOTIFICATION TO THE STUDENT
    this.addNotification({
      userId: m.studentId,
      targetRole: 'student',
      title: isApproved ? `🎉 «${clubName}» to‘garagiga a’zoligingiz tasdiqlandi!` : `⚠️ «${clubName}» to‘garagiga arizangiz rad etildi`,
      message: isApproved
        ? `Tabriklaymiz! Sizning «${clubName}» to‘garagiga yuborgan a’zolik arizangiz tasdiqlandi (${reviewerName || 'Bosh admin / To‘garak rahbari'} tomonidan). Endi mashg‘ulotlarda muntazam qatnashib, qatnashganlik fotodalillarini yuklashingiz mumkin.${comment ? ` Izoh: "${comment}"` : ''}`
        : `Afsuski, «${clubName}» to‘garagiga a’zolik arizangiz rad etildi.${comment ? ` Sabab: "${comment}"` : ''}`,
      type: isApproved ? 'success' : 'warning',
      linkTab: 'myApps',
      clubId: m.clubId,
    });

    this.save();

    // Fire direct API review for instantaneous server update
    try {
      fetch('/api/memberships/review', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          membershipId,
          status,
          comment,
          reviewerName,
        }),
      }).catch((e) => console.warn('[ReviewMembership] Server sync warning:', e));
    } catch {
      // ignore
    }

    return m;
  }

  // --- Annual Reports (Yillik hisobotlar) ---
  public getAnnualReports(clubId?: string): AnnualReport[] {
    let list = this.db.annualReports || [];
    if (clubId) {
      list = list.filter((r) => r.clubId === clubId);
    }
    return list.map((r) => ({
      ...r,
      pdfFile: this.getFileMeta(r.pdfFileId),
    })).sort((a, b) => b.createdAt.localeCompare(a.createdAt));
  }

  public saveAnnualReport(data: {
    clubId: string;
    leaderId: string;
    academicYear: string;
    summary: string;
    achievements: string;
    pdfFile?: { name: string; mime: string; data: string };
  }): AnnualReport {
    const club = this.enrichClub(this.db.clubs.find((c) => c.id === data.clubId)!);
    if (!club) throw new Error('To‘garak topilmadi');

    const totalPlanned = club.sessionCount || 0;
    const totalHeld = club.heldSessionCount || 0;
    const completionRate = totalPlanned > 0 ? Math.round((totalHeld / totalPlanned) * 100) : 0;
    const totalMembers = club.memberCount || 0;
    const totalPhotos = club.photoCount || 0;

    const pdfFileId = data.pdfFile ? this.storeFile(data.pdfFile, data.leaderId) : null;

    const rep: AnnualReport = {
      id: uid('ann'),
      clubId: data.clubId,
      clubName: club.name,
      category: club.category,
      leaderId: data.leaderId,
      leaderName: club.leaderName || '',
      academicYear: data.academicYear || '2025/2026',
      totalPlanned,
      totalHeld,
      completionRate,
      totalMembers,
      totalPhotos,
      summary: data.summary.trim(),
      achievements: data.achievements.trim(),
      pdfFileId,
      status: 'pending',
      adminComment: '',
      createdAt: nowISO(),
    };

    if (!this.db.annualReports) this.db.annualReports = [];
    this.db.annualReports.push(rep);
    this.save();
    return {
      ...rep,
      pdfFile: this.getFileMeta(pdfFileId),
    };
  }

  public reviewAnnualReport(id: string, status: 'approved', comment: string): AnnualReport {
    const rep = this.db.annualReports.find((r) => r.id === id);
    if (!rep) throw new Error('Hisobot topilmadi.');
    rep.status = status;
    rep.adminComment = comment.trim();
    this.save();
    return {
      ...rep,
      pdfFile: this.getFileMeta(rep.pdfFileId),
    };
  }

  // --- Reports (Leader reports) ---
  public getReports(opts?: { leaderId?: string; clubId?: string }): Report[] {
    let list = this.db.reports;
    if (opts?.leaderId) {
      list = list.filter((r) => r.leaderId === opts.leaderId);
    }
    if (opts?.clubId) {
      list = list.filter((r) => r.clubId === opts.clubId);
    }

    return list
      .map((r) => {
        const c = this.db.clubs.find((x) => x.id === r.clubId);
        const s = r.sessionId ? this.db.sessions.find((ses) => ses.id === r.sessionId) : null;
        const pdfFile = this.getFileMeta(r.pdfFileId);
        return {
          ...r,
          clubName: c?.name || '',
          sessionTopic: s?.topic || '',
          pdfFile,
        };
      })
      .sort((a, b) => b.createdAt.localeCompare(a.createdAt));
  }

  public createReport(data: {
    clubId: string;
    sessionId?: string | null;
    leaderId: string;
    title: string;
    socialLink: string;
    note: string;
    pdfFile?: { name: string; mime: string; data: string };
  }): Report {
    const pdfFileId = data.pdfFile ? this.storeFile(data.pdfFile, data.leaderId) : null;
    const r: Report = {
      id: uid('rep'),
      clubId: data.clubId,
      sessionId: data.sessionId || null,
      leaderId: data.leaderId,
      title: data.title.trim() || 'Hisobot',
      pdfFileId,
      socialLink: data.socialLink.trim(),
      note: data.note.trim(),
      createdAt: nowISO(),
    };
    this.db.reports.push(r);
    this.save();
    return r;
  }

  // --- Submissions (Student Materials) ---
  public getSubmissions(opts?: { studentId?: string; leaderId?: string; clubId?: string; sessionId?: string }): Submission[] {
    let list = this.db.submissions;
    if (opts?.studentId) {
      list = list.filter((s) => s.studentId === opts.studentId);
    } else if (opts?.leaderId) {
      const leaderClubs = this.db.clubs.filter((c) => c.leaderId === opts.leaderId).map((c) => c.id);
      list = list.filter((s) => leaderClubs.includes(s.clubId));
    }
    if (opts?.clubId) {
      list = list.filter((s) => s.clubId === opts.clubId);
    }
    if (opts?.sessionId) {
      list = list.filter((s) => s.sessionId === opts.sessionId);
    }

    return list
      .map((sub) => {
        const c = this.db.clubs.find((x) => x.id === sub.clubId);
        const st = this.db.users.find((u) => u.id === sub.studentId);
        const s = sub.sessionId ? this.db.sessions.find((ses) => ses.id === sub.sessionId) : null;
        const pdfFile = this.getFileMeta(sub.pdfFileId);
        const photoFile = this.getFileMeta(sub.photoFileId);
        return {
          ...sub,
          clubName: c?.name || '',
          studentName: st?.fullName || '',
          studentGroup: st?.groupName || '',
          sessionTopic: s?.topic || '',
          pdfFile,
          photoFile,
        };
      })
      .sort((a, b) => b.createdAt.localeCompare(a.createdAt));
  }

  public createSubmission(data: {
    clubId: string;
    sessionId?: string | null;
    studentId: string;
    title: string;
    note: string;
    photoFile: { name: string; mime: string; data: string };
  }): Submission {
    const photoFileId = this.storeFile(data.photoFile, data.studentId);
    const sub: Submission = {
      id: uid('sub'),
      clubId: data.clubId,
      sessionId: data.sessionId || null,
      studentId: data.studentId,
      title: data.title.trim() || 'Mashg‘ulotdagi ishtirok',
      pdfFileId: null,
      photoFileId,
      note: data.note.trim(),
      createdAt: nowISO(),
    };
    this.db.submissions.push(sub);
    this.save();
    return sub;
  }

  public deleteSubmission(id: string): void {
    this.db.submissions = (this.db.submissions || []).filter((s) => s.id !== id);
    if (!this.db._deletedSubmissionIds) this.db._deletedSubmissionIds = [];
    if (!this.db._deletedSubmissionIds.includes(id)) {
      this.db._deletedSubmissionIds.push(id);
    }
    this.save();
  }

  // --- Users (Admin) ---
  public getUsers(): User[] {
    return this.db.users;
  }

  public toggleUserActive(userId: string, active: boolean): void {
    const u = this.db.users.find((x) => x.id === userId);
    if (!u) throw new Error('Foydalanuvchi topilmadi.');
    if (u.role === 'admin') throw new Error('Administratorni bloklash mumkin emas.');
    u.active = active;
    this.save();
  }

  // --- Notifications ---
  public getNotifications(userId: string, role?: string): AppNotification[] {
    return (this.db.notifications || [])
      .filter((n) => {
        if (n.userId === userId) return true;
        if (n.userId === 'all') return true;
        if (role === 'student' && (n.userId === 'students' || n.targetRole === 'student')) return true;
        if (role === 'leader' && (n.userId === 'leaders' || n.targetRole === 'leader')) return true;
        if (role === 'admin' && (n.userId === 'admins' || n.targetRole === 'admin')) return true;
        return false;
      })
      .sort((a, b) => new Date(b.createdAt).getTime() - new Date(a.createdAt).getTime());
  }

  public getUnreadNotificationCount(userId: string, role?: string): number {
    return this.getNotifications(userId, role).filter((n) => !n.read).length;
  }

  public markNotificationAsRead(id: string): void {
    const n = (this.db.notifications || []).find((x) => x.id === id);
    if (n) {
      n.read = true;
      this.save();
    }
  }

  public markAllNotificationsAsRead(userId: string, role?: string): void {
    const list = this.getNotifications(userId, role);
    list.forEach((n) => {
      n.read = true;
    });
    this.save();
  }

  public addNotification(notification: Omit<AppNotification, 'id' | 'read' | 'createdAt'>): AppNotification {
    if (!Array.isArray(this.db.notifications)) {
      this.db.notifications = [];
    }
    const newNotif: AppNotification = {
      ...notification,
      id: `notif_${Date.now()}_${Math.random().toString(36).substring(2, 7)}`,
      read: false,
      createdAt: new Date().toISOString(),
    };
    this.db.notifications.unshift(newNotif);
    this.save();
    return newNotif;
  }

  // --- Admin Overview Stats ---
  public getAdminStats() {
    return {
      clubs: this.db.clubs.length,
      statutesPending: this.db.clubs.filter((c) => c.statuteStatus === 'pending' && c.statuteFileId).length,
      membershipsPending: this.db.memberships.filter((m) => m.status === 'pending').length,
      sessionsPlanned: this.db.sessions.filter((s) => s.status === 'planned').length,
      sessionsHeld: this.db.sessions.filter((s) => s.status === 'held').length,
      sessionsMissed: this.db.sessions.filter((s) => s.status === 'missed').length,
      students: this.db.users.filter((x) => x.role === 'student').length,
      leaders: this.db.users.filter((x) => x.role === 'leader').length,
      reports: this.db.reports.length,
      annualReports: (this.db.annualReports || []).length,
      submissions: this.db.submissions.length,
      photosCount: this.db.sessions.filter((s) => s.photoFileId).length,
    };
  }
}

export const storage = new StorageManager();
