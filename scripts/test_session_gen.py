from datetime import datetime, timedelta

def generate_sessions_for_schedule(sched, club_name):
    # weekday: 1=Mon, 2=Tue, 3=Wed, 4=Thu, 5=Fri
    # startDate: YYYY-MM-DD, endDate: YYYY-MM-DD
    start = datetime.strptime(sched["startDate"], "%Y-%m-%d")
    end = datetime.strptime(sched["endDate"], "%Y-%m-%d")
    target_weekday = sched["weekday"] - 1 # python 0=Mon
    
    # advance to first target_weekday
    cur = start
    while cur.weekday() != target_weekday:
        cur += timedelta(days=1)
        
    sessions = []
    idx = 1
    while cur <= end:
        d_str = cur.strftime("%Y-%m-%d")
        ses_id = f"ses_{sched['id']}_{idx}"
        sessions.append({
            "id": ses_id,
            "clubId": sched["clubId"],
            "slotId": sched["id"],
            "topic": f"{club_name}: {idx}-amaliy mashg‘ulot",
            "date": d_str,
            "time": sched["timeStart"],
            "timeEnd": sched["timeEnd"],
            "location": sched["room"],
            "status": "planned",
            "heldNote": "",
            "createdAt": sched["createdAt"]
        })
        cur += timedelta(days=7)
        idx += 1
    return sessions

print("Session generator ready")
