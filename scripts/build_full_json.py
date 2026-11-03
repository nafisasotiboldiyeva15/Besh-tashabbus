import json

# Load base populated data
with open("data/5_tashabbus_zaxira_2026-10-08.json", "r") as f:
    base_data = json.load(f)

users = base_data.get("users", [])
clubs = base_data.get("clubs", [])

print(f"Users: {len(users)}, Clubs: {len(clubs)}")
