import express from 'express';
import type { Request, Response } from 'express';
import { createServer as createViteServer } from 'vite';
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

async function startServer() {
  const app = express();
  // Always bind to port 3000. Nginx handles port 8080 externally and proxies to 3000.
  const PORT = 3000;

  // Allow larger payloads for PDF statutes and session photos
  app.use(express.json({ limit: '50mb' }));
  app.use(express.urlencoded({ extended: true, limit: '50mb' }));

  // Database file persistence path
  const DATA_DIR = path.join(__dirname, 'data');
  const DB_FILE = path.join(DATA_DIR, 'database.json');

  if (!fs.existsSync(DATA_DIR)) {
    fs.mkdirSync(DATA_DIR, { recursive: true });
  }

  // Ensure database.json exists with default admin account
  if (!fs.existsSync(DB_FILE)) {
    let h = 5381;
    const str = 'admin123';
    for (let i = 0; i < str.length; i++) {
      h = ((h << 5) + h) ^ str.charCodeAt(i);
    }
    const adminPassHash = 'h' + (h >>> 0).toString(16);

    const initialDb = {
      users: [
        {
          id: 'u_admin_001',
          username: 'admin',
          password: adminPassHash,
          fullName: 'Hamidulla Abdualiyev',
          role: 'admin',
          faculty: 'Institut Maʼmuriyati',
          groupName: 'Yoshlar bilan ishlash bo‘limi',
          clubId: null,
          active: true,
          createdAt: new Date().toISOString(),
        },
      ],
      clubs: [],
      sessions: [],
      schedules: [],
      memberships: [],
      reports: [],
      annualReports: [],
      submissions: [],
      files: [],
      tokens: {},
      _serverUpdatedAt: new Date().toISOString(),
    };
    fs.writeFileSync(DB_FILE, JSON.stringify(initialDb, null, 2), 'utf-8');
  }

  // --- API Endpoints ---
  app.get('/api/health', (_req: Request, res: Response) => {
    res.json({
      status: 'ok',
      hasDb: fs.existsSync(DB_FILE),
      timestamp: new Date().toISOString(),
    });
  });

  // Fetch full synchronized database
  app.get('/api/data', (_req: Request, res: Response) => {
    try {
      if (fs.existsSync(DB_FILE)) {
        const raw = fs.readFileSync(DB_FILE, 'utf-8');
        const parsed = JSON.parse(raw);
        return res.json(parsed);
      }
      return res.json(null);
    } catch (err) {
      console.error('[API] Error reading database.json:', err);
      return res.status(500).json({ error: 'Failed to read database' });
    }
  });

function mergeDatabaseOnServer(existing: any, incoming: any): any {
  if (!existing || typeof existing !== 'object') return incoming;
  if (!incoming || typeof incoming !== 'object') return existing;

  // 1. Users: merge by ID and username
  const userMap = new Map<string, any>();
  (existing.users || []).forEach((u: any) => userMap.set(u.id, u));
  (incoming.users || []).forEach((u: any) => {
    if (!userMap.has(u.id)) {
      userMap.set(u.id, u);
    } else {
      const exUser = userMap.get(u.id);
      exUser.password = u.password || exUser.password;
      exUser.fullName = u.fullName || exUser.fullName;
      exUser.faculty = u.faculty || exUser.faculty;
      exUser.groupName = u.groupName || exUser.groupName;
      if (u.active !== undefined) exUser.active = u.active;
    }
  });

  // 2. Clubs: merge by id
  const clubMap = new Map<string, any>();
  (existing.clubs || []).forEach((c: any) => clubMap.set(c.id, c));
  (incoming.clubs || []).forEach((c: any) => {
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

  // 4. Sessions
  const sessionMap = new Map<string, any>();
  (existing.sessions || []).forEach((s: any) => sessionMap.set(s.id, s));
  (incoming.sessions || []).forEach((s: any) => {
    if (!sessionMap.has(s.id)) {
      sessionMap.set(s.id, s);
    } else {
      const exS = sessionMap.get(s.id);
      if (s.isHeld) exS.isHeld = true;
      if (s.attendanceCount !== undefined) exS.attendanceCount = s.attendanceCount;
      if (s.photoFileId) exS.photoFileId = s.photoFileId;
    }
  });

  // 5. Schedules
  const scheduleMap = new Map<string, any>();
  (existing.schedules || []).forEach((sc: any) => scheduleMap.set(sc.id, sc));
  (incoming.schedules || []).forEach((sc: any) => scheduleMap.set(sc.id, sc));

  // 6. Memberships
  const membershipMap = new Map<string, any>();
  (existing.memberships || []).forEach((m: any) => membershipMap.set(m.id, m));
  (incoming.memberships || []).forEach((m: any) => {
    if (!membershipMap.has(m.id)) {
      membershipMap.set(m.id, m);
    } else if (m.status === 'approved') {
      membershipMap.get(m.id).status = 'approved';
    }
  });

  // 7. Reports
  const reportMap = new Map<string, any>();
  (existing.reports || []).forEach((r: any) => reportMap.set(r.id, r));
  (incoming.reports || []).forEach((r: any) => reportMap.set(r.id, r));

  // 8. Annual Reports
  const annualMap = new Map<string, any>();
  (existing.annualReports || []).forEach((ar: any) => annualMap.set(ar.id, ar));
  (incoming.annualReports || []).forEach((ar: any) => annualMap.set(ar.id, ar));

  // 9. Submissions
  const subMap = new Map<string, any>();
  (existing.submissions || []).forEach((sub: any) => subMap.set(sub.id, sub));
  (incoming.submissions || []).forEach((sub: any) => subMap.set(sub.id, sub));
  if (Array.isArray(incoming._deletedSubmissionIds)) {
    incoming._deletedSubmissionIds.forEach((id: string) => subMap.delete(id));
  }

  // 10. Clean up any deleted clubs across all maps
  const deletedClubIds = Array.from(new Set([
    ...(Array.isArray(existing._deletedClubIds) ? existing._deletedClubIds : []),
    ...(Array.isArray(incoming._deletedClubIds) ? incoming._deletedClubIds : []),
  ]));
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
    memberships: Array.from(membershipMap.values()),
    reports: Array.from(reportMap.values()),
    annualReports: Array.from(annualMap.values()),
    submissions: Array.from(subMap.values()),
    files: Array.from(fileMap.values()),
    notifications: Array.from(notifMap.values()),
    tokens,
    _serverUpdatedAt: new Date().toISOString(),
    _deletedClubIds: deletedClubIds,
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

  // Sync / save database across all devices
  app.post('/api/sync', (req: Request, res: Response) => {
    try {
      const incoming = req.body;
      if (!incoming || typeof incoming !== 'object') {
        return res.status(400).json({ error: 'Invalid payload' });
      }

      let currentDb: any = null;
      if (fs.existsSync(DB_FILE)) {
        try {
          currentDb = JSON.parse(fs.readFileSync(DB_FILE, 'utf-8'));
        } catch (e) {
          console.warn('[Sync] Could not parse existing DB, using incoming:', e);
        }
      }

      const mergedDb = mergeDatabaseOnServer(currentDb, incoming);

      // Write atomically to temporary file first
      const tempFile = `${DB_FILE}.tmp`;
      fs.writeFileSync(tempFile, JSON.stringify(mergedDb, null, 2), 'utf-8');
      fs.renameSync(tempFile, DB_FILE);

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
