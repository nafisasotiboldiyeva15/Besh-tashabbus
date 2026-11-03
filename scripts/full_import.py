import json

# Load users, clubs, schedules, memberships, reports from populate_data.py
import importlib.util
spec = importlib.util.spec_from_file_location("pop", "scripts/populate_data.py")
pop = importlib.util.module_from_spec(spec)
spec.loader.exec_module(pop)

users = pop.users
clubs = pop.clubs
# Filter schedules to remove legacy c_2040bdb_97be1
schedules = [s for s in pop.schedules if s.get("clubId") != "c_2040bdb_97be1"]
memberships = pop.memberships
reports = pop.reports

print(f"Base data: {len(users)} users, {len(clubs)} clubs, {len(schedules)} schedules")

files = [
    {
      "id": "f_eebac23_4430e",
      "name": "Image_to_PDF_20260925_031447.pdf",
      "mime": "application/pdf",
      "size": 4969623,
      "data": "",
      "owner": "u_317b241_fe6aa",
      "createdAt": "2026-09-25T11:12:27.406Z"
    },
    {
      "id": "f_f8bcae3_eb628",
      "name": "Oltin mikrofon.pdf",
      "mime": "application/pdf",
      "size": 283974,
      "data": "",
      "owner": "u_fa59e9a_95389",
      "createdAt": "2026-09-25T11:23:52.232Z"
    },
    {
      "id": "f_07443d7_2a949",
      "name": "photo_2026-09-25_16-27-56.jpg",
      "mime": "image/jpeg",
      "size": 49032,
      "data": "",
      "owner": "u_fa59e9a_95389",
      "createdAt": "2026-09-25T11:28:11.081Z"
    },
    {
      "id": "f_5c7d98e_af20f",
      "name": "photo_2026-09-25_16-37-03.jpg",
      "mime": "image/jpeg",
      "size": 51003,
      "data": "",
      "owner": "u_fa59e9a_95389",
      "createdAt": "2026-09-25T11:37:13.999Z"
    },
    {
      "id": "f_164e052_e385f",
      "name": "photo_2026-09-25_16-37-03.jpg",
      "mime": "image/jpeg",
      "size": 51003,
      "data": "",
      "owner": "u_fa59e9a_95389",
      "createdAt": "2026-09-25T11:40:48.607Z"
    },
    {
      "id": "f_7693fdd_fe878",
      "name": "photo_2026-09-25_16-42-16.jpg",
      "mime": "image/jpeg",
      "size": 58737,
      "data": "",
      "owner": "u_fa59e9a_95389",
      "createdAt": "2026-09-25T11:42:39.224Z"
    },
    {
      "id": "f_647b509_28990",
      "name": "Image_to_PDF_20260925_031447.pdf",
      "mime": "application/pdf",
      "size": 4969623,
      "data": "",
      "owner": "u_317b241_fe6aa",
      "createdAt": "2026-09-27T07:44:26.512Z"
    },
    {
      "id": "f_b664664_97931",
      "name": "Image_to_PDF_20260925_031447.pdf",
      "mime": "application/pdf",
      "size": 4969623,
      "data": "",
      "owner": "u_317b241_fe6aa",
      "createdAt": "2026-09-27T07:52:01.073Z"
    },
    {
      "id": "f_35980d8_1506a",
      "name": "Image_to_PDF_20260925_031447.pdf",
      "mime": "application/pdf",
      "size": 4969623,
      "data": "",
      "owner": "u_317b241_fe6aa",
      "createdAt": "2026-09-28T17:12:52.586Z"
    },
    {
      "id": "f_f1830f0_34d51",
      "name": "IMG_20260929_133500_829.pdf",
      "mime": "application/pdf",
      "size": 471291,
      "data": "",
      "owner": "u_3c89c5c_80f75",
      "createdAt": "2026-09-29T08:41:17.393Z"
    },
    {
      "id": "f_7409389_4c1d9",
      "name": "Stol tennisi M.Nematullayev.pdf",
      "mime": "application/pdf",
      "size": 4339638,
      "data": "",
      "owner": "u_d86a665_2f3ea",
      "createdAt": "2026-09-26T09:56:08.793Z"
    },
    {
      "id": "f_75970b3_dc5ab",
      "name": "Yosh kitobxon nizomi.PDF",
      "mime": "application/pdf",
      "size": 2043975,
      "data": "",
      "owner": "u_16e9d7e_b7d1a",
      "createdAt": "2026-09-26T11:15:53.899Z"
    },
    {
      "id": "f_ffce6a9_45f92",
      "name": "Raqs sehri N.Shavkatbekova.pdf",
      "mime": "application/pdf",
      "size": 3023151,
      "data": "",
      "owner": "u_4857dcb_146b3",
      "createdAt": "2026-09-28T10:34:15.826Z"
    },
    {
      "id": "f_1e6d81d_56d90",
      "name": "Mohir qo'llar.pdf",
      "mime": "application/pdf",
      "size": 464727,
      "data": "",
      "owner": "u_1b4a1c9_678c3",
      "createdAt": "2026-09-28T10:52:53.520Z"
    },
    {
      "id": "f_9a232a0_5e286",
      "name": "Raqs va qo'shiq M.Anvarova.pdf",
      "mime": "application/pdf",
      "size": 2117040,
      "data": "",
      "owner": "u_53b49e3_05088",
      "createdAt": "2026-09-28T11:10:52.038Z"
    },
    {
      "id": "f_066ff73_a7fa8",
      "name": "Raqs va qo'shiq M.Anvarova.pdf",
      "mime": "application/pdf",
      "size": 2117040,
      "data": "",
      "owner": "u_53b49e3_05088",
      "createdAt": "2026-09-28T11:15:54.408Z"
    },
    {
      "id": "f_3c76424_c1b26",
      "name": "Oltin mikrofon Egamberdiyeva Gulzoda.pdf",
      "mime": "application/pdf",
      "size": 283974,
      "data": "",
      "owner": "u_fa59e9a_95389",
      "createdAt": "2026-09-28T12:27:34.054Z"
    },
    {
      "id": "f_961609f_02f45",
      "name": "AI start N.Sotvoldiyeva.pdf",
      "mime": "application/pdf",
      "size": 4969623,
      "data": "",
      "owner": "u_317b241_fe6aa",
      "createdAt": "2026-09-28T12:32:01.350Z"
    },
    {
      "id": "f_5f9048c_9ddfd",
      "name": "Student gerlis club Zilola.pdf",
      "mime": "application/pdf",
      "size": 531879,
      "data": "",
      "owner": "u_d2746da_7ecfd",
      "createdAt": "2026-09-28T12:42:35.901Z"
    },
    {
      "id": "f_0f279b5_ca91c",
      "name": "rassomchilik klubi nizomi M.Muhammadjonova.pdf",
      "mime": "application/pdf",
      "size": 1859448,
      "data": "",
      "owner": "u_ca67edf_9826c",
      "createdAt": "2026-09-28T13:03:07.548Z"
    },
    {
      "id": "f_bd8c4e8_5f2f1",
      "name": "IMG_20260929_133500_829.pdf",
      "mime": "application/pdf",
      "size": 471291,
      "data": "",
      "owner": "u_3c89c5c_80f75",
      "createdAt": "2026-09-29T08:44:10.865Z"
    },
    {
      "id": "f_f2d0ab2_ac1d9",
      "name": "Document 134.pdf",
      "mime": "application/pdf",
      "size": 574692,
      "data": "",
      "owner": "u_336c094_bf71b",
      "createdAt": "2026-09-29T09:06:54.553Z"
    },
    {
      "id": "f_f0b0d18_d661c",
      "name": "Oltin mikrofon Egamberdiyeva Gulzoda.pdf",
      "mime": "application/pdf",
      "size": 283974,
      "data": "",
      "owner": "u_fa59e9a_95389",
      "createdAt": "2026-09-29T10:19:41.980Z"
    },
    {
      "id": "f_f01bc83_18fa7",
      "name": "Image_to_PDF_20260925_031447.pdf",
      "mime": "application/pdf",
      "size": 4969623,
      "data": "",
      "owner": "u_317b241_fe6aa",
      "createdAt": "2026-09-29T10:24:14.759Z"
    },
    {
      "id": "f_b2d2fad_934c0",
      "name": "book club .pdf",
      "mime": "application/pdf",
      "size": 5511144,
      "data": "",
      "owner": "u_12d6027_6beb7",
      "createdAt": "2026-09-29T11:25:01.504Z"
    },
    {
      "id": "f_bcea959_ec19d",
      "name": "Image_to_PDF_20260929_044248.pdf",
      "mime": "application/pdf",
      "size": 899358,
      "data": "",
      "owner": "u_d7eca37_a2f6a",
      "createdAt": "2026-09-29T11:48:33.821Z"
    },
    {
      "id": "f_c800215_bf733",
      "name": "Ibrat flowers academy R.Valijonova.pdf",
      "mime": "application/pdf",
      "size": 497145,
      "data": "",
      "owner": "u_95cc25d_a2b9b",
      "createdAt": "2026-09-30T04:56:36.915Z"
    },
    {
      "id": "f_b03948e_a9e78",
      "name": "Nafisa_Sotiboldiyeva_CV.pdf",
      "mime": "application/pdf",
      "size": 1203669,
      "data": "",
      "owner": "u_3b2c045_85477",
      "createdAt": "2026-09-24T05:01:52.120Z"
    },
    {
      "id": "f_b17a291_0fd9e",
      "name": "Nafisa_Sotiboldiyeva_CV.pdf",
      "mime": "application/pdf",
      "size": 1203669,
      "data": "",
      "owner": "u_317b241_fe6aa",
      "createdAt": "2026-09-24T12:43:12.670Z"
    },
    {
      "id": "f_920b538_d8de8",
      "name": "Nafisa_Sotiboldiyeva_CV.pdf",
      "mime": "application/pdf",
      "size": 1203669,
      "data": "",
      "owner": "u_317b241_fe6aa",
      "createdAt": "2026-09-24T13:14:24.616Z"
    },
    {
      "id": "f_85ab6df_cf255",
      "name": "Voleybol to'garagi M.Abdufattoyeva.pdf",
      "mime": "application/pdf",
      "size": 505233,
      "data": "",
      "owner": "u_41e27b6_a722f",
      "createdAt": "2026-10-03T06:21:42.357Z"
    },
    {
      "id": "f_dd2f588_15989",
      "name": "Image_to_PDF_20260929_055745.pdf",
      "mime": "application/pdf",
      "size": 723399,
      "data": "",
      "owner": "u_b7cc3d3_f8d55",
      "createdAt": "2026-09-29T13:01:18.089Z"
    },
    {
      "id": "f_6b6e075_5d70e",
      "name": "1702.pdf",
      "mime": "application/pdf",
      "size": 531879,
      "data": "",
      "owner": "u_961dcd6_e2441",
      "createdAt": "2026-10-02T15:40:07.822Z"
    },
    {
      "id": "f_17773b2_c641f",
      "name": "Student gerlis club Zilola.pdf",
      "mime": "application/pdf",
      "size": 531879,
      "data": "",
      "owner": "u_961dcd6_e2441",
      "createdAt": "2026-10-03T08:58:23.135Z"
    },
    {
      "id": "f_c774a8e_ccc4d",
      "name": "stol tennisi F.Mahamadaminov.pdf",
      "mime": "application/pdf",
      "size": 2615208,
      "data": "",
      "owner": "u_c0c8874_b45e6",
      "createdAt": "2026-10-03T09:16:18.381Z"
    },
    {
      "id": "f_1dfa3d1_b258b",
      "name": "Rus tili so'zlashuvi N.Mahmudjonova.pdf",
      "mime": "application/pdf",
      "size": 2104422,
      "data": "",
      "owner": "u_574fb26_7e9a4",
      "createdAt": "2026-10-03T09:31:58.732Z"
    },
    {
      "id": "f_5ea05a5_d5459",
      "name": "Manfaatli mutolaa R.Tursinmatova.pdf",
      "mime": "application/pdf",
      "size": 395541,
      "data": "",
      "owner": "u_3474a03_4ef0b",
      "createdAt": "2026-10-03T09:51:50.361Z"
    },
    {
      "id": "f_7bc4ee3_718ec",
      "name": "Volshebniye ruki M.Nasriddinova.pdf",
      "mime": "application/pdf",
      "size": 389412,
      "data": "",
      "owner": "u_bc482e8_d974b",
      "createdAt": "2026-10-05T10:41:02.700Z"
    },
    {
      "id": "f_e14e594_098c7",
      "name": "Image_to_PDF_20260925_031447.pdf",
      "mime": "application/pdf",
      "size": 4969623,
      "data": "",
      "owner": "u_317b241_fe6aa",
      "createdAt": "2026-10-06T17:26:25.735Z"
    },
    {
      "id": "f_ef56ace_6530d",
      "name": "Image_to_PDF_20260925_031447.pdf",
      "mime": "application/pdf",
      "size": 4969623,
      "data": "",
      "owner": "u_317b241_fe6aa",
      "createdAt": "2026-10-06T17:32:41.101Z"
    }
]

print(f"Loaded {len(files)} files")
