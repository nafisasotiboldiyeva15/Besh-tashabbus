import json
import os
from datetime import datetime, timedelta

# Import base data
import importlib.util
spec = importlib.util.spec_from_file_location("full_import", "scripts/full_import.py")
full_import = importlib.util.module_from_spec(spec)
spec.loader.exec_module(full_import)

users = full_import.users
clubs = full_import.clubs
schedules = full_import.schedules
memberships = full_import.memberships
reports = full_import.reports
files = full_import.files

# Define specific held sessions with attendee counts, conductor, and Telegram links
held_sessions_map = {
    # Raqs sehri
    ("c_c591d35_45ffe", "2026-09-22"): {
        "status": "held",
        "heldNote": "Talabalar bilan 1 darsimiz quvnoq va zòr kayfiyatda òtdi. Birinchi darsimizda biz qòl harakatlari ustida ishladik",
        "heldDate": "2026-09-29T16:56:18.847Z",
        "attendeeCount": 15,
        "conductorName": "Shavkatbekova Nargiza Shavkatovna",
        "telegramLink": "https://t.me/namsiflBT/11588?single"
    },
    ("c_c591d35_45ffe", "2026-09-29"): {
        "status": "held",
        "heldNote": "Bugungi darsimizda talabalar bilan qòl va oyoq harakatalri ustida ishladik. Dars juda qiziq va mazmunli òtdi",
        "heldDate": "2026-09-29T16:53:53.374Z",
        "attendeeCount": 6,
        "conductorName": "Shavkatbekova Nargiza Shavkatovna",
        "telegramLink": "https://t.me/namsiflBT/11676?single"
    },
    # Oltin mikrafon
    ("c_66437f6_d667b", "2026-09-07"): {
        "status": "held",
        "heldNote": "",
        "heldDate": "2026-10-03T05:26:40.120Z",
        "attendeeCount": 1,
        "conductorName": "Egamberdiyeva Gulzoda Shuxratjon qizi",
        "telegramLink": "https://t.me/namsiflBT/11167"
    },
    ("c_66437f6_d667b", "2026-09-14"): {
        "status": "held",
        "heldNote": "",
        "heldDate": "2026-10-03T05:26:19.481Z",
        "attendeeCount": 1,
        "conductorName": "Egamberdiyeva Gulzoda Shuxratjon qizi",
        "telegramLink": "https://t.me/namsiflBT/11197"
    },
    ("c_66437f6_d667b", "2026-09-21"): {
        "status": "held",
        "heldNote": "",
        "heldDate": "2026-10-03T05:25:56.907Z",
        "attendeeCount": 1,
        "conductorName": "Egamberdiyeva Gulzoda Shuxratjon qizi",
        "telegramLink": "https://t.me/namsiflBT/11431"
    },
    ("c_66437f6_d667b", "2026-09-28"): {
        "status": "held",
        "heldNote": "",
        "heldDate": "2026-10-03T05:27:02.885Z",
        "attendeeCount": 1,
        "conductorName": "Egamberdiyeva Gulzoda Shuxratjon qizi",
        "telegramLink": "https://t.me/namsiflBT/11617"
    },
    # Ibrat flowers academy
    ("c_2086a8b_bf799", "2026-09-22"): {
        "status": "held",
        "heldNote": "1-mashg'ulot",
        "heldDate": "2026-09-30T04:58:36.130Z",
        "attendeeCount": 8,
        "conductorName": "Valijonova Roziya Baxtiyor qizi",
        "telegramLink": "https://t.me/namsiflBT/11597"
    },
    # Voleybol to'garagi
    ("c_cb90143_cf2c7", "2026-09-16"): {
        "status": "held",
        "heldNote": "Dars jarayonida talabalar oz vaqtini unumli hamda mazmunli oʻtkazdi",
        "heldDate": "2026-10-03T12:43:30.966Z",
        "attendeeCount": 23,
        "conductorName": "Abtufattoyeva Mushtariybonu Sarvarjon qizi",
        "telegramLink": "https://t.me/namsiflBT/11314?single"
    },
    ("c_cb90143_cf2c7", "2026-09-22"): {
        "status": "held",
        "heldNote": "Soglom turmush tarziga amal qilindi",
        "heldDate": "2026-10-03T12:44:56.637Z",
        "attendeeCount": 15,
        "conductorName": "Abtufattoyeva Mushtariybonu Sarvarjon qizi",
        "telegramLink": "https://t.me/namsiflBT/11496?single"
    },
    ("c_cb90143_cf2c7", "2026-09-30"): {
        "status": "held",
        "heldNote": "Soglom turmush tarzi",
        "heldDate": "2026-10-03T12:47:58.436Z",
        "attendeeCount": 15,
        "conductorName": "Abtufattoyeva Mushtariybonu Sarvarjon qizi",
        "telegramLink": "https://t.me/namsiflBT/11496?single"
    },
    # Student girls' club
    ("c_23cbc13_c64f4", "2026-09-17"): {
        "status": "held",
        "heldNote": "1-mashg'ulot e'longa berish",
        "heldDate": "2026-10-03T09:00:51.771Z",
        "attendeeCount": 15,
        "conductorName": "Zayniddinova Zilolabonu",
        "telegramLink": "https://t.me/manaviyat_namSIFL/34186"
    },
    ("c_23cbc13_c64f4", "2026-09-24"): {
        "status": "held",
        "heldNote": "2-mashg'ulot",
        "heldDate": "2026-10-03T09:01:20.230Z",
        "attendeeCount": 15,
        "conductorName": "Zayniddinova Zilolabonu",
        "telegramLink": "https://t.me/manaviyat_namSIFL/34543"
    },
    ("c_23cbc13_c64f4", "2026-10-01"): {
        "status": "held",
        "heldNote": "3-mashg'ulot",
        "heldDate": "2026-10-03T09:02:15.615Z",
        "attendeeCount": 7,
        "conductorName": "Zayniddinova Zilolabonu",
        "telegramLink": "https://t.me/namsiflBT/11737"
    },
    # Manfaatli mutolaa
    ("c_80a1dc2_d5594", "2026-10-01"): {
        "status": "held",
        "heldNote": "1-mashg'ulot e'lon berish",
        "heldDate": "2026-10-03T09:53:31.609Z",
        "attendeeCount": 15,
        "conductorName": "Tursinmatova Ruxshona Farhodjon qizi",
        "telegramLink": "https://t.me/namsiflBT/11552"
    },
    # Kompyuter Savodxonligi
    ("c_ba9f925_5f358", "2026-09-23"): {
        "status": "held",
        "heldNote": "Qaynoq tugmalar",
        "heldDate": "2026-10-03T02:59:49.956Z",
        "attendeeCount": 4,
        "conductorName": "Rasuljonova Shaxrizoda",
        "telegramLink": "https://t.me/namsiflBT/11736?single"
    },
    # Current AI START (c_c272675_65543)
    ("c_c272675_65543", "2026-09-29"): {
        "status": "held",
        "heldNote": "Tanishtiruv",
        "heldDate": "2026-10-06T17:34:11.903Z",
        "attendeeCount": 15,
        "conductorName": "Nafisa Sotiboldiyeva",
        "telegramLink": "https://t.me/namsiflBT/11650?single"
    },
    ("c_c272675_65543", "2026-10-06"): {
        "status": "held",
        "heldNote": "Promt yozish",
        "heldDate": "2026-10-06T17:34:43.192Z",
        "attendeeCount": 15,
        "conductorName": "Nafisa Sotiboldiyeva",
        "telegramLink": "https://t.me/manaviyat_namSIFL/35290?single"
    }
}

