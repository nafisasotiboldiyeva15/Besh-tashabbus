import json

with open("data/database.json", "r", encoding="utf-8") as f:
    db = json.load(f)

lines = []
lines.append("-- ==============================================================================")
lines.append("-- UniBridge: 21 ta faol to'garakni Supabase bazasiga to'g'ridan-to'g'ri yozish")
lines.append("-- ==============================================================================")
lines.append("")

def escape_sql(val):
    if val is None:
        return "NULL"
    if isinstance(val, bool):
        return "TRUE" if val else "FALSE"
    if isinstance(val, (int, float)):
        return str(val)
    if isinstance(val, (list, dict)):
        s = json.dumps(val, ensure_ascii=False)
        return "'" + s.replace("'", "''") + "'::jsonb"
    s = str(val).replace("'", "''")
    return f"'{s}'"

# 1. Clubs
lines.append("-- 1. CLUBS (21 ta faol to'garak)")
for c in db.get("clubs", []):
    id_val = escape_sql(c.get("id"))
    name_val = escape_sql(c.get("name"))
    cat_val = escape_sql(c.get("category"))
    desc_val = escape_sql(c.get("description"))
    fac_val = escape_sql(c.get("faculty"))
    lid_val = escape_sql(c.get("leaderId"))
    lname_val = escape_sql(c.get("leaderName"))
    room_val = escape_sql(c.get("room"))
    sdate_val = escape_sql(c.get("startDate"))
    edate_val = escape_sql(c.get("endDate"))
    weekdays_val = escape_sql(c.get("weekdays", []))
    tstart_val = escape_sql(c.get("timeStart"))
    tend_val = escape_sql(c.get("timeEnd"))
    stat_val = escape_sql(c.get("statuteStatus", "approved"))
    comm_val = escape_sql(c.get("adminComment"))
    fid_val = escape_sql(c.get("statuteFileId"))
    rev_val = escape_sql(c.get("statuteReviewedAt"))
    
    sql = f"""INSERT INTO public.clubs (id, name, category, description, faculty, leader_id, leader_name, room, start_date, end_date, weekdays, time_start, time_end, statute_status, admin_comment, statute_file_id, statute_reviewed_at)
VALUES ({id_val}, {name_val}, {cat_val}, {desc_val}, {fac_val}, {lid_val}, {lname_val}, {room_val}, {sdate_val}, {edate_val}, {weekdays_val}, {tstart_val}, {tend_val}, {stat_val}, {comm_val}, {fid_val}, {rev_val})
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  description = EXCLUDED.description,
  faculty = EXCLUDED.faculty,
  leader_id = EXCLUDED.leader_id,
  leader_name = EXCLUDED.leader_name,
  room = EXCLUDED.room,
  start_date = EXCLUDED.start_date,
  end_date = EXCLUDED.end_date,
  weekdays = EXCLUDED.weekdays,
  time_start = EXCLUDED.time_start,
  time_end = EXCLUDED.time_end,
  statute_status = EXCLUDED.statute_status;"""
    lines.append(sql)

lines.append("")
lines.append("-- 2. SCHEDULES (24 ta dars jadvali)")
for sc in db.get("schedules", []):
    id_val = escape_sql(sc.get("id"))
    cid_val = escape_sql(sc.get("clubId"))
    w_val = escape_sql(sc.get("weekday"))
    ts_val = escape_sql(sc.get("timeStart"))
    te_val = escape_sql(sc.get("timeEnd"))
    r_val = escape_sql(sc.get("room"))
    sd_val = escape_sql(sc.get("startDate"))
    ed_val = escape_sql(sc.get("endDate"))
    sql = f"""INSERT INTO public.club_schedules (id, club_id, weekday, time_start, time_end, room, start_date, end_date)
VALUES ({id_val}, {cid_val}, {w_val}, {ts_val}, {te_val}, {r_val}, {sd_val}, {ed_val})
ON CONFLICT (id) DO UPDATE SET
  weekday = EXCLUDED.weekday,
  time_start = EXCLUDED.time_start,
  time_end = EXCLUDED.time_end,
  room = EXCLUDED.room;"""
    lines.append(sql)

lines.append("")
lines.append("-- 3. MEMBERSHIPS")
for m in db.get("memberships", []):
    id_val = escape_sql(m.get("id"))
    cid_val = escape_sql(m.get("clubId"))
    cname_val = escape_sql(m.get("clubName"))
    sid_val = escape_sql(m.get("studentId"))
    sname_val = escape_sql(m.get("studentName"))
    sgrp_val = escape_sql(m.get("studentGroup"))
    tut_val = escape_sql(m.get("tutorName"))
    sfac_val = escape_sql(m.get("studentFaculty"))
    tel_val = escape_sql(m.get("phoneOrTelegram"))
    st_val = escape_sql(m.get("status", "approved"))
    note_val = escape_sql(m.get("note"))
    comm_val = escape_sql(m.get("adminComment"))
    sql = f"""INSERT INTO public.club_memberships (id, club_id, club_name, student_id, student_name, student_group, tutor_name, student_faculty, phone_or_telegram, status, note, admin_comment)
VALUES ({id_val}, {cid_val}, {cname_val}, {sid_val}, {sname_val}, {sgrp_val}, {tut_val}, {sfac_val}, {tel_val}, {st_val}, {note_val}, {comm_val})
ON CONFLICT (id) DO NOTHING;"""
    lines.append(sql)

lines.append("")
lines.append("-- 4. REPORTS")
for rep in db.get("reports", []):
    id_val = escape_sql(rep.get("id"))
    cid_val = escape_sql(rep.get("clubId"))
    lid_val = escape_sql(rep.get("leaderId"))
    title_val = escape_sql(rep.get("title"))
    note_val = escape_sql(rep.get("note"))
    sql = f"""INSERT INTO public.club_reports (id, club_id, leader_id, title, content)
VALUES ({id_val}, {cid_val}, {lid_val}, {title_val}, {note_val})
ON CONFLICT (id) DO NOTHING;"""
    lines.append(sql)

lines.append("")
lines.append("-- 5. KEY HELD SESSIONS WITH TELEGRAM LINKS & ATTENDEE COUNTS")
for s in db.get("sessions", []):
    if s.get("status") == "held" or s.get("telegramLink"):
        id_val = escape_sql(s.get("id"))
        cid_val = escape_sql(s.get("clubId"))
        top_val = escape_sql(s.get("topic"))
        d_val = escape_sql(s.get("date"))
        t_val = escape_sql(s.get("time"))
        te_val = escape_sql(s.get("timeEnd"))
        loc_val = escape_sql(s.get("location"))
        st_val = escape_sql(s.get("status"))
        hn_val = escape_sql(s.get("heldNote"))
        cnt_val = escape_sql(s.get("attendeeCount"))
        cnd_val = escape_sql(s.get("conductorName"))
        tg_val = escape_sql(s.get("telegramLink"))
        hd_val = escape_sql(s.get("heldDate"))
        sql = f"""INSERT INTO public.club_sessions (id, club_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, telegram_link, held_date)
VALUES ({id_val}, {cid_val}, {top_val}, {d_val}, {t_val}, {te_val}, {loc_val}, {st_val}, {hn_val}, {cnt_val}, {cnd_val}, {tg_val}, {hd_val})
ON CONFLICT (id) DO UPDATE SET
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;"""
        lines.append(sql)

with open("supabase_import_data.sql", "w", encoding="utf-8") as f:
    f.write("\n".join(lines) + "\n")

print(f"Generated supabase_import_data.sql with {len(lines)} lines")
