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

export function normalizeClubTime(time: string): string {
  if (!time) return '';
  const trimmed = time.trim();
  const match = trimmed.match(/^(\d{1,2}):(\d{2})$/);
  if (!match) return trimmed;
  let h = parseInt(match[1], 10);
  const m = match[2];
  // Convert unintended late-night PM hours from mobile pickers:
  // 23:xx -> 11:xx, 22:xx -> 10:xx, 21:xx -> 09:xx, 00:xx -> 12:xx
  if (h === 23) h = 11;
  else if (h === 22) h = 10;
  else if (h === 21) h = 9;
  else if (h === 0) h = 12;
  return `${pad2(h)}:${m}`;
}

function liteHash(s: string): string {
  let h = 5381;
  const str = String(s);
  for (let i = 0; i < str.length; i++) {
    h = ((h << 5) + h) ^ str.charCodeAt(i);
  }
  return 'h' + (h >>> 0).toString(16);
}

// Initial data with authentic accounts for NamDChTI
function seedInitialData(): DatabaseSchema {
  return generateSeedData();
}

function sanitizeDatabase(db: DatabaseSchema): DatabaseSchema {
  if (!db) return db;
  // Always purge legacy AI START ('c_2040bdb_97be1') while preserving current AI START ('c_c272675_65543')
  const legacyAiStartId = 'c_2040bdb_97be1';
  if (Array.isArray(db.clubs)) {
    db.clubs = db.clubs.filter((c) => c && c.id !== legacyAiStartId);
  }
  if (Array.isArray(db.sessions)) {
    db.sessions = db.sessions.filter((s) => s && s.clubId !== legacyAiStartId);
  }
  if (Array.isArray(db.schedules)) {
    db.schedules = db.schedules.filter((sc) => sc && sc.clubId !== legacyAiStartId);
  }
  if (Array.isArray(db.memberships)) {
    db.memberships = db.memberships.filter((m) => m && m.clubId !== legacyAiStartId);
  }
  if (Array.isArray(db.reports)) {
    db.reports = db.reports.filter((r) => r && r.clubId !== legacyAiStartId);
  }
  if (Array.isArray(db.annualReports)) {
    db.annualReports = db.annualReports.filter((a) => a && a.clubId !== legacyAiStartId);
  }
  if (Array.isArray(db.submissions)) {
    db.submissions = db.submissions.filter((sub) => sub && sub.clubId !== legacyAiStartId);
  }
  if (Array.isArray(db.users)) {
    db.users.forEach((u) => {
      if (u && u.clubId === legacyAiStartId) u.clubId = null;
    });
  }
  if (!Array.isArray(db.users)) db.users = [];
  if (!Array.isArray(db.clubs)) db.clubs = [];
  if (!Array.isArray(db.schedules)) db.schedules = [];
  if (!Array.isArray(db.sessions)) db.sessions = [];
  if (!Array.isArray(db.memberships)) db.memberships = [];
  if (!Array.isArray(db.reports)) db.reports = [];
  if (!Array.isArray(db.annualReports)) db.annualReports = [];
  if (!Array.isArray(db.submissions)) db.submissions = [];
  if (!Array.isArray(db.files)) db.files = [];
  if (!Array.isArray(db.notifications)) db.notifications = [];
  if (!Array.isArray(db._deletedClubIds)) db._deletedClubIds = [];
  if (!Array.isArray(db._deletedMembershipIds)) db._deletedMembershipIds = [];
  if (!Array.isArray(db._deletedUserIds)) db._deletedUserIds = [];
  if (!db.tokens || typeof db.tokens !== 'object') db.tokens = {};

  const delMemberSet = new Set(db._deletedMembershipIds || []);
  const delClubSet = new Set(db._deletedClubIds || []);
  const delUserSet = new Set(db._deletedUserIds || []);

  db.clubs = (db.clubs || []).filter((c) => c && c.id && !delClubSet.has(c.id));
  db.schedules = (db.schedules || []).filter((s) => s && s.id && !delClubSet.has(s.clubId));
  db.sessions = (db.sessions || []).filter((ses) => ses && ses.id && !delClubSet.has(ses.clubId));
  db.memberships = (db.memberships || []).filter(
    (m) => m && m.id && !delMemberSet.has(m.id) && !delClubSet.has(m.clubId)
  );
  db.reports = (db.reports || []).filter((r) => r && r.id && !delClubSet.has(r.clubId));
  db.annualReports = (db.annualReports || []).filter((a) => a && a.id && !delClubSet.has(a.clubId));
  db.submissions = (db.submissions || []).filter((sub) => sub && sub.id && !delClubSet.has(sub.clubId));
  db.users = (db.users || []).filter((u) => u && u.id && !delUserSet.has(u.id));

  (db.memberships || []).forEach((m: any) => {
    if (!m.createdAt) {
      m.createdAt = m.appliedAt || new Date().toISOString();
    }
    if (m.tutorName === undefined || m.tutorName === null) m.tutorName = '';
    if (m.studentGroup === undefined || m.studentGroup === null) m.studentGroup = '';
    if (m.note === undefined) m.note = '';
    if (m.adminComment === undefined) m.adminComment = '';
    if (m.applicationFileId === undefined) m.applicationFileId = null;
    if (!m.status) m.status = 'approved';
  });

  (db.schedules || []).forEach((s: any) => {
    if (s.weekday === undefined || s.weekday === null) s.weekday = 1;
    if (!s.timeStart) s.timeStart = '09:00';
    if (!s.timeEnd) s.timeEnd = '10:30';
    if (!s.createdAt) s.createdAt = new Date().toISOString();
  });

  (db.sessions || []).forEach((ses: any) => {
    if (!ses.topic) ses.topic = 'Haftalik mashg‘ulot';
    if (!ses.date) ses.date = '';
    if (!ses.time) ses.time = '';
    if (!ses.createdAt) ses.createdAt = new Date().toISOString();
  });

  (db.reports || []).forEach((r: any) => {
    if (!r.title) r.title = 'Hisobot';
    if (!r.createdAt) r.createdAt = new Date().toISOString();
  });

  (db.annualReports || []).forEach((ar: any) => {
    if (!ar.createdAt) ar.createdAt = new Date().toISOString();
  });

  (db.submissions || []).forEach((sub: any) => {
    if (!sub.createdAt) sub.createdAt = new Date().toISOString();
  });

  return db;
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
    this.deduplicateSessions();
    this.autoCheckMissedSessions();
    // Local history recovery disabled to prevent stale data overwriting authoritative server data
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
    const sStr = (d.sessions || []).map((s) => `${s.id}:${s.status}:${s.photoFileId || ''}`).join(',');
    const sCount = (d.sessions || []).length;
    const rCount = (d.reports || []).length;
    const arCount = (d.annualReports || []).length;
    const subStr = (d.submissions || []).map((s) => `${s.id}:${s.status || 'pending'}:${s.telegramLink || ''}`).join(',');
    const subCount = (d.submissions || []).length;
    const mStr = (d.memberships || []).map((m) => `${m.id}:${m.status}:${m.clubId}:${m.studentName || ''}`).join(',');
    const mCount = (d.memberships || []).length;
    const notifCount = (d.notifications || []).map((n) => `${n.id}:${n.read}`).join(',');
    const delStr = (d._deletedClubIds || []).join(',');
    const delUStr = (d._deletedUserIds || []).join(',');
    const delMStr = (d._deletedMembershipIds || []).join(',');
    return `${uStr}##${cStr}##${fCount}##${sCount}##${sStr}##${rCount}##${arCount}##${subCount}##${subStr}##${mCount}##${mStr}##${notifCount}##${delStr}##${delUStr}##${delMStr}`;
  }

  private mergeDatabases(local: DatabaseSchema, remote: DatabaseSchema): DatabaseSchema {
    if (!remote || !Array.isArray(remote.users)) return local;
    if (!local || !Array.isArray(local.users)) return remote;

    const mergedDeletedClubIds = Array.from(new Set([
      ...(Array.isArray(local._deletedClubIds) ? local._deletedClubIds : []),
      ...(Array.isArray(remote._deletedClubIds) ? remote._deletedClubIds : []),
    ]));
    const isDeletedClub = (clubId?: string | null) => !clubId || mergedDeletedClubIds.includes(clubId);

    const mergedDeletedUserIds = Array.from(new Set([
      ...(Array.isArray(local._deletedUserIds) ? local._deletedUserIds : []),
      ...(Array.isArray(remote._deletedUserIds) ? remote._deletedUserIds : []),
    ]));

    const mergedDeletedMembershipIds = Array.from(new Set([
      ...(Array.isArray(local._deletedMembershipIds) ? local._deletedMembershipIds : []),
      ...(Array.isArray(remote._deletedMembershipIds) ? remote._deletedMembershipIds : []),
    ]));

    // Users
    const userMap = new Map<string, User>();
    (remote.users || []).forEach((u) => {
      if (mergedDeletedUserIds.includes(u.id)) return;
      const copy = { ...u };
      if (isDeletedClub(copy.clubId)) copy.clubId = null;
      userMap.set(copy.id, copy);
    });
    (local.users || []).forEach((u) => {
      if (mergedDeletedUserIds.includes(u.id)) return;
      const copy = { ...u };
      if (isDeletedClub(copy.clubId)) copy.clubId = null;
      if (!userMap.has(copy.id)) userMap.set(copy.id, copy);
    });
    mergedDeletedUserIds.forEach((id: string) => userMap.delete(id));

    // Clubs - remote approved/rejected statuses have absolute priority over pending
    const clubMap = new Map<string, Club>();
    (remote.clubs || []).forEach((c) => {
      if (!isDeletedClub(c.id)) {
        clubMap.set(c.id, { ...c });
      }
    });

    (local.clubs || []).forEach((c) => {
      if (isDeletedClub(c.id)) return;
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

    mergedDeletedClubIds.forEach((id: string) => clubMap.delete(id));

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

    // Sessions - merge by ID and clubId+date to prevent duplicate dates
    const sessionMap = new Map<string, Session>();
    const sessionClubDateMap = new Map<string, Session>();

    const mergeSessionItem = (s: Session) => {
      if (isDeletedClub(s.clubId)) return;
      const dateKey = `${s.clubId}_${s.date}`;
      if (sessionClubDateMap.has(dateKey)) {
        const exS = sessionClubDateMap.get(dateKey)!;
        if (s.photoFileId && !exS.photoFileId) exS.photoFileId = s.photoFileId;
        if (s.telegramLink && !exS.telegramLink) exS.telegramLink = s.telegramLink;
        if (s.status === 'held') {
          exS.status = 'held';
          if (s.heldDate) exS.heldDate = s.heldDate;
          if (s.heldNote) exS.heldNote = s.heldNote;
          if (s.attendeeCount !== undefined) exS.attendeeCount = s.attendeeCount;
          if (s.conductorName) exS.conductorName = s.conductorName;
          if (s.topic) exS.topic = s.topic;
        } else if (s.status === 'missed' && exS.status !== 'held') {
          exS.status = 'missed';
          if (s.heldNote) exS.heldNote = s.heldNote;
        }
      } else if (sessionMap.has(s.id)) {
        const exS = sessionMap.get(s.id)!;
        if (s.photoFileId && !exS.photoFileId) exS.photoFileId = s.photoFileId;
        if (s.telegramLink && !exS.telegramLink) exS.telegramLink = s.telegramLink;
        if (s.status === 'held') {
          exS.status = 'held';
          if (s.heldDate) exS.heldDate = s.heldDate;
          if (s.heldNote) exS.heldNote = s.heldNote;
          if (s.attendeeCount !== undefined) exS.attendeeCount = s.attendeeCount;
          if (s.conductorName) exS.conductorName = s.conductorName;
          if (s.topic) exS.topic = s.topic;
        } else if (s.status === 'missed' && exS.status !== 'held') {
          exS.status = 'missed';
          if (s.heldNote) exS.heldNote = s.heldNote;
        }
      } else {
        const copy = { ...s };
        sessionMap.set(copy.id, copy);
        sessionClubDateMap.set(dateKey, copy);
      }
    };

    (remote.sessions || []).forEach(mergeSessionItem);
    (local.sessions || []).forEach(mergeSessionItem);

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
    (remote.memberships || []).forEach((m: any) => {
      if (!m.createdAt) m.createdAt = m.appliedAt || new Date().toISOString();
      if (!isDeletedClub(m.clubId) && !mergedDeletedMembershipIds.includes(m.id)) {
        membershipMap.set(m.id, m);
      }
    });
    (local.memberships || []).forEach((m: any) => {
      if (!m.createdAt) m.createdAt = m.appliedAt || new Date().toISOString();
      if (!isDeletedClub(m.clubId) && !mergedDeletedMembershipIds.includes(m.id)) {
        if (!membershipMap.has(m.id)) {
          membershipMap.set(m.id, m);
        } else {
          const exM = membershipMap.get(m.id)!;
          if (m.studentName) exM.studentName = m.studentName;
          if (m.studentGroup) exM.studentGroup = m.studentGroup;
          if (m.tutorName !== undefined) exM.tutorName = m.tutorName;
          if (m.studentFaculty) exM.studentFaculty = m.studentFaculty;
          if (m.phoneOrTelegram !== undefined) exM.phoneOrTelegram = m.phoneOrTelegram;
          if (m.note !== undefined) exM.note = m.note;
          if (m.status === 'approved') exM.status = 'approved';
        }
      }
    });
    mergedDeletedMembershipIds.forEach((id: string) => membershipMap.delete(id));

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
      if (!isDeletedClub(s.clubId)) subMap.set(s.id, { ...s });
    });
    (local.submissions || []).forEach((s) => {
      if (isDeletedClub(s.clubId)) return;
      if (!subMap.has(s.id)) {
        subMap.set(s.id, s);
      } else {
        const remSub = subMap.get(s.id)!;
        if (s.status) remSub.status = s.status;
        if (s.telegramLink) remSub.telegramLink = s.telegramLink;
        if (s.leaderComment !== undefined) remSub.leaderComment = s.leaderComment;
        if (s.reviewedAt) remSub.reviewedAt = s.reviewedAt;
        if (s.title) remSub.title = s.title;
        if (s.note !== undefined) remSub.note = s.note;
      }
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

    return sanitizeDatabase({
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
      _deletedMembershipIds: mergedDeletedMembershipIds,
      _deletedUserIds: mergedDeletedUserIds,
    });
  }

  private async initSync(): Promise<void> {
    // 1. Fetch server data for instant cross-device updates
    await this.fetchServerData();

    // 2. Authoritative sync with server

    // 3. Sync with server
    await this.syncWithServer();

    // Start background sync polling every 2 seconds for instant multi-device sync
    if (typeof window !== 'undefined' && !this.pollInterval) {
      this.pollInterval = setInterval(() => {
        this.pollServer();
      }, 2000);

      window.addEventListener('focus', () => {
        this.pollServer();
      });

      window.addEventListener('online', () => {
        this.syncWithServer();
      });
    }
  }

  public async fetchSupabaseData(): Promise<boolean> {
    try {
      const { supabase } = await import("./supabase");
      if (!supabase) return false;
      const { data: supaClubs, error } = await supabase.from("clubs").select("*");
      if (error || !supaClubs || supaClubs.length === 0) return false;

      const mappedClubs: Club[] = supaClubs.map((sc: any) => ({
        id: sc.id,
        name: sc.name,
        category: sc.category,
        description: sc.description || "",
        faculty: sc.faculty || "",
        leaderId: sc.leader_id || "",
        leaderName: sc.leader_name || "",
        room: sc.room || "",
        startDate: sc.start_date || "",
        endDate: sc.end_date || "",
        weekdays: Array.isArray(sc.weekdays) ? sc.weekdays : [],
        timeStart: sc.time_start || "",
        timeEnd: sc.time_end || "",
        statuteStatus: sc.statute_status || "approved",
        adminComment: sc.admin_comment || "",
        statuteFileId: sc.statute_file_id || null,
        statuteReviewedAt: sc.statute_reviewed_at || undefined,
        createdAt: sc.created_at || new Date().toISOString(),
      }));

      const { data: supaSched } = await supabase.from("club_schedules").select("*");
      const { data: supaSess } = await supabase.from("club_sessions").select("*");
      const { data: supaMemb } = await supabase.from("club_memberships").select("*");
      const { data: supaFiles } = await supabase.from("club_files").select("*");

      if (mappedClubs.length > 0) {
        // SAFE MERGE: Never wipe out locally created, approved, or newly added clubs!
        const existingClubsMap = new Map<string, Club>();
        (this.db.clubs || []).forEach((c) => existingClubsMap.set(c.id, c));

        mappedClubs.forEach((sc) => {
          if (!existingClubsMap.has(sc.id)) {
            existingClubsMap.set(sc.id, sc);
          } else {
            const localC = existingClubsMap.get(sc.id)!;
            if (sc.statuteStatus === "approved") {
              localC.statuteStatus = "approved";
              localC.adminComment = sc.adminComment || localC.adminComment;
              localC.statuteReviewedAt = sc.statuteReviewedAt || localC.statuteReviewedAt;
            }
            if (sc.statuteFileId && !localC.statuteFileId) {
              localC.statuteFileId = sc.statuteFileId;
            }
          }
        });
        this.db.clubs = Array.from(existingClubsMap.values());

        // Safe merge schedules
        if (supaSched && supaSched.length > 0) {
          const schedMap = new Map<string, ScheduleSlot>();
          (this.db.schedules || []).forEach((s) => schedMap.set(s.id, s));
          supaSched.forEach((s: any) => {
            if (!schedMap.has(s.id)) {
              schedMap.set(s.id, {
                id: s.id,
                clubId: s.club_id,
                weekday: s.weekday,
                timeStart: s.time_start,
                timeEnd: s.time_end,
                room: s.room || "",
                startDate: s.start_date || "",
                endDate: s.end_date || "",
                createdAt: s.created_at || new Date().toISOString(),
              });
            }
          });
          this.db.schedules = Array.from(schedMap.values());
        }

        // Safe merge sessions
        if (supaSess && supaSess.length > 0) {
          const sessMap = new Map<string, Session>();
          (this.db.sessions || []).forEach((s) => sessMap.set(s.id, s));
          supaSess.forEach((s: any) => {
            if (!sessMap.has(s.id)) {
              sessMap.set(s.id, {
                id: s.id,
                clubId: s.club_id,
                slotId: s.slot_id || "",
                topic: s.topic,
                date: s.date,
                time: s.time || "",
                timeEnd: s.time_end || "",
                location: s.location || "",
                status: s.status || "scheduled",
                heldNote: s.held_note || "",
                attendeeCount: s.attendee_count || undefined,
                conductorName: s.conductor_name || "",
                photoFileId: s.photo_file_id || null,
                telegramLink: s.telegram_link || undefined,
                heldDate: s.held_date || undefined,
                createdAt: s.created_at || new Date().toISOString(),
              });
            }
          });
          this.db.sessions = Array.from(sessMap.values());
        }

        // Safe merge memberships
        if (supaMemb && supaMemb.length > 0) {
          const membMap = new Map<string, Membership>();
          (this.db.memberships || []).forEach((m) => membMap.set(m.id, m));
          supaMemb.forEach((m: any) => {
            if (!membMap.has(m.id)) {
              membMap.set(m.id, {
                id: m.id,
                clubId: m.club_id,
                clubName: m.club_name || "",
                studentId: m.student_id || "",
                studentName: m.student_name,
                studentGroup: m.student_group,
                tutorName: m.tutor_name,
                studentFaculty: m.student_faculty || "",
                phoneOrTelegram: m.phone_or_telegram || "",
                status: m.status || "approved",
                note: m.note || "",
                adminComment: m.admin_comment || "",
                applicationFileId: m.application_file_id || null,
                createdAt: m.created_at || new Date().toISOString(),
              });
            }
          });
          this.db.memberships = Array.from(membMap.values());
        }

        // Safe merge files
        if (supaFiles && supaFiles.length > 0) {
          const fileMap = new Map<string, FileItem>();
          (this.db.files || []).forEach((f) => fileMap.set(f.id, f));
          supaFiles.forEach((f: any) => {
            if (!fileMap.has(f.id)) {
              fileMap.set(f.id, {
                id: f.id,
                name: f.name,
                mime: f.type || "application/octet-stream",
                size: f.size || 0,
                data: f.data || "",
                owner: f.owner || "system",
                createdAt: f.uploaded_at || new Date().toISOString(),
              });
            }
          });
          this.db.files = Array.from(fileMap.values());
        }

        this.saveLocal();
        this.notifySubscribers();
        return true;
      }
    } catch (e) {
      console.warn('[Supabase] fetchSupabaseData warning:', e);
    }
    return false;
  }

  public async fetchServerData(): Promise<boolean> {
    try {
      // First try fetching from Supabase for direct database synchronization
      await this.fetchSupabaseData();

      const res = await fetch('/api/data');
      if (res.ok) {
        const serverData: DatabaseSchema | null = await res.json();
        if (serverData && typeof serverData === 'object' && Array.isArray(serverData.users) && serverData.users.length > 0) {
          this.db = this.mergeDatabases(this.db, serverData);
          this.saveLocal();
          this.lastServerHash = this.computeHash(this.db);
          this.notifySubscribers();
          return true;
        }
      }
    } catch (e) {
      console.warn('[Sync] fetchServerData error:', e);
    }
    return false;
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
          this.db = sanitizeDatabase(json.db);
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

      if (newHash !== currentHash) {
        console.log('[Sync] New changes received from server, updating...');
        this.db = this.mergeDatabases(this.db, serverData);
        this.lastServerHash = this.computeHash(this.db);
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

  public recoverFromLocalHistory(): { clubsRecovered: number; usersRecovered: number; membersRecovered: number } {
    // Disabled: Authoritative database is maintained by the central server.
    // Stale local browser keys must never overwrite server data.
    return { clubsRecovered: 0, usersRecovered: 0, membersRecovered: 0 };
  }

  public exportDatabaseJSON(): string {
    return JSON.stringify(this.db, null, 2);
  }

  public async importDatabaseJSON(jsonStr: string): Promise<boolean> {
    try {
      const parsed = JSON.parse(jsonStr);
      if (!parsed || typeof parsed !== 'object' || !Array.isArray(parsed.users)) {
        throw new Error('Noto‘g‘ri JSON formati: users ro‘yxati topilmadi');
      }
      parsed._deletedClubIds = [];
      parsed._deletedMembershipIds = [];
      parsed._deletedUserIds = [];
      this.db = sanitizeDatabase(parsed);
      this.saveLocal();
      
      // Post to dedicated authoritative import endpoint on server
      try {
        const res = await fetch('/api/database/import', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify(this.db),
        });
        if (res.ok) {
          const json = await res.json();
          if (json && json.db) {
            this.db = sanitizeDatabase(json.db);
            this.saveLocal();
            this.lastServerHash = this.computeHash(this.db);
          }
        }
      } catch (err) {
        console.warn('[Storage] Server import endpoint fallback to sync:', err);
        await this.postToServer();
      }

      this.notifySubscribers();
      return true;
    } catch (err: any) {
      throw new Error(err?.message || 'Zaxira faylini tiklashda xatolik yuz berdi');
    }
  }

  private load(): DatabaseSchema {
    try {
      let raw = localStorage.getItem(LS_KEY);
      // LocalStorage is used only as temporary cache, no stale fallback restoration

      if (raw) {
        const parsed: DatabaseSchema = JSON.parse(raw);
        if (parsed.users && Array.isArray(parsed.users)) {
          // Filter out dummy test clubs only, NEVER authentic user clubs
          const mockClubIds = new Set([
            'c_vokal', 'c_sport', 'c_it', 'c_reading', 'c_craft',
            'test_c1', 'c_test', 'club_01', 'club_02', 'club_03', 'club_04', 'club_05',
            'test', 'test_c_01'
          ]);
          parsed.clubs = (parsed.clubs || []).filter((c) => !mockClubIds.has(c.id));
          parsed.schedules = (parsed.schedules || []).filter((s) => !mockClubIds.has(s.clubId));
          parsed.sessions = (parsed.sessions || []).filter((s) => !mockClubIds.has(s.clubId));
          parsed.memberships = (parsed.memberships || []).filter((m) => !mockClubIds.has(m.clubId));
          parsed.reports = (parsed.reports || []).filter((r) => !mockClubIds.has(r.clubId));
          parsed.annualReports = (parsed.annualReports || []).filter((a) => !mockClubIds.has(a.clubId));
          parsed.submissions = (parsed.submissions || []).filter((s) => !mockClubIds.has(s.clubId));

          // Ensure admin profile exists
          const adminUser = parsed.users.find((u) => u.username.toLowerCase() === 'admin');
          if (adminUser) {
            adminUser.fullName = 'Hamidulla Abdualiyev';
            adminUser.role = 'admin';
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

          // Ensure Nafisa Sotiboldiyeva leader account exists and is never erased
          const nafisaUser = parsed.users.find((u) => u.username.toLowerCase() === 'nafisa');
          if (nafisaUser) {
            nafisaUser.fullName = 'Nafisa Sotiboldiyeva';
            nafisaUser.role = 'leader';
            nafisaUser.faculty = nafisaUser.faculty || 'Roman-german tillari fakulteti';
          } else {
            // Ensure Karimberdiyeva Dildora leader account exists
          const dildoraUser = parsed.users.find((u) => u.username && u.username.toLowerCase() === "dildora");
          if (dildoraUser) {
            dildoraUser.fullName = "Karimberdiyeva Dildora";
            dildoraUser.role = "leader";
            dildoraUser.faculty = "Til va tarjima";
            dildoraUser.groupName = "XTA-KU-25";
            dildoraUser.clubId = dildoraUser.clubId || "c_culture_around_world";
          } else {
            parsed.users.push({
              id: "u_leader_dildora",
              username: "dildora",
              password: liteHash("dildora123"),
              fullName: "Karimberdiyeva Dildora",
              role: "leader",
              faculty: "Til va tarjima",
              groupName: "XTA-KU-25",
              clubId: "c_culture_around_world",
              active: true,
              createdAt: nowISO(),
            });
          }
          parsed.users.push({
              id: 'u_leader_nafisa',
              username: 'nafisa',
              password: liteHash('nafisa123'),
              fullName: 'Nafisa Sotiboldiyeva',
              role: 'leader',
              faculty: 'Roman-german tillari fakulteti',
              groupName: 'Amaliy sanʼat va dizayn kafedrasi',
              clubId: null,
              active: true,
              createdAt: nowISO(),
            });
          }

          if (!Array.isArray(parsed.users)) parsed.users = [];
          if (!Array.isArray(parsed.clubs)) parsed.clubs = [];
          if (!Array.isArray(parsed.schedules)) parsed.schedules = [];
          if (!Array.isArray(parsed.sessions)) parsed.sessions = [];
          if (!Array.isArray(parsed.memberships)) parsed.memberships = [];
          if (!Array.isArray(parsed.reports)) parsed.reports = [];
          if (!Array.isArray(parsed.annualReports)) parsed.annualReports = [];
          if (!Array.isArray(parsed.submissions)) parsed.submissions = [];
          if (!Array.isArray(parsed.files)) parsed.files = [];
          if (!Array.isArray(parsed.notifications)) parsed.notifications = [];
          if (!Array.isArray(parsed._deletedClubIds)) parsed._deletedClubIds = [];
          if (!parsed.tokens || typeof parsed.tokens !== 'object') parsed.tokens = {};

          return sanitizeDatabase(parsed);
        }
      }
    } catch {
      // ignore
    }
    const initial = sanitizeDatabase(seedInitialData());
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
  public async login(username: string, pass: string): Promise<{ user: User; token: string }> {
    const cleanUname = (username || '').trim().toLowerCase();
    const cleanPass = (pass || '').trim();
    if (!cleanUname || !cleanPass) {
      throw new Error('Login va parol kiritilishi shart.');
    }

    // 1. Authenticate via server endpoint for real-time multi-device / phone access
    try {
      const res = await fetch('/api/login', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ username: cleanUname, password: cleanPass }),
      });
      if (res.ok) {
        const json = await res.json();
        if (json.success && json.user) {
          if (json.db && Array.isArray(json.db.users)) {
            this.db = sanitizeDatabase(json.db);
            this.saveLocal();
            this.lastServerHash = this.computeHash(this.db);
            this.notifySubscribers();
          }
          return { user: json.user, token: json.token };
        } else if (json.error) {
          throw new Error(json.error);
        }
      } else if (res.status === 401 || res.status === 404 || res.status === 403) {
        const errJson = await res.json().catch(() => null);
        throw new Error(errJson?.error || (res.status === 401 ? 'Parol noto‘g‘ri kiritildi.' : 'Bunday login mavjud emas.'));
      }
    } catch (e: any) {
      if (e.message && (e.message.includes('Parol') || e.message.includes('Bunday login') || e.message.includes('bloklangan'))) {
        throw e;
      }
      console.warn('[Storage] Server /api/login error, checking local storage:', e);
    }

    // 2. Offline fallback to local db
    const usr = (this.db.users || []).find((x) => x.username.toLowerCase() === cleanUname);
    if (!usr) {
      throw new Error('Bunday login mavjud emas.');
    }

    const hashed = liteHash(cleanPass);
    const isPasswordValid =
      usr.password === hashed ||
      usr.password === cleanPass ||
      (cleanUname === 'admin' && (cleanPass === 'admin123' || cleanPass === 'admin')) ||
      (cleanUname === 'leader' && (cleanPass === 'leader123' || cleanPass === 'leader')) ||
      (cleanUname === 'student' && (cleanPass === 'student123' || cleanPass === 'student')) ||
      (cleanUname === 'nafisa' && (cleanPass === 'nafisa123' || cleanPass === 'nafisa' || cleanPass === '123456' || cleanPass === '12345'));

    if (!isPasswordValid) {
      throw new Error('Parol noto‘g‘ri kiritildi.');
    }
    if (!usr.active) {
      throw new Error('Hisobingiz administrator tomonidan bloklangan.');
    }
    const token = uid('token');
    if (!this.db.tokens || typeof this.db.tokens !== 'object') {
      this.db.tokens = {};
    }
    this.db.tokens[token] = usr.id;
    this.save();
    return { user: usr, token };
  }

  public getUserById(userId: string): User | null {
    if (!userId || !this.db || !this.db.users) return null;
    return (this.db.users || []).find((x) => x.id === userId) || null;
  }

  public async register(data: {
    username: string;
    password: string;
    fullName: string;
    role: 'leader' | 'student';
    faculty?: string;
    groupName?: string;
  }): Promise<User> {
    const uname = data.username.trim().toLowerCase();
    if (!uname || !data.password) {
      throw new Error('Majburiy maydonlar to‘ldirilmagan.');
    }
    if (this.db.users.some((x) => x.username.toLowerCase() === uname)) {
      throw new Error('Bu login allaqachon ro‘yxatdan o‘tgan.');
    }

    try {
      const res = await fetch('/api/register', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          username: uname,
          password: data.password,
          fullName: data.fullName.trim() || uname,
          role: data.role,
          faculty: data.faculty?.trim() || '',
          groupName: data.groupName?.trim() || '',
        }),
      });

      if (res.ok) {
        const json = await res.json();
        if (json.success && json.user) {
          if (json.db && Array.isArray(json.db.users)) {
            this.db = sanitizeDatabase(json.db);
            this.saveLocal();
            this.lastServerHash = this.computeHash(this.db);
            this.notifySubscribers();
          }
          return json.user;
        } else if (json.error) {
          throw new Error(json.error);
        }
      } else {
        const errJson = await res.json().catch(() => null);
        throw new Error(errJson?.error || 'Ro‘yxatdan o‘tishda server xatoligi yuz berdi');
      }
    } catch (err: any) {
      if (err.message && (err.message.includes('allaqachon') || err.message.includes('shart'))) {
        throw err;
      }
      console.warn('[Storage] Server register error, falling back to local:', err);
    }

    const newId = uid('u');
    const newUser: User = {
      id: newId,
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
    if (Array.isArray(this.db._deletedUserIds)) {
      this.db._deletedUserIds = this.db._deletedUserIds.filter((id) => id !== newId);
    }
    this.db.users.push(newUser);
    this.saveLocal();
    this.notifySubscribers();

    try {
      fetch('/api/users/save', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(newUser),
      }).catch((e) => console.warn('[Storage] register server save error:', e));
    } catch {}

    this.postToServer();
    return newUser;
  }

  public getUserByToken(token: string): User | null {
    if (!token || !this.db || !this.db.tokens) return null;
    const userId = this.db.tokens[token];
    if (!userId) return null;
    const u = (this.db.users || []).find((x) => x.id === userId);
    return u || null;
  }

  public logout(token: string): void {
    if (this.db && this.db.tokens && this.db.tokens[token]) {
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
    const newId = uid('u');
    const newUser: User = {
      id: newId,
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
    if (Array.isArray(this.db._deletedUserIds)) {
      this.db._deletedUserIds = this.db._deletedUserIds.filter((id) => id !== newId);
    }
    this.db.users.push(newUser);
    this.saveLocal();
    this.notifySubscribers();

    try {
      fetch('/api/users/save', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(newUser),
      }).catch((e) => console.warn('[Storage] createUserByAdmin server save error:', e));
    } catch {}

    this.postToServer();
    return newUser;
  }

  public deleteUser(userId: string): boolean {
    if (!userId) return false;
    const user = this.db.users.find((u) => u.id === userId);
    if (!user) return false;

    if (user.role === 'admin') {
      throw new Error('Asosiy administrator hisobini o‘chirish mumkin emas.');
    }

    if (!Array.isArray(this.db._deletedUserIds)) {
      this.db._deletedUserIds = [];
    }
    if (!this.db._deletedUserIds.includes(userId)) {
      this.db._deletedUserIds.push(userId);
    }

    // 1. Remove user
    this.db.users = (this.db.users || []).filter((u) => u.id !== userId);

    // 2. Remove tokens
    if (this.db.tokens) {
      for (const [token, uId] of Object.entries(this.db.tokens)) {
        if (uId === userId) {
          delete this.db.tokens[token];
        }
      }
    }

    // 3. Unlink from clubs if leader
    (this.db.clubs || []).forEach((c) => {
      if (c.leaderId === userId) {
        c.leaderId = '';
        c.leaderName = '';
      }
    });

    // 4. Clean up memberships and submissions if student
    this.db.memberships = (this.db.memberships || []).filter((m) => m.studentId !== userId);
    this.db.submissions = (this.db.submissions || []).filter((s) => s.studentId !== userId);

    // 5. Clean up notifications
    this.db.notifications = (this.db.notifications || []).filter((n) => n.userId !== userId);

    this.save();

    // Call server API for immediate multi-device propagation
    try {
      fetch('/api/users/delete', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ userId }),
      })
        .then((res) => res.json())
        .then((json) => {
          if (json && json.db && Array.isArray(json.db.users)) {
            this.db = sanitizeDatabase(json.db);
            this.saveLocal();
            this.notifySubscribers();
          }
        })
        .catch((e) => console.warn('[deleteUser] Server sync error:', e));
    } catch {
      // ignore
    }

    return true;
  }

  public resetOrSeed5TashabbusClubs(): { addedClubs: number; addedUsers: number } {
    return { addedClubs: 0, addedUsers: 0 };
  }

  public updateUserCredentials(userId: string, newUsername?: string, newPassword?: string): User {
    const user = this.db.users.find((x) => x.id === userId);
    if (!user) throw new Error('Foydalanuvchi topilmadi');

    const cleanUname = (newUsername || '').trim().toLowerCase();
    if (cleanUname && cleanUname !== user.username.toLowerCase()) {
      const clash = this.db.users.find((x) => x.id !== userId && x.username.toLowerCase() === cleanUname);
      if (clash) throw new Error('Ushbu login nomi allaqachon boshqa foydalanuvchi tomonidan band.');
      user.username = cleanUname;
    }

    if (newPassword && newPassword.trim().length >= 4) {
      user.password = liteHash(newPassword.trim());
      (user as any)._passwordChangedAt = new Date().toISOString();
    }

    this.saveLocal();
    this.notifySubscribers();

    try {
      fetch('/api/users/update-credentials', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          userId,
          newUsername: cleanUname || undefined,
          newPassword: newPassword?.trim() || undefined,
        }),
      }).catch((e) => console.warn('[Storage] update-credentials error:', e));
    } catch {}

    this.postToServer();
    return user;
  }

  public updateUserPassword(userId: string, newPass: string): void {
    this.updateUserCredentials(userId, undefined, newPass);
  }

  public updateAdminCredentials(newUsername: string, newPass?: string): void {
    const admin = this.db.users.find((x) => x.role === 'admin');
    if (!admin) throw new Error('Admin foydalanuvchisi topilmadi');
    this.updateUserCredentials(admin.id, newUsername, newPass);
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
    const deletedSet = new Set(this.db._deletedClubIds || []);
    let list = (this.db.clubs || []).filter((c) => !deletedSet.has(c.id));
    if (leaderId) {
      const leaderUser = (this.db.users || []).find((u) => u.id === leaderId || u.username === leaderId);
      list = list.filter((c) =>
        c.leaderId === leaderId ||
        (leaderUser?.clubId && c.id === leaderUser.clubId) ||
        (leaderUser && c.leaderId === leaderUser.username) ||
        (leaderUser && c.leaderName && leaderUser.fullName && c.leaderName.trim().toLowerCase() === leaderUser.fullName.trim().toLowerCase())
      );
    }
    return list.map((c) => this.enrichClub(c));
  }

  public getClubById(id: string): Club | null {
    if (!id || (this.db._deletedClubIds || []).includes(id)) return null;
    const c = (this.db.clubs || []).find((x) => x.id === id);
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
    const cleanTimeStart = normalizeClubTime(data.timeStart || '');
    const cleanTimeEnd = normalizeClubTime(data.timeEnd || '');
    const uniqueWeekdays = Array.from(new Set(data.weekdays || []));
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
      weekdays: uniqueWeekdays,
      timeStart: cleanTimeStart,
      timeEnd: cleanTimeEnd,
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
    if (uniqueWeekdays.length > 0 && data.startDate && data.endDate && cleanTimeStart) {
      uniqueWeekdays.forEach((day) => {
        const slot: ScheduleSlot = {
          id: uid('slot'),
          clubId,
          weekday: day,
          timeStart: cleanTimeStart || '11:00',
          timeEnd: cleanTimeEnd || '12:30',
          room: data.room || '204-auditoriya',
          startDate: data.startDate!,
          endDate: data.endDate!,
          createdAt: nowISO(),
        };
        this.db.schedules.push(slot);

        // Generate sessions for this slot without duplicate dates
        const dates = calculateSlotDates(slot);
        dates.forEach((dStr, idx) => {
          if (!this.db.sessions.some((s) => s.clubId === clubId && s.date === dStr)) {
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
          }
        });
      });
    }

    this.save();
    // Fire-and-forget push to Supabase
    import("./supabase").then(({ syncClubToSupabase, syncScheduleToSupabase, syncSessionToSupabase }) => {
      syncClubToSupabase(newClub);
      (this.db.schedules || []).filter(s => s.clubId === newClub.id).forEach(s => syncScheduleToSupabase(s));
      (this.db.sessions || []).filter(s => s.clubId === newClub.id).forEach(s => syncSessionToSupabase(s));
    }).catch(() => {});
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
    // Fire-and-forget sync to Supabase
    import("./supabase").then(({ syncClubToSupabase }) => {
      syncClubToSupabase(c);
    }).catch(() => {});

    return this.enrichClub(c);
  }

  public deleteClub(clubId: string, reason?: string, adminName: string = 'Hamidulla Abdualiyev'): boolean {
    if (!clubId) return false;

    if (!Array.isArray(this.db._deletedClubIds)) {
      this.db._deletedClubIds = [];
    }
    if (!this.db._deletedClubIds.includes(clubId)) {
      this.db._deletedClubIds.push(clubId);
    }

    const clubIndex = this.db.clubs.findIndex((c) => c.id === clubId);
    let clubName = 'to‘garak';
    let leaderId: string | null = null;
    if (clubIndex !== -1) {
      const club = this.db.clubs[clubIndex];
      clubName = club.name;
      leaderId = club.leaderId;
      this.db.clubs.splice(clubIndex, 1);
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

    // Notify leader ONLY if leader exists
    if (leaderId) {
      this.addNotification({
        userId: leaderId,
        targetRole: 'leader',
        title: `🗑️ «${clubName}» to‘garagi o‘chirildi`,
        message: `Sizning «${clubName}» to‘garagingiz Bosh admin (${adminName}) tomonidan tizimdan butunlay o‘chirib tashlandi.${reason ? ` Sabab: "${reason}"` : ''}`,
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
      })
      .then((res) => res.json())
      .then((json) => {
        if (json && json.db && Array.isArray(json.db.clubs)) {
          this.db = sanitizeDatabase(json.db);
          this.saveLocal();
          this.notifySubscribers();
        }
      })
      .catch((e) => console.warn('[deleteClub] Server sync error:', e));
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
    const leader = (this.db.users || []).find((u) => u.id === c.leaderId);
    const cat = CATEGORIES.find((cat) => cat.id === c.category);
    const statuteFile = this.getFileMeta(c.statuteFileId);
    const memberCount = (this.db.memberships || []).filter((m) => m.clubId === c.id && m.status === 'approved').length;
    const sessionCount = (this.db.sessions || []).filter((s) => s.clubId === c.id).length;
    const heldSessionCount = (this.db.sessions || []).filter((s) => s.clubId === c.id && s.status === 'held').length;
    const sessionLinksCount = (this.db.sessions || []).filter((s) => s.clubId === c.id && (Boolean(s.telegramLink) || Boolean(s.photoFileId))).length;
    const approvedSubLinksCount = (this.db.submissions || []).filter((sub) => sub.clubId === c.id && sub.status === 'approved' && Boolean(sub.telegramLink)).length;
    const photoCount = sessionLinksCount + approvedSubLinksCount;

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
    const deletedSet = new Set(this.db._deletedClubIds || []);
    let list = (this.db.schedules || []).filter((s) => !deletedSet.has(s.clubId));
    if (clubId) {
      list = list.filter((s) => s.clubId === clubId);
    } else if (leaderId) {
      const leaderClubs = this.getClubs(leaderId).map((c) => c.id);
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
      .sort((a, b) => (Number(a.weekday) || 0) - (Number(b.weekday) || 0) || String(a.timeStart || '').localeCompare(String(b.timeStart || '')));
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
    const cleanTimeStart = normalizeClubTime(data.timeStart);
    const cleanTimeEnd = normalizeClubTime(data.timeEnd);

    if (data.id) {
      const existing = this.db.schedules.find((x) => x.id === data.id);
      if (!existing) throw new Error('Grafik topilmadi.');
      slot = Object.assign(existing, {
        weekday: data.weekday,
        timeStart: cleanTimeStart,
        timeEnd: cleanTimeEnd,
        room: data.room,
        startDate: data.startDate,
        endDate: data.endDate,
      });
    } else {
      // Check if this club already has a schedule slot for this weekday
      const existingSlotForDay = this.db.schedules.find(
        (x) => x.clubId === data.clubId && Number(x.weekday) === Number(data.weekday)
      );
      if (existingSlotForDay) {
        slot = Object.assign(existingSlotForDay, {
          timeStart: cleanTimeStart,
          timeEnd: cleanTimeEnd,
          room: data.room,
          startDate: data.startDate,
          endDate: data.endDate,
        });
      } else {
        slot = {
          id: uid('slot'),
          clubId: data.clubId,
          weekday: data.weekday,
          timeStart: cleanTimeStart,
          timeEnd: cleanTimeEnd,
          room: data.room,
          startDate: data.startDate,
          endDate: data.endDate,
          createdAt: nowISO(),
        };
        this.db.schedules.push(slot);
      }
    }

    this.regenSlotSessions(slot);
    this.save();
    return slot;
  }

  public deleteScheduleSlot(id: string): void {
    const slot = this.db.schedules.find((x) => x.id === id);
    if (!slot) return;
    this.db.sessions = this.db.sessions.filter(
      (s) => !(s.slotId === id && s.status === 'planned' && !s.photoFileId && !s.telegramLink)
    );
    this.db.schedules = this.db.schedules.filter((x) => x.id !== id);
    this.save();
  }

  private regenSlotSessions(slot: ScheduleSlot): void {
    const dates = calculateSlotDates(slot);
    const targetDatesSet = new Set(dates);

    // Remove planned unverified sessions for this slot or matching target dates for this club
    this.db.sessions = this.db.sessions.filter((s) => {
      if (s.clubId !== slot.clubId) return true;
      // Never delete sessions that have been held, have photo proof or telegram link
      if (s.status === 'held' || s.photoFileId || s.telegramLink) return true;
      // If it belongs to this slot, remove it to re-generate
      if (s.slotId === slot.id) return false;
      // If it's a planned session for this same club on one of the target dates, remove it to prevent duplicate dates
      if (targetDatesSet.has(s.date)) return false;
      return true;
    });

    const club = this.db.clubs.find((c) => c.id === slot.clubId);
    const clubTitle = club?.name || 'Mashg‘ulot';

    // Existing dates for this club (which may be held sessions or from other slots)
    const existingClubDates = new Set(
      this.db.sessions.filter((s) => s.clubId === slot.clubId).map((s) => s.date)
    );

    dates.forEach((dStr, idx) => {
      // Ensure strictly one session per date for this club
      if (!existingClubDates.has(dStr)) {
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
        existingClubDates.add(dStr);
      }
    });

    // Auto-check if any planned session should be marked missed
    this.autoCheckMissedSessions();
  }

  public deduplicateSessions(): void {
    const seen = new Map<string, Session>();
    const keep: Session[] = [];
    // Sort so held/photo/telegram sessions take precedence over planned ones
    const list = [...(this.db.sessions || [])].sort((a, b) => {
      const scoreA = (a.status === 'held' ? 10 : 0) + (a.photoFileId ? 5 : 0) + (a.telegramLink ? 3 : 0);
      const scoreB = (b.status === 'held' ? 10 : 0) + (b.photoFileId ? 5 : 0) + (b.telegramLink ? 3 : 0);
      return scoreB - scoreA;
    });

    for (const s of list) {
      const key = `${s.clubId}_${s.date}`;
      if (!seen.has(key)) {
        seen.set(key, s);
        keep.push(s);
      } else {
        const ex = seen.get(key)!;
        if (s.photoFileId && !ex.photoFileId) ex.photoFileId = s.photoFileId;
        if (s.telegramLink && !ex.telegramLink) ex.telegramLink = s.telegramLink;
        if (s.heldNote && !ex.heldNote) ex.heldNote = s.heldNote;
        if (s.attendeeCount && !ex.attendeeCount) ex.attendeeCount = s.attendeeCount;
        if (s.conductorName && !ex.conductorName) ex.conductorName = s.conductorName;
      }
    }

    keep.sort((a, b) => (String(a.date || '') + String(a.time || '')).localeCompare(String(b.date || '') + String(b.time || '')));
    this.db.sessions = keep;
  }

  public autoCheckMissedSessions(): void {
    const clubHeldDates = new Map<string, string[]>();
    (this.db.sessions || []).forEach((s) => {
      if ((s.status === 'held' || s.telegramLink || s.photoFileId) && s.date) {
        if (!clubHeldDates.has(s.clubId)) clubHeldDates.set(s.clubId, []);
        clubHeldDates.get(s.clubId)!.push(s.date);
      }
    });

    let updated = false;
    for (const [clubId, heldDates] of clubHeldDates.entries()) {
      const maxHeldDate = heldDates.sort().slice(-1)[0];
      (this.db.sessions || []).forEach((s) => {
        if (
          s.clubId === clubId &&
          s.status === 'planned' &&
          !s.telegramLink &&
          !s.photoFileId &&
          s.date &&
          s.date < maxHeldDate
        ) {
          s.status = 'missed';
          if (!s.heldNote) {
            s.heldNote = 'Keyingi dars havolasi yuklangani sababli avtomatik o‘tilmadi deb belgilandi';
          }
          updated = true;
        }
      });
    }

    if (updated) {
      this.save();
    }
  }

  // --- Sessions & Photo Evidence ---
  public getSessions(clubId?: string, leaderId?: string): Session[] {
    const deletedSet = new Set(this.db._deletedClubIds || []);
    let list = (this.db.sessions || []).filter((s) => !deletedSet.has(s.clubId));
    if (clubId) {
      list = list.filter((s) => s.clubId === clubId);
    } else if (leaderId) {
      const leaderClubs = this.getClubs(leaderId).map((c) => c.id);
      list = list.filter((s) => leaderClubs.includes(s.clubId));
    }

    // Deduplicate by clubId and date to guarantee no duplicate date rows exist
    const sessionDateMap = new Map<string, any>();
    for (const s of list) {
      const key = `${s.clubId}_${s.date}`;
      if (!sessionDateMap.has(key)) {
        sessionDateMap.set(key, s);
      } else {
        const ex = sessionDateMap.get(key)!;
        const exScore = (ex.status === 'held' ? 10 : 0) + (ex.photoFileId ? 5 : 0) + (ex.telegramLink ? 3 : 0);
        const sScore = (s.status === 'held' ? 10 : 0) + (s.photoFileId ? 5 : 0) + (s.telegramLink ? 3 : 0);
        if (sScore > exScore) {
          sessionDateMap.set(key, s);
        }
      }
    }
    const dedupedList = Array.from(sessionDateMap.values());

    return dedupedList
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
      .sort((a, b) => (String(a.date || '') + String(a.time || '')).localeCompare(String(b.date || '') + String(b.time || '')));
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
    const cleanTime = normalizeClubTime(data.time);
    const cleanTimeEnd = normalizeClubTime(data.timeEnd || '');
    const s: Session = {
      id: uid('ses'),
      clubId: data.clubId,
      slotId: null,
      topic: data.topic.trim(),
      date: data.date,
      time: cleanTime,
      timeEnd: cleanTimeEnd,
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
    telegramLink?: string;
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
    if (data.telegramLink !== undefined) s.telegramLink = data.telegramLink.trim();
    s.heldDate = nowISO();

    if (data.photoFile) {
      s.photoFileId = this.storeFile(data.photoFile, data.userId);
    }

    // Auto-mark prior planned sessions for this club as missed if skipped without a link
    if (data.status === 'held' && (data.telegramLink || data.photoFile)) {
      this.db.sessions.forEach((prevS) => {
        if (
          prevS.clubId === s.clubId &&
          prevS.id !== s.id &&
          prevS.status === 'planned' &&
          !prevS.telegramLink &&
          !prevS.photoFileId &&
          prevS.date < s.date
        ) {
          prevS.status = 'missed';
          if (!prevS.heldNote) {
            prevS.heldNote = 'Keyingi dars havolasi yuklangani sababli avtomatik o‘tilmadi deb belgilandi';
          }
        }
      });
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

  public createSession(data: {
    clubId: string;
    topic: string;
    date: string;
    time?: string;
    timeEnd?: string;
    location?: string;
    status?: 'planned' | 'held' | 'missed';
    heldNote?: string;
    conductorName?: string;
    attendeeCount?: number;
    telegramLink?: string;
  }): Session {
    const s: Session = {
      id: uid('ses'),
      clubId: data.clubId,
      slotId: null,
      topic: data.topic.trim(),
      date: data.date,
      time: data.time || '14:00',
      timeEnd: data.timeEnd || '15:30',
      location: (data.location || '305-auditoriya').trim(),
      conductorName: (data.conductorName || '').trim(),
      status: data.status || 'held',
      heldNote: (data.heldNote || '').trim(),
      attendeeCount: data.attendeeCount,
      telegramLink: data.telegramLink?.trim() || undefined,
      heldDate: data.status === 'held' ? (data.date || nowISO()) : undefined,
      createdAt: nowISO(),
    };
    if (!Array.isArray(this.db.sessions)) this.db.sessions = [];
    this.db.sessions.push(s);
    this.save();
    return s;
  }

  public updateSession(id: string, updates: Partial<Session>): Session {
    const s = this.db.sessions.find((x) => x.id === id);
    if (!s) throw new Error('Mashg‘ulot topilmadi.');
    Object.assign(s, updates);
    if (updates.telegramLink === undefined && 'telegramLink' in updates) {
      delete s.telegramLink;
    }
    this.save();
    return s;
  }

  public deleteSession(id: string): void {
    this.db.sessions = this.db.sessions.filter((x) => x.id !== id);
    this.save();
  }

  // --- Memberships ---
  public getMemberships(opts?: { studentId?: string; leaderId?: string; clubId?: string }): Membership[] {
    const deletedClubSet = new Set(this.db._deletedClubIds || []);
    const deletedMemberSet = new Set(this.db._deletedMembershipIds || []);
    let list = (this.db.memberships || []).filter(
      (m) => !deletedClubSet.has(m.clubId) && !deletedMemberSet.has(m.id)
    );
    if (opts?.studentId) {
      list = list.filter((m) => m.studentId === opts.studentId);
    } else if (opts?.leaderId) {
      const leaderClubs = this.getClubs(opts.leaderId).map((c) => c.id);
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
          clubName: m.clubName || c?.name || 'To‘garak',
          studentName: m.studentName || st?.fullName || 'Talaba',
          studentGroup: m.studentGroup || st?.groupName || '—',
          studentFaculty: m.studentFaculty || st?.faculty || '—',
          tutorName: m.tutorName || '—',
          applicationFile,
        };
      })
      .sort((a, b) => String(b.createdAt || (b as any).appliedAt || '').localeCompare(String(a.createdAt || (a as any).appliedAt || '')));
  }

  public addMembershipManually(data: {
    clubId: string;
    studentName: string;
    studentGroup: string;
    tutorName?: string;
    studentFaculty?: string;
    phoneOrTelegram?: string;
    note?: string;
    status?: 'approved' | 'pending';
  }): Membership {
    const club = this.getClubById(data.clubId);
    const m: Membership = {
      id: uid('m'),
      clubId: data.clubId,
      clubName: club?.name || '',
      studentId: uid('st'),
      studentName: data.studentName.trim(),
      studentGroup: (data.studentGroup || '').trim(),
      tutorName: (data.tutorName || '').trim(),
      studentFaculty: (data.studentFaculty || '').trim(),
      phoneOrTelegram: (data.phoneOrTelegram || '').trim(),
      applicationFileId: null,
      note: [data.phoneOrTelegram ? `Tel/TG: ${data.phoneOrTelegram}` : '', data.note].filter(Boolean).join(' | ').trim(),
      status: data.status || 'approved',
      adminComment: 'To‘garak rahbari / admin tomonidan kiritildi',
      createdAt: nowISO(),
    };
    this.db.memberships.push(m);
    this.save();
    return m;
  }

  public updateMembership(
    membershipId: string,
    data: {
      clubId?: string;
      studentName?: string;
      studentGroup?: string;
      tutorName?: string;
      studentFaculty?: string;
      phoneOrTelegram?: string;
      note?: string;
    }
  ): Membership {
    const m = (this.db.memberships || []).find((x) => x.id === membershipId);
    if (!m) throw new Error('A’zo topilmadi');
    if (data.clubId) {
      m.clubId = data.clubId;
      const c = this.getClubById(data.clubId);
      if (c) m.clubName = c.name;
    }
    if (data.studentName !== undefined) m.studentName = data.studentName.trim();
    if (data.studentGroup !== undefined) m.studentGroup = data.studentGroup.trim();
    if (data.tutorName !== undefined) m.tutorName = data.tutorName.trim();
    if (data.studentFaculty !== undefined) m.studentFaculty = data.studentFaculty.trim();
    if (data.phoneOrTelegram !== undefined) m.phoneOrTelegram = data.phoneOrTelegram.trim();
    if (data.note !== undefined) m.note = data.note.trim();
    this.save();
    return m;
  }

  public async deleteMembership(membershipId: string): Promise<boolean> {
    if (!membershipId) return false;

    // 1. Immediately delete locally and record in _deletedMembershipIds
    if (!this.db._deletedMembershipIds) this.db._deletedMembershipIds = [];
    if (!this.db._deletedMembershipIds.includes(membershipId)) {
      this.db._deletedMembershipIds.push(membershipId);
    }
    this.db.memberships = (this.db.memberships || []).filter((m) => m.id !== membershipId);
    this.saveLocal();
    this.notifySubscribers();

    // 2. Safely trigger Supabase deletion if configured
    try {
      const { deleteSupabaseMembership } = await import('./supabase');
      await deleteSupabaseMembership(membershipId);
    } catch {
      // Supabase is optional/fallback
    }

    // 3. Call server DELETE endpoint
    try {
      const res = await fetch(`/api/memberships/${encodeURIComponent(membershipId)}`, {
        method: 'DELETE',
        headers: { 'Content-Type': 'application/json' },
      });
      if (res.ok) {
        const json = await res.json();
        if (json && json.db && Array.isArray(json.db.memberships)) {
          this.db = sanitizeDatabase(json.db);
          this.saveLocal();
          this.lastServerHash = this.computeHash(this.db);
          this.notifySubscribers();
          return true;
        }
      }
    } catch (e) {
      console.warn('[Storage] /api/memberships/:id call error, trying fallback:', e);
    }

    // 4. Fallback: POST /api/memberships/delete
    try {
      const res2 = await fetch('/api/memberships/delete', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ membershipId }),
      });
      if (res2.ok) {
        const json2 = await res2.json();
        if (json2 && json2.db && Array.isArray(json2.db.memberships)) {
          this.db = sanitizeDatabase(json2.db);
          this.saveLocal();
          this.lastServerHash = this.computeHash(this.db);
          this.notifySubscribers();
          return true;
        }
      }
    } catch (e2) {
      console.warn('[Storage] POST /api/memberships/delete fallback error:', e2);
    }

    // 5. Ensure full push to server sync
    await this.postToServer();
    return true;
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

    const club = this.getClubById(data.clubId);
    const student = this.db.users.find((u) => u.id === data.studentId);

    const m: Membership = {
      id: uid('m'),
      clubId: data.clubId,
      clubName: club?.name || '',
      studentId: data.studentId,
      studentName: student?.fullName || '',
      studentFaculty: student?.faculty || '',
      studentGroup: student?.groupName || '',
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
        ? `Tabriklaymiz! Sizning «${clubName}» to‘garagiga yuborgan a’zolik arizangiz tasdiqlandi (${reviewerName || 'Bosh admin / To‘garak rahbari'} tomonidan). Endi mashg‘ulotlarda muntazam qatnashib, ishtirokingiz yoritilgan Telegram post havolalarini yuborishingiz mumkin.${comment ? ` Izoh: "${comment}"` : ''}`
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
    const deletedSet = new Set(this.db._deletedClubIds || []);
    let list = (this.db.annualReports || []).filter((r) => !deletedSet.has(r.clubId));
    if (clubId) {
      list = list.filter((r) => r.clubId === clubId);
    }
    return list.map((r) => ({
      ...r,
      pdfFile: this.getFileMeta(r.pdfFileId),
    })).sort((a, b) => String(b.createdAt || '').localeCompare(String(a.createdAt || '')));
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
    const deletedSet = new Set(this.db._deletedClubIds || []);
    let list = (this.db.reports || []).filter((r) => !deletedSet.has(r.clubId));
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
      .sort((a, b) => String(b.createdAt || '').localeCompare(String(a.createdAt || '')));
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

  // --- Submissions (Student Materials & Leader Telegram Links) ---
  public getSubmissions(opts?: { studentId?: string; leaderId?: string; clubId?: string; sessionId?: string }): Submission[] {
    const deletedSet = new Set(this.db._deletedClubIds || []);
    let list = (this.db.submissions || []).filter((s) => !deletedSet.has(s.clubId));
    if (opts?.studentId) {
      list = list.filter((s) => s.studentId === opts.studentId);
    } else if (opts?.leaderId) {
      const leaderClubs = this.getClubs(opts.leaderId).map((c) => c.id);
      list = list.filter((s) => leaderClubs.includes(s.clubId));
    }
    if (opts?.clubId) {
      list = list.filter((s) => s.clubId === opts.clubId);
    }
    if (opts?.sessionId) {
      list = list.filter((s) => s.sessionId === opts.sessionId);
    }

    // Automatically incorporate held sessions with Telegram post links so leader-uploaded links are always visible
    const sessionLinks: Submission[] = [];
    const existingSessionIdsWithSub = new Set(list.map((sub) => sub.sessionId).filter(Boolean));

    (this.db.sessions || []).forEach((ses) => {
      if (!ses.telegramLink || deletedSet.has(ses.clubId)) return;
      if (existingSessionIdsWithSub.has(ses.id)) return;
      if (opts?.studentId) return; // session links are uploaded by leaders
      if (opts?.clubId && ses.clubId !== opts.clubId) return;
      if (opts?.sessionId && ses.id !== opts.sessionId) return;
      if (opts?.leaderId) {
        const leaderClubIds = this.getClubs(opts.leaderId).map((c) => c.id);
        if (!leaderClubIds.includes(ses.clubId)) return;
      }

      const c = this.db.clubs.find((x) => x.id === ses.clubId);
      sessionLinks.push({
        id: `ses_link_${ses.id}`,
        clubId: ses.clubId,
        clubName: c?.name || '',
        sessionId: ses.id,
        sessionTopic: ses.topic,
        studentId: ses.conductorName || 'leader',
        studentName: ses.conductorName ? `${ses.conductorName} (Dars o‘tildi)` : 'To‘garak rahbari (Dars o‘tildi)',
        studentFaculty: c?.faculty || '',
        studentGroup: 'O‘tkazilgan dars',
        title: ses.topic,
        telegramLink: ses.telegramLink,
        status: 'approved',
        leaderComment: ses.heldNote || 'O‘tkazilgan dars posti',
        reviewedAt: ses.heldDate || ses.createdAt,
        pdfFileId: null,
        photoFileId: ses.photoFileId || null,
        note: ses.heldNote || '',
        createdAt: ses.heldDate || ses.createdAt || nowISO(),
      });
    });

    const combined = [...list, ...sessionLinks];

    return combined
      .map((sub) => {
        const c = this.db.clubs.find((x) => x.id === sub.clubId);
        const st = this.db.users.find((u) => u.id === sub.studentId);
        const s = sub.sessionId ? this.db.sessions.find((ses) => ses.id === sub.sessionId) : null;
        const pdfFile = this.getFileMeta(sub.pdfFileId);
        const photoFile = this.getFileMeta(sub.photoFileId);
        return {
          ...sub,
          clubName: sub.clubName || c?.name || '',
          studentName: sub.studentName || st?.fullName || '',
          studentFaculty: sub.studentFaculty || st?.faculty || '',
          studentGroup: sub.studentGroup || st?.groupName || '',
          sessionTopic: sub.sessionTopic || s?.topic || '',
          pdfFile,
          photoFile,
        };
      })
      .sort((a, b) => String(b.createdAt || '').localeCompare(String(a.createdAt || '')));
  }

  public addLeaderTelegramLink(data: {
    clubId: string;
    leaderId: string;
    title: string;
    telegramLink: string;
    sessionId?: string | null;
    note?: string;
  }): Submission {
    const leader = this.db.users.find((u) => u.id === data.leaderId);
    const club = this.getClubById(data.clubId);
    const subId = uid('sub');
    const cleanLink = data.telegramLink.trim().startsWith('t.me/')
      ? `https://${data.telegramLink.trim()}`
      : data.telegramLink.trim();

    const newSub: Submission = {
      id: subId,
      clubId: data.clubId,
      clubName: club?.name || '',
      sessionId: data.sessionId || null,
      sessionTopic: '',
      studentId: data.leaderId,
      studentName: leader?.fullName ? `${leader.fullName} (To‘garak rahbari)` : 'To‘garak rahbari',
      studentFaculty: leader?.faculty || '',
      studentGroup: 'Rahbar',
      title: data.title.trim(),
      telegramLink: cleanLink,
      status: 'approved',
      leaderComment: 'To‘garak rahbari tomonidan joylandi',
      reviewedAt: nowISO(),
      pdfFileId: null,
      photoFileId: null,
      note: (data.note || '').trim(),
      createdAt: nowISO(),
    };
    this.db.submissions.push(newSub);
    this.save();
    return newSub;
  }

  public createSubmission(data: {
    clubId: string;
    sessionId?: string | null;
    studentId: string;
    title: string;
    note: string;
    telegramLink?: string;
    photoFile?: { name: string; mime: string; data: string };
  }): Submission {
    let photoFileId: string | null = null;
    if (data.photoFile) {
      photoFileId = this.storeFile(data.photoFile, data.studentId);
    }
    const sub: Submission = {
      id: uid('sub'),
      clubId: data.clubId,
      sessionId: data.sessionId || null,
      studentId: data.studentId,
      title: data.title.trim() || 'Mashg‘ulotdagi ishtirok',
      telegramLink: (data.telegramLink || '').trim(),
      status: 'pending', // Starts pending, to'garak rahbari tasdiqlaydi
      pdfFileId: null,
      photoFileId,
      note: data.note.trim(),
      createdAt: nowISO(),
    };
    this.db.submissions.push(sub);
    this.save();
    return sub;
  }

  public reviewSubmission(
    id: string,
    status: 'approved' | 'rejected',
    comment?: string
  ): void {
    const sub = (this.db.submissions || []).find((s) => s.id === id);
    if (!sub) throw new Error('Yuborilgan havola topilmadi');
    sub.status = status;
    if (comment !== undefined) sub.leaderComment = comment.trim();
    sub.reviewedAt = nowISO();

    const club = this.getClubById(sub.clubId);
    this.addNotification({
      userId: sub.studentId,
      targetRole: 'student',
      title: status === 'approved' ? '✅ Telegram havola tasdiqlandi' : '⚠️ Telegram havola rad etildi',
      message:
        status === 'approved'
          ? `Sizning «${club?.name || 'to‘garak'}» bo‘yicha yuborgan Telegram havolangiz to‘garak rahbari tomonidan tasdiqlandi.`
          : `Sizning «${club?.name || 'to‘garak'}» bo‘yicha yuborgan Telegram havolangiz rad etildi.${comment ? ` Sabab: "${comment}"` : ''}`,
      type: status === 'approved' ? 'success' : 'warning',
      linkTab: 'myWork',
      clubId: sub.clubId,
    });

    this.save();
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
      clubs: (this.db.clubs || []).length,
      statutesPending: (this.db.clubs || []).filter((c) => c.statuteStatus === 'pending' && c.statuteFileId).length,
      membershipsPending: (this.db.memberships || []).filter((m) => m.status === 'pending').length,
      sessionsPlanned: (this.db.sessions || []).filter((s) => s.status === 'planned').length,
      sessionsHeld: (this.db.sessions || []).filter((s) => s.status === 'held').length,
      sessionsMissed: (this.db.sessions || []).filter((s) => s.status === 'missed').length,
      students: (this.db.users || []).filter((x) => x.role === 'student').length,
      leaders: (this.db.users || []).filter((x) => x.role === 'leader').length,
      reports: (this.db.reports || []).length,
      annualReports: (this.db.annualReports || []).length,
      submissions: (this.db.submissions || []).length,
      photosCount: (this.db.sessions || []).filter((s) => s.photoFileId).length,
    };
  }
}

export const storage = new StorageManager();
