const fs = require('fs');

const db = JSON.parse(fs.readFileSync('./data/5_tashabbus_zaxira_clean.json', 'utf8'));

function esc(val) {
  if (val === null || val === undefined) return 'NULL';
  return "'" + String(val).replace(/'/g, "''") + "'";
}

function num(val) {
  if (val === null || val === undefined || isNaN(val)) return 'NULL';
  return String(val);
}

function bool(val) {
  return val ? 'TRUE' : 'FALSE';
}

function jsonb(val) {
  if (val === null || val === undefined) return "'[]'::jsonb";
  return "'" + JSON.stringify(val).replace(/'/g, "''") + "'::jsonb";
}

let out = '';
out += "-- ==============================================================================\n";
out += "-- UniBridge: 21 ta faol to'garak va ularga tegishli ma'lumotlarni import qilish\n";
out += "-- Mavjud profiles, study_groups, study_group_members jadvallariga mutlaqo tegmaydi\n";
out += "-- Eski AI START (c_2040bdb_97be1) chiqarib tashlangan, joriy AI START (c_c272675_65543) saqlangan\n";
out += "-- DROP, TRUNCATE yoki DELETE ishlatilmagan (xavfsiz ON CONFLICT DO UPDATE/NOTHING)\n";
out += "-- ==============================================================================\n\n";

// 1. CLUBS (21 ta faol to'garak)
out += "-- 1. CLUBS (21 ta faol to'garak)\n";
db.clubs.forEach(c => {
  out += `INSERT INTO public.clubs (id, name, category, description, faculty, leader_id, leader_name, room, start_date, end_date, weekdays, time_start, time_end, statute_status, admin_comment, statute_file_id, statute_reviewed_at)\n`;
  out += `VALUES (${esc(c.id)}, ${esc(c.name)}, ${esc(c.category)}, ${esc(c.description || '')}, ${esc(c.faculty)}, ${esc(c.leaderId || c.leader_id)}, ${esc(c.leaderName || c.leader_name)}, ${esc(c.room)}, ${esc(c.startDate || c.start_date)}, ${esc(c.endDate || c.end_date)}, ${jsonb(c.weekdays)}, ${esc(c.timeStart || c.time_start)}, ${esc(c.timeEnd || c.time_end)}, ${esc(c.statuteStatus || c.statute_status || 'approved')}, ${esc(c.adminComment || c.admin_comment || '')}, ${esc(c.statuteFileId || c.statute_file_id)}, ${esc(c.statuteReviewedAt || c.statute_reviewed_at)})\n`;
  out += `ON CONFLICT (id) DO UPDATE SET\n`;
  out += `  name = EXCLUDED.name,\n  category = EXCLUDED.category,\n  description = EXCLUDED.description,\n  faculty = EXCLUDED.faculty,\n  leader_id = EXCLUDED.leader_id,\n  leader_name = EXCLUDED.leader_name,\n  room = EXCLUDED.room,\n  start_date = EXCLUDED.start_date,\n  end_date = EXCLUDED.end_date,\n  weekdays = EXCLUDED.weekdays,\n  time_start = EXCLUDED.time_start,\n  time_end = EXCLUDED.time_end,\n  statute_status = EXCLUDED.statute_status,\n  admin_comment = EXCLUDED.admin_comment,\n  statute_file_id = EXCLUDED.statute_file_id,\n  statute_reviewed_at = EXCLUDED.statute_reviewed_at;\n\n`;
});

// 2. CLUB SCHEDULES (24 ta)
out += "-- 2. CLUB SCHEDULES (24 ta dars jadvali)\n";
db.schedules.forEach(s => {
  out += `INSERT INTO public.club_schedules (id, club_id, weekday, time_start, time_end, room, start_date, end_date, created_at)\n`;
  out += `VALUES (${esc(s.id)}, ${esc(s.clubId)}, ${num(s.weekday)}, ${esc(s.timeStart)}, ${esc(s.timeEnd)}, ${esc(s.room)}, ${esc(s.startDate)}, ${esc(s.endDate)}, ${esc(s.createdAt)})\n`;
  out += `ON CONFLICT (id) DO UPDATE SET\n`;
  out += `  club_id = EXCLUDED.club_id,\n  weekday = EXCLUDED.weekday,\n  time_start = EXCLUDED.time_start,\n  time_end = EXCLUDED.time_end,\n  room = EXCLUDED.room,\n  start_date = EXCLUDED.start_date,\n  end_date = EXCLUDED.end_date;\n\n`;
});

// 3. CLUB MEMBERSHIPS (1 ta)
out += "-- 3. CLUB MEMBERSHIPS (To'garak a'zoligi)\n";
(db.memberships || []).forEach(m => {
  out += `INSERT INTO public.club_memberships (id, club_id, club_name, student_id, student_name, student_group, tutor_name, student_faculty, phone_or_telegram, status, note, admin_comment, application_file_id, created_at)\n`;
  out += `VALUES (${esc(m.id)}, ${esc(m.clubId)}, ${esc(m.clubName)}, ${esc(m.studentId)}, ${esc(m.studentName)}, ${esc(m.studentGroup)}, ${esc(m.tutorName)}, ${esc(m.studentFaculty)}, ${esc(m.phoneOrTelegram)}, ${esc(m.status || 'approved')}, ${esc(m.note)}, ${esc(m.adminComment)}, ${esc(m.applicationFileId)}, ${esc(m.createdAt)})\n`;
  out += `ON CONFLICT (id) DO UPDATE SET\n`;
  out += `  club_id = EXCLUDED.club_id,\n  club_name = EXCLUDED.club_name,\n  student_id = EXCLUDED.student_id,\n  student_name = EXCLUDED.student_name,\n  student_group = EXCLUDED.student_group,\n  tutor_name = EXCLUDED.tutor_name,\n  student_faculty = EXCLUDED.student_faculty,\n  phone_or_telegram = EXCLUDED.phone_or_telegram,\n  status = EXCLUDED.status,\n  note = EXCLUDED.note,\n  admin_comment = EXCLUDED.admin_comment;\n\n`;
});

// 4. CLUB REPORTS (1 ta)
out += "-- 4. CLUB REPORTS (To'garak hisobotlari)\n";
(db.reports || []).forEach(r => {
  out += `INSERT INTO public.club_reports (id, club_id, leader_id, title, content, created_at)\n`;
  out += `VALUES (${esc(r.id)}, ${esc(r.clubId)}, ${esc(r.leaderId)}, ${esc(r.title)}, ${esc(r.note || r.content || '')}, ${esc(r.createdAt)})\n`;
  out += `ON CONFLICT (id) DO UPDATE SET\n`;
  out += `  club_id = EXCLUDED.club_id,\n  leader_id = EXCLUDED.leader_id,\n  title = EXCLUDED.title,\n  content = EXCLUDED.content;\n\n`;
});

// 5. CLUB NOTIFICATIONS (3 ta)
out += "-- 5. CLUB NOTIFICATIONS (Bildirishnomalar)\n";
(db.notifications || []).forEach(n => {
  out += `INSERT INTO public.club_notifications (id, user_id, title, message, type, read, link_tab, target_role, created_at)\n`;
  out += `VALUES (${esc(n.id)}, ${esc(n.userId)}, ${esc(n.title)}, ${esc(n.message)}, ${esc(n.type || 'info')}, ${bool(n.read)}, ${esc(n.linkTab)}, ${esc(n.targetRole)}, ${esc(n.createdAt)})\n`;
  out += `ON CONFLICT (id) DO UPDATE SET\n`;
  out += `  user_id = EXCLUDED.user_id,\n  title = EXCLUDED.title,\n  message = EXCLUDED.message,\n  type = EXCLUDED.type,\n  read = EXCLUDED.read,\n  link_tab = EXCLUDED.link_tab,\n  target_role = EXCLUDED.target_role;\n\n`;
});

// 6. CLUB FILES (40 ta)
out += "-- 6. CLUB FILES (Fayl metama'lumotlari)\n";
(db.files || []).forEach(f => {
  out += `INSERT INTO public.club_files (id, name, size, type, data, uploaded_at)\n`;
  out += `VALUES (${esc(f.id)}, ${esc(f.name)}, ${num(f.size || 0)}, ${esc(f.mime || f.type || 'application/octet-stream')}, ${esc(f.data || '')}, ${esc(f.createdAt || new Date().toISOString())})\n`;
  out += `ON CONFLICT (id) DO UPDATE SET\n`;
  out += `  name = EXCLUDED.name,\n  size = EXCLUDED.size,\n  type = EXCLUDED.type,\n  data = CASE WHEN EXCLUDED.data <> '' THEN EXCLUDED.data ELSE public.club_files.data END;\n\n`;
});

// 7. CLUB SESSIONS (956 ta darslar, shu jumladan 17 ta o'tkazilgan va Telegram havolali mashg'ulotlar)
out += "-- 7. CLUB SESSIONS (956 ta to'garak mashg'ulotlari)\n";
db.sessions.forEach(s => {
  out += `INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)\n`;
  out += `VALUES (${esc(s.id)}, ${esc(s.clubId)}, ${esc(s.slotId)}, ${esc(s.topic)}, ${esc(s.date)}, ${esc(s.time)}, ${esc(s.timeEnd)}, ${esc(s.location)}, ${esc(s.status || 'scheduled')}, ${esc(s.heldNote || '')}, ${num(s.attendeeCount)}, ${esc(s.conductorName)}, ${esc(s.photoFileId)}, ${esc(s.telegramLink)}, ${esc(s.heldDate)}, ${esc(s.createdAt)})\n`;
  out += `ON CONFLICT (id) DO UPDATE SET\n`;
  out += `  club_id = EXCLUDED.club_id,\n  slot_id = EXCLUDED.slot_id,\n  topic = EXCLUDED.topic,\n  date = EXCLUDED.date,\n  time = EXCLUDED.time,\n  time_end = EXCLUDED.time_end,\n  location = EXCLUDED.location,\n  status = EXCLUDED.status,\n  held_note = EXCLUDED.held_note,\n  attendee_count = EXCLUDED.attendee_count,\n  conductor_name = EXCLUDED.conductor_name,\n  photo_file_id = EXCLUDED.photo_file_id,\n  telegram_link = EXCLUDED.telegram_link,\n  held_date = EXCLUDED.held_date;\n\n`;
});

fs.writeFileSync('./supabase_import_data.sql', out, 'utf8');
console.log('Finished writing supabase_import_data.sql, total size:', out.length);