club_names_map = {c["id"]: c["name"] for c in clubs}

# Generate sessions for all active schedules
all_sessions = []
for sc in schedules:
    c_id = sc["clubId"]
    c_name = club_names_map.get(c_id, "To‘garak")
    
    start_d = datetime.strptime(sc["startDate"], "%Y-%m-%d")
    end_d = datetime.strptime(sc["endDate"], "%Y-%m-%d")
    target_weekday = sc["weekday"] - 1
    
    cur = start_d
    while cur.weekday() != target_weekday:
        cur += timedelta(days=1)
        
    idx = 1
    while cur <= end_d:
        d_str = cur.strftime("%Y-%m-%d")
        ses_id = f"ses_{sc['id']}_{idx}"
        
        session_obj = {
            "id": ses_id,
            "clubId": c_id,
            "slotId": sc["id"],
            "topic": f"{c_name}: {idx}-amaliy mashg‘ulot",
            "date": d_str,
            "time": sc["timeStart"],
            "timeEnd": sc.get("timeEnd", ""),
            "location": sc.get("room", ""),
            "status": "planned",
            "heldNote": "",
            "createdAt": sc.get("createdAt", "2026-09-01T08:00:00.000Z")
        }
        
        # Check if held
        key = (c_id, d_str)
        if key in held_sessions_map:
            session_obj.update(held_sessions_map[key])
            
        all_sessions.append(session_obj)
        cur += timedelta(days=7)
        idx += 1

