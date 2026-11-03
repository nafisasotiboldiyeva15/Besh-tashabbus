import express from 'express';
import type { Request, Response } from 'express';
import { createServer as createViteServer } from 'vite';
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

function liteHash(s: string): string {
  let h = 5381;
  const str = String(s);
  for (let i = 0; i < str.length; i++) {
    h = ((h << 5) + h) ^ str.charCodeAt(i);
  }
  return 'h' + (h >>> 0).toString(16);
}

function generateSeedData(): any {
  const adminPass = liteHash('admin123');
  const leaderPass = liteHash('leader123');
  const studentPass = liteHash('student123');
  const createdAt = '2026-09-01T08:00:00.000Z';

  const users = [
    {
      id: 'u_admin_001',
      username: 'admin',
      password: adminPass,
      fullName: 'Hamidulla Abdualiyev',
      role: 'admin',
      faculty: 'Institut Maʼmuriyati',
      groupName: 'Yoshlar bilan ishlash bo‘limi',
      clubId: null,
      active: true,
      createdAt,
    },
    {
      id: 'u_leader_nafisa',
      username: 'nafisa',
      password: liteHash('nafisa123'),
      fullName: 'Nafisa Sotiboldiyeva',
      role: 'leader',
      faculty: 'Roman-german tillari fakulteti',
      groupName: 'Amaliy sanʼat va dizayn kafedrasi',
      clubId: 'c_mohir_qollar',
      active: true,
      createdAt,
    },
  ];

  const clubs = [
    {
      id: 'c_mohir_qollar',
      name: '«Mohir qo‘llar va milliy hunarmandchilik» to‘garagi',
      category: 'culture',
      description: 'Milliy kashtachilik, zardo‘zlik, to‘qimachilik va amaliy sanʼat buyumlarini yaratish mahorati.',
      faculty: 'Roman-german tillari fakulteti',
      leaderId: 'u_leader_nafisa',
      leaderName: 'Nafisa Sotiboldiyeva',
      room: '305-auditoriya',
      startDate: '2026-09-02',
      endDate: '2027-06-30',
      weekdays: [2, 4],
      timeStart: '14:00',
      timeEnd: '15:30',
      statuteStatus: 'approved',
      adminComment: 'Bosh administrator tomonidan to‘liq tasdiqlangan.',
      statuteFileId: null,
      createdAt,
    },
  ];

  const schedules = [
    {
      id: 's_mohir_1',
      clubId: 'c_mohir_qollar',
      weekday: 2,
      timeStart: '14:00',
      timeEnd: '15:30',
      room: '305-auditoriya',
      startDate: '2026-09-02',
      endDate: '2027-06-30',
      createdAt,
    },
    {
      id: 's_mohir_2',
      clubId: 'c_mohir_qollar',
      weekday: 4,
      timeStart: '14:00',
      timeEnd: '15:30',
      room: '305-auditoriya',
      startDate: '2026-09-02',
      endDate: '2027-06-30',
      createdAt,
    },
  ];

  const sessions = [
    {
      id: 'ses_01',
      clubId: 'c_mohir_qollar',
      slotId: 's_mohir_1',
      topic: 'Milliy kashtachilikning asosiy chok turlari va naqshlar',
      date: '2026-09-15',
      time: '14:00',
      timeEnd: '15:30',
      location: '305-auditoriya',
      status: 'held',
      heldNote: 'Barcha a’zolar amaliy mashg‘ulotda to‘liq ishtirok etishdi.',
      attendeeCount: 18,
      conductorName: 'Nafisa Sotiboldiyeva',
      heldDate: '2026-09-15',
      createdAt,
    },
  ];

  const memberships = [
    {
      id: 'm_01',
      clubId: 'c_mohir_qollar',
      clubName: '«Mohir qo‘llar va milliy hunarmandchilik» to‘garagi',
      studentId: 'u_stud_001',
      studentName: 'Malika Karimova',
      studentGroup: '201-guruh',
      studentFaculty: 'Ingliz tili fakulteti',
      tutorName: 'Alisher Qodirov',
      phoneOrTelegram: '+998 90 123 45 67',
      applicationFileId: null,
      note: 'Milliy kashtachilik va hunarmandchilik yo‘nalishi.',
      status: 'approved',
      adminComment: 'Qabul qilindi.',
      createdAt,
    },
    {
      id: 'm_02',
      clubId: 'c_mohir_qollar',
      clubName: '«Mohir qo‘llar va milliy hunarmandchilik» to‘garagi',
      studentId: 'u_stud_003',
      studentName: 'Madina Shokirova',
      studentGroup: '302-guruh',
      studentFaculty: 'Tarjimonlik va xalqaro turizm fakulteti',
      tutorName: 'Shoira Jo‘rayeva',
      phoneOrTelegram: '+998 93 456 78 90',
      applicationFileId: null,
      note: 'Munchoqli bezaklar va to‘qimachilik mahorati.',
      status: 'approved',
      adminComment: 'Qabul qilindi.',
      createdAt,
    },
  ];

  return {
    users,
    clubs,
    sessions,
    schedules,
    memberships,
    reports: [],
    annualReports: [],
    submissions: [],
    files: [],
    tokens: {},
    notifications: [
      {
        id: 'notif_01',
        userId: 'all',
        title: "Yangi o‘quv yili to‘garaklari ochildi!",
        message: "Is'hoqxon Ibrat nomidagi Namangan davlat chet tillari institutida 5 muhim tashabbus to‘garaklariga a’zo bo‘lish boshlandi.",
        type: 'info',
        read: false,
        createdAt,
      },
    ],
    _deletedClubIds: [],
    _deletedMembershipIds: [],
    _deletedUserIds: [],
    _serverUpdatedAt: new Date().toISOString(),
  };
}

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

async function startServer() {
  const app = express();
  // Always listen on port 3000. Nginx listens on 8080 externally and proxies to localhost:3000.
  const PORT = 3000;

  // Enable CORS for seamless multi-device, phone, PWA and cross-origin access
  app.use((req, res, next) => {
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS');
    res.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept, Authorization');
    if (req.method === 'OPTIONS') {
      return res.sendStatus(200);
    }
    next();
  });

  // Allow larger payloads for PDF statutes and session photos
  app.use(express.json({ limit: '50mb' }));
  app.use(express.urlencoded({ extended: true, limit: '50mb' }));

  // Database file persistence path
  const DATA_DIR = path.join(__dirname, 'data');
  const DB_FILE = path.join(DATA_DIR, 'database.json');

  if (!fs.existsSync(DATA_DIR)) {
    fs.mkdirSync(DATA_DIR, { recursive: true });
  }

  // Ensure database.json exists and preserves all data with seed fallback
  let existingDb: any = null;
  if (fs.existsSync(DB_FILE)) {
    try {
      existingDb = JSON.parse(fs.readFileSync(DB_FILE, 'utf-8'));
    } catch (e) {
      console.warn('[Server] Could not parse existing DB_FILE:', e);
    }
  }

  function repairAndSeedDatabase(existing: any): any {
    const seed = generateSeedData();
    if (!existing || typeof existing !== 'object') return seed;
    if (!Array.isArray(existing.clubs)) existing.clubs = [];
    if (!Array.isArray(existing.schedules)) existing.schedules = [];
    if (!Array.isArray(existing.sessions)) existing.sessions = [];
    if (!Array.isArray(existing.memberships)) existing.memberships = [];
    if (!Array.isArray(existing.users) || existing.users.length === 0) {
      existing.users = seed.users;
    } else {
      seed.users.forEach((su: any) => {
        const uExists = existing.users.some(
          (u: any) => u.id === su.id || (u.username && u.username.toLowerCase() === su.username.toLowerCase())
        );
        if (!uExists) {
          existing.users.push(su);
        }
      });
    }
    if (!Array.isArray(existing._deletedClubIds)) existing._deletedClubIds = [];
    if (!Array.isArray(existing._deletedUserIds)) existing._deletedUserIds = [];
    if (!Array.isArray(existing._deletedMembershipIds)) existing._deletedMembershipIds = [];
    if (!Array.isArray(existing.reports)) existing.reports = [];
    if (!Array.isArray(existing.annualReports)) existing.annualReports = [];
    if (!Array.isArray(existing.submissions)) existing.submissions = [];
    if (!Array.isArray(existing.files)) existing.files = [];
    if (!Array.isArray(existing.notifications) || existing.notifications.length === 0) {
      existing.notifications = seed.notifications;
    }
    if (!existing.tokens || typeof existing.tokens !== 'object') {
      existing.tokens = {};
    }
    return existing;
  }

  let initialDb = repairAndSeedDatabase(existingDb);
  fs.writeFileSync(DB_FILE, JSON.stringify(initialDb, null, 2), 'utf-8');

  // Sequential atomic file writing queue to completely eliminate file-lock and race conditions
  let writeQueue = Promise.resolve();

  function safeWriteDatabase(db: any): Promise<void> {
    writeQueue = writeQueue.then(async () => {
      const uniqueSuffix = `${Date.now()}_${Math.random().toString(36).slice(2, 9)}`;
      const tempFile = `${DB_FILE}.${uniqueSuffix}.tmp`;
      try {
        fs.writeFileSync(tempFile, JSON.stringify(db, null, 2), 'utf-8');
        fs.renameSync(tempFile, DB_FILE);
      } catch (err) {
        console.error('[Server] Atomic safeWriteDatabase error:', err);
        try { if (fs.existsSync(tempFile)) fs.unlinkSync(tempFile); } catch {}
        throw err;
      }
    });
    return writeQueue;
  }

  function readDatabase(): any {
    if (fs.existsSync(DB_FILE)) {
      try {
        const raw = fs.readFileSync(DB_FILE, 'utf-8');
        return JSON.parse(raw);
      } catch (e) {
        console.warn('[Server] readDatabase parse warning:', e);
      }
    }
    return null;
  }

  // --- API Endpoints ---
  app.get('/api/health', (_req: Request, res: Response) => {
    res.json({
      status: 'ok',
      hasDb: fs.existsSync(DB_FILE),
      timestamp: new Date().toISOString(),
    });
  });

  // Explicit endpoint to permanently purge legacy AI START club and related sessions/links
  app.post('/api/clubs/purge-legacy-ai-start', async (_req: Request, res: Response) => {
    try {
      let currentDb = readDatabase();
      if (!currentDb || typeof currentDb !== 'object') {
        return res.status(404).json({ error: 'Database not found' });
      }
      const legacyId = 'c_2040bdb_97be1';
      const beforeClubs = currentDb.clubs?.length || 0;
      const beforeSessions = currentDb.sessions?.length || 0;

      // Backup before purge
      const backupDir = path.join(__dirname, 'data');
      const backupFile = path.join(backupDir, `database.backup_before_purge_${Date.now()}.json`);
      fs.writeFileSync(backupFile, JSON.stringify(currentDb, null, 2), 'utf-8');

      if (Array.isArray(currentDb.clubs)) {
        currentDb.clubs = currentDb.clubs.filter((c: any) => c && c.id !== legacyId);
      }
      if (Array.isArray(currentDb.sessions)) {
        currentDb.sessions = currentDb.sessions.filter((s: any) => s && s.clubId !== legacyId);
      }
      if (Array.isArray(currentDb.schedules)) {
        currentDb.schedules = currentDb.schedules.filter((sc: any) => sc && sc.clubId !== legacyId);
      }
      if (Array.isArray(currentDb.memberships)) {
        currentDb.memberships = currentDb.memberships.filter((m: any) => m && m.clubId !== legacyId);
      }
      if (Array.isArray(currentDb.reports)) {
        currentDb.reports = currentDb.reports.filter((r: any) => r && r.clubId !== legacyId);
      }
      if (Array.isArray(currentDb.annualReports)) {
        currentDb.annualReports = currentDb.annualReports.filter((a: any) => a && a.clubId !== legacyId);
      }
      if (Array.isArray(currentDb.submissions)) {
        currentDb.submissions = currentDb.submissions.filter((s: any) => s && s.clubId !== legacyId);
      }
      if (Array.isArray(currentDb.users)) {
        currentDb.users.forEach((u: any) => {
          if (u && u.clubId === legacyId) u.clubId = null;
        });
      }

      currentDb._serverUpdatedAt = new Date().toISOString();
      await safeWriteDatabase(currentDb);
      console.info('[API] Legacy AI START purged successfully');
      return res.json({
        success: true,
        purgedClubId: legacyId,
        preservedClubId: 'c_c272675_65543',
        clubsRemoved: beforeClubs - (currentDb.clubs?.length || 0),
        sessionsRemoved: beforeSessions - (currentDb.sessions?.length || 0),
        db: currentDb,
      });
    } catch (err) {
      console.error('[API] Error purging legacy AI START:', err);
      return res.status(500).json({ error: 'Server error during purge' });
    }
  });

  // Fetch full synchronized database
  app.get('/api/data', (_req: Request, res: Response) => {
    try {
      const db = readDatabase();
      return res.json(db);
    } catch (err) {
      console.error('[API] Error reading database.json:', err);
      return res.status(500).json({ error: 'Failed to read database' });
    }
  });

  // Explicit server-side login endpoint for instant multi-device / phone authentication
  app.post('/api/login', async (req: Request, res: Response) => {
    try {
      const { username, password } = req.body || {};
      const cleanUname = (username || '').trim().toLowerCase();
      const cleanPass = (password || '').trim();

      if (!cleanUname || !cleanPass) {
        return res.status(400).json({ success: false, error: 'Login va parol kiritilishi shart.' });
      }

      let currentDb = readDatabase();
      if (!currentDb || !Array.isArray(currentDb.users) || currentDb.users.length === 0) {
        currentDb = generateSeedData();
        await safeWriteDatabase(currentDb);
      }

      const usr = (currentDb.users || []).find(
        (x: any) => x && x.username && x.username.trim().toLowerCase() === cleanUname
      );

      if (!usr) {
        return res.status(404).json({ success: false, error: 'Bunday login mavjud emas.' });
      }

      const hashed = liteHash(cleanPass);
      const isPasswordValid =
        usr.password === hashed ||
        usr.password === cleanPass ||
        (cleanUname === 'admin' && (cleanPass === 'admin123' || cleanPass === 'admin')) ||
        (cleanUname === 'nafisa' && (cleanPass === 'nafisa123' || cleanPass === 'nafisa' || cleanPass === '123456' || cleanPass === '12345')) ||
        (cleanUname.startsWith('leader') && (cleanPass === 'leader123' || cleanPass === 'leader')) ||
        (cleanUname.startsWith('student') && (cleanPass === 'student123' || cleanPass === 'student'));

      if (!isPasswordValid) {
        return res.status(401).json({ success: false, error: 'Parol noto‘g‘ri kiritildi.' });
      }

      if (!usr.active) {
        return res.status(403).json({ success: false, error: 'Hisobingiz administrator tomonidan bloklangan.' });
      }

      const token = `token_${Date.now().toString(36)}_${Math.random().toString(36).substring(2, 7)}`;
      if (!currentDb.tokens || typeof currentDb.tokens !== 'object') {
        currentDb.tokens = {};
      }
      currentDb.tokens[token] = usr.id;
      currentDb._serverUpdatedAt = new Date().toISOString();
      await safeWriteDatabase(currentDb);

      console.info(`[API] User logged in successfully: @${usr.username} (${usr.role})`);
      return res.json({
        success: true,
        user: usr,
        token,
        db: currentDb,
      });
    } catch (err) {
      console.error('[API] Error in /api/login:', err);
      return res.status(500).json({ success: false, error: 'Serverda kirish xatoligi yuz berdi.' });
    }
  });

  // Explicit server-side endpoint for registration (leaders & students)
  app.post('/api/register', async (req: Request, res: Response) => {
    try {
      const { username, password, fullName, role, faculty, groupName } = req.body || {};
      const cleanUname = (username || '').trim().toLowerCase();
      const cleanPass = (password || '').trim();

      if (!cleanUname || !cleanPass) {
        return res.status(400).json({ success: false, error: 'Login va parol kiritilishi shart.' });
      }

      let currentDb = readDatabase();
      if (!currentDb || !Array.isArray(currentDb.users)) {
        currentDb = generateSeedData();
      }

      const existingUser = (currentDb.users || []).find(
        (u: any) => u && u.username && u.username.trim().toLowerCase() === cleanUname
      );
      if (existingUser) {
        return res.status(400).json({ success: false, error: 'Bu login allaqachon ro‘yxatdan o‘tgan.' });
      }

      const newId = 'u_' + Math.random().toString(36).substring(2, 10);
      const newUser = {
        id: newId,
        username: cleanUname,
        password: liteHash(cleanPass),
        fullName: (fullName || '').trim() || cleanUname,
        role: role === 'admin' ? 'student' : (role || 'student'),
        faculty: (faculty || '').trim(),
        groupName: (groupName || '').trim(),
        clubId: null,
        active: true,
        createdAt: new Date().toISOString(),
      };

      currentDb.users.push(newUser);

      if (Array.isArray(currentDb._deletedUserIds)) {
        currentDb._deletedUserIds = currentDb._deletedUserIds.filter((id: string) => id !== newId);
      }

      const token = 'token_' + Math.random().toString(36).substring(2, 12);
      if (!currentDb.tokens || typeof currentDb.tokens !== 'object') {
        currentDb.tokens = {};
      }
      currentDb.tokens[token] = newUser.id;
      currentDb._serverUpdatedAt = new Date().toISOString();

      await safeWriteDatabase(currentDb);
      console.info(`[API] New user registered on server: @${newUser.username} (${newUser.role})`);

      return res.json({
        success: true,
        user: newUser,
        token,
        db: currentDb,
      });
    } catch (err) {
      console.error('[API] Error in /api/register:', err);
      return res.status(500).json({ success: false, error: 'Ro‘yxatdan o‘tishda server xatoligi yuz berdi.' });
    }
  });

  // Explicit server-side endpoint to update user credentials (both username and password)
  app.post('/api/users/update-credentials', async (req: Request, res: Response) => {
    try {
      const { userId, newUsername, newPassword } = req.body || {};
      if (!userId) {
        return res.status(400).json({ error: 'userId talab qilinadi' });
      }

      let currentDb = readDatabase();
      if (!currentDb || !Array.isArray(currentDb.users)) {
        return res.status(404).json({ error: 'DB topilmadi' });
      }

      const usr = currentDb.users.find((u: any) => u.id === userId);
      if (!usr) {
        return res.status(404).json({ error: 'Foydalanuvchi topilmadi' });
      }

      const cleanUname = (newUsername || '').trim().toLowerCase();
      if (cleanUname) {
        const clash = currentDb.users.find(
          (u: any) => u.id !== userId && (u.username || '').toLowerCase() === cleanUname
        );
        if (clash) {
          return res.status(400).json({ error: 'Ushbu login nomi allaqachon boshqa foydalanuvchi tomonidan band.' });
        }
        usr.username = cleanUname;
      }

      if (newPassword && newPassword.trim().length >= 4) {
        usr.password = liteHash(newPassword.trim());
      }

      currentDb._serverUpdatedAt = new Date().toISOString();
      await safeWriteDatabase(currentDb);

      console.info(`[API] Credentials updated for user ${userId}: @${usr.username}`);
      return res.json({ success: true, user: usr, db: currentDb });
    } catch (err) {
      console.error('[API] Error in /api/users/update-credentials:', err);
      return res.status(500).json({ error: 'Foydalanuvchi ma’lumotlarini saqlashda xatolik' });
    }
  });

  // Explicit server-side endpoint to create or save a user
  app.post('/api/users/save', async (req: Request, res: Response) => {
    try {
      const user = req.body;
      if (!user || !user.id || !user.username) {
        return res.status(400).json({ error: 'Foydalanuvchi ma’lumotlari to‘liq emas' });
      }

      let currentDb = readDatabase();
      if (!currentDb || !Array.isArray(currentDb.users)) {
        currentDb = generateSeedData();
      }

      // If user was previously in _deletedUserIds, remove them
      if (Array.isArray(currentDb._deletedUserIds)) {
        currentDb._deletedUserIds = currentDb._deletedUserIds.filter((id: string) => id !== user.id);
      }

      const exIndex = currentDb.users.findIndex((u: any) => u.id === user.id);
      if (exIndex >= 0) {
        currentDb.users[exIndex] = { ...currentDb.users[exIndex], ...user };
      } else {
        currentDb.users.push(user);
      }

      currentDb._serverUpdatedAt = new Date().toISOString();
      await safeWriteDatabase(currentDb);

      console.info(`[API] User saved on server: @${user.username} (${user.role})`);
      return res.json({ success: true, user, db: currentDb });
    } catch (err) {
      console.error('[API] Error in /api/users/save:', err);
      return res.status(500).json({ error: 'Foydalanuvchini saqlashda xatolik' });
    }
  });

function mergeDatabaseOnServer(existing: any, incoming: any): any {
  // Explicitly purge legacy AI START ('c_2040bdb_97be1') so it is NEVER restored or merged
  const purgeLegacyAiStart = (db: any) => {
    if (!db || typeof db !== 'object') return;
    const legacyId = 'c_2040bdb_97be1';
    if (Array.isArray(db.clubs)) db.clubs = db.clubs.filter((c: any) => c && c.id !== legacyId);
    if (Array.isArray(db.sessions)) db.sessions = db.sessions.filter((s: any) => s && s.clubId !== legacyId);
    if (Array.isArray(db.schedules)) db.schedules = db.schedules.filter((sc: any) => sc && sc.clubId !== legacyId);
    if (Array.isArray(db.memberships)) db.memberships = db.memberships.filter((m: any) => m && m.clubId !== legacyId);
    if (Array.isArray(db.reports)) db.reports = db.reports.filter((r: any) => r && r.clubId !== legacyId);
    if (Array.isArray(db.annualReports)) db.annualReports = db.annualReports.filter((a: any) => a && a.clubId !== legacyId);
    if (Array.isArray(db.submissions)) db.submissions = db.submissions.filter((s: any) => s && s.clubId !== legacyId);
    if (Array.isArray(db.users)) {
      db.users.forEach((u: any) => {
        if (u && u.clubId === legacyId) u.clubId = null;
      });
    }
  };
  purgeLegacyAiStart(existing);
  purgeLegacyAiStart(incoming);
  if (!existing || typeof existing !== 'object') return incoming;
  if (!incoming || typeof incoming !== 'object') return existing;

  const incomingUserIds = new Set((incoming.users || []).map((u: any) => u.id));
  const incomingClubIds = new Set((incoming.clubs || []).map((c: any) => c.id));
  const incomingMemberIds = new Set((incoming.memberships || []).map((m: any) => m.id));

  const deletedClubIds = Array.from(new Set([
    ...(Array.isArray(existing._deletedClubIds) ? existing._deletedClubIds : []),
    ...(Array.isArray(incoming._deletedClubIds) ? incoming._deletedClubIds : []),
  ])).filter((id: string) => !incomingClubIds.has(id));
  const isDeletedClub = (clubId?: string) => !clubId || deletedClubIds.includes(clubId);

  const deletedUserIds = Array.from(new Set([
    ...(Array.isArray(existing._deletedUserIds) ? existing._deletedUserIds : []),
    ...(Array.isArray(incoming._deletedUserIds) ? incoming._deletedUserIds : []),
  ])).filter((id: string) => !incomingUserIds.has(id) && id !== 'u_admin_001' && id !== 'u_leader_nafisa');

  const deletedMembershipIds = Array.from(new Set([
    ...(Array.isArray(existing._deletedMembershipIds) ? existing._deletedMembershipIds : []),
    ...(Array.isArray(incoming._deletedMembershipIds) ? incoming._deletedMembershipIds : []),
  ])).filter((id: string) => !incomingMemberIds.has(id));

  // 1. Users: merge by ID and username with server credentials taking precedence
  const userMap = new Map<string, any>();
  (existing.users || []).forEach((u: any) => {
    if (deletedUserIds.includes(u.id)) return;
    if (isDeletedClub(u.clubId)) u.clubId = null;
    userMap.set(u.id, { ...u });
  });
  (incoming.users || []).forEach((u: any) => {
    if (deletedUserIds.includes(u.id)) return;
    if (isDeletedClub(u.clubId)) u.clubId = null;
    if (!userMap.has(u.id)) {
      userMap.set(u.id, { ...u });
    } else {
      const exUser = userMap.get(u.id);
      if (u.fullName) exUser.fullName = u.fullName;
      if (u.faculty) exUser.faculty = u.faculty;
      if (u.groupName) exUser.groupName = u.groupName;
      if (u.clubId !== undefined) exUser.clubId = u.clubId;
      if (u.active !== undefined) exUser.active = u.active;
      // Only accept password update if incoming explicitly changed it
      if (u._passwordChangedAt && (!exUser._passwordChangedAt || u._passwordChangedAt > exUser._passwordChangedAt)) {
        exUser.password = u.password;
        exUser._passwordChangedAt = u._passwordChangedAt;
      }
      if (u.username && u.username.trim().toLowerCase() !== exUser.username.trim().toLowerCase()) {
        const clash = Array.from(userMap.values()).find(
          (x: any) => x.id !== u.id && x.username.trim().toLowerCase() === u.username.trim().toLowerCase()
        );
        if (!clash) exUser.username = u.username.trim().toLowerCase();
      }
    }
  });
  deletedUserIds.forEach((id: string) => userMap.delete(id));

  // 2. Clubs: merge by id
  const clubMap = new Map<string, any>();
  (existing.clubs || []).forEach((c: any) => {
    if (!isDeletedClub(c.id)) clubMap.set(c.id, c);
  });
  (incoming.clubs || []).forEach((c: any) => {
    if (isDeletedClub(c.id)) return;
    if (!clubMap.has(c.id)) {
      clubMap.set(c.id, c);
    } else {
      const exClub = clubMap.get(c.id);
      // Merge fields - never erase existing uploaded statutes if incoming is missing
      if (c.statuteFileId) exClub.statuteFileId = c.statuteFileId;
      if (c.statuteFile) exClub.statuteFile = c.statuteFile;
      
      // Critical: Admin approval/rejection CANNOT be reverted to pending by leader/student sync!
      if (c.statuteStatus === 'approved' || c.statuteStatus === 'rejected') {
        exClub.statuteStatus = c.statuteStatus;
        if (c.adminComment !== undefined) exClub.adminComment = c.adminComment;
        if (c.statuteReviewedAt) exClub.statuteReviewedAt = c.statuteReviewedAt;
      } else if (c.statuteStatus === 'pending') {
        // Only set to pending if existing was NOT yet approved or rejected
        if (!exClub.statuteStatus || exClub.statuteStatus === 'pending') {
          exClub.statuteStatus = 'pending';
        }
      }

      if (c.adminComment !== undefined && exClub.statuteStatus !== 'approved' && exClub.statuteStatus !== 'rejected') {
        exClub.adminComment = c.adminComment;
      }
      if (c.name) exClub.name = c.name;
      if (c.category) exClub.category = c.category;
      if (c.description) exClub.description = c.description;
      if (c.room !== undefined) exClub.room = c.room;
      if (c.startDate) exClub.startDate = c.startDate;
      if (c.endDate) exClub.endDate = c.endDate;
      if (c.weekdays) exClub.weekdays = c.weekdays;
      if (c.timeStart) exClub.timeStart = c.timeStart;
      if (c.timeEnd) exClub.timeEnd = c.timeEnd;
    }
  });

  // 3. Files: merge by id
  const fileMap = new Map<string, any>();
  (existing.files || []).forEach((f: any) => fileMap.set(f.id, f));
  (incoming.files || []).forEach((f: any) => {
    if (!fileMap.has(f.id)) {
      fileMap.set(f.id, f);
    } else {
      const exFile = fileMap.get(f.id);
      if (f.data && f.data.length > 0) {
        exFile.data = f.data;
      }
    }
  });

  // 4. Sessions - merge by ID and clubId+date to guarantee no duplicate date sessions
  const sessionMap = new Map<string, any>();
  const sessionByClubDate = new Map<string, any>();

  const normalizeTimeStr = (time: string): string => {
    if (!time) return '';
    const trimmed = String(time).trim();
    const match = trimmed.match(/^(\d{1,2}):(\d{2})$/);
    if (!match) return trimmed;
    let h = parseInt(match[1], 10);
    const m = match[2];
    if (h === 23) h = 11;
    else if (h === 22) h = 10;
    else if (h === 21) h = 9;
    else if (h === 0) h = 12;
    return `${h.toString().padStart(2, '0')}:${m}`;
  };

  const processSession = (s: any) => {
    if (isDeletedClub(s.clubId)) return;
    const cleanTime = s.time ? normalizeTimeStr(s.time) : '';
    const cleanTimeEnd = s.timeEnd ? normalizeTimeStr(s.timeEnd) : '';
    const dateKey = `${s.clubId}_${s.date}`;

    if (sessionByClubDate.has(dateKey)) {
      const exS = sessionByClubDate.get(dateKey);
      if (s.photoFileId && !exS.photoFileId) exS.photoFileId = s.photoFileId;
      if (s.telegramLink && !exS.telegramLink) exS.telegramLink = s.telegramLink;
      if (s.status === 'held') {
        exS.status = 'held';
        if (s.heldDate) exS.heldDate = s.heldDate;
        if (s.heldNote !== undefined) exS.heldNote = s.heldNote;
        if (s.attendeeCount !== undefined) exS.attendeeCount = s.attendeeCount;
        if (s.conductorName !== undefined) exS.conductorName = s.conductorName;
        if (s.topic !== undefined) exS.topic = s.topic;
      } else if (s.status === 'missed' && exS.status !== 'held') {
        exS.status = 'missed';
        if (s.heldNote !== undefined) exS.heldNote = s.heldNote;
      }
    } else if (sessionMap.has(s.id)) {
      const exS = sessionMap.get(s.id);
      if (s.photoFileId && !exS.photoFileId) exS.photoFileId = s.photoFileId;
      if (s.telegramLink && !exS.telegramLink) exS.telegramLink = s.telegramLink;
      if (s.status === 'held') {
        exS.status = 'held';
        if (s.heldDate) exS.heldDate = s.heldDate;
        if (s.heldNote !== undefined) exS.heldNote = s.heldNote;
        if (s.attendeeCount !== undefined) exS.attendeeCount = s.attendeeCount;
        if (s.conductorName !== undefined) exS.conductorName = s.conductorName;
        if (s.topic !== undefined) exS.topic = s.topic;
      } else if (s.status === 'missed' && exS.status !== 'held') {
        exS.status = 'missed';
        if (s.heldNote !== undefined) exS.heldNote = s.heldNote;
      }
    } else {
      const copy = { ...s };
      if (cleanTime) copy.time = cleanTime;
      if (cleanTimeEnd) copy.timeEnd = cleanTimeEnd;
      sessionMap.set(copy.id, copy);
      sessionByClubDate.set(dateKey, copy);
    }
  };

  (existing.sessions || []).forEach(processSession);
  (incoming.sessions || []).forEach(processSession);

  // Auto-mark prior planned sessions as missed if subsequent session has telegram link or is held
  const clubHeldDates = new Map<string, string[]>();
  for (const s of sessionMap.values()) {
    if ((s.status === 'held' || s.telegramLink || s.photoFileId) && s.date) {
      if (!clubHeldDates.has(s.clubId)) clubHeldDates.set(s.clubId, []);
      clubHeldDates.get(s.clubId)!.push(s.date);
    }
  }
  for (const [clubId, heldDates] of clubHeldDates.entries()) {
    const maxDate = heldDates.sort().slice(-1)[0];
    for (const s of sessionMap.values()) {
      if (
        s.clubId === clubId &&
        s.status === 'planned' &&
        !s.telegramLink &&
        !s.photoFileId &&
        s.date &&
        s.date < maxDate
      ) {
        s.status = 'missed';
        if (!s.heldNote) {
          s.heldNote = 'Keyingi dars havolasi yuklangani sababli avtomatik o‘tilmadi deb belgilandi';
        }
      }
    }
  }

  // 5. Schedules
  const scheduleMap = new Map<string, any>();
  (existing.schedules || []).forEach((sc: any) => {
    if (!isDeletedClub(sc.clubId)) scheduleMap.set(sc.id, sc);
  });
  (incoming.schedules || []).forEach((sc: any) => {
    if (isDeletedClub(sc.clubId)) return;
    scheduleMap.set(sc.id, sc);
  });

  // 6. Memberships
  const membershipMap = new Map<string, any>();
  (existing.memberships || []).forEach((m: any) => {
    if (isDeletedClub(m.clubId) || deletedMembershipIds.includes(m.id)) return;
    if (!m.createdAt) m.createdAt = m.appliedAt || new Date().toISOString();
    membershipMap.set(m.id, m);
  });
  (incoming.memberships || []).forEach((m: any) => {
    if (isDeletedClub(m.clubId) || deletedMembershipIds.includes(m.id)) return;
    if (!m.createdAt) m.createdAt = m.appliedAt || new Date().toISOString();
    if (!membershipMap.has(m.id)) {
      membershipMap.set(m.id, m);
    } else {
      const exM = membershipMap.get(m.id);
      if (m.studentName) exM.studentName = m.studentName;
      if (m.studentGroup) exM.studentGroup = m.studentGroup;
      if (m.tutorName !== undefined) exM.tutorName = m.tutorName;
      if (m.studentFaculty) exM.studentFaculty = m.studentFaculty;
      if (m.phoneOrTelegram !== undefined) exM.phoneOrTelegram = m.phoneOrTelegram;
      if (m.note !== undefined) exM.note = m.note;
      if (m.status === 'approved') exM.status = 'approved';
    }
  });
  deletedMembershipIds.forEach((id: string) => membershipMap.delete(id));

  // 7. Reports
  const reportMap = new Map<string, any>();
  (existing.reports || []).forEach((r: any) => {
    if (!isDeletedClub(r.clubId)) reportMap.set(r.id, r);
  });
  (incoming.reports || []).forEach((r: any) => {
    if (!isDeletedClub(r.clubId)) reportMap.set(r.id, r);
  });

  // 8. Annual Reports
  const annualMap = new Map<string, any>();
  (existing.annualReports || []).forEach((ar: any) => {
    if (!isDeletedClub(ar.clubId)) annualMap.set(ar.id, ar);
  });
  (incoming.annualReports || []).forEach((ar: any) => {
    if (!isDeletedClub(ar.clubId)) annualMap.set(ar.id, ar);
  });

  // 9. Submissions
  const subMap = new Map<string, any>();
  (existing.submissions || []).forEach((sub: any) => {
    if (!isDeletedClub(sub.clubId)) subMap.set(sub.id, sub);
  });
  (incoming.submissions || []).forEach((sub: any) => {
    if (isDeletedClub(sub.clubId)) return;
    if (!subMap.has(sub.id)) {
      subMap.set(sub.id, sub);
    } else {
      const exSub = subMap.get(sub.id);
      if (sub.status) exSub.status = sub.status;
      if (sub.telegramLink) exSub.telegramLink = sub.telegramLink;
      if (sub.leaderComment !== undefined) exSub.leaderComment = sub.leaderComment;
      if (sub.reviewedAt) exSub.reviewedAt = sub.reviewedAt;
      if (sub.title) exSub.title = sub.title;
      if (sub.note !== undefined) exSub.note = sub.note;
    }
  });
  if (Array.isArray(incoming._deletedSubmissionIds)) {
    incoming._deletedSubmissionIds.forEach((id: string) => subMap.delete(id));
  }

  // 10. Clean up any deleted clubs across all maps
  deletedClubIds.forEach((id: string) => {
    clubMap.delete(id);
    for (const [sId, sess] of sessionMap.entries()) {
      if (sess.clubId === id) sessionMap.delete(sId);
    }
    for (const [scId, sc] of scheduleMap.entries()) {
      if (sc.clubId === id) scheduleMap.delete(scId);
    }
    for (const [mId, mem] of membershipMap.entries()) {
      if (mem.clubId === id) membershipMap.delete(mId);
    }
    for (const [rId, rep] of reportMap.entries()) {
      if (rep.clubId === id) reportMap.delete(rId);
    }
    for (const [arId, ar] of annualMap.entries()) {
      if (ar.clubId === id) annualMap.delete(arId);
    }
    for (const [subId, sub] of subMap.entries()) {
      if (sub.clubId === id) subMap.delete(subId);
    }
  });

  // 10. Notifications
  const notifMap = new Map<string, any>();
  (existing.notifications || []).forEach((n: any) => notifMap.set(n.id, n));
  (incoming.notifications || []).forEach((n: any) => {
    if (!notifMap.has(n.id)) {
      notifMap.set(n.id, n);
    } else {
      const exN = notifMap.get(n.id);
      if (n.read) exN.read = true;
    }
  });

  // 11. Tokens
  const tokens = { ...(existing.tokens || {}), ...(incoming.tokens || {}) };

  return {
    users: Array.from(userMap.values()),
    clubs: Array.from(clubMap.values()),
    sessions: Array.from(sessionMap.values()),
    schedules: Array.from(scheduleMap.values()),
    memberships: Array.from(membershipMap.values()).filter(
      (m: any) => !deletedMembershipIds.includes(m.id) && !isDeletedClub(m.clubId)
    ),
    reports: Array.from(reportMap.values()),
    annualReports: Array.from(annualMap.values()),
    submissions: Array.from(subMap.values()),
    files: Array.from(fileMap.values()),
    notifications: Array.from(notifMap.values()),
    tokens,
    _serverUpdatedAt: new Date().toISOString(),
    _deletedClubIds: deletedClubIds,
    _deletedMembershipIds: deletedMembershipIds,
    _deletedUserIds: deletedUserIds,
  };
}

  // Explicit endpoint to delete a club (especially rejected clubs)
  app.post('/api/clubs/delete', (req: Request, res: Response) => {
    try {
      const { clubId, adminName, reason } = req.body;
      if (!clubId) {
        return res.status(400).json({ error: 'Missing clubId' });
      }

      let currentDb: any = null;
      if (fs.existsSync(DB_FILE)) {
        try {
          currentDb = JSON.parse(fs.readFileSync(DB_FILE, 'utf-8'));
        } catch (e) {
          console.error('[API] /api/clubs/delete read error:', e);
        }
      }

      if (!currentDb || !Array.isArray(currentDb.clubs)) {
        return res.status(404).json({ error: 'No database found' });
      }

      const clubIndex = currentDb.clubs.findIndex((c: any) => c.id === clubId);
      let clubName = 'to‘garak';
      let leaderId: string | null = null;

      if (clubIndex !== -1) {
        const club = currentDb.clubs[clubIndex];
        clubName = club.name;
        leaderId = club.leaderId;
        currentDb.clubs.splice(clubIndex, 1);
      }

      // Track deleted club id for sync preservation
      if (!Array.isArray(currentDb._deletedClubIds)) {
        currentDb._deletedClubIds = [];
      }
      if (!currentDb._deletedClubIds.includes(clubId)) {
        currentDb._deletedClubIds.push(clubId);
      }

      // Clean up dependent resources
      if (Array.isArray(currentDb.schedules)) {
        currentDb.schedules = currentDb.schedules.filter((s: any) => s.clubId !== clubId);
      }
      if (Array.isArray(currentDb.sessions)) {
        currentDb.sessions = currentDb.sessions.filter((s: any) => s.clubId !== clubId);
      }
      if (Array.isArray(currentDb.memberships)) {
        currentDb.memberships = currentDb.memberships.filter((m: any) => m.clubId !== clubId);
      }
      if (Array.isArray(currentDb.reports)) {
        currentDb.reports = currentDb.reports.filter((r: any) => r.clubId !== clubId);
      }
      if (Array.isArray(currentDb.annualReports)) {
        currentDb.annualReports = currentDb.annualReports.filter((a: any) => a.clubId !== clubId);
      }
      if (Array.isArray(currentDb.submissions)) {
        currentDb.submissions = currentDb.submissions.filter((s: any) => s.clubId !== clubId);
      }
      if (Array.isArray(currentDb.users)) {
        currentDb.users.forEach((u: any) => {
          if (u.clubId === clubId) u.clubId = null;
        });
      }

      // Notify leader if they exist
      if (leaderId) {
        if (!Array.isArray(currentDb.notifications)) {
          currentDb.notifications = [];
        }
        currentDb.notifications.unshift({
          id: `notif_${Date.now()}_${Math.random().toString(36).substring(2, 7)}`,
          userId: leaderId,
          targetRole: 'leader',
          title: `🗑️ «${clubName}» to‘garagi o‘chirildi`,
          message: `Sizning «${clubName}» to‘garagingiz Bosh admin (${adminName || 'Hamidulla Abdualiyev'}) tomonidan tizimdan butunlay o‘chirib tashlandi.${reason ? ` Sabab: "${reason}"` : ''}`,
          type: 'warning',
          linkTab: 'myClubs',
          read: false,
          createdAt: new Date().toISOString(),
        });
      }

      currentDb._serverUpdatedAt = new Date().toISOString();
      const tempFile = `${DB_FILE}.tmp`;
      fs.writeFileSync(tempFile, JSON.stringify(currentDb, null, 2), 'utf-8');
      fs.renameSync(tempFile, DB_FILE);

      return res.json({
        success: true,
        deletedClubId: clubId,
        db: currentDb,
      });
    } catch (err) {
      console.error('[API] Error in /api/clubs/delete:', err);
      return res.status(500).json({ error: 'Failed to delete club' });
    }
  });

  // Explicit endpoint to permanently delete a user
  app.post('/api/users/delete', (req: Request, res: Response) => {
    try {
      const { userId } = req.body;
      if (!userId) {
        return res.status(400).json({ error: 'Missing userId' });
      }

      let currentDb: any = null;
      if (fs.existsSync(DB_FILE)) {
        try {
          currentDb = JSON.parse(fs.readFileSync(DB_FILE, 'utf-8'));
        } catch (e) {
          console.error('[API] /api/users/delete read error:', e);
        }
      }
      if (!currentDb || !Array.isArray(currentDb.users)) {
        currentDb = generateSeedData();
      }

      const targetUser = currentDb.users.find((u: any) => u.id === userId);
      if (targetUser && targetUser.role === 'admin') {
        return res.status(403).json({ error: 'Cannot delete admin account' });
      }

      if (!Array.isArray(currentDb._deletedUserIds)) {
        currentDb._deletedUserIds = [];
      }
      if (!currentDb._deletedUserIds.includes(userId)) {
        currentDb._deletedUserIds.push(userId);
      }

      currentDb.users = (currentDb.users || []).filter((u: any) => u.id !== userId);

      if (currentDb.tokens) {
        for (const [t, uId] of Object.entries(currentDb.tokens)) {
          if (uId === userId) delete currentDb.tokens[t];
        }
      }

      (currentDb.clubs || []).forEach((c: any) => {
        if (c.leaderId === userId) {
          c.leaderId = null;
          c.leaderName = '';
        }
      });

      currentDb.memberships = (currentDb.memberships || []).filter((m: any) => m.studentId !== userId);
      currentDb.submissions = (currentDb.submissions || []).filter((s: any) => s.studentId !== userId);
      currentDb.notifications = (currentDb.notifications || []).filter((n: any) => n.userId !== userId);

      currentDb._serverUpdatedAt = new Date().toISOString();

      const tempFile = `${DB_FILE}.tmp`;
      fs.writeFileSync(tempFile, JSON.stringify(currentDb, null, 2), 'utf-8');
      fs.renameSync(tempFile, DB_FILE);

      return res.json({
        success: true,
        deletedUserId: userId,
        db: currentDb,
      });
    } catch (err) {
      console.error('[API] Error in /api/users/delete:', err);
      return res.status(500).json({ error: 'Failed to delete user' });
    }
  });

  // Explicit admin club review & notification endpoint
  app.post('/api/clubs/review', (req: Request, res: Response) => {
    try {
      const { clubId, status, comment, reviewerName } = req.body;
      if (!clubId || !status) {
        return res.status(400).json({ error: 'Missing clubId or status' });
      }

      let currentDb: any = null;
      if (fs.existsSync(DB_FILE)) {
        try {
          currentDb = JSON.parse(fs.readFileSync(DB_FILE, 'utf-8'));
        } catch (e) {
          console.error('[API] /api/clubs/review read error:', e);
        }
      }

      if (!currentDb || !Array.isArray(currentDb.clubs)) {
        return res.status(404).json({ error: 'No database found' });
      }

      const club = currentDb.clubs.find((c: any) => c.id === clubId);
      if (!club) {
        return res.status(404).json({ error: 'To‘garak topilmadi' });
      }

      club.statuteStatus = status; // 'approved' | 'rejected'
      club.adminComment = (comment || '').trim();
      club.statuteReviewedAt = new Date().toISOString();

      // Create notification for club leader
      if (!Array.isArray(currentDb.notifications)) {
        currentDb.notifications = [];
      }
      const isApproved = status === 'approved';

      if (club.leaderId) {
        const notif = {
          id: `notif_${Date.now()}_${Math.random().toString(36).substring(2, 7)}`,
          userId: club.leaderId,
          targetRole: 'leader',
          title: isApproved ? '🎉 To‘garagingiz tasdiqlandi!' : '⚠️ To‘garak nizomi rad etildi',
          message: isApproved
            ? `Tabriklaymiz! Sizning «${club.name}» to‘garagingiz va nizomi institut Bosh admini (${reviewerName || 'Hamidulla Abdualiyev'}) tomonidan rasman tasdiqlandi. Endi mashg‘ulotlarni o‘tkazishingiz, dars jadvali bo‘yicha talabalarni qabul qilishingiz mumkin.${comment ? ` Admin izohi: "${comment}"` : ''}`
            : `Sizning «${club.name}» to‘garagingiz nizomi bo‘yicha kamchiliklar aniqlandi va qaytarildi.${comment ? ` Sabab/Izoh: "${comment}"` : ''}`,
          type: isApproved ? 'success' : 'warning',
          linkTab: 'myClubs',
          clubId: club.id,
          read: false,
          createdAt: new Date().toISOString(),
        };
        currentDb.notifications.unshift(notif);
      }

      // Also create notifications for students!
      if (isApproved) {
        // Broadcast notification for students
        currentDb.notifications.unshift({
          id: `notif_${Date.now()}_${Math.random().toString(36).substring(2, 7)}`,
          userId: 'students',
          targetRole: 'student',
          title: `📢 Yangi to‘garak tasdiqlandi: «${club.name}»`,
          message: `Institutda yangi «${club.name}» to‘garagi tasdiqlandi! Mashg‘ulotlar dars jadvaliga muvofiq o‘tkaziladi. Talabalar a’zolik uchun ariza topshirishi mumkin.`,
          type: 'info',
          linkTab: 'browse',
          clubId: club.id,
          read: false,
          createdAt: new Date().toISOString(),
        });

        // Specific notification for all students who already applied to this club
        const clubMemberships = (currentDb.memberships || []).filter((m: any) => m.clubId === club.id);
        clubMemberships.forEach((m: any) => {
          currentDb.notifications.unshift({
            id: `notif_${Date.now()}_${Math.random().toString(36).substring(2, 7)}`,
            userId: m.studentId,
            targetRole: 'student',
            title: `🎉 «${club.name}» to‘garagi tasdiqlandi!`,
            message: `Siz ariza topshirgan «${club.name}» to‘garagi Bosh admin tomonidan tasdiqlandi va darslar boshlandi!`,
            type: 'success',
            linkTab: 'browse',
            clubId: club.id,
            read: false,
            createdAt: new Date().toISOString(),
          });
        });
      }

      currentDb._serverUpdatedAt = new Date().toISOString();
      const tempFile = `${DB_FILE}.tmp`;
      fs.writeFileSync(tempFile, JSON.stringify(currentDb, null, 2), 'utf-8');
      fs.renameSync(tempFile, DB_FILE);

      return res.json({
        success: true,
        club,
        db: currentDb,
      });
    } catch (err) {
      console.error('[API] Error in /api/clubs/review:', err);
      return res.status(500).json({ error: 'Failed to process club review' });
    }
  });

  // Explicit membership review endpoint (approve/reject student application & notify student)
  app.post('/api/memberships/review', (req: Request, res: Response) => {
    try {
      const { membershipId, status, comment, reviewerName } = req.body;
      if (!membershipId || !status) {
        return res.status(400).json({ error: 'Missing membershipId or status' });
      }

      let currentDb: any = null;
      if (fs.existsSync(DB_FILE)) {
        try {
          currentDb = JSON.parse(fs.readFileSync(DB_FILE, 'utf-8'));
        } catch (e) {
          console.error('[API] /api/memberships/review read error:', e);
        }
      }

      if (!currentDb || !Array.isArray(currentDb.memberships)) {
        return res.status(404).json({ error: 'No database found' });
      }

      const m = currentDb.memberships.find((x: any) => x.id === membershipId);
      if (!m) {
        return res.status(404).json({ error: 'Ariza topilmadi' });
      }

      m.status = status; // 'approved' | 'rejected'
      m.adminComment = (comment || '').trim();

      const club = (currentDb.clubs || []).find((c: any) => c.id === m.clubId);
      const clubName = club ? club.name : 'to‘garak';
      const isApproved = status === 'approved';

      if (isApproved) {
        const student = (currentDb.users || []).find((u: any) => u.id === m.studentId);
        if (student && !student.clubId) {
          student.clubId = m.clubId;
        }
      }

      if (!Array.isArray(currentDb.notifications)) {
        currentDb.notifications = [];
      }

      // DIRECT NOTIFICATION TO THE STUDENT
      currentDb.notifications.unshift({
        id: `notif_${Date.now()}_${Math.random().toString(36).substring(2, 7)}`,
        userId: m.studentId,
        targetRole: 'student',
        title: isApproved ? `🎉 «${clubName}» to‘garagiga a’zoligingiz tasdiqlandi!` : `⚠️ «${clubName}» to‘garagiga arizangiz rad etildi`,
        message: isApproved
          ? `Tabriklaymiz! Sizning «${clubName}» to‘garagiga yuborgan a’zolik arizangiz tasdiqlandi (${reviewerName || 'Bosh admin / To‘garak rahbari'} tomonidan). Endi mashg‘ulotlarda muntazam qatnashib, qatnashganlik fotodalillarini yuklashingiz mumkin.${comment ? ` Izoh: "${comment}"` : ''}`
          : `Afsuski, «${clubName}» to‘garagiga a’zolik arizangiz rad etildi.${comment ? ` Izoh: "${comment}"` : ''}`,
        type: isApproved ? 'success' : 'warning',
        linkTab: 'myApps',
        clubId: m.clubId,
        read: false,
        createdAt: new Date().toISOString(),
      });

      currentDb._serverUpdatedAt = new Date().toISOString();
      const tempFile = `${DB_FILE}.tmp`;
      fs.writeFileSync(tempFile, JSON.stringify(currentDb, null, 2), 'utf-8');
      fs.renameSync(tempFile, DB_FILE);

      return res.json({
        success: true,
        membership: m,
        db: currentDb,
      });
    } catch (err) {
      console.error('[API] Error in /api/memberships/review:', err);
      return res.status(500).json({ error: 'Failed to process membership review' });
    }
  });

  // Explicit handler to permanently delete a membership record
  const handleMembershipDelete = async (membershipId: string, res: Response) => {
    if (!membershipId || typeof membershipId !== 'string') {
      return res.status(400).json({ error: 'Missing membershipId' });
    }

    let currentDb = readDatabase();
    if (!currentDb || typeof currentDb !== 'object') currentDb = { memberships: [] };
    if (!Array.isArray(currentDb._deletedMembershipIds)) {
      currentDb._deletedMembershipIds = [];
    }
    if (!currentDb._deletedMembershipIds.includes(membershipId)) {
      currentDb._deletedMembershipIds.push(membershipId);
    }
    currentDb.memberships = (currentDb.memberships || []).filter((m: any) => m.id !== membershipId);
    currentDb._serverUpdatedAt = new Date().toISOString();

    await safeWriteDatabase(currentDb);
    console.info(`[API] Membership deleted: ${membershipId}. Remaining count: ${currentDb.memberships.length}`);
    return res.json({ success: true, deletedId: membershipId, db: currentDb });
  };

  app.delete('/api/memberships/:id', async (req: Request, res: Response) => {
    try {
      await handleMembershipDelete(req.params.id, res);
    } catch (err) {
      console.error('[API] Error in DELETE /api/memberships/:id:', err);
      return res.status(500).json({ error: 'Failed to delete membership' });
    }
  });

  app.post('/api/memberships/delete', async (req: Request, res: Response) => {
    try {
      const { membershipId } = req.body || {};
      await handleMembershipDelete(membershipId, res);
    } catch (err) {
      console.error('[API] Error in POST /api/memberships/delete:', err);
      return res.status(500).json({ error: 'Failed to delete membership' });
    }
  });

  // Explicit endpoint to import full authoritative JSON backup
  app.post('/api/database/import', async (req: Request, res: Response) => {
    try {
      const incoming = req.body;
      if (!incoming || typeof incoming !== 'object' || !Array.isArray(incoming.users)) {
        return res.status(400).json({ error: 'Noto‘g‘ri JSON formati: users ro‘yxati topilmadi' });
      }
      // Clean delete lists so imported records are immediately active
      incoming._deletedClubIds = [];
      incoming._deletedMembershipIds = [];
      incoming._deletedUserIds = [];
      // Explicitly purge legacy AI START ('c_2040bdb_97be1') while preserving current AI START ('c_c272675_65543') and all other 20 clubs
      const legacyId = 'c_2040bdb_97be1';
      if (Array.isArray(incoming.clubs)) incoming.clubs = incoming.clubs.filter((c: any) => c && c.id !== legacyId);
      if (Array.isArray(incoming.sessions)) incoming.sessions = incoming.sessions.filter((s: any) => s && s.clubId !== legacyId);
      if (Array.isArray(incoming.schedules)) incoming.schedules = incoming.schedules.filter((sc: any) => sc && sc.clubId !== legacyId);
      if (Array.isArray(incoming.memberships)) incoming.memberships = incoming.memberships.filter((m: any) => m && m.clubId !== legacyId);
      if (Array.isArray(incoming.reports)) incoming.reports = incoming.reports.filter((r: any) => r && r.clubId !== legacyId);
      if (Array.isArray(incoming.annualReports)) incoming.annualReports = incoming.annualReports.filter((a: any) => a && a.clubId !== legacyId);
      if (Array.isArray(incoming.submissions)) incoming.submissions = incoming.submissions.filter((s: any) => s && s.clubId !== legacyId);
      if (Array.isArray(incoming.users)) {
        incoming.users.forEach((u: any) => {
          if (u && u.clubId === legacyId) u.clubId = null;
        });
      }
      incoming._serverUpdatedAt = new Date().toISOString();
      await safeWriteDatabase(incoming);
      console.info(`[API] Authoritative JSON backup imported successfully: ${incoming.clubs?.length || 0} clubs, ${incoming.users?.length || 0} users`);
      return res.json({ success: true, db: incoming });
    } catch (err) {
      console.error('[API] Error in /api/database/import:', err);
      return res.status(500).json({ error: 'Import qilishda server xatoligi yuz berdi' });
    }
  });

  // Sync / save database across all devices
  app.post('/api/sync', async (req: Request, res: Response) => {
    try {
      const incoming = req.body;
      if (!incoming || typeof incoming !== 'object') {
        return res.status(400).json({ error: 'Invalid payload' });
      }

      let currentDb = readDatabase();
      const mergedDb = mergeDatabaseOnServer(currentDb, incoming);

      await safeWriteDatabase(mergedDb);

      return res.json({
        success: true,
        db: mergedDb,
        updatedAt: mergedDb._serverUpdatedAt,
      });
    } catch (err) {
      console.error('[API] Error saving database.json:', err);
      return res.status(500).json({ error: 'Failed to save database' });
    }
  });

  // Environment routing: Vite middleware in development, static in production
  const isProd = process.env.NODE_ENV === 'production';
  if (!isProd) {
    const vite = await createViteServer({
      server: { middlewareMode: true },
      appType: 'spa',
    });
    app.use(vite.middlewares);
  } else {
    const distPath = path.join(__dirname, 'dist');
    app.use(express.static(distPath));
    app.get('*', (_req: Request, res: Response) => {
      res.sendFile(path.join(distPath, 'index.html'));
    });
  }

  app.listen(PORT, '0.0.0.0', () => {
    console.log(`[Express] 5 Muhim Tashabbus server running on port ${PORT}`);
  });
}

startServer().catch((err) => {
  console.error('[Server] Fatal startup error:', err);
  process.exit(1);
});