print(f"Generated {len(all_sessions)} clean sessions across {len(clubs)} clubs")

# Filter notifications: remove any mentioning the legacy AI START (c_2040bdb_97be1)
clean_notifications = [
    {
      "id": "notif_01",
      "userId": "all",
      "title": "Yangi o‘quv yili to‘garaklari ochildi!",
      "message": "Is'hoqxon Ibrat nomidagi Namangan davlat chet tillari institutida 5 muhim tashabbus to‘garaklariga a’zo bo‘lish boshlandi.",
      "type": "info",
      "read": True,
      "createdAt": "2026-09-01T08:00:00.000Z"
    },
    {
      "id": "notif_1791307995538_ocwdt",
      "userId": "students",
      "targetRole": "student",
      "title": "📢 Yangi to‘garak tasdiqlandi: «AI START»",
      "message": "Institutda yangi «AI START» to‘garagi tasdiqlandi! Mashg‘ulotlar dars jadvaliga muvofiq o‘tkaziladi. Talabalar a’zolik uchun ariza topshirishi mumkin.",
      "type": "info",
      "linkTab": "browse",
      "clubId": "c_c272675_65543",
      "read": False,
      "createdAt": "2026-10-06T17:33:15.538Z"
    },
    {
      "id": "notif_1791307995538_2tshq",
      "userId": "u_317b241_fe6aa",
      "targetRole": "leader",
      "title": "🎉 To‘garagingiz tasdiqlandi!",
      "message": "Tabriklaymiz! Sizning «AI START» to‘garagingiz va nizomi institut Bosh admini (Hamidulla Abdualiyev) tomonidan rasman tasdiqlandi. Endi mashg‘ulotlarni o‘tkazishingiz, dars jadvali bo‘yicha talabalarni qabul qilishingiz mumkin.",
      "type": "success",
      "linkTab": "myClubs",
      "clubId": "c_c272675_65543",
      "read": True,
      "createdAt": "2026-10-06T17:33:15.538Z"
    }
]

tokens = {
    "token_admin_001": "u_admin_001",
    "token_nafisaxon_001": "u_317b241_fe6aa"
}

clean_db = {
    "users": users,
    "clubs": clubs,
    "sessions": all_sessions,
    "schedules": schedules,
    "memberships": memberships,
    "reports": reports,
    "annualReports": [],
    "submissions": [],
    "files": files,
    "notifications": clean_notifications,
    "tokens": tokens,
    "_serverUpdatedAt": "2026-10-11T12:00:00.000Z",
    "_deletedClubIds": [],
    "_deletedMembershipIds": [],
    "_deletedUserIds": []
}

# 1. Write clean database.json
with open("data/database.json", "w", encoding="utf-8") as f:
    json.dump(clean_db, f, ensure_ascii=False, indent=2)

# 2. Write clean immutable backup file
with open("data/5_tashabbus_zaxira_clean.json", "w", encoding="utf-8") as f:
    json.dump(clean_db, f, ensure_ascii=False, indent=2)

print(f"Successfully saved clean database.json and 5_tashabbus_zaxira_clean.json!")
print(f"Summary: {len(users)} users, {len(clubs)} clubs, {len(all_sessions)} sessions, {len(schedules)} schedules, {len(memberships)} memberships, {len(files)} files")
