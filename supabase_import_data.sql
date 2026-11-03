-- ==============================================================================
-- UniBridge: 21 ta faol to'garak va ularga tegishli ma'lumotlarni import qilish
-- Mavjud profiles, study_groups, study_group_members jadvallariga mutlaqo tegmaydi
-- Eski AI START (c_2040bdb_97be1) chiqarib tashlangan, joriy AI START (c_c272675_65543) saqlangan
-- DROP, TRUNCATE yoki DELETE ishlatilmagan (xavfsiz ON CONFLICT DO UPDATE/NOTHING)
-- ==============================================================================

-- 1. CLUBS (21 ta faol to'garak)
INSERT INTO public.clubs (id, name, category, description, faculty, leader_id, leader_name, room, start_date, end_date, weekdays, time_start, time_end, statute_status, admin_comment, statute_file_id, statute_reviewed_at)
VALUES ('c_1945175_4c20f', 'Stol tennisi', 'talaba_tashkil', 'Sport bu sog''lik garovi', 'Til va tarjima', 'u_d86a665_2f3ea', 'Ne''matullayeva Mohlaroy Nurullo qizi', 'Yangi bino sport zalida', '2026-09-14', '2027-06-25', '[2,4]'::jsonb, '16:00', '18:00', 'approved', 'juda sog''lomsiz', 'f_7409389_4c1d9', '2026-09-26T09:58:01.697Z')
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
  statute_status = EXCLUDED.statute_status,
  admin_comment = EXCLUDED.admin_comment,
  statute_file_id = EXCLUDED.statute_file_id,
  statute_reviewed_at = EXCLUDED.statute_reviewed_at;

INSERT INTO public.clubs (id, name, category, description, faculty, leader_id, leader_name, room, start_date, end_date, weekdays, time_start, time_end, statute_status, admin_comment, statute_file_id, statute_reviewed_at)
VALUES ('c_89f1306_dc63a', 'Yosh kitobxon', 'talaba_tashkil', '', 'Til va tarjima', 'u_16e9d7e_b7d1a', 'Rustamova Zilola Avaz qizi', 'Yangi binoda joylashgan ARM', '2026-09-21', '2027-06-25', '[2]'::jsonb, '15:00', '16:00', 'approved', '', 'f_75970b3_dc5ab', '2026-09-26T11:16:45.359Z')
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
  statute_status = EXCLUDED.statute_status,
  admin_comment = EXCLUDED.admin_comment,
  statute_file_id = EXCLUDED.statute_file_id,
  statute_reviewed_at = EXCLUDED.statute_reviewed_at;

INSERT INTO public.clubs (id, name, category, description, faculty, leader_id, leader_name, room, start_date, end_date, weekdays, time_start, time_end, statute_status, admin_comment, statute_file_id, statute_reviewed_at)
VALUES ('c_c591d35_45ffe', 'Raqs sehri', 'talaba_tashkil', '', 'Til va tarjima', 'u_4857dcb_146b3', 'Shavkatbekova Nargiza Shavkatovna', 'Faollar zali', '2026-09-14', '2027-06-27', '[2]'::jsonb, '17:30', '18:30', 'approved', 'uyonga tashlab o''yna', 'f_ffce6a9_45f92', '2026-09-28T10:35:21.828Z')
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
  statute_status = EXCLUDED.statute_status,
  admin_comment = EXCLUDED.admin_comment,
  statute_file_id = EXCLUDED.statute_file_id,
  statute_reviewed_at = EXCLUDED.statute_reviewed_at;

INSERT INTO public.clubs (id, name, category, description, faculty, leader_id, leader_name, room, start_date, end_date, weekdays, time_start, time_end, statute_status, admin_comment, statute_file_id, statute_reviewed_at)
VALUES ('c_82f768d_56e08', 'Mohir qo''llar', 'talaba_tashkil', '', 'Til va tarjima', 'u_1b4a1c9_678c3', 'Odilova Muborak Shuhratjon qizi', 'Yangi bino 335-auditoriya', '2026-09-15', '2027-06-27', '[2]'::jsonb, '11:00', '13:00', 'approved', 'Doim o''ting nazorat qilinadi', 'f_1e6d81d_56d90', '2026-09-28T10:53:26.734Z')
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
  statute_status = EXCLUDED.statute_status,
  admin_comment = EXCLUDED.admin_comment,
  statute_file_id = EXCLUDED.statute_file_id,
  statute_reviewed_at = EXCLUDED.statute_reviewed_at;

INSERT INTO public.clubs (id, name, category, description, faculty, leader_id, leader_name, room, start_date, end_date, weekdays, time_start, time_end, statute_status, admin_comment, statute_file_id, statute_reviewed_at)
VALUES ('c_e8395b0_a8051', 'Raqs va qo''shiq', 'talaba_tashkil', '', 'Til va tarjima', 'u_53b49e3_05088', 'Anvarobva Ma''suma Axrorjon qizi', 'Faollar zali', '2026-09-17', '2027-06-27', '[4]'::jsonb, '10:00', '12:00', 'approved', 'O''z vaqtida o''ting!', 'f_066ff73_a7fa8', '2026-09-28T11:16:23.902Z')
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
  statute_status = EXCLUDED.statute_status,
  admin_comment = EXCLUDED.admin_comment,
  statute_file_id = EXCLUDED.statute_file_id,
  statute_reviewed_at = EXCLUDED.statute_reviewed_at;

INSERT INTO public.clubs (id, name, category, description, faculty, leader_id, leader_name, room, start_date, end_date, weekdays, time_start, time_end, statute_status, admin_comment, statute_file_id, statute_reviewed_at)
VALUES ('c_45a70b4_caa15', 'Rasomchilik klubi', 'talaba_tashkil', 'nazoratdasiz', 'Til va tarjima', 'u_ca67edf_9826c', 'Muhammadjonova Muxlisa Oybek qizi', 'Ochiq osmon astida', '2026-09-28', '2026-12-27', '[5]'::jsonb, '13:00', '14:00', 'approved', 'nazoratdasiz', 'f_0f279b5_ca91c', '2026-09-28T13:03:27.187Z')
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
  statute_status = EXCLUDED.statute_status,
  admin_comment = EXCLUDED.admin_comment,
  statute_file_id = EXCLUDED.statute_file_id,
  statute_reviewed_at = EXCLUDED.statute_reviewed_at;

INSERT INTO public.clubs (id, name, category, description, faculty, leader_id, leader_name, room, start_date, end_date, weekdays, time_start, time_end, statute_status, admin_comment, statute_file_id, statute_reviewed_at)
VALUES ('c_ba9f925_5f358', 'Kompyuter Savodxonligi', 'talaba_tashkil', 'Kompyuter savodxonligi', 'Til va tarjima fakulteti', 'u_3c89c5c_80f75', 'Rasuljonova Shaxrizoda', '5-etaj', '2026-02-01', '2027-02-06', '[3]'::jsonb, '13:00', '15:00', 'approved', 'Nazoratdasiz', 'f_bd8c4e8_5f2f1', '2026-09-29T08:44:50.300Z')
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
  statute_status = EXCLUDED.statute_status,
  admin_comment = EXCLUDED.admin_comment,
  statute_file_id = EXCLUDED.statute_file_id,
  statute_reviewed_at = EXCLUDED.statute_reviewed_at;

INSERT INTO public.clubs (id, name, category, description, faculty, leader_id, leader_name, room, start_date, end_date, weekdays, time_start, time_end, statute_status, admin_comment, statute_file_id, statute_reviewed_at)
VALUES ('c_f780955_ac270', 'Turk tili', 'talaba_tashkil', 'Turk tili', 'Til va tarjima', 'u_336c094_bf71b', 'Mamatkarimova Umida Komiljon qizi', '119-xona', '2026-09-29', '2027-06-26', '[2]'::jsonb, '13:00', '14:00', 'approved', 'Nazoratdasiz!', 'f_f2d0ab2_ac1d9', '2026-09-29T09:07:15.924Z')
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
  statute_status = EXCLUDED.statute_status,
  admin_comment = EXCLUDED.admin_comment,
  statute_file_id = EXCLUDED.statute_file_id,
  statute_reviewed_at = EXCLUDED.statute_reviewed_at;

INSERT INTO public.clubs (id, name, category, description, faculty, leader_id, leader_name, room, start_date, end_date, weekdays, time_start, time_end, statute_status, admin_comment, statute_file_id, statute_reviewed_at)
VALUES ('c_f501c2b_87e2b', 'English beyond class', 'talaba_tashkil', 'English beyond class ingliz tilini talabalarga o''rgatish', 'Til va tarjima fakulteti', 'u_9355ed9_fdcc5', 'Shoxida Rasuljonova', 'bo''sh xonada', '2026-09-16', '2027-06-08', '[3]'::jsonb, '16:00', NULL, 'approved', 'Nazoratdasiz', NULL, '2026-09-29T10:15:17.154Z')
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
  statute_status = EXCLUDED.statute_status,
  admin_comment = EXCLUDED.admin_comment,
  statute_file_id = EXCLUDED.statute_file_id,
  statute_reviewed_at = EXCLUDED.statute_reviewed_at;

INSERT INTO public.clubs (id, name, category, description, faculty, leader_id, leader_name, room, start_date, end_date, weekdays, time_start, time_end, statute_status, admin_comment, statute_file_id, statute_reviewed_at)
VALUES ('c_66437f6_d667b', 'Oltin mikrafon', 'talaba_tashkil', 'Onlayn efirda ketadi', 'Til va tarjima fakulteti', 'u_fa59e9a_95389', 'Egamberdiyeva Gulzoda Shuxratjon qizi', 'Onlayn', '2026-09-07', '2027-06-28', '[1]'::jsonb, '06:30', '08:30', 'approved', 'Nazoratdasiz', 'f_f0b0d18_d661c', '2026-09-29T10:20:07.356Z')
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
  statute_status = EXCLUDED.statute_status,
  admin_comment = EXCLUDED.admin_comment,
  statute_file_id = EXCLUDED.statute_file_id,
  statute_reviewed_at = EXCLUDED.statute_reviewed_at;

INSERT INTO public.clubs (id, name, category, description, faculty, leader_id, leader_name, room, start_date, end_date, weekdays, time_start, time_end, statute_status, admin_comment, statute_file_id, statute_reviewed_at)
VALUES ('c_3049351_93612', 'Book club', 'talaba_tashkil', 'Kitobxonlik madaniyatini oshirish', 'Til va tarjima fakulteti', 'u_12d6027_6beb7', 'Haydarova Dilnuraxon', 'ARM', '2026-09-29', '2027-06-26', '[3]'::jsonb, '16:00', '17:00', 'approved', 'Nazoratdasiz', 'f_b2d2fad_934c0', '2026-09-29T11:25:39.789Z')
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
  statute_status = EXCLUDED.statute_status,
  admin_comment = EXCLUDED.admin_comment,
  statute_file_id = EXCLUDED.statute_file_id,
  statute_reviewed_at = EXCLUDED.statute_reviewed_at;

INSERT INTO public.clubs (id, name, category, description, faculty, leader_id, leader_name, room, start_date, end_date, weekdays, time_start, time_end, statute_status, admin_comment, statute_file_id, statute_reviewed_at)
VALUES ('c_11525bb_ec1f4', 'IBRAT IZIDAN', 'talaba_tashkil', 'Video qilish', 'Til va tarjima fakulteti', 'u_d7eca37_a2f6a', 'Sotvoldiyeva Mastura', 'onlayn', '2026-09-29', '2027-06-26', '[5]'::jsonb, '10:00', '11:30', 'approved', 'Nazoratdasiz', 'f_bcea959_ec19d', '2026-09-29T11:49:03.297Z')
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
  statute_status = EXCLUDED.statute_status,
  admin_comment = EXCLUDED.admin_comment,
  statute_file_id = EXCLUDED.statute_file_id,
  statute_reviewed_at = EXCLUDED.statute_reviewed_at;

INSERT INTO public.clubs (id, name, category, description, faculty, leader_id, leader_name, room, start_date, end_date, weekdays, time_start, time_end, statute_status, admin_comment, statute_file_id, statute_reviewed_at)
VALUES ('c_2086a8b_bf799', 'Ibrat flowers academy', 'talaba_tashkil', '', 'Til va tarjima fakulteti', 'u_95cc25d_a2b9b', 'Valijonova Roziya Baxtiyor qizi', '403-auditoriya', '2026-09-22', '2027-06-29', '[2]'::jsonb, '13:00', '14:00', 'approved', 'nazoratdasiz', 'f_c800215_bf733', '2026-09-30T04:59:00.081Z')
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
  statute_status = EXCLUDED.statute_status,
  admin_comment = EXCLUDED.admin_comment,
  statute_file_id = EXCLUDED.statute_file_id,
  statute_reviewed_at = EXCLUDED.statute_reviewed_at;

INSERT INTO public.clubs (id, name, category, description, faculty, leader_id, leader_name, room, start_date, end_date, weekdays, time_start, time_end, statute_status, admin_comment, statute_file_id, statute_reviewed_at)
VALUES ('c_cb90143_cf2c7', 'Voleybol to''garagi', 'talaba_tashkil', 'Nazoratdasiz', 'Til va tarjima fakulteti', 'u_41e27b6_a722f', 'Abtufattoyeva Mushtariybonu Sarvarjon qizi', 'Ikkita fakultet sport zali', '2026-09-14', '2027-06-26', '[2,3]'::jsonb, '14:20', '16:20', 'approved', 'nazoratimdasiz', 'f_85ab6df_cf255', '2026-10-03T06:22:13.059Z')
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
  statute_status = EXCLUDED.statute_status,
  admin_comment = EXCLUDED.admin_comment,
  statute_file_id = EXCLUDED.statute_file_id,
  statute_reviewed_at = EXCLUDED.statute_reviewed_at;

INSERT INTO public.clubs (id, name, category, description, faculty, leader_id, leader_name, room, start_date, end_date, weekdays, time_start, time_end, statute_status, admin_comment, statute_file_id, statute_reviewed_at)
VALUES ('c_d1019f6_15a21', 'Media club', 'talaba_tashkil', 'Ijtimoiy tarmoqlar uchun video tayyorlash', 'Til va tarjima fakulteti', 'u_b7cc3d3_f8d55', 'Husnida Yakubjanova', 'bo''sh xonada', '2026-10-08', '2027-06-26', '[4]'::jsonb, '11:00', '12:30', 'approved', 'Nazoratdasiz', 'f_dd2f588_15989', '2026-09-29T13:02:10.989Z')
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
  statute_status = EXCLUDED.statute_status,
  admin_comment = EXCLUDED.admin_comment,
  statute_file_id = EXCLUDED.statute_file_id,
  statute_reviewed_at = EXCLUDED.statute_reviewed_at;

INSERT INTO public.clubs (id, name, category, description, faculty, leader_id, leader_name, room, start_date, end_date, weekdays, time_start, time_end, statute_status, admin_comment, statute_file_id, statute_reviewed_at)
VALUES ('c_23cbc13_c64f4', 'Student girls'' club', 'talaba_tashkil', 'Nazoratdasiz', 'Til va tarjima fakulteti', 'u_961dcd6_e2441', 'Zayniddinova Zilolabonu', '428-auditoriya', '2026-09-17', '2027-06-26', '[4]'::jsonb, '11:30', '12:30', 'approved', 'Nazoratdasiz', 'f_17773b2_c641f', '2026-10-03T08:58:50.046Z')
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
  statute_status = EXCLUDED.statute_status,
  admin_comment = EXCLUDED.admin_comment,
  statute_file_id = EXCLUDED.statute_file_id,
  statute_reviewed_at = EXCLUDED.statute_reviewed_at;

INSERT INTO public.clubs (id, name, category, description, faculty, leader_id, leader_name, room, start_date, end_date, weekdays, time_start, time_end, statute_status, admin_comment, statute_file_id, statute_reviewed_at)
VALUES ('c_33a8bdd_ccd46', 'Stol tennisi yigitlarga', 'talaba_tashkil', 'Nazoratdasiz', 'Til va tarjima fakulteti', 'u_c0c8874_b45e6', 'Mahamadaminov Firdavs G''avsiddin o''g''li', 'Sport zal', '2026-10-07', '2027-06-26', '[1,3]'::jsonb, '15:00', '16:00', 'approved', 'Nazoratdasiz', 'f_c774a8e_ccc4d', '2026-10-03T09:16:39.104Z')
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
  statute_status = EXCLUDED.statute_status,
  admin_comment = EXCLUDED.admin_comment,
  statute_file_id = EXCLUDED.statute_file_id,
  statute_reviewed_at = EXCLUDED.statute_reviewed_at;

INSERT INTO public.clubs (id, name, category, description, faculty, leader_id, leader_name, room, start_date, end_date, weekdays, time_start, time_end, statute_status, admin_comment, statute_file_id, statute_reviewed_at)
VALUES ('c_f702a75_b26bd', 'Rus tili so''zlashuvi', 'talaba_tashkil', 'Til o''rgatish', 'Til va tarjima fakulteti', 'u_574fb26_7e9a4', 'Mahmudjonova Nodiraxon Dilmurod qizi', 'TTJ faollar zalida', '2026-10-06', '2027-06-27', '[2]'::jsonb, '16:00', '17:00', 'approved', 'Nazoratdasiz', 'f_1dfa3d1_b258b', '2026-10-03T09:32:14.251Z')
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
  statute_status = EXCLUDED.statute_status,
  admin_comment = EXCLUDED.admin_comment,
  statute_file_id = EXCLUDED.statute_file_id,
  statute_reviewed_at = EXCLUDED.statute_reviewed_at;

INSERT INTO public.clubs (id, name, category, description, faculty, leader_id, leader_name, room, start_date, end_date, weekdays, time_start, time_end, statute_status, admin_comment, statute_file_id, statute_reviewed_at)
VALUES ('c_80a1dc2_d5594', 'Manfaatli mutolaa', 'talaba_tashkil', 'Kitob o''qitish', 'Til va tarjima fakulteti', 'u_3474a03_4ef0b', 'Tursinmatova Ruxshona Farhodjon qizi', 'ARM', '2026-09-29', '2027-06-26', '[4]'::jsonb, '15:00', '16:00', 'approved', 'Nazoratdasiz', 'f_5ea05a5_d5459', '2026-10-03T09:52:08.822Z')
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
  statute_status = EXCLUDED.statute_status,
  admin_comment = EXCLUDED.admin_comment,
  statute_file_id = EXCLUDED.statute_file_id,
  statute_reviewed_at = EXCLUDED.statute_reviewed_at;

INSERT INTO public.clubs (id, name, category, description, faculty, leader_id, leader_name, room, start_date, end_date, weekdays, time_start, time_end, statute_status, admin_comment, statute_file_id, statute_reviewed_at)
VALUES ('c_4190d91_71920', 'Volshebniye ruki', 'talaba_tashkil', 'Sehirli qollar', 'Til va tarjima fakulteti', 'u_bc482e8_d974b', 'Nasriddinova Malohat Kamoliddin qizi', '506', '2026-09-29', '2027-06-22', '[2]'::jsonb, '12:00', '13:00', 'approved', 'Nazoratdasiz', 'f_7bc4ee3_718ec', '2026-10-05T10:41:19.362Z')
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
  statute_status = EXCLUDED.statute_status,
  admin_comment = EXCLUDED.admin_comment,
  statute_file_id = EXCLUDED.statute_file_id,
  statute_reviewed_at = EXCLUDED.statute_reviewed_at;

INSERT INTO public.clubs (id, name, category, description, faculty, leader_id, leader_name, room, start_date, end_date, weekdays, time_start, time_end, statute_status, admin_comment, statute_file_id, statute_reviewed_at)
VALUES ('c_c272675_65543', 'AI START', 'talaba_tashkil', 'Ai orqali daromad qilish', 'Til va tarjima fakulteti', 'u_317b241_fe6aa', 'Nafisa Sotiboldiyeva', 'KARYERA MARKAZIDA', '2026-09-29', '2027-06-26', '[2]'::jsonb, '12:00', '12:30', 'approved', '', 'f_ef56ace_6530d', '2026-10-06T17:33:09.905Z')
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
  statute_status = EXCLUDED.statute_status,
  admin_comment = EXCLUDED.admin_comment,
  statute_file_id = EXCLUDED.statute_file_id,
  statute_reviewed_at = EXCLUDED.statute_reviewed_at;


-- 22. Culture around the world
INSERT INTO public.clubs (id, name, category, description, faculty, leader_id, leader_name, room, start_date, end_date, weekdays, time_start, time_end, statute_status, admin_comment, statute_file_id, statute_reviewed_at)
VALUES ('c_culture_around_world', 'Culture around the world', 'talaba_tashkil', 'Xorijiy mamlakatlar madaniyati, an’analari va xalqaro muloqotni rivojlantirish to‘garagi', 'Til va tarjima', 'u_leader_dildora', 'Karimberdiyeva Dildora', '308-auditoriya', '2026-09-15', '2027-06-25', '[3,5]'::jsonb, '15:00', '16:30', 'approved', 'To‘garak faoliyati va nizomi ma’qullandi. Muvaffaqiyat tilayman!', NULL, '2026-10-12T12:30:00.000Z')
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
  statute_status = EXCLUDED.statute_status,
  admin_comment = EXCLUDED.admin_comment,
  statute_file_id = EXCLUDED.statute_file_id,
  statute_reviewed_at = EXCLUDED.statute_reviewed_at;

-- 2. CLUB SCHEDULES (24 ta dars jadvali)
INSERT INTO public.club_schedules (id, club_id, weekday, time_start, time_end, room, start_date, end_date, created_at)
VALUES ('slot_d5031a5_4c20f', 'c_1945175_4c20f', 2, '16:00', '18:00', 'Yangi bino sport zalida', '2026-09-14', '2027-06-25', '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  weekday = EXCLUDED.weekday,
  time_start = EXCLUDED.time_start,
  time_end = EXCLUDED.time_end,
  room = EXCLUDED.room,
  start_date = EXCLUDED.start_date,
  end_date = EXCLUDED.end_date;

INSERT INTO public.club_schedules (id, club_id, weekday, time_start, time_end, room, start_date, end_date, created_at)
VALUES ('slot_11edcfa_4c20f', 'c_1945175_4c20f', 4, '16:00', '18:00', 'Yangi bino sport zalida', '2026-09-14', '2027-06-25', '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  weekday = EXCLUDED.weekday,
  time_start = EXCLUDED.time_start,
  time_end = EXCLUDED.time_end,
  room = EXCLUDED.room,
  start_date = EXCLUDED.start_date,
  end_date = EXCLUDED.end_date;

INSERT INTO public.club_schedules (id, club_id, weekday, time_start, time_end, room, start_date, end_date, created_at)
VALUES ('slot_7480125_dc63a', 'c_89f1306_dc63a', 2, '15:00', '16:00', 'Yangi binoda joylashgan ARM', '2026-09-21', '2027-06-25', '2026-09-26T11:15:54.042Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  weekday = EXCLUDED.weekday,
  time_start = EXCLUDED.time_start,
  time_end = EXCLUDED.time_end,
  room = EXCLUDED.room,
  start_date = EXCLUDED.start_date,
  end_date = EXCLUDED.end_date;

INSERT INTO public.club_schedules (id, club_id, weekday, time_start, time_end, room, start_date, end_date, created_at)
VALUES ('slot_8f85605_45ffe', 'c_c591d35_45ffe', 2, '17:30', '18:30', 'Faollar zali', '2026-09-14', '2027-06-27', '2026-09-28T10:34:15.934Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  weekday = EXCLUDED.weekday,
  time_start = EXCLUDED.time_start,
  time_end = EXCLUDED.time_end,
  room = EXCLUDED.room,
  start_date = EXCLUDED.start_date,
  end_date = EXCLUDED.end_date;

INSERT INTO public.club_schedules (id, club_id, weekday, time_start, time_end, room, start_date, end_date, created_at)
VALUES ('slot_7256d62_56e08', 'c_82f768d_56e08', 2, '11:00', '13:00', 'Yangi bino 335-auditoriya', '2026-09-15', '2027-06-27', '2026-09-28T10:52:53.640Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  weekday = EXCLUDED.weekday,
  time_start = EXCLUDED.time_start,
  time_end = EXCLUDED.time_end,
  room = EXCLUDED.room,
  start_date = EXCLUDED.start_date,
  end_date = EXCLUDED.end_date;

INSERT INTO public.club_schedules (id, club_id, weekday, time_start, time_end, room, start_date, end_date, created_at)
VALUES ('slot_8782258_a8051', 'c_e8395b0_a8051', 4, '10:00', '12:00', 'Faollar zali', '2026-09-17', '2027-06-27', '2026-09-28T11:15:54.577Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  weekday = EXCLUDED.weekday,
  time_start = EXCLUDED.time_start,
  time_end = EXCLUDED.time_end,
  room = EXCLUDED.room,
  start_date = EXCLUDED.start_date,
  end_date = EXCLUDED.end_date;

INSERT INTO public.club_schedules (id, club_id, weekday, time_start, time_end, room, start_date, end_date, created_at)
VALUES ('slot_e78354c_caa15', 'c_45a70b4_caa15', 5, '13:00', '14:00', 'Ochiq osmon astida', '2026-09-18', '2027-06-27', '2026-09-28T13:03:07.797Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  weekday = EXCLUDED.weekday,
  time_start = EXCLUDED.time_start,
  time_end = EXCLUDED.time_end,
  room = EXCLUDED.room,
  start_date = EXCLUDED.start_date,
  end_date = EXCLUDED.end_date;

INSERT INTO public.club_schedules (id, club_id, weekday, time_start, time_end, room, start_date, end_date, created_at)
VALUES ('slot_4025c1a_5f358', 'c_ba9f925_5f358', 3, '13:00', '15:00', '5-etaj', '2026-09-21', '2027-06-26', '2026-09-29T08:44:10.968Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  weekday = EXCLUDED.weekday,
  time_start = EXCLUDED.time_start,
  time_end = EXCLUDED.time_end,
  room = EXCLUDED.room,
  start_date = EXCLUDED.start_date,
  end_date = EXCLUDED.end_date;

INSERT INTO public.club_schedules (id, club_id, weekday, time_start, time_end, room, start_date, end_date, created_at)
VALUES ('slot_75a10e1_ac270', 'c_f780955_ac270', 2, '13:00', '14:00', '119-xona', '2026-09-29', '2027-06-26', '2026-09-29T09:06:54.704Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  weekday = EXCLUDED.weekday,
  time_start = EXCLUDED.time_start,
  time_end = EXCLUDED.time_end,
  room = EXCLUDED.room,
  start_date = EXCLUDED.start_date,
  end_date = EXCLUDED.end_date;

INSERT INTO public.club_schedules (id, club_id, weekday, time_start, time_end, room, start_date, end_date, created_at)
VALUES ('slot_df39588_87e2d', 'c_f501c2b_87e2b', 3, '16:00', '16:30', 'bo''sh xonada', '2026-09-16', '2027-06-08', '2026-09-29T10:14:20.461Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  weekday = EXCLUDED.weekday,
  time_start = EXCLUDED.time_start,
  time_end = EXCLUDED.time_end,
  room = EXCLUDED.room,
  start_date = EXCLUDED.start_date,
  end_date = EXCLUDED.end_date;

INSERT INTO public.club_schedules (id, club_id, weekday, time_start, time_end, room, start_date, end_date, created_at)
VALUES ('slot_b2d3d71_d667c', 'c_66437f6_d667b', 1, '06:30', '08:30', 'Onlayn', '2026-09-07', '2027-06-28', '2026-09-29T10:19:42.076Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  weekday = EXCLUDED.weekday,
  time_start = EXCLUDED.time_start,
  time_end = EXCLUDED.time_end,
  room = EXCLUDED.room,
  start_date = EXCLUDED.start_date,
  end_date = EXCLUDED.end_date;

INSERT INTO public.club_schedules (id, club_id, weekday, time_start, time_end, room, start_date, end_date, created_at)
VALUES ('slot_8e42e01_93613', 'c_3049351_93612', 3, '16:00', '17:00', 'ARM', '2026-09-29', '2027-06-26', '2026-09-29T11:25:01.843Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  weekday = EXCLUDED.weekday,
  time_start = EXCLUDED.time_start,
  time_end = EXCLUDED.time_end,
  room = EXCLUDED.room,
  start_date = EXCLUDED.start_date,
  end_date = EXCLUDED.end_date;

INSERT INTO public.club_schedules (id, club_id, weekday, time_start, time_end, room, start_date, end_date, created_at)
VALUES ('slot_a998ce9_ec1f4', 'c_11525bb_ec1f4', 5, '10:00', '11:30', 'onlayn', '2026-09-29', '2027-06-26', '2026-09-29T11:48:33.908Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  weekday = EXCLUDED.weekday,
  time_start = EXCLUDED.time_start,
  time_end = EXCLUDED.time_end,
  room = EXCLUDED.room,
  start_date = EXCLUDED.start_date,
  end_date = EXCLUDED.end_date;

INSERT INTO public.club_schedules (id, club_id, weekday, time_start, time_end, room, start_date, end_date, created_at)
VALUES ('slot_ef1836b_bf799', 'c_2086a8b_bf799', 2, '13:00', '14:00', '403-auditoriya', '2026-09-22', '2027-06-29', '2026-09-30T04:56:37.017Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  weekday = EXCLUDED.weekday,
  time_start = EXCLUDED.time_start,
  time_end = EXCLUDED.time_end,
  room = EXCLUDED.room,
  start_date = EXCLUDED.start_date,
  end_date = EXCLUDED.end_date;

INSERT INTO public.club_schedules (id, club_id, weekday, time_start, time_end, room, start_date, end_date, created_at)
VALUES ('slot_4fd75b2_cf2c8', 'c_cb90143_cf2c7', 2, '14:20', '16:20', 'Ikkita fakultet sport zali', '2026-09-14', '2027-06-26', '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  weekday = EXCLUDED.weekday,
  time_start = EXCLUDED.time_start,
  time_end = EXCLUDED.time_end,
  room = EXCLUDED.room,
  start_date = EXCLUDED.start_date,
  end_date = EXCLUDED.end_date;

INSERT INTO public.club_schedules (id, club_id, weekday, time_start, time_end, room, start_date, end_date, created_at)
VALUES ('slot_82631aa_cf2c8', 'c_cb90143_cf2c7', 3, '14:20', '16:20', 'Ikkita fakultet sport zali', '2026-09-14', '2027-06-26', '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  weekday = EXCLUDED.weekday,
  time_start = EXCLUDED.time_start,
  time_end = EXCLUDED.time_end,
  room = EXCLUDED.room,
  start_date = EXCLUDED.start_date,
  end_date = EXCLUDED.end_date;

INSERT INTO public.club_schedules (id, club_id, weekday, time_start, time_end, room, start_date, end_date, created_at)
VALUES ('slot_34a2814_15a21', 'c_d1019f6_15a21', 4, '11:00', '12:30', 'bo''sh xonada', '2026-10-08', '2027-06-26', '2026-09-29T13:01:18.241Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  weekday = EXCLUDED.weekday,
  time_start = EXCLUDED.time_start,
  time_end = EXCLUDED.time_end,
  room = EXCLUDED.room,
  start_date = EXCLUDED.start_date,
  end_date = EXCLUDED.end_date;

INSERT INTO public.club_schedules (id, club_id, weekday, time_start, time_end, room, start_date, end_date, created_at)
VALUES ('slot_b186563_c64f5', 'c_23cbc13_c64f4', 4, '11:30', '12:30', '428-auditoriya', '2026-09-17', '2027-06-26', '2026-10-03T08:58:23.349Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  weekday = EXCLUDED.weekday,
  time_start = EXCLUDED.time_start,
  time_end = EXCLUDED.time_end,
  room = EXCLUDED.room,
  start_date = EXCLUDED.start_date,
  end_date = EXCLUDED.end_date;

INSERT INTO public.club_schedules (id, club_id, weekday, time_start, time_end, room, start_date, end_date, created_at)
VALUES ('slot_7b0ed10_ccd46', 'c_33a8bdd_ccd46', 1, '15:00', '16:00', 'Sport zal', '2026-10-07', '2027-06-26', '2026-10-03T09:16:18.630Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  weekday = EXCLUDED.weekday,
  time_start = EXCLUDED.time_start,
  time_end = EXCLUDED.time_end,
  room = EXCLUDED.room,
  start_date = EXCLUDED.start_date,
  end_date = EXCLUDED.end_date;

INSERT INTO public.club_schedules (id, club_id, weekday, time_start, time_end, room, start_date, end_date, created_at)
VALUES ('slot_626d81c_ccd47', 'c_33a8bdd_ccd46', 3, '15:00', '16:00', 'Sport zal', '2026-10-07', '2027-06-26', '2026-10-03T09:16:18.631Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  weekday = EXCLUDED.weekday,
  time_start = EXCLUDED.time_start,
  time_end = EXCLUDED.time_end,
  room = EXCLUDED.room,
  start_date = EXCLUDED.start_date,
  end_date = EXCLUDED.end_date;

INSERT INTO public.club_schedules (id, club_id, weekday, time_start, time_end, room, start_date, end_date, created_at)
VALUES ('slot_698d93a_b26bd', 'c_f702a75_b26bd', 2, '16:00', '17:00', 'TTJ faollar zalida', '2026-10-06', '2027-06-27', '2026-10-03T09:31:59.037Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  weekday = EXCLUDED.weekday,
  time_start = EXCLUDED.time_start,
  time_end = EXCLUDED.time_end,
  room = EXCLUDED.room,
  start_date = EXCLUDED.start_date,
  end_date = EXCLUDED.end_date;

INSERT INTO public.club_schedules (id, club_id, weekday, time_start, time_end, room, start_date, end_date, created_at)
VALUES ('slot_f244b58_d5594', 'c_80a1dc2_d5594', 4, '15:00', '16:00', 'ARM', '2026-09-29', '2027-06-26', '2026-10-03T09:51:50.676Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  weekday = EXCLUDED.weekday,
  time_start = EXCLUDED.time_start,
  time_end = EXCLUDED.time_end,
  room = EXCLUDED.room,
  start_date = EXCLUDED.start_date,
  end_date = EXCLUDED.end_date;

INSERT INTO public.club_schedules (id, club_id, weekday, time_start, time_end, room, start_date, end_date, created_at)
VALUES ('slot_ad5624e_71920', 'c_4190d91_71920', 2, '12:00', '13:00', '506', '2026-09-29', '2027-06-22', '2026-10-05T10:41:02.752Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  weekday = EXCLUDED.weekday,
  time_start = EXCLUDED.time_start,
  time_end = EXCLUDED.time_end,
  room = EXCLUDED.room,
  start_date = EXCLUDED.start_date,
  end_date = EXCLUDED.end_date;

INSERT INTO public.club_schedules (id, club_id, weekday, time_start, time_end, room, start_date, end_date, created_at)
VALUES ('slot_dc91677_65544', 'c_c272675_65543', 2, '12:00', '12:30', 'KARYERA MARKAZIDA', '2026-09-29', '2027-06-26', '2026-10-06T17:32:41.668Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  weekday = EXCLUDED.weekday,
  time_start = EXCLUDED.time_start,
  time_end = EXCLUDED.time_end,
  room = EXCLUDED.room,
  start_date = EXCLUDED.start_date,
  end_date = EXCLUDED.end_date;

-- 3. CLUB MEMBERSHIPS (To'garak a'zoligi)
INSERT INTO public.club_memberships (id, club_id, club_name, student_id, student_name, student_group, tutor_name, student_faculty, phone_or_telegram, status, note, admin_comment, application_file_id, created_at)
VALUES ('m_d74917f_880cd', 'c_ba9f925_5f358', 'Kompyuter Savodxonligi', 'st_9acda7a_880cd', 'Abdusattorova Dilnoza Maxammadjon qizi', 'RUA-AR-24', 'Abdulxamidov Ulug''bek', 'Til va tarjima fakulteti', '+998946332102', 'approved', 'Tel/TG: +998946332102', 'To‘garak rahbari / admin tomonidan kiritildi', NULL, '2026-10-02T06:41:16.493Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  club_name = EXCLUDED.club_name,
  student_id = EXCLUDED.student_id,
  student_name = EXCLUDED.student_name,
  student_group = EXCLUDED.student_group,
  tutor_name = EXCLUDED.tutor_name,
  student_faculty = EXCLUDED.student_faculty,
  phone_or_telegram = EXCLUDED.phone_or_telegram,
  status = EXCLUDED.status,
  note = EXCLUDED.note,
  admin_comment = EXCLUDED.admin_comment;

-- 4. CLUB REPORTS (To'garak hisobotlari)
INSERT INTO public.club_reports (id, club_id, leader_id, title, content, created_at)
VALUES ('rep_1bf6959_94652', 'c_c591d35_45ffe', 'u_4857dcb_146b3', '1-mashg''ulot', 'Birinchi mashg''ulot qo''l harakatlari', '2026-09-28T10:39:37.042Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  leader_id = EXCLUDED.leader_id,
  title = EXCLUDED.title,
  content = EXCLUDED.content;

-- 5. CLUB NOTIFICATIONS (Bildirishnomalar)
INSERT INTO public.club_notifications (id, user_id, title, message, type, read, link_tab, target_role, created_at)
VALUES ('notif_01', 'all', 'Yangi o‘quv yili to‘garaklari ochildi!', 'Is''hoqxon Ibrat nomidagi Namangan davlat chet tillari institutida 5 muhim tashabbus to‘garaklariga a’zo bo‘lish boshlandi.', 'info', TRUE, NULL, NULL, '2026-09-01T08:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET
  user_id = EXCLUDED.user_id,
  title = EXCLUDED.title,
  message = EXCLUDED.message,
  type = EXCLUDED.type,
  read = EXCLUDED.read,
  link_tab = EXCLUDED.link_tab,
  target_role = EXCLUDED.target_role;

INSERT INTO public.club_notifications (id, user_id, title, message, type, read, link_tab, target_role, created_at)
VALUES ('notif_1791307995538_ocwdt', 'students', '📢 Yangi to‘garak tasdiqlandi: «AI START»', 'Institutda yangi «AI START» to‘garagi tasdiqlandi! Mashg‘ulotlar dars jadvaliga muvofiq o‘tkaziladi. Talabalar a’zolik uchun ariza topshirishi mumkin.', 'info', FALSE, 'browse', 'student', '2026-10-06T17:33:15.538Z')
ON CONFLICT (id) DO UPDATE SET
  user_id = EXCLUDED.user_id,
  title = EXCLUDED.title,
  message = EXCLUDED.message,
  type = EXCLUDED.type,
  read = EXCLUDED.read,
  link_tab = EXCLUDED.link_tab,
  target_role = EXCLUDED.target_role;

INSERT INTO public.club_notifications (id, user_id, title, message, type, read, link_tab, target_role, created_at)
VALUES ('notif_1791307995538_2tshq', 'u_317b241_fe6aa', '🎉 To‘garagingiz tasdiqlandi!', 'Tabriklaymiz! Sizning «AI START» to‘garagingiz va nizomi institut Bosh admini (Hamidulla Abdualiyev) tomonidan rasman tasdiqlandi. Endi mashg‘ulotlarni o‘tkazishingiz, dars jadvali bo‘yicha talabalarni qabul qilishingiz mumkin.', 'success', TRUE, 'myClubs', 'leader', '2026-10-06T17:33:15.538Z')
ON CONFLICT (id) DO UPDATE SET
  user_id = EXCLUDED.user_id,
  title = EXCLUDED.title,
  message = EXCLUDED.message,
  type = EXCLUDED.type,
  read = EXCLUDED.read,
  link_tab = EXCLUDED.link_tab,
  target_role = EXCLUDED.target_role;

-- 6. CLUB FILES (Fayl metama'lumotlari)
INSERT INTO public.club_files (id, name, size, type, data, uploaded_at)
VALUES ('f_eebac23_4430e', 'Image_to_PDF_20260925_031447.pdf', 4969623, 'application/pdf', '', '2026-09-25T11:12:27.406Z')
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  size = EXCLUDED.size,
  type = EXCLUDED.type,
  data = CASE WHEN EXCLUDED.data <> '' THEN EXCLUDED.data ELSE public.club_files.data END;

INSERT INTO public.club_files (id, name, size, type, data, uploaded_at)
VALUES ('f_f8bcae3_eb628', 'Oltin mikrofon.pdf', 283974, 'application/pdf', '', '2026-09-25T11:23:52.232Z')
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  size = EXCLUDED.size,
  type = EXCLUDED.type,
  data = CASE WHEN EXCLUDED.data <> '' THEN EXCLUDED.data ELSE public.club_files.data END;

INSERT INTO public.club_files (id, name, size, type, data, uploaded_at)
VALUES ('f_07443d7_2a949', 'photo_2026-09-25_16-27-56.jpg', 49032, 'image/jpeg', '', '2026-09-25T11:28:11.081Z')
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  size = EXCLUDED.size,
  type = EXCLUDED.type,
  data = CASE WHEN EXCLUDED.data <> '' THEN EXCLUDED.data ELSE public.club_files.data END;

INSERT INTO public.club_files (id, name, size, type, data, uploaded_at)
VALUES ('f_5c7d98e_af20f', 'photo_2026-09-25_16-37-03.jpg', 51003, 'image/jpeg', '', '2026-09-25T11:37:13.999Z')
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  size = EXCLUDED.size,
  type = EXCLUDED.type,
  data = CASE WHEN EXCLUDED.data <> '' THEN EXCLUDED.data ELSE public.club_files.data END;

INSERT INTO public.club_files (id, name, size, type, data, uploaded_at)
VALUES ('f_164e052_e385f', 'photo_2026-09-25_16-37-03.jpg', 51003, 'image/jpeg', '', '2026-09-25T11:40:48.607Z')
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  size = EXCLUDED.size,
  type = EXCLUDED.type,
  data = CASE WHEN EXCLUDED.data <> '' THEN EXCLUDED.data ELSE public.club_files.data END;

INSERT INTO public.club_files (id, name, size, type, data, uploaded_at)
VALUES ('f_7693fdd_fe878', 'photo_2026-09-25_16-42-16.jpg', 58737, 'image/jpeg', '', '2026-09-25T11:42:39.224Z')
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  size = EXCLUDED.size,
  type = EXCLUDED.type,
  data = CASE WHEN EXCLUDED.data <> '' THEN EXCLUDED.data ELSE public.club_files.data END;

INSERT INTO public.club_files (id, name, size, type, data, uploaded_at)
VALUES ('f_647b509_28990', 'Image_to_PDF_20260925_031447.pdf', 4969623, 'application/pdf', '', '2026-09-27T07:44:26.512Z')
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  size = EXCLUDED.size,
  type = EXCLUDED.type,
  data = CASE WHEN EXCLUDED.data <> '' THEN EXCLUDED.data ELSE public.club_files.data END;

INSERT INTO public.club_files (id, name, size, type, data, uploaded_at)
VALUES ('f_b664664_97931', 'Image_to_PDF_20260925_031447.pdf', 4969623, 'application/pdf', '', '2026-09-27T07:52:01.073Z')
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  size = EXCLUDED.size,
  type = EXCLUDED.type,
  data = CASE WHEN EXCLUDED.data <> '' THEN EXCLUDED.data ELSE public.club_files.data END;

INSERT INTO public.club_files (id, name, size, type, data, uploaded_at)
VALUES ('f_35980d8_1506a', 'Image_to_PDF_20260925_031447.pdf', 4969623, 'application/pdf', '', '2026-09-28T17:12:52.586Z')
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  size = EXCLUDED.size,
  type = EXCLUDED.type,
  data = CASE WHEN EXCLUDED.data <> '' THEN EXCLUDED.data ELSE public.club_files.data END;

INSERT INTO public.club_files (id, name, size, type, data, uploaded_at)
VALUES ('f_f1830f0_34d51', 'IMG_20260929_133500_829.pdf', 471291, 'application/pdf', '', '2026-09-29T08:41:17.393Z')
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  size = EXCLUDED.size,
  type = EXCLUDED.type,
  data = CASE WHEN EXCLUDED.data <> '' THEN EXCLUDED.data ELSE public.club_files.data END;

INSERT INTO public.club_files (id, name, size, type, data, uploaded_at)
VALUES ('f_7409389_4c1d9', 'Stol tennisi M.Nematullayev.pdf', 4339638, 'application/pdf', '', '2026-09-26T09:56:08.793Z')
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  size = EXCLUDED.size,
  type = EXCLUDED.type,
  data = CASE WHEN EXCLUDED.data <> '' THEN EXCLUDED.data ELSE public.club_files.data END;

INSERT INTO public.club_files (id, name, size, type, data, uploaded_at)
VALUES ('f_75970b3_dc5ab', 'Yosh kitobxon nizomi.PDF', 2043975, 'application/pdf', '', '2026-09-26T11:15:53.899Z')
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  size = EXCLUDED.size,
  type = EXCLUDED.type,
  data = CASE WHEN EXCLUDED.data <> '' THEN EXCLUDED.data ELSE public.club_files.data END;

INSERT INTO public.club_files (id, name, size, type, data, uploaded_at)
VALUES ('f_ffce6a9_45f92', 'Raqs sehri N.Shavkatbekova.pdf', 3023151, 'application/pdf', '', '2026-09-28T10:34:15.826Z')
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  size = EXCLUDED.size,
  type = EXCLUDED.type,
  data = CASE WHEN EXCLUDED.data <> '' THEN EXCLUDED.data ELSE public.club_files.data END;

INSERT INTO public.club_files (id, name, size, type, data, uploaded_at)
VALUES ('f_1e6d81d_56d90', 'Mohir qo''llar.pdf', 464727, 'application/pdf', '', '2026-09-28T10:52:53.520Z')
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  size = EXCLUDED.size,
  type = EXCLUDED.type,
  data = CASE WHEN EXCLUDED.data <> '' THEN EXCLUDED.data ELSE public.club_files.data END;

INSERT INTO public.club_files (id, name, size, type, data, uploaded_at)
VALUES ('f_9a232a0_5e286', 'Raqs va qo''shiq M.Anvarova.pdf', 2117040, 'application/pdf', '', '2026-09-28T11:10:52.038Z')
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  size = EXCLUDED.size,
  type = EXCLUDED.type,
  data = CASE WHEN EXCLUDED.data <> '' THEN EXCLUDED.data ELSE public.club_files.data END;

INSERT INTO public.club_files (id, name, size, type, data, uploaded_at)
VALUES ('f_066ff73_a7fa8', 'Raqs va qo''shiq M.Anvarova.pdf', 2117040, 'application/pdf', '', '2026-09-28T11:15:54.408Z')
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  size = EXCLUDED.size,
  type = EXCLUDED.type,
  data = CASE WHEN EXCLUDED.data <> '' THEN EXCLUDED.data ELSE public.club_files.data END;

INSERT INTO public.club_files (id, name, size, type, data, uploaded_at)
VALUES ('f_3c76424_c1b26', 'Oltin mikrofon Egamberdiyeva Gulzoda.pdf', 283974, 'application/pdf', '', '2026-09-28T12:27:34.054Z')
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  size = EXCLUDED.size,
  type = EXCLUDED.type,
  data = CASE WHEN EXCLUDED.data <> '' THEN EXCLUDED.data ELSE public.club_files.data END;

INSERT INTO public.club_files (id, name, size, type, data, uploaded_at)
VALUES ('f_961609f_02f45', 'AI start N.Sotvoldiyeva.pdf', 4969623, 'application/pdf', '', '2026-09-28T12:32:01.350Z')
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  size = EXCLUDED.size,
  type = EXCLUDED.type,
  data = CASE WHEN EXCLUDED.data <> '' THEN EXCLUDED.data ELSE public.club_files.data END;

INSERT INTO public.club_files (id, name, size, type, data, uploaded_at)
VALUES ('f_5f9048c_9ddfd', 'Student gerlis club Zilola.pdf', 531879, 'application/pdf', '', '2026-09-28T12:42:35.901Z')
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  size = EXCLUDED.size,
  type = EXCLUDED.type,
  data = CASE WHEN EXCLUDED.data <> '' THEN EXCLUDED.data ELSE public.club_files.data END;

INSERT INTO public.club_files (id, name, size, type, data, uploaded_at)
VALUES ('f_0f279b5_ca91c', 'rassomchilik klubi nizomi M.Muhammadjonova.pdf', 1859448, 'application/pdf', '', '2026-09-28T13:03:07.548Z')
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  size = EXCLUDED.size,
  type = EXCLUDED.type,
  data = CASE WHEN EXCLUDED.data <> '' THEN EXCLUDED.data ELSE public.club_files.data END;

INSERT INTO public.club_files (id, name, size, type, data, uploaded_at)
VALUES ('f_bd8c4e8_5f2f1', 'IMG_20260929_133500_829.pdf', 471291, 'application/pdf', '', '2026-09-29T08:44:10.865Z')
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  size = EXCLUDED.size,
  type = EXCLUDED.type,
  data = CASE WHEN EXCLUDED.data <> '' THEN EXCLUDED.data ELSE public.club_files.data END;

INSERT INTO public.club_files (id, name, size, type, data, uploaded_at)
VALUES ('f_f2d0ab2_ac1d9', 'Document 134.pdf', 574692, 'application/pdf', '', '2026-09-29T09:06:54.553Z')
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  size = EXCLUDED.size,
  type = EXCLUDED.type,
  data = CASE WHEN EXCLUDED.data <> '' THEN EXCLUDED.data ELSE public.club_files.data END;

INSERT INTO public.club_files (id, name, size, type, data, uploaded_at)
VALUES ('f_f0b0d18_d661c', 'Oltin mikrofon Egamberdiyeva Gulzoda.pdf', 283974, 'application/pdf', '', '2026-09-29T10:19:41.980Z')
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  size = EXCLUDED.size,
  type = EXCLUDED.type,
  data = CASE WHEN EXCLUDED.data <> '' THEN EXCLUDED.data ELSE public.club_files.data END;

INSERT INTO public.club_files (id, name, size, type, data, uploaded_at)
VALUES ('f_f01bc83_18fa7', 'Image_to_PDF_20260925_031447.pdf', 4969623, 'application/pdf', '', '2026-09-29T10:24:14.759Z')
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  size = EXCLUDED.size,
  type = EXCLUDED.type,
  data = CASE WHEN EXCLUDED.data <> '' THEN EXCLUDED.data ELSE public.club_files.data END;

INSERT INTO public.club_files (id, name, size, type, data, uploaded_at)
VALUES ('f_b2d2fad_934c0', 'book club .pdf', 5511144, 'application/pdf', '', '2026-09-29T11:25:01.504Z')
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  size = EXCLUDED.size,
  type = EXCLUDED.type,
  data = CASE WHEN EXCLUDED.data <> '' THEN EXCLUDED.data ELSE public.club_files.data END;

INSERT INTO public.club_files (id, name, size, type, data, uploaded_at)
VALUES ('f_bcea959_ec19d', 'Image_to_PDF_20260929_044248.pdf', 899358, 'application/pdf', '', '2026-09-29T11:48:33.821Z')
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  size = EXCLUDED.size,
  type = EXCLUDED.type,
  data = CASE WHEN EXCLUDED.data <> '' THEN EXCLUDED.data ELSE public.club_files.data END;

INSERT INTO public.club_files (id, name, size, type, data, uploaded_at)
VALUES ('f_c800215_bf733', 'Ibrat flowers academy R.Valijonova.pdf', 497145, 'application/pdf', '', '2026-09-30T04:56:36.915Z')
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  size = EXCLUDED.size,
  type = EXCLUDED.type,
  data = CASE WHEN EXCLUDED.data <> '' THEN EXCLUDED.data ELSE public.club_files.data END;

INSERT INTO public.club_files (id, name, size, type, data, uploaded_at)
VALUES ('f_b03948e_a9e78', 'Nafisa_Sotiboldiyeva_CV.pdf', 1203669, 'application/pdf', '', '2026-09-24T05:01:52.120Z')
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  size = EXCLUDED.size,
  type = EXCLUDED.type,
  data = CASE WHEN EXCLUDED.data <> '' THEN EXCLUDED.data ELSE public.club_files.data END;

INSERT INTO public.club_files (id, name, size, type, data, uploaded_at)
VALUES ('f_b17a291_0fd9e', 'Nafisa_Sotiboldiyeva_CV.pdf', 1203669, 'application/pdf', '', '2026-09-24T12:43:12.670Z')
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  size = EXCLUDED.size,
  type = EXCLUDED.type,
  data = CASE WHEN EXCLUDED.data <> '' THEN EXCLUDED.data ELSE public.club_files.data END;

INSERT INTO public.club_files (id, name, size, type, data, uploaded_at)
VALUES ('f_920b538_d8de8', 'Nafisa_Sotiboldiyeva_CV.pdf', 1203669, 'application/pdf', '', '2026-09-24T13:14:24.616Z')
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  size = EXCLUDED.size,
  type = EXCLUDED.type,
  data = CASE WHEN EXCLUDED.data <> '' THEN EXCLUDED.data ELSE public.club_files.data END;

INSERT INTO public.club_files (id, name, size, type, data, uploaded_at)
VALUES ('f_85ab6df_cf255', 'Voleybol to''garagi M.Abdufattoyeva.pdf', 505233, 'application/pdf', '', '2026-10-03T06:21:42.357Z')
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  size = EXCLUDED.size,
  type = EXCLUDED.type,
  data = CASE WHEN EXCLUDED.data <> '' THEN EXCLUDED.data ELSE public.club_files.data END;

INSERT INTO public.club_files (id, name, size, type, data, uploaded_at)
VALUES ('f_dd2f588_15989', 'Image_to_PDF_20260929_055745.pdf', 723399, 'application/pdf', '', '2026-09-29T13:01:18.089Z')
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  size = EXCLUDED.size,
  type = EXCLUDED.type,
  data = CASE WHEN EXCLUDED.data <> '' THEN EXCLUDED.data ELSE public.club_files.data END;

INSERT INTO public.club_files (id, name, size, type, data, uploaded_at)
VALUES ('f_6b6e075_5d70e', '1702.pdf', 531879, 'application/pdf', '', '2026-10-02T15:40:07.822Z')
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  size = EXCLUDED.size,
  type = EXCLUDED.type,
  data = CASE WHEN EXCLUDED.data <> '' THEN EXCLUDED.data ELSE public.club_files.data END;

INSERT INTO public.club_files (id, name, size, type, data, uploaded_at)
VALUES ('f_17773b2_c641f', 'Student gerlis club Zilola.pdf', 531879, 'application/pdf', '', '2026-10-03T08:58:23.135Z')
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  size = EXCLUDED.size,
  type = EXCLUDED.type,
  data = CASE WHEN EXCLUDED.data <> '' THEN EXCLUDED.data ELSE public.club_files.data END;

INSERT INTO public.club_files (id, name, size, type, data, uploaded_at)
VALUES ('f_c774a8e_ccc4d', 'stol tennisi F.Mahamadaminov.pdf', 2615208, 'application/pdf', '', '2026-10-03T09:16:18.381Z')
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  size = EXCLUDED.size,
  type = EXCLUDED.type,
  data = CASE WHEN EXCLUDED.data <> '' THEN EXCLUDED.data ELSE public.club_files.data END;

INSERT INTO public.club_files (id, name, size, type, data, uploaded_at)
VALUES ('f_1dfa3d1_b258b', 'Rus tili so''zlashuvi N.Mahmudjonova.pdf', 2104422, 'application/pdf', '', '2026-10-03T09:31:58.732Z')
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  size = EXCLUDED.size,
  type = EXCLUDED.type,
  data = CASE WHEN EXCLUDED.data <> '' THEN EXCLUDED.data ELSE public.club_files.data END;

INSERT INTO public.club_files (id, name, size, type, data, uploaded_at)
VALUES ('f_5ea05a5_d5459', 'Manfaatli mutolaa R.Tursinmatova.pdf', 395541, 'application/pdf', '', '2026-10-03T09:51:50.361Z')
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  size = EXCLUDED.size,
  type = EXCLUDED.type,
  data = CASE WHEN EXCLUDED.data <> '' THEN EXCLUDED.data ELSE public.club_files.data END;

INSERT INTO public.club_files (id, name, size, type, data, uploaded_at)
VALUES ('f_7bc4ee3_718ec', 'Volshebniye ruki M.Nasriddinova.pdf', 389412, 'application/pdf', '', '2026-10-05T10:41:02.700Z')
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  size = EXCLUDED.size,
  type = EXCLUDED.type,
  data = CASE WHEN EXCLUDED.data <> '' THEN EXCLUDED.data ELSE public.club_files.data END;

INSERT INTO public.club_files (id, name, size, type, data, uploaded_at)
VALUES ('f_e14e594_098c7', 'Image_to_PDF_20260925_031447.pdf', 4969623, 'application/pdf', '', '2026-10-06T17:26:25.735Z')
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  size = EXCLUDED.size,
  type = EXCLUDED.type,
  data = CASE WHEN EXCLUDED.data <> '' THEN EXCLUDED.data ELSE public.club_files.data END;

INSERT INTO public.club_files (id, name, size, type, data, uploaded_at)
VALUES ('f_ef56ace_6530d', 'Image_to_PDF_20260925_031447.pdf', 4969623, 'application/pdf', '', '2026-10-06T17:32:41.101Z')
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  size = EXCLUDED.size,
  type = EXCLUDED.type,
  data = CASE WHEN EXCLUDED.data <> '' THEN EXCLUDED.data ELSE public.club_files.data END;

-- 7. CLUB SESSIONS (956 ta to'garak mashg'ulotlari)
INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_d5031a5_4c20f_1', 'c_1945175_4c20f', 'slot_d5031a5_4c20f', 'Stol tennisi: 1-amaliy mashg‘ulot', '2026-09-15', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_d5031a5_4c20f_2', 'c_1945175_4c20f', 'slot_d5031a5_4c20f', 'Stol tennisi: 2-amaliy mashg‘ulot', '2026-09-22', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_d5031a5_4c20f_3', 'c_1945175_4c20f', 'slot_d5031a5_4c20f', 'Stol tennisi: 3-amaliy mashg‘ulot', '2026-09-29', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_d5031a5_4c20f_4', 'c_1945175_4c20f', 'slot_d5031a5_4c20f', 'Stol tennisi: 4-amaliy mashg‘ulot', '2026-10-06', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_d5031a5_4c20f_5', 'c_1945175_4c20f', 'slot_d5031a5_4c20f', 'Stol tennisi: 5-amaliy mashg‘ulot', '2026-10-13', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_d5031a5_4c20f_6', 'c_1945175_4c20f', 'slot_d5031a5_4c20f', 'Stol tennisi: 6-amaliy mashg‘ulot', '2026-10-20', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_d5031a5_4c20f_7', 'c_1945175_4c20f', 'slot_d5031a5_4c20f', 'Stol tennisi: 7-amaliy mashg‘ulot', '2026-10-27', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_d5031a5_4c20f_8', 'c_1945175_4c20f', 'slot_d5031a5_4c20f', 'Stol tennisi: 8-amaliy mashg‘ulot', '2026-11-03', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_d5031a5_4c20f_9', 'c_1945175_4c20f', 'slot_d5031a5_4c20f', 'Stol tennisi: 9-amaliy mashg‘ulot', '2026-11-10', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_d5031a5_4c20f_10', 'c_1945175_4c20f', 'slot_d5031a5_4c20f', 'Stol tennisi: 10-amaliy mashg‘ulot', '2026-11-17', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_d5031a5_4c20f_11', 'c_1945175_4c20f', 'slot_d5031a5_4c20f', 'Stol tennisi: 11-amaliy mashg‘ulot', '2026-11-24', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_d5031a5_4c20f_12', 'c_1945175_4c20f', 'slot_d5031a5_4c20f', 'Stol tennisi: 12-amaliy mashg‘ulot', '2026-12-01', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_d5031a5_4c20f_13', 'c_1945175_4c20f', 'slot_d5031a5_4c20f', 'Stol tennisi: 13-amaliy mashg‘ulot', '2026-12-08', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_d5031a5_4c20f_14', 'c_1945175_4c20f', 'slot_d5031a5_4c20f', 'Stol tennisi: 14-amaliy mashg‘ulot', '2026-12-15', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_d5031a5_4c20f_15', 'c_1945175_4c20f', 'slot_d5031a5_4c20f', 'Stol tennisi: 15-amaliy mashg‘ulot', '2026-12-22', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_d5031a5_4c20f_16', 'c_1945175_4c20f', 'slot_d5031a5_4c20f', 'Stol tennisi: 16-amaliy mashg‘ulot', '2026-12-29', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_d5031a5_4c20f_17', 'c_1945175_4c20f', 'slot_d5031a5_4c20f', 'Stol tennisi: 17-amaliy mashg‘ulot', '2027-01-05', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_d5031a5_4c20f_18', 'c_1945175_4c20f', 'slot_d5031a5_4c20f', 'Stol tennisi: 18-amaliy mashg‘ulot', '2027-01-12', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_d5031a5_4c20f_19', 'c_1945175_4c20f', 'slot_d5031a5_4c20f', 'Stol tennisi: 19-amaliy mashg‘ulot', '2027-01-19', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_d5031a5_4c20f_20', 'c_1945175_4c20f', 'slot_d5031a5_4c20f', 'Stol tennisi: 20-amaliy mashg‘ulot', '2027-01-26', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_d5031a5_4c20f_21', 'c_1945175_4c20f', 'slot_d5031a5_4c20f', 'Stol tennisi: 21-amaliy mashg‘ulot', '2027-02-02', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_d5031a5_4c20f_22', 'c_1945175_4c20f', 'slot_d5031a5_4c20f', 'Stol tennisi: 22-amaliy mashg‘ulot', '2027-02-09', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_d5031a5_4c20f_23', 'c_1945175_4c20f', 'slot_d5031a5_4c20f', 'Stol tennisi: 23-amaliy mashg‘ulot', '2027-02-16', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_d5031a5_4c20f_24', 'c_1945175_4c20f', 'slot_d5031a5_4c20f', 'Stol tennisi: 24-amaliy mashg‘ulot', '2027-02-23', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_d5031a5_4c20f_25', 'c_1945175_4c20f', 'slot_d5031a5_4c20f', 'Stol tennisi: 25-amaliy mashg‘ulot', '2027-03-02', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_d5031a5_4c20f_26', 'c_1945175_4c20f', 'slot_d5031a5_4c20f', 'Stol tennisi: 26-amaliy mashg‘ulot', '2027-03-09', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_d5031a5_4c20f_27', 'c_1945175_4c20f', 'slot_d5031a5_4c20f', 'Stol tennisi: 27-amaliy mashg‘ulot', '2027-03-16', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_d5031a5_4c20f_28', 'c_1945175_4c20f', 'slot_d5031a5_4c20f', 'Stol tennisi: 28-amaliy mashg‘ulot', '2027-03-23', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_d5031a5_4c20f_29', 'c_1945175_4c20f', 'slot_d5031a5_4c20f', 'Stol tennisi: 29-amaliy mashg‘ulot', '2027-03-30', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_d5031a5_4c20f_30', 'c_1945175_4c20f', 'slot_d5031a5_4c20f', 'Stol tennisi: 30-amaliy mashg‘ulot', '2027-04-06', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_d5031a5_4c20f_31', 'c_1945175_4c20f', 'slot_d5031a5_4c20f', 'Stol tennisi: 31-amaliy mashg‘ulot', '2027-04-13', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_d5031a5_4c20f_32', 'c_1945175_4c20f', 'slot_d5031a5_4c20f', 'Stol tennisi: 32-amaliy mashg‘ulot', '2027-04-20', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_d5031a5_4c20f_33', 'c_1945175_4c20f', 'slot_d5031a5_4c20f', 'Stol tennisi: 33-amaliy mashg‘ulot', '2027-04-27', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_d5031a5_4c20f_34', 'c_1945175_4c20f', 'slot_d5031a5_4c20f', 'Stol tennisi: 34-amaliy mashg‘ulot', '2027-05-04', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_d5031a5_4c20f_35', 'c_1945175_4c20f', 'slot_d5031a5_4c20f', 'Stol tennisi: 35-amaliy mashg‘ulot', '2027-05-11', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_d5031a5_4c20f_36', 'c_1945175_4c20f', 'slot_d5031a5_4c20f', 'Stol tennisi: 36-amaliy mashg‘ulot', '2027-05-18', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_d5031a5_4c20f_37', 'c_1945175_4c20f', 'slot_d5031a5_4c20f', 'Stol tennisi: 37-amaliy mashg‘ulot', '2027-05-25', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_d5031a5_4c20f_38', 'c_1945175_4c20f', 'slot_d5031a5_4c20f', 'Stol tennisi: 38-amaliy mashg‘ulot', '2027-06-01', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_d5031a5_4c20f_39', 'c_1945175_4c20f', 'slot_d5031a5_4c20f', 'Stol tennisi: 39-amaliy mashg‘ulot', '2027-06-08', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_d5031a5_4c20f_40', 'c_1945175_4c20f', 'slot_d5031a5_4c20f', 'Stol tennisi: 40-amaliy mashg‘ulot', '2027-06-15', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_d5031a5_4c20f_41', 'c_1945175_4c20f', 'slot_d5031a5_4c20f', 'Stol tennisi: 41-amaliy mashg‘ulot', '2027-06-22', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_11edcfa_4c20f_1', 'c_1945175_4c20f', 'slot_11edcfa_4c20f', 'Stol tennisi: 1-amaliy mashg‘ulot', '2026-09-17', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_11edcfa_4c20f_2', 'c_1945175_4c20f', 'slot_11edcfa_4c20f', 'Stol tennisi: 2-amaliy mashg‘ulot', '2026-09-24', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_11edcfa_4c20f_3', 'c_1945175_4c20f', 'slot_11edcfa_4c20f', 'Stol tennisi: 3-amaliy mashg‘ulot', '2026-10-01', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_11edcfa_4c20f_4', 'c_1945175_4c20f', 'slot_11edcfa_4c20f', 'Stol tennisi: 4-amaliy mashg‘ulot', '2026-10-08', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_11edcfa_4c20f_5', 'c_1945175_4c20f', 'slot_11edcfa_4c20f', 'Stol tennisi: 5-amaliy mashg‘ulot', '2026-10-15', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_11edcfa_4c20f_6', 'c_1945175_4c20f', 'slot_11edcfa_4c20f', 'Stol tennisi: 6-amaliy mashg‘ulot', '2026-10-22', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_11edcfa_4c20f_7', 'c_1945175_4c20f', 'slot_11edcfa_4c20f', 'Stol tennisi: 7-amaliy mashg‘ulot', '2026-10-29', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_11edcfa_4c20f_8', 'c_1945175_4c20f', 'slot_11edcfa_4c20f', 'Stol tennisi: 8-amaliy mashg‘ulot', '2026-11-05', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_11edcfa_4c20f_9', 'c_1945175_4c20f', 'slot_11edcfa_4c20f', 'Stol tennisi: 9-amaliy mashg‘ulot', '2026-11-12', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_11edcfa_4c20f_10', 'c_1945175_4c20f', 'slot_11edcfa_4c20f', 'Stol tennisi: 10-amaliy mashg‘ulot', '2026-11-19', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_11edcfa_4c20f_11', 'c_1945175_4c20f', 'slot_11edcfa_4c20f', 'Stol tennisi: 11-amaliy mashg‘ulot', '2026-11-26', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_11edcfa_4c20f_12', 'c_1945175_4c20f', 'slot_11edcfa_4c20f', 'Stol tennisi: 12-amaliy mashg‘ulot', '2026-12-03', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_11edcfa_4c20f_13', 'c_1945175_4c20f', 'slot_11edcfa_4c20f', 'Stol tennisi: 13-amaliy mashg‘ulot', '2026-12-10', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_11edcfa_4c20f_14', 'c_1945175_4c20f', 'slot_11edcfa_4c20f', 'Stol tennisi: 14-amaliy mashg‘ulot', '2026-12-17', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_11edcfa_4c20f_15', 'c_1945175_4c20f', 'slot_11edcfa_4c20f', 'Stol tennisi: 15-amaliy mashg‘ulot', '2026-12-24', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_11edcfa_4c20f_16', 'c_1945175_4c20f', 'slot_11edcfa_4c20f', 'Stol tennisi: 16-amaliy mashg‘ulot', '2026-12-31', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_11edcfa_4c20f_17', 'c_1945175_4c20f', 'slot_11edcfa_4c20f', 'Stol tennisi: 17-amaliy mashg‘ulot', '2027-01-07', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_11edcfa_4c20f_18', 'c_1945175_4c20f', 'slot_11edcfa_4c20f', 'Stol tennisi: 18-amaliy mashg‘ulot', '2027-01-14', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_11edcfa_4c20f_19', 'c_1945175_4c20f', 'slot_11edcfa_4c20f', 'Stol tennisi: 19-amaliy mashg‘ulot', '2027-01-21', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_11edcfa_4c20f_20', 'c_1945175_4c20f', 'slot_11edcfa_4c20f', 'Stol tennisi: 20-amaliy mashg‘ulot', '2027-01-28', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_11edcfa_4c20f_21', 'c_1945175_4c20f', 'slot_11edcfa_4c20f', 'Stol tennisi: 21-amaliy mashg‘ulot', '2027-02-04', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_11edcfa_4c20f_22', 'c_1945175_4c20f', 'slot_11edcfa_4c20f', 'Stol tennisi: 22-amaliy mashg‘ulot', '2027-02-11', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_11edcfa_4c20f_23', 'c_1945175_4c20f', 'slot_11edcfa_4c20f', 'Stol tennisi: 23-amaliy mashg‘ulot', '2027-02-18', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_11edcfa_4c20f_24', 'c_1945175_4c20f', 'slot_11edcfa_4c20f', 'Stol tennisi: 24-amaliy mashg‘ulot', '2027-02-25', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_11edcfa_4c20f_25', 'c_1945175_4c20f', 'slot_11edcfa_4c20f', 'Stol tennisi: 25-amaliy mashg‘ulot', '2027-03-04', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_11edcfa_4c20f_26', 'c_1945175_4c20f', 'slot_11edcfa_4c20f', 'Stol tennisi: 26-amaliy mashg‘ulot', '2027-03-11', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_11edcfa_4c20f_27', 'c_1945175_4c20f', 'slot_11edcfa_4c20f', 'Stol tennisi: 27-amaliy mashg‘ulot', '2027-03-18', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_11edcfa_4c20f_28', 'c_1945175_4c20f', 'slot_11edcfa_4c20f', 'Stol tennisi: 28-amaliy mashg‘ulot', '2027-03-25', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_11edcfa_4c20f_29', 'c_1945175_4c20f', 'slot_11edcfa_4c20f', 'Stol tennisi: 29-amaliy mashg‘ulot', '2027-04-01', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_11edcfa_4c20f_30', 'c_1945175_4c20f', 'slot_11edcfa_4c20f', 'Stol tennisi: 30-amaliy mashg‘ulot', '2027-04-08', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_11edcfa_4c20f_31', 'c_1945175_4c20f', 'slot_11edcfa_4c20f', 'Stol tennisi: 31-amaliy mashg‘ulot', '2027-04-15', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_11edcfa_4c20f_32', 'c_1945175_4c20f', 'slot_11edcfa_4c20f', 'Stol tennisi: 32-amaliy mashg‘ulot', '2027-04-22', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_11edcfa_4c20f_33', 'c_1945175_4c20f', 'slot_11edcfa_4c20f', 'Stol tennisi: 33-amaliy mashg‘ulot', '2027-04-29', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_11edcfa_4c20f_34', 'c_1945175_4c20f', 'slot_11edcfa_4c20f', 'Stol tennisi: 34-amaliy mashg‘ulot', '2027-05-06', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_11edcfa_4c20f_35', 'c_1945175_4c20f', 'slot_11edcfa_4c20f', 'Stol tennisi: 35-amaliy mashg‘ulot', '2027-05-13', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_11edcfa_4c20f_36', 'c_1945175_4c20f', 'slot_11edcfa_4c20f', 'Stol tennisi: 36-amaliy mashg‘ulot', '2027-05-20', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_11edcfa_4c20f_37', 'c_1945175_4c20f', 'slot_11edcfa_4c20f', 'Stol tennisi: 37-amaliy mashg‘ulot', '2027-05-27', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_11edcfa_4c20f_38', 'c_1945175_4c20f', 'slot_11edcfa_4c20f', 'Stol tennisi: 38-amaliy mashg‘ulot', '2027-06-03', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_11edcfa_4c20f_39', 'c_1945175_4c20f', 'slot_11edcfa_4c20f', 'Stol tennisi: 39-amaliy mashg‘ulot', '2027-06-10', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_11edcfa_4c20f_40', 'c_1945175_4c20f', 'slot_11edcfa_4c20f', 'Stol tennisi: 40-amaliy mashg‘ulot', '2027-06-17', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_11edcfa_4c20f_41', 'c_1945175_4c20f', 'slot_11edcfa_4c20f', 'Stol tennisi: 41-amaliy mashg‘ulot', '2027-06-24', '16:00', '18:00', 'Yangi bino sport zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T09:56:08.847Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7480125_dc63a_1', 'c_89f1306_dc63a', 'slot_7480125_dc63a', 'Yosh kitobxon: 1-amaliy mashg‘ulot', '2026-09-22', '15:00', '16:00', 'Yangi binoda joylashgan ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T11:15:54.042Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7480125_dc63a_2', 'c_89f1306_dc63a', 'slot_7480125_dc63a', 'Yosh kitobxon: 2-amaliy mashg‘ulot', '2026-09-29', '15:00', '16:00', 'Yangi binoda joylashgan ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T11:15:54.042Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7480125_dc63a_3', 'c_89f1306_dc63a', 'slot_7480125_dc63a', 'Yosh kitobxon: 3-amaliy mashg‘ulot', '2026-10-06', '15:00', '16:00', 'Yangi binoda joylashgan ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T11:15:54.042Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7480125_dc63a_4', 'c_89f1306_dc63a', 'slot_7480125_dc63a', 'Yosh kitobxon: 4-amaliy mashg‘ulot', '2026-10-13', '15:00', '16:00', 'Yangi binoda joylashgan ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T11:15:54.042Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7480125_dc63a_5', 'c_89f1306_dc63a', 'slot_7480125_dc63a', 'Yosh kitobxon: 5-amaliy mashg‘ulot', '2026-10-20', '15:00', '16:00', 'Yangi binoda joylashgan ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T11:15:54.042Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7480125_dc63a_6', 'c_89f1306_dc63a', 'slot_7480125_dc63a', 'Yosh kitobxon: 6-amaliy mashg‘ulot', '2026-10-27', '15:00', '16:00', 'Yangi binoda joylashgan ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T11:15:54.042Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7480125_dc63a_7', 'c_89f1306_dc63a', 'slot_7480125_dc63a', 'Yosh kitobxon: 7-amaliy mashg‘ulot', '2026-11-03', '15:00', '16:00', 'Yangi binoda joylashgan ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T11:15:54.042Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7480125_dc63a_8', 'c_89f1306_dc63a', 'slot_7480125_dc63a', 'Yosh kitobxon: 8-amaliy mashg‘ulot', '2026-11-10', '15:00', '16:00', 'Yangi binoda joylashgan ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T11:15:54.042Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7480125_dc63a_9', 'c_89f1306_dc63a', 'slot_7480125_dc63a', 'Yosh kitobxon: 9-amaliy mashg‘ulot', '2026-11-17', '15:00', '16:00', 'Yangi binoda joylashgan ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T11:15:54.042Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7480125_dc63a_10', 'c_89f1306_dc63a', 'slot_7480125_dc63a', 'Yosh kitobxon: 10-amaliy mashg‘ulot', '2026-11-24', '15:00', '16:00', 'Yangi binoda joylashgan ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T11:15:54.042Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7480125_dc63a_11', 'c_89f1306_dc63a', 'slot_7480125_dc63a', 'Yosh kitobxon: 11-amaliy mashg‘ulot', '2026-12-01', '15:00', '16:00', 'Yangi binoda joylashgan ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T11:15:54.042Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7480125_dc63a_12', 'c_89f1306_dc63a', 'slot_7480125_dc63a', 'Yosh kitobxon: 12-amaliy mashg‘ulot', '2026-12-08', '15:00', '16:00', 'Yangi binoda joylashgan ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T11:15:54.042Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7480125_dc63a_13', 'c_89f1306_dc63a', 'slot_7480125_dc63a', 'Yosh kitobxon: 13-amaliy mashg‘ulot', '2026-12-15', '15:00', '16:00', 'Yangi binoda joylashgan ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T11:15:54.042Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7480125_dc63a_14', 'c_89f1306_dc63a', 'slot_7480125_dc63a', 'Yosh kitobxon: 14-amaliy mashg‘ulot', '2026-12-22', '15:00', '16:00', 'Yangi binoda joylashgan ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T11:15:54.042Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7480125_dc63a_15', 'c_89f1306_dc63a', 'slot_7480125_dc63a', 'Yosh kitobxon: 15-amaliy mashg‘ulot', '2026-12-29', '15:00', '16:00', 'Yangi binoda joylashgan ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T11:15:54.042Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7480125_dc63a_16', 'c_89f1306_dc63a', 'slot_7480125_dc63a', 'Yosh kitobxon: 16-amaliy mashg‘ulot', '2027-01-05', '15:00', '16:00', 'Yangi binoda joylashgan ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T11:15:54.042Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7480125_dc63a_17', 'c_89f1306_dc63a', 'slot_7480125_dc63a', 'Yosh kitobxon: 17-amaliy mashg‘ulot', '2027-01-12', '15:00', '16:00', 'Yangi binoda joylashgan ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T11:15:54.042Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7480125_dc63a_18', 'c_89f1306_dc63a', 'slot_7480125_dc63a', 'Yosh kitobxon: 18-amaliy mashg‘ulot', '2027-01-19', '15:00', '16:00', 'Yangi binoda joylashgan ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T11:15:54.042Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7480125_dc63a_19', 'c_89f1306_dc63a', 'slot_7480125_dc63a', 'Yosh kitobxon: 19-amaliy mashg‘ulot', '2027-01-26', '15:00', '16:00', 'Yangi binoda joylashgan ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T11:15:54.042Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7480125_dc63a_20', 'c_89f1306_dc63a', 'slot_7480125_dc63a', 'Yosh kitobxon: 20-amaliy mashg‘ulot', '2027-02-02', '15:00', '16:00', 'Yangi binoda joylashgan ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T11:15:54.042Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7480125_dc63a_21', 'c_89f1306_dc63a', 'slot_7480125_dc63a', 'Yosh kitobxon: 21-amaliy mashg‘ulot', '2027-02-09', '15:00', '16:00', 'Yangi binoda joylashgan ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T11:15:54.042Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7480125_dc63a_22', 'c_89f1306_dc63a', 'slot_7480125_dc63a', 'Yosh kitobxon: 22-amaliy mashg‘ulot', '2027-02-16', '15:00', '16:00', 'Yangi binoda joylashgan ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T11:15:54.042Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7480125_dc63a_23', 'c_89f1306_dc63a', 'slot_7480125_dc63a', 'Yosh kitobxon: 23-amaliy mashg‘ulot', '2027-02-23', '15:00', '16:00', 'Yangi binoda joylashgan ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T11:15:54.042Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7480125_dc63a_24', 'c_89f1306_dc63a', 'slot_7480125_dc63a', 'Yosh kitobxon: 24-amaliy mashg‘ulot', '2027-03-02', '15:00', '16:00', 'Yangi binoda joylashgan ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T11:15:54.042Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7480125_dc63a_25', 'c_89f1306_dc63a', 'slot_7480125_dc63a', 'Yosh kitobxon: 25-amaliy mashg‘ulot', '2027-03-09', '15:00', '16:00', 'Yangi binoda joylashgan ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T11:15:54.042Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7480125_dc63a_26', 'c_89f1306_dc63a', 'slot_7480125_dc63a', 'Yosh kitobxon: 26-amaliy mashg‘ulot', '2027-03-16', '15:00', '16:00', 'Yangi binoda joylashgan ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T11:15:54.042Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7480125_dc63a_27', 'c_89f1306_dc63a', 'slot_7480125_dc63a', 'Yosh kitobxon: 27-amaliy mashg‘ulot', '2027-03-23', '15:00', '16:00', 'Yangi binoda joylashgan ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T11:15:54.042Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7480125_dc63a_28', 'c_89f1306_dc63a', 'slot_7480125_dc63a', 'Yosh kitobxon: 28-amaliy mashg‘ulot', '2027-03-30', '15:00', '16:00', 'Yangi binoda joylashgan ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T11:15:54.042Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7480125_dc63a_29', 'c_89f1306_dc63a', 'slot_7480125_dc63a', 'Yosh kitobxon: 29-amaliy mashg‘ulot', '2027-04-06', '15:00', '16:00', 'Yangi binoda joylashgan ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T11:15:54.042Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7480125_dc63a_30', 'c_89f1306_dc63a', 'slot_7480125_dc63a', 'Yosh kitobxon: 30-amaliy mashg‘ulot', '2027-04-13', '15:00', '16:00', 'Yangi binoda joylashgan ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T11:15:54.042Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7480125_dc63a_31', 'c_89f1306_dc63a', 'slot_7480125_dc63a', 'Yosh kitobxon: 31-amaliy mashg‘ulot', '2027-04-20', '15:00', '16:00', 'Yangi binoda joylashgan ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T11:15:54.042Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7480125_dc63a_32', 'c_89f1306_dc63a', 'slot_7480125_dc63a', 'Yosh kitobxon: 32-amaliy mashg‘ulot', '2027-04-27', '15:00', '16:00', 'Yangi binoda joylashgan ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T11:15:54.042Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7480125_dc63a_33', 'c_89f1306_dc63a', 'slot_7480125_dc63a', 'Yosh kitobxon: 33-amaliy mashg‘ulot', '2027-05-04', '15:00', '16:00', 'Yangi binoda joylashgan ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T11:15:54.042Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7480125_dc63a_34', 'c_89f1306_dc63a', 'slot_7480125_dc63a', 'Yosh kitobxon: 34-amaliy mashg‘ulot', '2027-05-11', '15:00', '16:00', 'Yangi binoda joylashgan ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T11:15:54.042Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7480125_dc63a_35', 'c_89f1306_dc63a', 'slot_7480125_dc63a', 'Yosh kitobxon: 35-amaliy mashg‘ulot', '2027-05-18', '15:00', '16:00', 'Yangi binoda joylashgan ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T11:15:54.042Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7480125_dc63a_36', 'c_89f1306_dc63a', 'slot_7480125_dc63a', 'Yosh kitobxon: 36-amaliy mashg‘ulot', '2027-05-25', '15:00', '16:00', 'Yangi binoda joylashgan ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T11:15:54.042Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7480125_dc63a_37', 'c_89f1306_dc63a', 'slot_7480125_dc63a', 'Yosh kitobxon: 37-amaliy mashg‘ulot', '2027-06-01', '15:00', '16:00', 'Yangi binoda joylashgan ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T11:15:54.042Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7480125_dc63a_38', 'c_89f1306_dc63a', 'slot_7480125_dc63a', 'Yosh kitobxon: 38-amaliy mashg‘ulot', '2027-06-08', '15:00', '16:00', 'Yangi binoda joylashgan ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T11:15:54.042Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7480125_dc63a_39', 'c_89f1306_dc63a', 'slot_7480125_dc63a', 'Yosh kitobxon: 39-amaliy mashg‘ulot', '2027-06-15', '15:00', '16:00', 'Yangi binoda joylashgan ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T11:15:54.042Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7480125_dc63a_40', 'c_89f1306_dc63a', 'slot_7480125_dc63a', 'Yosh kitobxon: 40-amaliy mashg‘ulot', '2027-06-22', '15:00', '16:00', 'Yangi binoda joylashgan ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-26T11:15:54.042Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8f85605_45ffe_1', 'c_c591d35_45ffe', 'slot_8f85605_45ffe', 'Raqs sehri: 1-amaliy mashg‘ulot', '2026-09-15', '17:30', '18:30', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:34:15.934Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8f85605_45ffe_2', 'c_c591d35_45ffe', 'slot_8f85605_45ffe', 'Raqs sehri: 2-amaliy mashg‘ulot', '2026-09-22', '17:30', '18:30', 'Faollar zali', 'held', 'Talabalar bilan 1 darsimiz quvnoq va zòr kayfiyatda òtdi. Birinchi darsimizda biz qòl harakatlari ustida ishladik', 15, 'Shavkatbekova Nargiza Shavkatovna', NULL, 'https://t.me/namsiflBT/11588?single', '2026-09-29T16:56:18.847Z', '2026-09-28T10:34:15.934Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8f85605_45ffe_3', 'c_c591d35_45ffe', 'slot_8f85605_45ffe', 'Raqs sehri: 3-amaliy mashg‘ulot', '2026-09-29', '17:30', '18:30', 'Faollar zali', 'held', 'Bugungi darsimizda talabalar bilan qòl va oyoq harakatalri ustida ishladik. Dars juda qiziq va mazmunli òtdi', 6, 'Shavkatbekova Nargiza Shavkatovna', NULL, 'https://t.me/namsiflBT/11676?single', '2026-09-29T16:53:53.374Z', '2026-09-28T10:34:15.934Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8f85605_45ffe_4', 'c_c591d35_45ffe', 'slot_8f85605_45ffe', 'Raqs sehri: 4-amaliy mashg‘ulot', '2026-10-06', '17:30', '18:30', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:34:15.934Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8f85605_45ffe_5', 'c_c591d35_45ffe', 'slot_8f85605_45ffe', 'Raqs sehri: 5-amaliy mashg‘ulot', '2026-10-13', '17:30', '18:30', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:34:15.934Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8f85605_45ffe_6', 'c_c591d35_45ffe', 'slot_8f85605_45ffe', 'Raqs sehri: 6-amaliy mashg‘ulot', '2026-10-20', '17:30', '18:30', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:34:15.934Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8f85605_45ffe_7', 'c_c591d35_45ffe', 'slot_8f85605_45ffe', 'Raqs sehri: 7-amaliy mashg‘ulot', '2026-10-27', '17:30', '18:30', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:34:15.934Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8f85605_45ffe_8', 'c_c591d35_45ffe', 'slot_8f85605_45ffe', 'Raqs sehri: 8-amaliy mashg‘ulot', '2026-11-03', '17:30', '18:30', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:34:15.934Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8f85605_45ffe_9', 'c_c591d35_45ffe', 'slot_8f85605_45ffe', 'Raqs sehri: 9-amaliy mashg‘ulot', '2026-11-10', '17:30', '18:30', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:34:15.934Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8f85605_45ffe_10', 'c_c591d35_45ffe', 'slot_8f85605_45ffe', 'Raqs sehri: 10-amaliy mashg‘ulot', '2026-11-17', '17:30', '18:30', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:34:15.934Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8f85605_45ffe_11', 'c_c591d35_45ffe', 'slot_8f85605_45ffe', 'Raqs sehri: 11-amaliy mashg‘ulot', '2026-11-24', '17:30', '18:30', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:34:15.934Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8f85605_45ffe_12', 'c_c591d35_45ffe', 'slot_8f85605_45ffe', 'Raqs sehri: 12-amaliy mashg‘ulot', '2026-12-01', '17:30', '18:30', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:34:15.934Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8f85605_45ffe_13', 'c_c591d35_45ffe', 'slot_8f85605_45ffe', 'Raqs sehri: 13-amaliy mashg‘ulot', '2026-12-08', '17:30', '18:30', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:34:15.934Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8f85605_45ffe_14', 'c_c591d35_45ffe', 'slot_8f85605_45ffe', 'Raqs sehri: 14-amaliy mashg‘ulot', '2026-12-15', '17:30', '18:30', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:34:15.934Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8f85605_45ffe_15', 'c_c591d35_45ffe', 'slot_8f85605_45ffe', 'Raqs sehri: 15-amaliy mashg‘ulot', '2026-12-22', '17:30', '18:30', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:34:15.934Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8f85605_45ffe_16', 'c_c591d35_45ffe', 'slot_8f85605_45ffe', 'Raqs sehri: 16-amaliy mashg‘ulot', '2026-12-29', '17:30', '18:30', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:34:15.934Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8f85605_45ffe_17', 'c_c591d35_45ffe', 'slot_8f85605_45ffe', 'Raqs sehri: 17-amaliy mashg‘ulot', '2027-01-05', '17:30', '18:30', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:34:15.934Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8f85605_45ffe_18', 'c_c591d35_45ffe', 'slot_8f85605_45ffe', 'Raqs sehri: 18-amaliy mashg‘ulot', '2027-01-12', '17:30', '18:30', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:34:15.934Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8f85605_45ffe_19', 'c_c591d35_45ffe', 'slot_8f85605_45ffe', 'Raqs sehri: 19-amaliy mashg‘ulot', '2027-01-19', '17:30', '18:30', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:34:15.934Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8f85605_45ffe_20', 'c_c591d35_45ffe', 'slot_8f85605_45ffe', 'Raqs sehri: 20-amaliy mashg‘ulot', '2027-01-26', '17:30', '18:30', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:34:15.934Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8f85605_45ffe_21', 'c_c591d35_45ffe', 'slot_8f85605_45ffe', 'Raqs sehri: 21-amaliy mashg‘ulot', '2027-02-02', '17:30', '18:30', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:34:15.934Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8f85605_45ffe_22', 'c_c591d35_45ffe', 'slot_8f85605_45ffe', 'Raqs sehri: 22-amaliy mashg‘ulot', '2027-02-09', '17:30', '18:30', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:34:15.934Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8f85605_45ffe_23', 'c_c591d35_45ffe', 'slot_8f85605_45ffe', 'Raqs sehri: 23-amaliy mashg‘ulot', '2027-02-16', '17:30', '18:30', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:34:15.934Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8f85605_45ffe_24', 'c_c591d35_45ffe', 'slot_8f85605_45ffe', 'Raqs sehri: 24-amaliy mashg‘ulot', '2027-02-23', '17:30', '18:30', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:34:15.934Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8f85605_45ffe_25', 'c_c591d35_45ffe', 'slot_8f85605_45ffe', 'Raqs sehri: 25-amaliy mashg‘ulot', '2027-03-02', '17:30', '18:30', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:34:15.934Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8f85605_45ffe_26', 'c_c591d35_45ffe', 'slot_8f85605_45ffe', 'Raqs sehri: 26-amaliy mashg‘ulot', '2027-03-09', '17:30', '18:30', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:34:15.934Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8f85605_45ffe_27', 'c_c591d35_45ffe', 'slot_8f85605_45ffe', 'Raqs sehri: 27-amaliy mashg‘ulot', '2027-03-16', '17:30', '18:30', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:34:15.934Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8f85605_45ffe_28', 'c_c591d35_45ffe', 'slot_8f85605_45ffe', 'Raqs sehri: 28-amaliy mashg‘ulot', '2027-03-23', '17:30', '18:30', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:34:15.934Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8f85605_45ffe_29', 'c_c591d35_45ffe', 'slot_8f85605_45ffe', 'Raqs sehri: 29-amaliy mashg‘ulot', '2027-03-30', '17:30', '18:30', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:34:15.934Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8f85605_45ffe_30', 'c_c591d35_45ffe', 'slot_8f85605_45ffe', 'Raqs sehri: 30-amaliy mashg‘ulot', '2027-04-06', '17:30', '18:30', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:34:15.934Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8f85605_45ffe_31', 'c_c591d35_45ffe', 'slot_8f85605_45ffe', 'Raqs sehri: 31-amaliy mashg‘ulot', '2027-04-13', '17:30', '18:30', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:34:15.934Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8f85605_45ffe_32', 'c_c591d35_45ffe', 'slot_8f85605_45ffe', 'Raqs sehri: 32-amaliy mashg‘ulot', '2027-04-20', '17:30', '18:30', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:34:15.934Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8f85605_45ffe_33', 'c_c591d35_45ffe', 'slot_8f85605_45ffe', 'Raqs sehri: 33-amaliy mashg‘ulot', '2027-04-27', '17:30', '18:30', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:34:15.934Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8f85605_45ffe_34', 'c_c591d35_45ffe', 'slot_8f85605_45ffe', 'Raqs sehri: 34-amaliy mashg‘ulot', '2027-05-04', '17:30', '18:30', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:34:15.934Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8f85605_45ffe_35', 'c_c591d35_45ffe', 'slot_8f85605_45ffe', 'Raqs sehri: 35-amaliy mashg‘ulot', '2027-05-11', '17:30', '18:30', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:34:15.934Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8f85605_45ffe_36', 'c_c591d35_45ffe', 'slot_8f85605_45ffe', 'Raqs sehri: 36-amaliy mashg‘ulot', '2027-05-18', '17:30', '18:30', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:34:15.934Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8f85605_45ffe_37', 'c_c591d35_45ffe', 'slot_8f85605_45ffe', 'Raqs sehri: 37-amaliy mashg‘ulot', '2027-05-25', '17:30', '18:30', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:34:15.934Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8f85605_45ffe_38', 'c_c591d35_45ffe', 'slot_8f85605_45ffe', 'Raqs sehri: 38-amaliy mashg‘ulot', '2027-06-01', '17:30', '18:30', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:34:15.934Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8f85605_45ffe_39', 'c_c591d35_45ffe', 'slot_8f85605_45ffe', 'Raqs sehri: 39-amaliy mashg‘ulot', '2027-06-08', '17:30', '18:30', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:34:15.934Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8f85605_45ffe_40', 'c_c591d35_45ffe', 'slot_8f85605_45ffe', 'Raqs sehri: 40-amaliy mashg‘ulot', '2027-06-15', '17:30', '18:30', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:34:15.934Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8f85605_45ffe_41', 'c_c591d35_45ffe', 'slot_8f85605_45ffe', 'Raqs sehri: 41-amaliy mashg‘ulot', '2027-06-22', '17:30', '18:30', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:34:15.934Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7256d62_56e08_1', 'c_82f768d_56e08', 'slot_7256d62_56e08', 'Mohir qo''llar: 1-amaliy mashg‘ulot', '2026-09-15', '11:00', '13:00', 'Yangi bino 335-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:52:53.640Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7256d62_56e08_2', 'c_82f768d_56e08', 'slot_7256d62_56e08', 'Mohir qo''llar: 2-amaliy mashg‘ulot', '2026-09-22', '11:00', '13:00', 'Yangi bino 335-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:52:53.640Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7256d62_56e08_3', 'c_82f768d_56e08', 'slot_7256d62_56e08', 'Mohir qo''llar: 3-amaliy mashg‘ulot', '2026-09-29', '11:00', '13:00', 'Yangi bino 335-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:52:53.640Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7256d62_56e08_4', 'c_82f768d_56e08', 'slot_7256d62_56e08', 'Mohir qo''llar: 4-amaliy mashg‘ulot', '2026-10-06', '11:00', '13:00', 'Yangi bino 335-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:52:53.640Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7256d62_56e08_5', 'c_82f768d_56e08', 'slot_7256d62_56e08', 'Mohir qo''llar: 5-amaliy mashg‘ulot', '2026-10-13', '11:00', '13:00', 'Yangi bino 335-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:52:53.640Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7256d62_56e08_6', 'c_82f768d_56e08', 'slot_7256d62_56e08', 'Mohir qo''llar: 6-amaliy mashg‘ulot', '2026-10-20', '11:00', '13:00', 'Yangi bino 335-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:52:53.640Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7256d62_56e08_7', 'c_82f768d_56e08', 'slot_7256d62_56e08', 'Mohir qo''llar: 7-amaliy mashg‘ulot', '2026-10-27', '11:00', '13:00', 'Yangi bino 335-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:52:53.640Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7256d62_56e08_8', 'c_82f768d_56e08', 'slot_7256d62_56e08', 'Mohir qo''llar: 8-amaliy mashg‘ulot', '2026-11-03', '11:00', '13:00', 'Yangi bino 335-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:52:53.640Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7256d62_56e08_9', 'c_82f768d_56e08', 'slot_7256d62_56e08', 'Mohir qo''llar: 9-amaliy mashg‘ulot', '2026-11-10', '11:00', '13:00', 'Yangi bino 335-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:52:53.640Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7256d62_56e08_10', 'c_82f768d_56e08', 'slot_7256d62_56e08', 'Mohir qo''llar: 10-amaliy mashg‘ulot', '2026-11-17', '11:00', '13:00', 'Yangi bino 335-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:52:53.640Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7256d62_56e08_11', 'c_82f768d_56e08', 'slot_7256d62_56e08', 'Mohir qo''llar: 11-amaliy mashg‘ulot', '2026-11-24', '11:00', '13:00', 'Yangi bino 335-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:52:53.640Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7256d62_56e08_12', 'c_82f768d_56e08', 'slot_7256d62_56e08', 'Mohir qo''llar: 12-amaliy mashg‘ulot', '2026-12-01', '11:00', '13:00', 'Yangi bino 335-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:52:53.640Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7256d62_56e08_13', 'c_82f768d_56e08', 'slot_7256d62_56e08', 'Mohir qo''llar: 13-amaliy mashg‘ulot', '2026-12-08', '11:00', '13:00', 'Yangi bino 335-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:52:53.640Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7256d62_56e08_14', 'c_82f768d_56e08', 'slot_7256d62_56e08', 'Mohir qo''llar: 14-amaliy mashg‘ulot', '2026-12-15', '11:00', '13:00', 'Yangi bino 335-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:52:53.640Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7256d62_56e08_15', 'c_82f768d_56e08', 'slot_7256d62_56e08', 'Mohir qo''llar: 15-amaliy mashg‘ulot', '2026-12-22', '11:00', '13:00', 'Yangi bino 335-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:52:53.640Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7256d62_56e08_16', 'c_82f768d_56e08', 'slot_7256d62_56e08', 'Mohir qo''llar: 16-amaliy mashg‘ulot', '2026-12-29', '11:00', '13:00', 'Yangi bino 335-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:52:53.640Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7256d62_56e08_17', 'c_82f768d_56e08', 'slot_7256d62_56e08', 'Mohir qo''llar: 17-amaliy mashg‘ulot', '2027-01-05', '11:00', '13:00', 'Yangi bino 335-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:52:53.640Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7256d62_56e08_18', 'c_82f768d_56e08', 'slot_7256d62_56e08', 'Mohir qo''llar: 18-amaliy mashg‘ulot', '2027-01-12', '11:00', '13:00', 'Yangi bino 335-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:52:53.640Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7256d62_56e08_19', 'c_82f768d_56e08', 'slot_7256d62_56e08', 'Mohir qo''llar: 19-amaliy mashg‘ulot', '2027-01-19', '11:00', '13:00', 'Yangi bino 335-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:52:53.640Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7256d62_56e08_20', 'c_82f768d_56e08', 'slot_7256d62_56e08', 'Mohir qo''llar: 20-amaliy mashg‘ulot', '2027-01-26', '11:00', '13:00', 'Yangi bino 335-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:52:53.640Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7256d62_56e08_21', 'c_82f768d_56e08', 'slot_7256d62_56e08', 'Mohir qo''llar: 21-amaliy mashg‘ulot', '2027-02-02', '11:00', '13:00', 'Yangi bino 335-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:52:53.640Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7256d62_56e08_22', 'c_82f768d_56e08', 'slot_7256d62_56e08', 'Mohir qo''llar: 22-amaliy mashg‘ulot', '2027-02-09', '11:00', '13:00', 'Yangi bino 335-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:52:53.640Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7256d62_56e08_23', 'c_82f768d_56e08', 'slot_7256d62_56e08', 'Mohir qo''llar: 23-amaliy mashg‘ulot', '2027-02-16', '11:00', '13:00', 'Yangi bino 335-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:52:53.640Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7256d62_56e08_24', 'c_82f768d_56e08', 'slot_7256d62_56e08', 'Mohir qo''llar: 24-amaliy mashg‘ulot', '2027-02-23', '11:00', '13:00', 'Yangi bino 335-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:52:53.640Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7256d62_56e08_25', 'c_82f768d_56e08', 'slot_7256d62_56e08', 'Mohir qo''llar: 25-amaliy mashg‘ulot', '2027-03-02', '11:00', '13:00', 'Yangi bino 335-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:52:53.640Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7256d62_56e08_26', 'c_82f768d_56e08', 'slot_7256d62_56e08', 'Mohir qo''llar: 26-amaliy mashg‘ulot', '2027-03-09', '11:00', '13:00', 'Yangi bino 335-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:52:53.640Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7256d62_56e08_27', 'c_82f768d_56e08', 'slot_7256d62_56e08', 'Mohir qo''llar: 27-amaliy mashg‘ulot', '2027-03-16', '11:00', '13:00', 'Yangi bino 335-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:52:53.640Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7256d62_56e08_28', 'c_82f768d_56e08', 'slot_7256d62_56e08', 'Mohir qo''llar: 28-amaliy mashg‘ulot', '2027-03-23', '11:00', '13:00', 'Yangi bino 335-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:52:53.640Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7256d62_56e08_29', 'c_82f768d_56e08', 'slot_7256d62_56e08', 'Mohir qo''llar: 29-amaliy mashg‘ulot', '2027-03-30', '11:00', '13:00', 'Yangi bino 335-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:52:53.640Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7256d62_56e08_30', 'c_82f768d_56e08', 'slot_7256d62_56e08', 'Mohir qo''llar: 30-amaliy mashg‘ulot', '2027-04-06', '11:00', '13:00', 'Yangi bino 335-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:52:53.640Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7256d62_56e08_31', 'c_82f768d_56e08', 'slot_7256d62_56e08', 'Mohir qo''llar: 31-amaliy mashg‘ulot', '2027-04-13', '11:00', '13:00', 'Yangi bino 335-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:52:53.640Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7256d62_56e08_32', 'c_82f768d_56e08', 'slot_7256d62_56e08', 'Mohir qo''llar: 32-amaliy mashg‘ulot', '2027-04-20', '11:00', '13:00', 'Yangi bino 335-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:52:53.640Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7256d62_56e08_33', 'c_82f768d_56e08', 'slot_7256d62_56e08', 'Mohir qo''llar: 33-amaliy mashg‘ulot', '2027-04-27', '11:00', '13:00', 'Yangi bino 335-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:52:53.640Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7256d62_56e08_34', 'c_82f768d_56e08', 'slot_7256d62_56e08', 'Mohir qo''llar: 34-amaliy mashg‘ulot', '2027-05-04', '11:00', '13:00', 'Yangi bino 335-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:52:53.640Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7256d62_56e08_35', 'c_82f768d_56e08', 'slot_7256d62_56e08', 'Mohir qo''llar: 35-amaliy mashg‘ulot', '2027-05-11', '11:00', '13:00', 'Yangi bino 335-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:52:53.640Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7256d62_56e08_36', 'c_82f768d_56e08', 'slot_7256d62_56e08', 'Mohir qo''llar: 36-amaliy mashg‘ulot', '2027-05-18', '11:00', '13:00', 'Yangi bino 335-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:52:53.640Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7256d62_56e08_37', 'c_82f768d_56e08', 'slot_7256d62_56e08', 'Mohir qo''llar: 37-amaliy mashg‘ulot', '2027-05-25', '11:00', '13:00', 'Yangi bino 335-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:52:53.640Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7256d62_56e08_38', 'c_82f768d_56e08', 'slot_7256d62_56e08', 'Mohir qo''llar: 38-amaliy mashg‘ulot', '2027-06-01', '11:00', '13:00', 'Yangi bino 335-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:52:53.640Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7256d62_56e08_39', 'c_82f768d_56e08', 'slot_7256d62_56e08', 'Mohir qo''llar: 39-amaliy mashg‘ulot', '2027-06-08', '11:00', '13:00', 'Yangi bino 335-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:52:53.640Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7256d62_56e08_40', 'c_82f768d_56e08', 'slot_7256d62_56e08', 'Mohir qo''llar: 40-amaliy mashg‘ulot', '2027-06-15', '11:00', '13:00', 'Yangi bino 335-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:52:53.640Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7256d62_56e08_41', 'c_82f768d_56e08', 'slot_7256d62_56e08', 'Mohir qo''llar: 41-amaliy mashg‘ulot', '2027-06-22', '11:00', '13:00', 'Yangi bino 335-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T10:52:53.640Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8782258_a8051_1', 'c_e8395b0_a8051', 'slot_8782258_a8051', 'Raqs va qo''shiq: 1-amaliy mashg‘ulot', '2026-09-17', '10:00', '12:00', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T11:15:54.577Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8782258_a8051_2', 'c_e8395b0_a8051', 'slot_8782258_a8051', 'Raqs va qo''shiq: 2-amaliy mashg‘ulot', '2026-09-24', '10:00', '12:00', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T11:15:54.577Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8782258_a8051_3', 'c_e8395b0_a8051', 'slot_8782258_a8051', 'Raqs va qo''shiq: 3-amaliy mashg‘ulot', '2026-10-01', '10:00', '12:00', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T11:15:54.577Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8782258_a8051_4', 'c_e8395b0_a8051', 'slot_8782258_a8051', 'Raqs va qo''shiq: 4-amaliy mashg‘ulot', '2026-10-08', '10:00', '12:00', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T11:15:54.577Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8782258_a8051_5', 'c_e8395b0_a8051', 'slot_8782258_a8051', 'Raqs va qo''shiq: 5-amaliy mashg‘ulot', '2026-10-15', '10:00', '12:00', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T11:15:54.577Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8782258_a8051_6', 'c_e8395b0_a8051', 'slot_8782258_a8051', 'Raqs va qo''shiq: 6-amaliy mashg‘ulot', '2026-10-22', '10:00', '12:00', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T11:15:54.577Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8782258_a8051_7', 'c_e8395b0_a8051', 'slot_8782258_a8051', 'Raqs va qo''shiq: 7-amaliy mashg‘ulot', '2026-10-29', '10:00', '12:00', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T11:15:54.577Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8782258_a8051_8', 'c_e8395b0_a8051', 'slot_8782258_a8051', 'Raqs va qo''shiq: 8-amaliy mashg‘ulot', '2026-11-05', '10:00', '12:00', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T11:15:54.577Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8782258_a8051_9', 'c_e8395b0_a8051', 'slot_8782258_a8051', 'Raqs va qo''shiq: 9-amaliy mashg‘ulot', '2026-11-12', '10:00', '12:00', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T11:15:54.577Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8782258_a8051_10', 'c_e8395b0_a8051', 'slot_8782258_a8051', 'Raqs va qo''shiq: 10-amaliy mashg‘ulot', '2026-11-19', '10:00', '12:00', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T11:15:54.577Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8782258_a8051_11', 'c_e8395b0_a8051', 'slot_8782258_a8051', 'Raqs va qo''shiq: 11-amaliy mashg‘ulot', '2026-11-26', '10:00', '12:00', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T11:15:54.577Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8782258_a8051_12', 'c_e8395b0_a8051', 'slot_8782258_a8051', 'Raqs va qo''shiq: 12-amaliy mashg‘ulot', '2026-12-03', '10:00', '12:00', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T11:15:54.577Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8782258_a8051_13', 'c_e8395b0_a8051', 'slot_8782258_a8051', 'Raqs va qo''shiq: 13-amaliy mashg‘ulot', '2026-12-10', '10:00', '12:00', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T11:15:54.577Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8782258_a8051_14', 'c_e8395b0_a8051', 'slot_8782258_a8051', 'Raqs va qo''shiq: 14-amaliy mashg‘ulot', '2026-12-17', '10:00', '12:00', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T11:15:54.577Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8782258_a8051_15', 'c_e8395b0_a8051', 'slot_8782258_a8051', 'Raqs va qo''shiq: 15-amaliy mashg‘ulot', '2026-12-24', '10:00', '12:00', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T11:15:54.577Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8782258_a8051_16', 'c_e8395b0_a8051', 'slot_8782258_a8051', 'Raqs va qo''shiq: 16-amaliy mashg‘ulot', '2026-12-31', '10:00', '12:00', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T11:15:54.577Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8782258_a8051_17', 'c_e8395b0_a8051', 'slot_8782258_a8051', 'Raqs va qo''shiq: 17-amaliy mashg‘ulot', '2027-01-07', '10:00', '12:00', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T11:15:54.577Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8782258_a8051_18', 'c_e8395b0_a8051', 'slot_8782258_a8051', 'Raqs va qo''shiq: 18-amaliy mashg‘ulot', '2027-01-14', '10:00', '12:00', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T11:15:54.577Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8782258_a8051_19', 'c_e8395b0_a8051', 'slot_8782258_a8051', 'Raqs va qo''shiq: 19-amaliy mashg‘ulot', '2027-01-21', '10:00', '12:00', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T11:15:54.577Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8782258_a8051_20', 'c_e8395b0_a8051', 'slot_8782258_a8051', 'Raqs va qo''shiq: 20-amaliy mashg‘ulot', '2027-01-28', '10:00', '12:00', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T11:15:54.577Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8782258_a8051_21', 'c_e8395b0_a8051', 'slot_8782258_a8051', 'Raqs va qo''shiq: 21-amaliy mashg‘ulot', '2027-02-04', '10:00', '12:00', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T11:15:54.577Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8782258_a8051_22', 'c_e8395b0_a8051', 'slot_8782258_a8051', 'Raqs va qo''shiq: 22-amaliy mashg‘ulot', '2027-02-11', '10:00', '12:00', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T11:15:54.577Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8782258_a8051_23', 'c_e8395b0_a8051', 'slot_8782258_a8051', 'Raqs va qo''shiq: 23-amaliy mashg‘ulot', '2027-02-18', '10:00', '12:00', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T11:15:54.577Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8782258_a8051_24', 'c_e8395b0_a8051', 'slot_8782258_a8051', 'Raqs va qo''shiq: 24-amaliy mashg‘ulot', '2027-02-25', '10:00', '12:00', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T11:15:54.577Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8782258_a8051_25', 'c_e8395b0_a8051', 'slot_8782258_a8051', 'Raqs va qo''shiq: 25-amaliy mashg‘ulot', '2027-03-04', '10:00', '12:00', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T11:15:54.577Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8782258_a8051_26', 'c_e8395b0_a8051', 'slot_8782258_a8051', 'Raqs va qo''shiq: 26-amaliy mashg‘ulot', '2027-03-11', '10:00', '12:00', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T11:15:54.577Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8782258_a8051_27', 'c_e8395b0_a8051', 'slot_8782258_a8051', 'Raqs va qo''shiq: 27-amaliy mashg‘ulot', '2027-03-18', '10:00', '12:00', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T11:15:54.577Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8782258_a8051_28', 'c_e8395b0_a8051', 'slot_8782258_a8051', 'Raqs va qo''shiq: 28-amaliy mashg‘ulot', '2027-03-25', '10:00', '12:00', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T11:15:54.577Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8782258_a8051_29', 'c_e8395b0_a8051', 'slot_8782258_a8051', 'Raqs va qo''shiq: 29-amaliy mashg‘ulot', '2027-04-01', '10:00', '12:00', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T11:15:54.577Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8782258_a8051_30', 'c_e8395b0_a8051', 'slot_8782258_a8051', 'Raqs va qo''shiq: 30-amaliy mashg‘ulot', '2027-04-08', '10:00', '12:00', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T11:15:54.577Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8782258_a8051_31', 'c_e8395b0_a8051', 'slot_8782258_a8051', 'Raqs va qo''shiq: 31-amaliy mashg‘ulot', '2027-04-15', '10:00', '12:00', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T11:15:54.577Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8782258_a8051_32', 'c_e8395b0_a8051', 'slot_8782258_a8051', 'Raqs va qo''shiq: 32-amaliy mashg‘ulot', '2027-04-22', '10:00', '12:00', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T11:15:54.577Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8782258_a8051_33', 'c_e8395b0_a8051', 'slot_8782258_a8051', 'Raqs va qo''shiq: 33-amaliy mashg‘ulot', '2027-04-29', '10:00', '12:00', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T11:15:54.577Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8782258_a8051_34', 'c_e8395b0_a8051', 'slot_8782258_a8051', 'Raqs va qo''shiq: 34-amaliy mashg‘ulot', '2027-05-06', '10:00', '12:00', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T11:15:54.577Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8782258_a8051_35', 'c_e8395b0_a8051', 'slot_8782258_a8051', 'Raqs va qo''shiq: 35-amaliy mashg‘ulot', '2027-05-13', '10:00', '12:00', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T11:15:54.577Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8782258_a8051_36', 'c_e8395b0_a8051', 'slot_8782258_a8051', 'Raqs va qo''shiq: 36-amaliy mashg‘ulot', '2027-05-20', '10:00', '12:00', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T11:15:54.577Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8782258_a8051_37', 'c_e8395b0_a8051', 'slot_8782258_a8051', 'Raqs va qo''shiq: 37-amaliy mashg‘ulot', '2027-05-27', '10:00', '12:00', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T11:15:54.577Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8782258_a8051_38', 'c_e8395b0_a8051', 'slot_8782258_a8051', 'Raqs va qo''shiq: 38-amaliy mashg‘ulot', '2027-06-03', '10:00', '12:00', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T11:15:54.577Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8782258_a8051_39', 'c_e8395b0_a8051', 'slot_8782258_a8051', 'Raqs va qo''shiq: 39-amaliy mashg‘ulot', '2027-06-10', '10:00', '12:00', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T11:15:54.577Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8782258_a8051_40', 'c_e8395b0_a8051', 'slot_8782258_a8051', 'Raqs va qo''shiq: 40-amaliy mashg‘ulot', '2027-06-17', '10:00', '12:00', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T11:15:54.577Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8782258_a8051_41', 'c_e8395b0_a8051', 'slot_8782258_a8051', 'Raqs va qo''shiq: 41-amaliy mashg‘ulot', '2027-06-24', '10:00', '12:00', 'Faollar zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T11:15:54.577Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_e78354c_caa15_1', 'c_45a70b4_caa15', 'slot_e78354c_caa15', 'Rasomchilik klubi: 1-amaliy mashg‘ulot', '2026-09-18', '13:00', '14:00', 'Ochiq osmon astida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T13:03:07.797Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_e78354c_caa15_2', 'c_45a70b4_caa15', 'slot_e78354c_caa15', 'Rasomchilik klubi: 2-amaliy mashg‘ulot', '2026-09-25', '13:00', '14:00', 'Ochiq osmon astida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T13:03:07.797Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_e78354c_caa15_3', 'c_45a70b4_caa15', 'slot_e78354c_caa15', 'Rasomchilik klubi: 3-amaliy mashg‘ulot', '2026-10-02', '13:00', '14:00', 'Ochiq osmon astida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T13:03:07.797Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_e78354c_caa15_4', 'c_45a70b4_caa15', 'slot_e78354c_caa15', 'Rasomchilik klubi: 4-amaliy mashg‘ulot', '2026-10-09', '13:00', '14:00', 'Ochiq osmon astida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T13:03:07.797Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_e78354c_caa15_5', 'c_45a70b4_caa15', 'slot_e78354c_caa15', 'Rasomchilik klubi: 5-amaliy mashg‘ulot', '2026-10-16', '13:00', '14:00', 'Ochiq osmon astida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T13:03:07.797Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_e78354c_caa15_6', 'c_45a70b4_caa15', 'slot_e78354c_caa15', 'Rasomchilik klubi: 6-amaliy mashg‘ulot', '2026-10-23', '13:00', '14:00', 'Ochiq osmon astida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T13:03:07.797Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_e78354c_caa15_7', 'c_45a70b4_caa15', 'slot_e78354c_caa15', 'Rasomchilik klubi: 7-amaliy mashg‘ulot', '2026-10-30', '13:00', '14:00', 'Ochiq osmon astida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T13:03:07.797Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_e78354c_caa15_8', 'c_45a70b4_caa15', 'slot_e78354c_caa15', 'Rasomchilik klubi: 8-amaliy mashg‘ulot', '2026-11-06', '13:00', '14:00', 'Ochiq osmon astida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T13:03:07.797Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_e78354c_caa15_9', 'c_45a70b4_caa15', 'slot_e78354c_caa15', 'Rasomchilik klubi: 9-amaliy mashg‘ulot', '2026-11-13', '13:00', '14:00', 'Ochiq osmon astida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T13:03:07.797Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_e78354c_caa15_10', 'c_45a70b4_caa15', 'slot_e78354c_caa15', 'Rasomchilik klubi: 10-amaliy mashg‘ulot', '2026-11-20', '13:00', '14:00', 'Ochiq osmon astida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T13:03:07.797Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_e78354c_caa15_11', 'c_45a70b4_caa15', 'slot_e78354c_caa15', 'Rasomchilik klubi: 11-amaliy mashg‘ulot', '2026-11-27', '13:00', '14:00', 'Ochiq osmon astida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T13:03:07.797Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_e78354c_caa15_12', 'c_45a70b4_caa15', 'slot_e78354c_caa15', 'Rasomchilik klubi: 12-amaliy mashg‘ulot', '2026-12-04', '13:00', '14:00', 'Ochiq osmon astida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T13:03:07.797Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_e78354c_caa15_13', 'c_45a70b4_caa15', 'slot_e78354c_caa15', 'Rasomchilik klubi: 13-amaliy mashg‘ulot', '2026-12-11', '13:00', '14:00', 'Ochiq osmon astida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T13:03:07.797Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_e78354c_caa15_14', 'c_45a70b4_caa15', 'slot_e78354c_caa15', 'Rasomchilik klubi: 14-amaliy mashg‘ulot', '2026-12-18', '13:00', '14:00', 'Ochiq osmon astida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T13:03:07.797Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_e78354c_caa15_15', 'c_45a70b4_caa15', 'slot_e78354c_caa15', 'Rasomchilik klubi: 15-amaliy mashg‘ulot', '2026-12-25', '13:00', '14:00', 'Ochiq osmon astida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T13:03:07.797Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_e78354c_caa15_16', 'c_45a70b4_caa15', 'slot_e78354c_caa15', 'Rasomchilik klubi: 16-amaliy mashg‘ulot', '2027-01-01', '13:00', '14:00', 'Ochiq osmon astida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T13:03:07.797Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_e78354c_caa15_17', 'c_45a70b4_caa15', 'slot_e78354c_caa15', 'Rasomchilik klubi: 17-amaliy mashg‘ulot', '2027-01-08', '13:00', '14:00', 'Ochiq osmon astida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T13:03:07.797Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_e78354c_caa15_18', 'c_45a70b4_caa15', 'slot_e78354c_caa15', 'Rasomchilik klubi: 18-amaliy mashg‘ulot', '2027-01-15', '13:00', '14:00', 'Ochiq osmon astida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T13:03:07.797Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_e78354c_caa15_19', 'c_45a70b4_caa15', 'slot_e78354c_caa15', 'Rasomchilik klubi: 19-amaliy mashg‘ulot', '2027-01-22', '13:00', '14:00', 'Ochiq osmon astida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T13:03:07.797Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_e78354c_caa15_20', 'c_45a70b4_caa15', 'slot_e78354c_caa15', 'Rasomchilik klubi: 20-amaliy mashg‘ulot', '2027-01-29', '13:00', '14:00', 'Ochiq osmon astida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T13:03:07.797Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_e78354c_caa15_21', 'c_45a70b4_caa15', 'slot_e78354c_caa15', 'Rasomchilik klubi: 21-amaliy mashg‘ulot', '2027-02-05', '13:00', '14:00', 'Ochiq osmon astida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T13:03:07.797Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_e78354c_caa15_22', 'c_45a70b4_caa15', 'slot_e78354c_caa15', 'Rasomchilik klubi: 22-amaliy mashg‘ulot', '2027-02-12', '13:00', '14:00', 'Ochiq osmon astida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T13:03:07.797Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_e78354c_caa15_23', 'c_45a70b4_caa15', 'slot_e78354c_caa15', 'Rasomchilik klubi: 23-amaliy mashg‘ulot', '2027-02-19', '13:00', '14:00', 'Ochiq osmon astida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T13:03:07.797Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_e78354c_caa15_24', 'c_45a70b4_caa15', 'slot_e78354c_caa15', 'Rasomchilik klubi: 24-amaliy mashg‘ulot', '2027-02-26', '13:00', '14:00', 'Ochiq osmon astida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T13:03:07.797Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_e78354c_caa15_25', 'c_45a70b4_caa15', 'slot_e78354c_caa15', 'Rasomchilik klubi: 25-amaliy mashg‘ulot', '2027-03-05', '13:00', '14:00', 'Ochiq osmon astida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T13:03:07.797Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_e78354c_caa15_26', 'c_45a70b4_caa15', 'slot_e78354c_caa15', 'Rasomchilik klubi: 26-amaliy mashg‘ulot', '2027-03-12', '13:00', '14:00', 'Ochiq osmon astida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T13:03:07.797Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_e78354c_caa15_27', 'c_45a70b4_caa15', 'slot_e78354c_caa15', 'Rasomchilik klubi: 27-amaliy mashg‘ulot', '2027-03-19', '13:00', '14:00', 'Ochiq osmon astida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T13:03:07.797Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_e78354c_caa15_28', 'c_45a70b4_caa15', 'slot_e78354c_caa15', 'Rasomchilik klubi: 28-amaliy mashg‘ulot', '2027-03-26', '13:00', '14:00', 'Ochiq osmon astida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T13:03:07.797Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_e78354c_caa15_29', 'c_45a70b4_caa15', 'slot_e78354c_caa15', 'Rasomchilik klubi: 29-amaliy mashg‘ulot', '2027-04-02', '13:00', '14:00', 'Ochiq osmon astida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T13:03:07.797Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_e78354c_caa15_30', 'c_45a70b4_caa15', 'slot_e78354c_caa15', 'Rasomchilik klubi: 30-amaliy mashg‘ulot', '2027-04-09', '13:00', '14:00', 'Ochiq osmon astida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T13:03:07.797Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_e78354c_caa15_31', 'c_45a70b4_caa15', 'slot_e78354c_caa15', 'Rasomchilik klubi: 31-amaliy mashg‘ulot', '2027-04-16', '13:00', '14:00', 'Ochiq osmon astida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T13:03:07.797Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_e78354c_caa15_32', 'c_45a70b4_caa15', 'slot_e78354c_caa15', 'Rasomchilik klubi: 32-amaliy mashg‘ulot', '2027-04-23', '13:00', '14:00', 'Ochiq osmon astida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T13:03:07.797Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_e78354c_caa15_33', 'c_45a70b4_caa15', 'slot_e78354c_caa15', 'Rasomchilik klubi: 33-amaliy mashg‘ulot', '2027-04-30', '13:00', '14:00', 'Ochiq osmon astida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T13:03:07.797Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_e78354c_caa15_34', 'c_45a70b4_caa15', 'slot_e78354c_caa15', 'Rasomchilik klubi: 34-amaliy mashg‘ulot', '2027-05-07', '13:00', '14:00', 'Ochiq osmon astida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T13:03:07.797Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_e78354c_caa15_35', 'c_45a70b4_caa15', 'slot_e78354c_caa15', 'Rasomchilik klubi: 35-amaliy mashg‘ulot', '2027-05-14', '13:00', '14:00', 'Ochiq osmon astida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T13:03:07.797Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_e78354c_caa15_36', 'c_45a70b4_caa15', 'slot_e78354c_caa15', 'Rasomchilik klubi: 36-amaliy mashg‘ulot', '2027-05-21', '13:00', '14:00', 'Ochiq osmon astida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T13:03:07.797Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_e78354c_caa15_37', 'c_45a70b4_caa15', 'slot_e78354c_caa15', 'Rasomchilik klubi: 37-amaliy mashg‘ulot', '2027-05-28', '13:00', '14:00', 'Ochiq osmon astida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T13:03:07.797Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_e78354c_caa15_38', 'c_45a70b4_caa15', 'slot_e78354c_caa15', 'Rasomchilik klubi: 38-amaliy mashg‘ulot', '2027-06-04', '13:00', '14:00', 'Ochiq osmon astida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T13:03:07.797Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_e78354c_caa15_39', 'c_45a70b4_caa15', 'slot_e78354c_caa15', 'Rasomchilik klubi: 39-amaliy mashg‘ulot', '2027-06-11', '13:00', '14:00', 'Ochiq osmon astida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T13:03:07.797Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_e78354c_caa15_40', 'c_45a70b4_caa15', 'slot_e78354c_caa15', 'Rasomchilik klubi: 40-amaliy mashg‘ulot', '2027-06-18', '13:00', '14:00', 'Ochiq osmon astida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T13:03:07.797Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_e78354c_caa15_41', 'c_45a70b4_caa15', 'slot_e78354c_caa15', 'Rasomchilik klubi: 41-amaliy mashg‘ulot', '2027-06-25', '13:00', '14:00', 'Ochiq osmon astida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-28T13:03:07.797Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4025c1a_5f358_1', 'c_ba9f925_5f358', 'slot_4025c1a_5f358', 'Kompyuter Savodxonligi: 1-amaliy mashg‘ulot', '2026-09-23', '13:00', '15:00', '5-etaj', 'held', 'Qaynoq tugmalar', 4, 'Rasuljonova Shaxrizoda', NULL, 'https://t.me/namsiflBT/11736?single', '2026-10-03T02:59:49.956Z', '2026-09-29T08:44:10.968Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4025c1a_5f358_2', 'c_ba9f925_5f358', 'slot_4025c1a_5f358', 'Kompyuter Savodxonligi: 2-amaliy mashg‘ulot', '2026-09-30', '13:00', '15:00', '5-etaj', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T08:44:10.968Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4025c1a_5f358_3', 'c_ba9f925_5f358', 'slot_4025c1a_5f358', 'Kompyuter Savodxonligi: 3-amaliy mashg‘ulot', '2026-10-07', '13:00', '15:00', '5-etaj', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T08:44:10.968Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4025c1a_5f358_4', 'c_ba9f925_5f358', 'slot_4025c1a_5f358', 'Kompyuter Savodxonligi: 4-amaliy mashg‘ulot', '2026-10-14', '13:00', '15:00', '5-etaj', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T08:44:10.968Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4025c1a_5f358_5', 'c_ba9f925_5f358', 'slot_4025c1a_5f358', 'Kompyuter Savodxonligi: 5-amaliy mashg‘ulot', '2026-10-21', '13:00', '15:00', '5-etaj', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T08:44:10.968Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4025c1a_5f358_6', 'c_ba9f925_5f358', 'slot_4025c1a_5f358', 'Kompyuter Savodxonligi: 6-amaliy mashg‘ulot', '2026-10-28', '13:00', '15:00', '5-etaj', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T08:44:10.968Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4025c1a_5f358_7', 'c_ba9f925_5f358', 'slot_4025c1a_5f358', 'Kompyuter Savodxonligi: 7-amaliy mashg‘ulot', '2026-11-04', '13:00', '15:00', '5-etaj', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T08:44:10.968Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4025c1a_5f358_8', 'c_ba9f925_5f358', 'slot_4025c1a_5f358', 'Kompyuter Savodxonligi: 8-amaliy mashg‘ulot', '2026-11-11', '13:00', '15:00', '5-etaj', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T08:44:10.968Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4025c1a_5f358_9', 'c_ba9f925_5f358', 'slot_4025c1a_5f358', 'Kompyuter Savodxonligi: 9-amaliy mashg‘ulot', '2026-11-18', '13:00', '15:00', '5-etaj', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T08:44:10.968Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4025c1a_5f358_10', 'c_ba9f925_5f358', 'slot_4025c1a_5f358', 'Kompyuter Savodxonligi: 10-amaliy mashg‘ulot', '2026-11-25', '13:00', '15:00', '5-etaj', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T08:44:10.968Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4025c1a_5f358_11', 'c_ba9f925_5f358', 'slot_4025c1a_5f358', 'Kompyuter Savodxonligi: 11-amaliy mashg‘ulot', '2026-12-02', '13:00', '15:00', '5-etaj', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T08:44:10.968Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4025c1a_5f358_12', 'c_ba9f925_5f358', 'slot_4025c1a_5f358', 'Kompyuter Savodxonligi: 12-amaliy mashg‘ulot', '2026-12-09', '13:00', '15:00', '5-etaj', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T08:44:10.968Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4025c1a_5f358_13', 'c_ba9f925_5f358', 'slot_4025c1a_5f358', 'Kompyuter Savodxonligi: 13-amaliy mashg‘ulot', '2026-12-16', '13:00', '15:00', '5-etaj', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T08:44:10.968Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4025c1a_5f358_14', 'c_ba9f925_5f358', 'slot_4025c1a_5f358', 'Kompyuter Savodxonligi: 14-amaliy mashg‘ulot', '2026-12-23', '13:00', '15:00', '5-etaj', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T08:44:10.968Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4025c1a_5f358_15', 'c_ba9f925_5f358', 'slot_4025c1a_5f358', 'Kompyuter Savodxonligi: 15-amaliy mashg‘ulot', '2026-12-30', '13:00', '15:00', '5-etaj', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T08:44:10.968Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4025c1a_5f358_16', 'c_ba9f925_5f358', 'slot_4025c1a_5f358', 'Kompyuter Savodxonligi: 16-amaliy mashg‘ulot', '2027-01-06', '13:00', '15:00', '5-etaj', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T08:44:10.968Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4025c1a_5f358_17', 'c_ba9f925_5f358', 'slot_4025c1a_5f358', 'Kompyuter Savodxonligi: 17-amaliy mashg‘ulot', '2027-01-13', '13:00', '15:00', '5-etaj', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T08:44:10.968Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4025c1a_5f358_18', 'c_ba9f925_5f358', 'slot_4025c1a_5f358', 'Kompyuter Savodxonligi: 18-amaliy mashg‘ulot', '2027-01-20', '13:00', '15:00', '5-etaj', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T08:44:10.968Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4025c1a_5f358_19', 'c_ba9f925_5f358', 'slot_4025c1a_5f358', 'Kompyuter Savodxonligi: 19-amaliy mashg‘ulot', '2027-01-27', '13:00', '15:00', '5-etaj', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T08:44:10.968Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4025c1a_5f358_20', 'c_ba9f925_5f358', 'slot_4025c1a_5f358', 'Kompyuter Savodxonligi: 20-amaliy mashg‘ulot', '2027-02-03', '13:00', '15:00', '5-etaj', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T08:44:10.968Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4025c1a_5f358_21', 'c_ba9f925_5f358', 'slot_4025c1a_5f358', 'Kompyuter Savodxonligi: 21-amaliy mashg‘ulot', '2027-02-10', '13:00', '15:00', '5-etaj', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T08:44:10.968Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4025c1a_5f358_22', 'c_ba9f925_5f358', 'slot_4025c1a_5f358', 'Kompyuter Savodxonligi: 22-amaliy mashg‘ulot', '2027-02-17', '13:00', '15:00', '5-etaj', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T08:44:10.968Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4025c1a_5f358_23', 'c_ba9f925_5f358', 'slot_4025c1a_5f358', 'Kompyuter Savodxonligi: 23-amaliy mashg‘ulot', '2027-02-24', '13:00', '15:00', '5-etaj', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T08:44:10.968Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4025c1a_5f358_24', 'c_ba9f925_5f358', 'slot_4025c1a_5f358', 'Kompyuter Savodxonligi: 24-amaliy mashg‘ulot', '2027-03-03', '13:00', '15:00', '5-etaj', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T08:44:10.968Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4025c1a_5f358_25', 'c_ba9f925_5f358', 'slot_4025c1a_5f358', 'Kompyuter Savodxonligi: 25-amaliy mashg‘ulot', '2027-03-10', '13:00', '15:00', '5-etaj', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T08:44:10.968Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4025c1a_5f358_26', 'c_ba9f925_5f358', 'slot_4025c1a_5f358', 'Kompyuter Savodxonligi: 26-amaliy mashg‘ulot', '2027-03-17', '13:00', '15:00', '5-etaj', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T08:44:10.968Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4025c1a_5f358_27', 'c_ba9f925_5f358', 'slot_4025c1a_5f358', 'Kompyuter Savodxonligi: 27-amaliy mashg‘ulot', '2027-03-24', '13:00', '15:00', '5-etaj', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T08:44:10.968Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4025c1a_5f358_28', 'c_ba9f925_5f358', 'slot_4025c1a_5f358', 'Kompyuter Savodxonligi: 28-amaliy mashg‘ulot', '2027-03-31', '13:00', '15:00', '5-etaj', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T08:44:10.968Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4025c1a_5f358_29', 'c_ba9f925_5f358', 'slot_4025c1a_5f358', 'Kompyuter Savodxonligi: 29-amaliy mashg‘ulot', '2027-04-07', '13:00', '15:00', '5-etaj', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T08:44:10.968Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4025c1a_5f358_30', 'c_ba9f925_5f358', 'slot_4025c1a_5f358', 'Kompyuter Savodxonligi: 30-amaliy mashg‘ulot', '2027-04-14', '13:00', '15:00', '5-etaj', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T08:44:10.968Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4025c1a_5f358_31', 'c_ba9f925_5f358', 'slot_4025c1a_5f358', 'Kompyuter Savodxonligi: 31-amaliy mashg‘ulot', '2027-04-21', '13:00', '15:00', '5-etaj', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T08:44:10.968Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4025c1a_5f358_32', 'c_ba9f925_5f358', 'slot_4025c1a_5f358', 'Kompyuter Savodxonligi: 32-amaliy mashg‘ulot', '2027-04-28', '13:00', '15:00', '5-etaj', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T08:44:10.968Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4025c1a_5f358_33', 'c_ba9f925_5f358', 'slot_4025c1a_5f358', 'Kompyuter Savodxonligi: 33-amaliy mashg‘ulot', '2027-05-05', '13:00', '15:00', '5-etaj', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T08:44:10.968Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4025c1a_5f358_34', 'c_ba9f925_5f358', 'slot_4025c1a_5f358', 'Kompyuter Savodxonligi: 34-amaliy mashg‘ulot', '2027-05-12', '13:00', '15:00', '5-etaj', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T08:44:10.968Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4025c1a_5f358_35', 'c_ba9f925_5f358', 'slot_4025c1a_5f358', 'Kompyuter Savodxonligi: 35-amaliy mashg‘ulot', '2027-05-19', '13:00', '15:00', '5-etaj', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T08:44:10.968Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4025c1a_5f358_36', 'c_ba9f925_5f358', 'slot_4025c1a_5f358', 'Kompyuter Savodxonligi: 36-amaliy mashg‘ulot', '2027-05-26', '13:00', '15:00', '5-etaj', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T08:44:10.968Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4025c1a_5f358_37', 'c_ba9f925_5f358', 'slot_4025c1a_5f358', 'Kompyuter Savodxonligi: 37-amaliy mashg‘ulot', '2027-06-02', '13:00', '15:00', '5-etaj', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T08:44:10.968Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4025c1a_5f358_38', 'c_ba9f925_5f358', 'slot_4025c1a_5f358', 'Kompyuter Savodxonligi: 38-amaliy mashg‘ulot', '2027-06-09', '13:00', '15:00', '5-etaj', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T08:44:10.968Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4025c1a_5f358_39', 'c_ba9f925_5f358', 'slot_4025c1a_5f358', 'Kompyuter Savodxonligi: 39-amaliy mashg‘ulot', '2027-06-16', '13:00', '15:00', '5-etaj', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T08:44:10.968Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4025c1a_5f358_40', 'c_ba9f925_5f358', 'slot_4025c1a_5f358', 'Kompyuter Savodxonligi: 40-amaliy mashg‘ulot', '2027-06-23', '13:00', '15:00', '5-etaj', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T08:44:10.968Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_75a10e1_ac270_1', 'c_f780955_ac270', 'slot_75a10e1_ac270', 'Turk tili: 1-amaliy mashg‘ulot', '2026-09-29', '13:00', '14:00', '119-xona', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T09:06:54.704Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_75a10e1_ac270_2', 'c_f780955_ac270', 'slot_75a10e1_ac270', 'Turk tili: 2-amaliy mashg‘ulot', '2026-10-06', '13:00', '14:00', '119-xona', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T09:06:54.704Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_75a10e1_ac270_3', 'c_f780955_ac270', 'slot_75a10e1_ac270', 'Turk tili: 3-amaliy mashg‘ulot', '2026-10-13', '13:00', '14:00', '119-xona', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T09:06:54.704Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_75a10e1_ac270_4', 'c_f780955_ac270', 'slot_75a10e1_ac270', 'Turk tili: 4-amaliy mashg‘ulot', '2026-10-20', '13:00', '14:00', '119-xona', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T09:06:54.704Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_75a10e1_ac270_5', 'c_f780955_ac270', 'slot_75a10e1_ac270', 'Turk tili: 5-amaliy mashg‘ulot', '2026-10-27', '13:00', '14:00', '119-xona', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T09:06:54.704Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_75a10e1_ac270_6', 'c_f780955_ac270', 'slot_75a10e1_ac270', 'Turk tili: 6-amaliy mashg‘ulot', '2026-11-03', '13:00', '14:00', '119-xona', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T09:06:54.704Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_75a10e1_ac270_7', 'c_f780955_ac270', 'slot_75a10e1_ac270', 'Turk tili: 7-amaliy mashg‘ulot', '2026-11-10', '13:00', '14:00', '119-xona', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T09:06:54.704Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_75a10e1_ac270_8', 'c_f780955_ac270', 'slot_75a10e1_ac270', 'Turk tili: 8-amaliy mashg‘ulot', '2026-11-17', '13:00', '14:00', '119-xona', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T09:06:54.704Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_75a10e1_ac270_9', 'c_f780955_ac270', 'slot_75a10e1_ac270', 'Turk tili: 9-amaliy mashg‘ulot', '2026-11-24', '13:00', '14:00', '119-xona', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T09:06:54.704Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_75a10e1_ac270_10', 'c_f780955_ac270', 'slot_75a10e1_ac270', 'Turk tili: 10-amaliy mashg‘ulot', '2026-12-01', '13:00', '14:00', '119-xona', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T09:06:54.704Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_75a10e1_ac270_11', 'c_f780955_ac270', 'slot_75a10e1_ac270', 'Turk tili: 11-amaliy mashg‘ulot', '2026-12-08', '13:00', '14:00', '119-xona', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T09:06:54.704Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_75a10e1_ac270_12', 'c_f780955_ac270', 'slot_75a10e1_ac270', 'Turk tili: 12-amaliy mashg‘ulot', '2026-12-15', '13:00', '14:00', '119-xona', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T09:06:54.704Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_75a10e1_ac270_13', 'c_f780955_ac270', 'slot_75a10e1_ac270', 'Turk tili: 13-amaliy mashg‘ulot', '2026-12-22', '13:00', '14:00', '119-xona', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T09:06:54.704Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_75a10e1_ac270_14', 'c_f780955_ac270', 'slot_75a10e1_ac270', 'Turk tili: 14-amaliy mashg‘ulot', '2026-12-29', '13:00', '14:00', '119-xona', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T09:06:54.704Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_75a10e1_ac270_15', 'c_f780955_ac270', 'slot_75a10e1_ac270', 'Turk tili: 15-amaliy mashg‘ulot', '2027-01-05', '13:00', '14:00', '119-xona', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T09:06:54.704Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_75a10e1_ac270_16', 'c_f780955_ac270', 'slot_75a10e1_ac270', 'Turk tili: 16-amaliy mashg‘ulot', '2027-01-12', '13:00', '14:00', '119-xona', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T09:06:54.704Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_75a10e1_ac270_17', 'c_f780955_ac270', 'slot_75a10e1_ac270', 'Turk tili: 17-amaliy mashg‘ulot', '2027-01-19', '13:00', '14:00', '119-xona', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T09:06:54.704Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_75a10e1_ac270_18', 'c_f780955_ac270', 'slot_75a10e1_ac270', 'Turk tili: 18-amaliy mashg‘ulot', '2027-01-26', '13:00', '14:00', '119-xona', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T09:06:54.704Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_75a10e1_ac270_19', 'c_f780955_ac270', 'slot_75a10e1_ac270', 'Turk tili: 19-amaliy mashg‘ulot', '2027-02-02', '13:00', '14:00', '119-xona', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T09:06:54.704Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_75a10e1_ac270_20', 'c_f780955_ac270', 'slot_75a10e1_ac270', 'Turk tili: 20-amaliy mashg‘ulot', '2027-02-09', '13:00', '14:00', '119-xona', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T09:06:54.704Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_75a10e1_ac270_21', 'c_f780955_ac270', 'slot_75a10e1_ac270', 'Turk tili: 21-amaliy mashg‘ulot', '2027-02-16', '13:00', '14:00', '119-xona', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T09:06:54.704Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_75a10e1_ac270_22', 'c_f780955_ac270', 'slot_75a10e1_ac270', 'Turk tili: 22-amaliy mashg‘ulot', '2027-02-23', '13:00', '14:00', '119-xona', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T09:06:54.704Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_75a10e1_ac270_23', 'c_f780955_ac270', 'slot_75a10e1_ac270', 'Turk tili: 23-amaliy mashg‘ulot', '2027-03-02', '13:00', '14:00', '119-xona', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T09:06:54.704Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_75a10e1_ac270_24', 'c_f780955_ac270', 'slot_75a10e1_ac270', 'Turk tili: 24-amaliy mashg‘ulot', '2027-03-09', '13:00', '14:00', '119-xona', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T09:06:54.704Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_75a10e1_ac270_25', 'c_f780955_ac270', 'slot_75a10e1_ac270', 'Turk tili: 25-amaliy mashg‘ulot', '2027-03-16', '13:00', '14:00', '119-xona', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T09:06:54.704Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_75a10e1_ac270_26', 'c_f780955_ac270', 'slot_75a10e1_ac270', 'Turk tili: 26-amaliy mashg‘ulot', '2027-03-23', '13:00', '14:00', '119-xona', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T09:06:54.704Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_75a10e1_ac270_27', 'c_f780955_ac270', 'slot_75a10e1_ac270', 'Turk tili: 27-amaliy mashg‘ulot', '2027-03-30', '13:00', '14:00', '119-xona', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T09:06:54.704Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_75a10e1_ac270_28', 'c_f780955_ac270', 'slot_75a10e1_ac270', 'Turk tili: 28-amaliy mashg‘ulot', '2027-04-06', '13:00', '14:00', '119-xona', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T09:06:54.704Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_75a10e1_ac270_29', 'c_f780955_ac270', 'slot_75a10e1_ac270', 'Turk tili: 29-amaliy mashg‘ulot', '2027-04-13', '13:00', '14:00', '119-xona', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T09:06:54.704Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_75a10e1_ac270_30', 'c_f780955_ac270', 'slot_75a10e1_ac270', 'Turk tili: 30-amaliy mashg‘ulot', '2027-04-20', '13:00', '14:00', '119-xona', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T09:06:54.704Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_75a10e1_ac270_31', 'c_f780955_ac270', 'slot_75a10e1_ac270', 'Turk tili: 31-amaliy mashg‘ulot', '2027-04-27', '13:00', '14:00', '119-xona', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T09:06:54.704Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_75a10e1_ac270_32', 'c_f780955_ac270', 'slot_75a10e1_ac270', 'Turk tili: 32-amaliy mashg‘ulot', '2027-05-04', '13:00', '14:00', '119-xona', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T09:06:54.704Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_75a10e1_ac270_33', 'c_f780955_ac270', 'slot_75a10e1_ac270', 'Turk tili: 33-amaliy mashg‘ulot', '2027-05-11', '13:00', '14:00', '119-xona', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T09:06:54.704Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_75a10e1_ac270_34', 'c_f780955_ac270', 'slot_75a10e1_ac270', 'Turk tili: 34-amaliy mashg‘ulot', '2027-05-18', '13:00', '14:00', '119-xona', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T09:06:54.704Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_75a10e1_ac270_35', 'c_f780955_ac270', 'slot_75a10e1_ac270', 'Turk tili: 35-amaliy mashg‘ulot', '2027-05-25', '13:00', '14:00', '119-xona', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T09:06:54.704Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_75a10e1_ac270_36', 'c_f780955_ac270', 'slot_75a10e1_ac270', 'Turk tili: 36-amaliy mashg‘ulot', '2027-06-01', '13:00', '14:00', '119-xona', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T09:06:54.704Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_75a10e1_ac270_37', 'c_f780955_ac270', 'slot_75a10e1_ac270', 'Turk tili: 37-amaliy mashg‘ulot', '2027-06-08', '13:00', '14:00', '119-xona', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T09:06:54.704Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_75a10e1_ac270_38', 'c_f780955_ac270', 'slot_75a10e1_ac270', 'Turk tili: 38-amaliy mashg‘ulot', '2027-06-15', '13:00', '14:00', '119-xona', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T09:06:54.704Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_75a10e1_ac270_39', 'c_f780955_ac270', 'slot_75a10e1_ac270', 'Turk tili: 39-amaliy mashg‘ulot', '2027-06-22', '13:00', '14:00', '119-xona', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T09:06:54.704Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_df39588_87e2d_1', 'c_f501c2b_87e2b', 'slot_df39588_87e2d', 'English beyond class: 1-amaliy mashg‘ulot', '2026-09-16', '16:00', '16:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:14:20.461Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_df39588_87e2d_2', 'c_f501c2b_87e2b', 'slot_df39588_87e2d', 'English beyond class: 2-amaliy mashg‘ulot', '2026-09-23', '16:00', '16:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:14:20.461Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_df39588_87e2d_3', 'c_f501c2b_87e2b', 'slot_df39588_87e2d', 'English beyond class: 3-amaliy mashg‘ulot', '2026-09-30', '16:00', '16:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:14:20.461Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_df39588_87e2d_4', 'c_f501c2b_87e2b', 'slot_df39588_87e2d', 'English beyond class: 4-amaliy mashg‘ulot', '2026-10-07', '16:00', '16:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:14:20.461Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_df39588_87e2d_5', 'c_f501c2b_87e2b', 'slot_df39588_87e2d', 'English beyond class: 5-amaliy mashg‘ulot', '2026-10-14', '16:00', '16:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:14:20.461Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_df39588_87e2d_6', 'c_f501c2b_87e2b', 'slot_df39588_87e2d', 'English beyond class: 6-amaliy mashg‘ulot', '2026-10-21', '16:00', '16:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:14:20.461Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_df39588_87e2d_7', 'c_f501c2b_87e2b', 'slot_df39588_87e2d', 'English beyond class: 7-amaliy mashg‘ulot', '2026-10-28', '16:00', '16:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:14:20.461Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_df39588_87e2d_8', 'c_f501c2b_87e2b', 'slot_df39588_87e2d', 'English beyond class: 8-amaliy mashg‘ulot', '2026-11-04', '16:00', '16:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:14:20.461Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_df39588_87e2d_9', 'c_f501c2b_87e2b', 'slot_df39588_87e2d', 'English beyond class: 9-amaliy mashg‘ulot', '2026-11-11', '16:00', '16:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:14:20.461Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_df39588_87e2d_10', 'c_f501c2b_87e2b', 'slot_df39588_87e2d', 'English beyond class: 10-amaliy mashg‘ulot', '2026-11-18', '16:00', '16:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:14:20.461Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_df39588_87e2d_11', 'c_f501c2b_87e2b', 'slot_df39588_87e2d', 'English beyond class: 11-amaliy mashg‘ulot', '2026-11-25', '16:00', '16:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:14:20.461Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_df39588_87e2d_12', 'c_f501c2b_87e2b', 'slot_df39588_87e2d', 'English beyond class: 12-amaliy mashg‘ulot', '2026-12-02', '16:00', '16:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:14:20.461Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_df39588_87e2d_13', 'c_f501c2b_87e2b', 'slot_df39588_87e2d', 'English beyond class: 13-amaliy mashg‘ulot', '2026-12-09', '16:00', '16:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:14:20.461Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_df39588_87e2d_14', 'c_f501c2b_87e2b', 'slot_df39588_87e2d', 'English beyond class: 14-amaliy mashg‘ulot', '2026-12-16', '16:00', '16:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:14:20.461Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_df39588_87e2d_15', 'c_f501c2b_87e2b', 'slot_df39588_87e2d', 'English beyond class: 15-amaliy mashg‘ulot', '2026-12-23', '16:00', '16:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:14:20.461Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_df39588_87e2d_16', 'c_f501c2b_87e2b', 'slot_df39588_87e2d', 'English beyond class: 16-amaliy mashg‘ulot', '2026-12-30', '16:00', '16:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:14:20.461Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_df39588_87e2d_17', 'c_f501c2b_87e2b', 'slot_df39588_87e2d', 'English beyond class: 17-amaliy mashg‘ulot', '2027-01-06', '16:00', '16:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:14:20.461Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_df39588_87e2d_18', 'c_f501c2b_87e2b', 'slot_df39588_87e2d', 'English beyond class: 18-amaliy mashg‘ulot', '2027-01-13', '16:00', '16:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:14:20.461Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_df39588_87e2d_19', 'c_f501c2b_87e2b', 'slot_df39588_87e2d', 'English beyond class: 19-amaliy mashg‘ulot', '2027-01-20', '16:00', '16:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:14:20.461Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_df39588_87e2d_20', 'c_f501c2b_87e2b', 'slot_df39588_87e2d', 'English beyond class: 20-amaliy mashg‘ulot', '2027-01-27', '16:00', '16:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:14:20.461Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_df39588_87e2d_21', 'c_f501c2b_87e2b', 'slot_df39588_87e2d', 'English beyond class: 21-amaliy mashg‘ulot', '2027-02-03', '16:00', '16:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:14:20.461Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_df39588_87e2d_22', 'c_f501c2b_87e2b', 'slot_df39588_87e2d', 'English beyond class: 22-amaliy mashg‘ulot', '2027-02-10', '16:00', '16:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:14:20.461Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_df39588_87e2d_23', 'c_f501c2b_87e2b', 'slot_df39588_87e2d', 'English beyond class: 23-amaliy mashg‘ulot', '2027-02-17', '16:00', '16:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:14:20.461Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_df39588_87e2d_24', 'c_f501c2b_87e2b', 'slot_df39588_87e2d', 'English beyond class: 24-amaliy mashg‘ulot', '2027-02-24', '16:00', '16:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:14:20.461Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_df39588_87e2d_25', 'c_f501c2b_87e2b', 'slot_df39588_87e2d', 'English beyond class: 25-amaliy mashg‘ulot', '2027-03-03', '16:00', '16:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:14:20.461Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_df39588_87e2d_26', 'c_f501c2b_87e2b', 'slot_df39588_87e2d', 'English beyond class: 26-amaliy mashg‘ulot', '2027-03-10', '16:00', '16:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:14:20.461Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_df39588_87e2d_27', 'c_f501c2b_87e2b', 'slot_df39588_87e2d', 'English beyond class: 27-amaliy mashg‘ulot', '2027-03-17', '16:00', '16:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:14:20.461Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_df39588_87e2d_28', 'c_f501c2b_87e2b', 'slot_df39588_87e2d', 'English beyond class: 28-amaliy mashg‘ulot', '2027-03-24', '16:00', '16:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:14:20.461Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_df39588_87e2d_29', 'c_f501c2b_87e2b', 'slot_df39588_87e2d', 'English beyond class: 29-amaliy mashg‘ulot', '2027-03-31', '16:00', '16:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:14:20.461Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_df39588_87e2d_30', 'c_f501c2b_87e2b', 'slot_df39588_87e2d', 'English beyond class: 30-amaliy mashg‘ulot', '2027-04-07', '16:00', '16:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:14:20.461Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_df39588_87e2d_31', 'c_f501c2b_87e2b', 'slot_df39588_87e2d', 'English beyond class: 31-amaliy mashg‘ulot', '2027-04-14', '16:00', '16:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:14:20.461Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_df39588_87e2d_32', 'c_f501c2b_87e2b', 'slot_df39588_87e2d', 'English beyond class: 32-amaliy mashg‘ulot', '2027-04-21', '16:00', '16:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:14:20.461Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_df39588_87e2d_33', 'c_f501c2b_87e2b', 'slot_df39588_87e2d', 'English beyond class: 33-amaliy mashg‘ulot', '2027-04-28', '16:00', '16:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:14:20.461Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_df39588_87e2d_34', 'c_f501c2b_87e2b', 'slot_df39588_87e2d', 'English beyond class: 34-amaliy mashg‘ulot', '2027-05-05', '16:00', '16:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:14:20.461Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_df39588_87e2d_35', 'c_f501c2b_87e2b', 'slot_df39588_87e2d', 'English beyond class: 35-amaliy mashg‘ulot', '2027-05-12', '16:00', '16:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:14:20.461Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_df39588_87e2d_36', 'c_f501c2b_87e2b', 'slot_df39588_87e2d', 'English beyond class: 36-amaliy mashg‘ulot', '2027-05-19', '16:00', '16:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:14:20.461Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_df39588_87e2d_37', 'c_f501c2b_87e2b', 'slot_df39588_87e2d', 'English beyond class: 37-amaliy mashg‘ulot', '2027-05-26', '16:00', '16:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:14:20.461Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_df39588_87e2d_38', 'c_f501c2b_87e2b', 'slot_df39588_87e2d', 'English beyond class: 38-amaliy mashg‘ulot', '2027-06-02', '16:00', '16:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:14:20.461Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b2d3d71_d667c_1', 'c_66437f6_d667b', 'slot_b2d3d71_d667c', 'Oltin mikrafon: 1-amaliy mashg‘ulot', '2026-09-07', '06:30', '08:30', 'Onlayn', 'held', '', 1, 'Egamberdiyeva Gulzoda Shuxratjon qizi', NULL, 'https://t.me/namsiflBT/11167', '2026-10-03T05:26:40.120Z', '2026-09-29T10:19:42.076Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b2d3d71_d667c_2', 'c_66437f6_d667b', 'slot_b2d3d71_d667c', 'Oltin mikrafon: 2-amaliy mashg‘ulot', '2026-09-14', '06:30', '08:30', 'Onlayn', 'held', '', 1, 'Egamberdiyeva Gulzoda Shuxratjon qizi', NULL, 'https://t.me/namsiflBT/11197', '2026-10-03T05:26:19.481Z', '2026-09-29T10:19:42.076Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b2d3d71_d667c_3', 'c_66437f6_d667b', 'slot_b2d3d71_d667c', 'Oltin mikrafon: 3-amaliy mashg‘ulot', '2026-09-21', '06:30', '08:30', 'Onlayn', 'held', '', 1, 'Egamberdiyeva Gulzoda Shuxratjon qizi', NULL, 'https://t.me/namsiflBT/11431', '2026-10-03T05:25:56.907Z', '2026-09-29T10:19:42.076Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b2d3d71_d667c_4', 'c_66437f6_d667b', 'slot_b2d3d71_d667c', 'Oltin mikrafon: 4-amaliy mashg‘ulot', '2026-09-28', '06:30', '08:30', 'Onlayn', 'held', '', 1, 'Egamberdiyeva Gulzoda Shuxratjon qizi', NULL, 'https://t.me/namsiflBT/11617', '2026-10-03T05:27:02.885Z', '2026-09-29T10:19:42.076Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b2d3d71_d667c_5', 'c_66437f6_d667b', 'slot_b2d3d71_d667c', 'Oltin mikrafon: 5-amaliy mashg‘ulot', '2026-10-05', '06:30', '08:30', 'Onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:19:42.076Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b2d3d71_d667c_6', 'c_66437f6_d667b', 'slot_b2d3d71_d667c', 'Oltin mikrafon: 6-amaliy mashg‘ulot', '2026-10-12', '06:30', '08:30', 'Onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:19:42.076Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b2d3d71_d667c_7', 'c_66437f6_d667b', 'slot_b2d3d71_d667c', 'Oltin mikrafon: 7-amaliy mashg‘ulot', '2026-10-19', '06:30', '08:30', 'Onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:19:42.076Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b2d3d71_d667c_8', 'c_66437f6_d667b', 'slot_b2d3d71_d667c', 'Oltin mikrafon: 8-amaliy mashg‘ulot', '2026-10-26', '06:30', '08:30', 'Onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:19:42.076Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b2d3d71_d667c_9', 'c_66437f6_d667b', 'slot_b2d3d71_d667c', 'Oltin mikrafon: 9-amaliy mashg‘ulot', '2026-11-02', '06:30', '08:30', 'Onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:19:42.076Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b2d3d71_d667c_10', 'c_66437f6_d667b', 'slot_b2d3d71_d667c', 'Oltin mikrafon: 10-amaliy mashg‘ulot', '2026-11-09', '06:30', '08:30', 'Onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:19:42.076Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b2d3d71_d667c_11', 'c_66437f6_d667b', 'slot_b2d3d71_d667c', 'Oltin mikrafon: 11-amaliy mashg‘ulot', '2026-11-16', '06:30', '08:30', 'Onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:19:42.076Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b2d3d71_d667c_12', 'c_66437f6_d667b', 'slot_b2d3d71_d667c', 'Oltin mikrafon: 12-amaliy mashg‘ulot', '2026-11-23', '06:30', '08:30', 'Onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:19:42.076Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b2d3d71_d667c_13', 'c_66437f6_d667b', 'slot_b2d3d71_d667c', 'Oltin mikrafon: 13-amaliy mashg‘ulot', '2026-11-30', '06:30', '08:30', 'Onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:19:42.076Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b2d3d71_d667c_14', 'c_66437f6_d667b', 'slot_b2d3d71_d667c', 'Oltin mikrafon: 14-amaliy mashg‘ulot', '2026-12-07', '06:30', '08:30', 'Onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:19:42.076Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b2d3d71_d667c_15', 'c_66437f6_d667b', 'slot_b2d3d71_d667c', 'Oltin mikrafon: 15-amaliy mashg‘ulot', '2026-12-14', '06:30', '08:30', 'Onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:19:42.076Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b2d3d71_d667c_16', 'c_66437f6_d667b', 'slot_b2d3d71_d667c', 'Oltin mikrafon: 16-amaliy mashg‘ulot', '2026-12-21', '06:30', '08:30', 'Onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:19:42.076Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b2d3d71_d667c_17', 'c_66437f6_d667b', 'slot_b2d3d71_d667c', 'Oltin mikrafon: 17-amaliy mashg‘ulot', '2026-12-28', '06:30', '08:30', 'Onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:19:42.076Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b2d3d71_d667c_18', 'c_66437f6_d667b', 'slot_b2d3d71_d667c', 'Oltin mikrafon: 18-amaliy mashg‘ulot', '2027-01-04', '06:30', '08:30', 'Onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:19:42.076Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b2d3d71_d667c_19', 'c_66437f6_d667b', 'slot_b2d3d71_d667c', 'Oltin mikrafon: 19-amaliy mashg‘ulot', '2027-01-11', '06:30', '08:30', 'Onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:19:42.076Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b2d3d71_d667c_20', 'c_66437f6_d667b', 'slot_b2d3d71_d667c', 'Oltin mikrafon: 20-amaliy mashg‘ulot', '2027-01-18', '06:30', '08:30', 'Onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:19:42.076Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b2d3d71_d667c_21', 'c_66437f6_d667b', 'slot_b2d3d71_d667c', 'Oltin mikrafon: 21-amaliy mashg‘ulot', '2027-01-25', '06:30', '08:30', 'Onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:19:42.076Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b2d3d71_d667c_22', 'c_66437f6_d667b', 'slot_b2d3d71_d667c', 'Oltin mikrafon: 22-amaliy mashg‘ulot', '2027-02-01', '06:30', '08:30', 'Onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:19:42.076Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b2d3d71_d667c_23', 'c_66437f6_d667b', 'slot_b2d3d71_d667c', 'Oltin mikrafon: 23-amaliy mashg‘ulot', '2027-02-08', '06:30', '08:30', 'Onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:19:42.076Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b2d3d71_d667c_24', 'c_66437f6_d667b', 'slot_b2d3d71_d667c', 'Oltin mikrafon: 24-amaliy mashg‘ulot', '2027-02-15', '06:30', '08:30', 'Onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:19:42.076Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b2d3d71_d667c_25', 'c_66437f6_d667b', 'slot_b2d3d71_d667c', 'Oltin mikrafon: 25-amaliy mashg‘ulot', '2027-02-22', '06:30', '08:30', 'Onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:19:42.076Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b2d3d71_d667c_26', 'c_66437f6_d667b', 'slot_b2d3d71_d667c', 'Oltin mikrafon: 26-amaliy mashg‘ulot', '2027-03-01', '06:30', '08:30', 'Onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:19:42.076Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b2d3d71_d667c_27', 'c_66437f6_d667b', 'slot_b2d3d71_d667c', 'Oltin mikrafon: 27-amaliy mashg‘ulot', '2027-03-08', '06:30', '08:30', 'Onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:19:42.076Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b2d3d71_d667c_28', 'c_66437f6_d667b', 'slot_b2d3d71_d667c', 'Oltin mikrafon: 28-amaliy mashg‘ulot', '2027-03-15', '06:30', '08:30', 'Onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:19:42.076Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b2d3d71_d667c_29', 'c_66437f6_d667b', 'slot_b2d3d71_d667c', 'Oltin mikrafon: 29-amaliy mashg‘ulot', '2027-03-22', '06:30', '08:30', 'Onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:19:42.076Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b2d3d71_d667c_30', 'c_66437f6_d667b', 'slot_b2d3d71_d667c', 'Oltin mikrafon: 30-amaliy mashg‘ulot', '2027-03-29', '06:30', '08:30', 'Onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:19:42.076Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b2d3d71_d667c_31', 'c_66437f6_d667b', 'slot_b2d3d71_d667c', 'Oltin mikrafon: 31-amaliy mashg‘ulot', '2027-04-05', '06:30', '08:30', 'Onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:19:42.076Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b2d3d71_d667c_32', 'c_66437f6_d667b', 'slot_b2d3d71_d667c', 'Oltin mikrafon: 32-amaliy mashg‘ulot', '2027-04-12', '06:30', '08:30', 'Onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:19:42.076Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b2d3d71_d667c_33', 'c_66437f6_d667b', 'slot_b2d3d71_d667c', 'Oltin mikrafon: 33-amaliy mashg‘ulot', '2027-04-19', '06:30', '08:30', 'Onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:19:42.076Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b2d3d71_d667c_34', 'c_66437f6_d667b', 'slot_b2d3d71_d667c', 'Oltin mikrafon: 34-amaliy mashg‘ulot', '2027-04-26', '06:30', '08:30', 'Onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:19:42.076Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b2d3d71_d667c_35', 'c_66437f6_d667b', 'slot_b2d3d71_d667c', 'Oltin mikrafon: 35-amaliy mashg‘ulot', '2027-05-03', '06:30', '08:30', 'Onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:19:42.076Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b2d3d71_d667c_36', 'c_66437f6_d667b', 'slot_b2d3d71_d667c', 'Oltin mikrafon: 36-amaliy mashg‘ulot', '2027-05-10', '06:30', '08:30', 'Onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:19:42.076Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b2d3d71_d667c_37', 'c_66437f6_d667b', 'slot_b2d3d71_d667c', 'Oltin mikrafon: 37-amaliy mashg‘ulot', '2027-05-17', '06:30', '08:30', 'Onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:19:42.076Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b2d3d71_d667c_38', 'c_66437f6_d667b', 'slot_b2d3d71_d667c', 'Oltin mikrafon: 38-amaliy mashg‘ulot', '2027-05-24', '06:30', '08:30', 'Onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:19:42.076Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b2d3d71_d667c_39', 'c_66437f6_d667b', 'slot_b2d3d71_d667c', 'Oltin mikrafon: 39-amaliy mashg‘ulot', '2027-05-31', '06:30', '08:30', 'Onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:19:42.076Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b2d3d71_d667c_40', 'c_66437f6_d667b', 'slot_b2d3d71_d667c', 'Oltin mikrafon: 40-amaliy mashg‘ulot', '2027-06-07', '06:30', '08:30', 'Onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:19:42.076Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b2d3d71_d667c_41', 'c_66437f6_d667b', 'slot_b2d3d71_d667c', 'Oltin mikrafon: 41-amaliy mashg‘ulot', '2027-06-14', '06:30', '08:30', 'Onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:19:42.076Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b2d3d71_d667c_42', 'c_66437f6_d667b', 'slot_b2d3d71_d667c', 'Oltin mikrafon: 42-amaliy mashg‘ulot', '2027-06-21', '06:30', '08:30', 'Onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:19:42.076Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b2d3d71_d667c_43', 'c_66437f6_d667b', 'slot_b2d3d71_d667c', 'Oltin mikrafon: 43-amaliy mashg‘ulot', '2027-06-28', '06:30', '08:30', 'Onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T10:19:42.076Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8e42e01_93613_1', 'c_3049351_93612', 'slot_8e42e01_93613', 'Book club: 1-amaliy mashg‘ulot', '2026-09-30', '16:00', '17:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:25:01.843Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8e42e01_93613_2', 'c_3049351_93612', 'slot_8e42e01_93613', 'Book club: 2-amaliy mashg‘ulot', '2026-10-07', '16:00', '17:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:25:01.843Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8e42e01_93613_3', 'c_3049351_93612', 'slot_8e42e01_93613', 'Book club: 3-amaliy mashg‘ulot', '2026-10-14', '16:00', '17:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:25:01.843Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8e42e01_93613_4', 'c_3049351_93612', 'slot_8e42e01_93613', 'Book club: 4-amaliy mashg‘ulot', '2026-10-21', '16:00', '17:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:25:01.843Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8e42e01_93613_5', 'c_3049351_93612', 'slot_8e42e01_93613', 'Book club: 5-amaliy mashg‘ulot', '2026-10-28', '16:00', '17:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:25:01.843Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8e42e01_93613_6', 'c_3049351_93612', 'slot_8e42e01_93613', 'Book club: 6-amaliy mashg‘ulot', '2026-11-04', '16:00', '17:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:25:01.843Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8e42e01_93613_7', 'c_3049351_93612', 'slot_8e42e01_93613', 'Book club: 7-amaliy mashg‘ulot', '2026-11-11', '16:00', '17:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:25:01.843Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8e42e01_93613_8', 'c_3049351_93612', 'slot_8e42e01_93613', 'Book club: 8-amaliy mashg‘ulot', '2026-11-18', '16:00', '17:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:25:01.843Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8e42e01_93613_9', 'c_3049351_93612', 'slot_8e42e01_93613', 'Book club: 9-amaliy mashg‘ulot', '2026-11-25', '16:00', '17:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:25:01.843Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8e42e01_93613_10', 'c_3049351_93612', 'slot_8e42e01_93613', 'Book club: 10-amaliy mashg‘ulot', '2026-12-02', '16:00', '17:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:25:01.843Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8e42e01_93613_11', 'c_3049351_93612', 'slot_8e42e01_93613', 'Book club: 11-amaliy mashg‘ulot', '2026-12-09', '16:00', '17:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:25:01.843Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8e42e01_93613_12', 'c_3049351_93612', 'slot_8e42e01_93613', 'Book club: 12-amaliy mashg‘ulot', '2026-12-16', '16:00', '17:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:25:01.843Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8e42e01_93613_13', 'c_3049351_93612', 'slot_8e42e01_93613', 'Book club: 13-amaliy mashg‘ulot', '2026-12-23', '16:00', '17:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:25:01.843Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8e42e01_93613_14', 'c_3049351_93612', 'slot_8e42e01_93613', 'Book club: 14-amaliy mashg‘ulot', '2026-12-30', '16:00', '17:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:25:01.843Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8e42e01_93613_15', 'c_3049351_93612', 'slot_8e42e01_93613', 'Book club: 15-amaliy mashg‘ulot', '2027-01-06', '16:00', '17:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:25:01.843Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8e42e01_93613_16', 'c_3049351_93612', 'slot_8e42e01_93613', 'Book club: 16-amaliy mashg‘ulot', '2027-01-13', '16:00', '17:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:25:01.843Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8e42e01_93613_17', 'c_3049351_93612', 'slot_8e42e01_93613', 'Book club: 17-amaliy mashg‘ulot', '2027-01-20', '16:00', '17:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:25:01.843Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8e42e01_93613_18', 'c_3049351_93612', 'slot_8e42e01_93613', 'Book club: 18-amaliy mashg‘ulot', '2027-01-27', '16:00', '17:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:25:01.843Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8e42e01_93613_19', 'c_3049351_93612', 'slot_8e42e01_93613', 'Book club: 19-amaliy mashg‘ulot', '2027-02-03', '16:00', '17:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:25:01.843Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8e42e01_93613_20', 'c_3049351_93612', 'slot_8e42e01_93613', 'Book club: 20-amaliy mashg‘ulot', '2027-02-10', '16:00', '17:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:25:01.843Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8e42e01_93613_21', 'c_3049351_93612', 'slot_8e42e01_93613', 'Book club: 21-amaliy mashg‘ulot', '2027-02-17', '16:00', '17:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:25:01.843Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8e42e01_93613_22', 'c_3049351_93612', 'slot_8e42e01_93613', 'Book club: 22-amaliy mashg‘ulot', '2027-02-24', '16:00', '17:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:25:01.843Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8e42e01_93613_23', 'c_3049351_93612', 'slot_8e42e01_93613', 'Book club: 23-amaliy mashg‘ulot', '2027-03-03', '16:00', '17:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:25:01.843Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8e42e01_93613_24', 'c_3049351_93612', 'slot_8e42e01_93613', 'Book club: 24-amaliy mashg‘ulot', '2027-03-10', '16:00', '17:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:25:01.843Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8e42e01_93613_25', 'c_3049351_93612', 'slot_8e42e01_93613', 'Book club: 25-amaliy mashg‘ulot', '2027-03-17', '16:00', '17:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:25:01.843Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8e42e01_93613_26', 'c_3049351_93612', 'slot_8e42e01_93613', 'Book club: 26-amaliy mashg‘ulot', '2027-03-24', '16:00', '17:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:25:01.843Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8e42e01_93613_27', 'c_3049351_93612', 'slot_8e42e01_93613', 'Book club: 27-amaliy mashg‘ulot', '2027-03-31', '16:00', '17:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:25:01.843Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8e42e01_93613_28', 'c_3049351_93612', 'slot_8e42e01_93613', 'Book club: 28-amaliy mashg‘ulot', '2027-04-07', '16:00', '17:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:25:01.843Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8e42e01_93613_29', 'c_3049351_93612', 'slot_8e42e01_93613', 'Book club: 29-amaliy mashg‘ulot', '2027-04-14', '16:00', '17:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:25:01.843Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8e42e01_93613_30', 'c_3049351_93612', 'slot_8e42e01_93613', 'Book club: 30-amaliy mashg‘ulot', '2027-04-21', '16:00', '17:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:25:01.843Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8e42e01_93613_31', 'c_3049351_93612', 'slot_8e42e01_93613', 'Book club: 31-amaliy mashg‘ulot', '2027-04-28', '16:00', '17:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:25:01.843Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8e42e01_93613_32', 'c_3049351_93612', 'slot_8e42e01_93613', 'Book club: 32-amaliy mashg‘ulot', '2027-05-05', '16:00', '17:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:25:01.843Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8e42e01_93613_33', 'c_3049351_93612', 'slot_8e42e01_93613', 'Book club: 33-amaliy mashg‘ulot', '2027-05-12', '16:00', '17:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:25:01.843Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8e42e01_93613_34', 'c_3049351_93612', 'slot_8e42e01_93613', 'Book club: 34-amaliy mashg‘ulot', '2027-05-19', '16:00', '17:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:25:01.843Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8e42e01_93613_35', 'c_3049351_93612', 'slot_8e42e01_93613', 'Book club: 35-amaliy mashg‘ulot', '2027-05-26', '16:00', '17:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:25:01.843Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8e42e01_93613_36', 'c_3049351_93612', 'slot_8e42e01_93613', 'Book club: 36-amaliy mashg‘ulot', '2027-06-02', '16:00', '17:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:25:01.843Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8e42e01_93613_37', 'c_3049351_93612', 'slot_8e42e01_93613', 'Book club: 37-amaliy mashg‘ulot', '2027-06-09', '16:00', '17:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:25:01.843Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8e42e01_93613_38', 'c_3049351_93612', 'slot_8e42e01_93613', 'Book club: 38-amaliy mashg‘ulot', '2027-06-16', '16:00', '17:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:25:01.843Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_8e42e01_93613_39', 'c_3049351_93612', 'slot_8e42e01_93613', 'Book club: 39-amaliy mashg‘ulot', '2027-06-23', '16:00', '17:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:25:01.843Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_a998ce9_ec1f4_1', 'c_11525bb_ec1f4', 'slot_a998ce9_ec1f4', 'IBRAT IZIDAN: 1-amaliy mashg‘ulot', '2026-10-02', '10:00', '11:30', 'onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:48:33.908Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_a998ce9_ec1f4_2', 'c_11525bb_ec1f4', 'slot_a998ce9_ec1f4', 'IBRAT IZIDAN: 2-amaliy mashg‘ulot', '2026-10-09', '10:00', '11:30', 'onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:48:33.908Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_a998ce9_ec1f4_3', 'c_11525bb_ec1f4', 'slot_a998ce9_ec1f4', 'IBRAT IZIDAN: 3-amaliy mashg‘ulot', '2026-10-16', '10:00', '11:30', 'onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:48:33.908Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_a998ce9_ec1f4_4', 'c_11525bb_ec1f4', 'slot_a998ce9_ec1f4', 'IBRAT IZIDAN: 4-amaliy mashg‘ulot', '2026-10-23', '10:00', '11:30', 'onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:48:33.908Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_a998ce9_ec1f4_5', 'c_11525bb_ec1f4', 'slot_a998ce9_ec1f4', 'IBRAT IZIDAN: 5-amaliy mashg‘ulot', '2026-10-30', '10:00', '11:30', 'onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:48:33.908Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_a998ce9_ec1f4_6', 'c_11525bb_ec1f4', 'slot_a998ce9_ec1f4', 'IBRAT IZIDAN: 6-amaliy mashg‘ulot', '2026-11-06', '10:00', '11:30', 'onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:48:33.908Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_a998ce9_ec1f4_7', 'c_11525bb_ec1f4', 'slot_a998ce9_ec1f4', 'IBRAT IZIDAN: 7-amaliy mashg‘ulot', '2026-11-13', '10:00', '11:30', 'onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:48:33.908Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_a998ce9_ec1f4_8', 'c_11525bb_ec1f4', 'slot_a998ce9_ec1f4', 'IBRAT IZIDAN: 8-amaliy mashg‘ulot', '2026-11-20', '10:00', '11:30', 'onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:48:33.908Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_a998ce9_ec1f4_9', 'c_11525bb_ec1f4', 'slot_a998ce9_ec1f4', 'IBRAT IZIDAN: 9-amaliy mashg‘ulot', '2026-11-27', '10:00', '11:30', 'onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:48:33.908Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_a998ce9_ec1f4_10', 'c_11525bb_ec1f4', 'slot_a998ce9_ec1f4', 'IBRAT IZIDAN: 10-amaliy mashg‘ulot', '2026-12-04', '10:00', '11:30', 'onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:48:33.908Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_a998ce9_ec1f4_11', 'c_11525bb_ec1f4', 'slot_a998ce9_ec1f4', 'IBRAT IZIDAN: 11-amaliy mashg‘ulot', '2026-12-11', '10:00', '11:30', 'onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:48:33.908Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_a998ce9_ec1f4_12', 'c_11525bb_ec1f4', 'slot_a998ce9_ec1f4', 'IBRAT IZIDAN: 12-amaliy mashg‘ulot', '2026-12-18', '10:00', '11:30', 'onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:48:33.908Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_a998ce9_ec1f4_13', 'c_11525bb_ec1f4', 'slot_a998ce9_ec1f4', 'IBRAT IZIDAN: 13-amaliy mashg‘ulot', '2026-12-25', '10:00', '11:30', 'onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:48:33.908Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_a998ce9_ec1f4_14', 'c_11525bb_ec1f4', 'slot_a998ce9_ec1f4', 'IBRAT IZIDAN: 14-amaliy mashg‘ulot', '2027-01-01', '10:00', '11:30', 'onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:48:33.908Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_a998ce9_ec1f4_15', 'c_11525bb_ec1f4', 'slot_a998ce9_ec1f4', 'IBRAT IZIDAN: 15-amaliy mashg‘ulot', '2027-01-08', '10:00', '11:30', 'onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:48:33.908Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_a998ce9_ec1f4_16', 'c_11525bb_ec1f4', 'slot_a998ce9_ec1f4', 'IBRAT IZIDAN: 16-amaliy mashg‘ulot', '2027-01-15', '10:00', '11:30', 'onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:48:33.908Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_a998ce9_ec1f4_17', 'c_11525bb_ec1f4', 'slot_a998ce9_ec1f4', 'IBRAT IZIDAN: 17-amaliy mashg‘ulot', '2027-01-22', '10:00', '11:30', 'onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:48:33.908Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_a998ce9_ec1f4_18', 'c_11525bb_ec1f4', 'slot_a998ce9_ec1f4', 'IBRAT IZIDAN: 18-amaliy mashg‘ulot', '2027-01-29', '10:00', '11:30', 'onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:48:33.908Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_a998ce9_ec1f4_19', 'c_11525bb_ec1f4', 'slot_a998ce9_ec1f4', 'IBRAT IZIDAN: 19-amaliy mashg‘ulot', '2027-02-05', '10:00', '11:30', 'onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:48:33.908Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_a998ce9_ec1f4_20', 'c_11525bb_ec1f4', 'slot_a998ce9_ec1f4', 'IBRAT IZIDAN: 20-amaliy mashg‘ulot', '2027-02-12', '10:00', '11:30', 'onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:48:33.908Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_a998ce9_ec1f4_21', 'c_11525bb_ec1f4', 'slot_a998ce9_ec1f4', 'IBRAT IZIDAN: 21-amaliy mashg‘ulot', '2027-02-19', '10:00', '11:30', 'onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:48:33.908Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_a998ce9_ec1f4_22', 'c_11525bb_ec1f4', 'slot_a998ce9_ec1f4', 'IBRAT IZIDAN: 22-amaliy mashg‘ulot', '2027-02-26', '10:00', '11:30', 'onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:48:33.908Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_a998ce9_ec1f4_23', 'c_11525bb_ec1f4', 'slot_a998ce9_ec1f4', 'IBRAT IZIDAN: 23-amaliy mashg‘ulot', '2027-03-05', '10:00', '11:30', 'onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:48:33.908Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_a998ce9_ec1f4_24', 'c_11525bb_ec1f4', 'slot_a998ce9_ec1f4', 'IBRAT IZIDAN: 24-amaliy mashg‘ulot', '2027-03-12', '10:00', '11:30', 'onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:48:33.908Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_a998ce9_ec1f4_25', 'c_11525bb_ec1f4', 'slot_a998ce9_ec1f4', 'IBRAT IZIDAN: 25-amaliy mashg‘ulot', '2027-03-19', '10:00', '11:30', 'onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:48:33.908Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_a998ce9_ec1f4_26', 'c_11525bb_ec1f4', 'slot_a998ce9_ec1f4', 'IBRAT IZIDAN: 26-amaliy mashg‘ulot', '2027-03-26', '10:00', '11:30', 'onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:48:33.908Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_a998ce9_ec1f4_27', 'c_11525bb_ec1f4', 'slot_a998ce9_ec1f4', 'IBRAT IZIDAN: 27-amaliy mashg‘ulot', '2027-04-02', '10:00', '11:30', 'onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:48:33.908Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_a998ce9_ec1f4_28', 'c_11525bb_ec1f4', 'slot_a998ce9_ec1f4', 'IBRAT IZIDAN: 28-amaliy mashg‘ulot', '2027-04-09', '10:00', '11:30', 'onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:48:33.908Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_a998ce9_ec1f4_29', 'c_11525bb_ec1f4', 'slot_a998ce9_ec1f4', 'IBRAT IZIDAN: 29-amaliy mashg‘ulot', '2027-04-16', '10:00', '11:30', 'onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:48:33.908Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_a998ce9_ec1f4_30', 'c_11525bb_ec1f4', 'slot_a998ce9_ec1f4', 'IBRAT IZIDAN: 30-amaliy mashg‘ulot', '2027-04-23', '10:00', '11:30', 'onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:48:33.908Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_a998ce9_ec1f4_31', 'c_11525bb_ec1f4', 'slot_a998ce9_ec1f4', 'IBRAT IZIDAN: 31-amaliy mashg‘ulot', '2027-04-30', '10:00', '11:30', 'onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:48:33.908Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_a998ce9_ec1f4_32', 'c_11525bb_ec1f4', 'slot_a998ce9_ec1f4', 'IBRAT IZIDAN: 32-amaliy mashg‘ulot', '2027-05-07', '10:00', '11:30', 'onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:48:33.908Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_a998ce9_ec1f4_33', 'c_11525bb_ec1f4', 'slot_a998ce9_ec1f4', 'IBRAT IZIDAN: 33-amaliy mashg‘ulot', '2027-05-14', '10:00', '11:30', 'onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:48:33.908Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_a998ce9_ec1f4_34', 'c_11525bb_ec1f4', 'slot_a998ce9_ec1f4', 'IBRAT IZIDAN: 34-amaliy mashg‘ulot', '2027-05-21', '10:00', '11:30', 'onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:48:33.908Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_a998ce9_ec1f4_35', 'c_11525bb_ec1f4', 'slot_a998ce9_ec1f4', 'IBRAT IZIDAN: 35-amaliy mashg‘ulot', '2027-05-28', '10:00', '11:30', 'onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:48:33.908Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_a998ce9_ec1f4_36', 'c_11525bb_ec1f4', 'slot_a998ce9_ec1f4', 'IBRAT IZIDAN: 36-amaliy mashg‘ulot', '2027-06-04', '10:00', '11:30', 'onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:48:33.908Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_a998ce9_ec1f4_37', 'c_11525bb_ec1f4', 'slot_a998ce9_ec1f4', 'IBRAT IZIDAN: 37-amaliy mashg‘ulot', '2027-06-11', '10:00', '11:30', 'onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:48:33.908Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_a998ce9_ec1f4_38', 'c_11525bb_ec1f4', 'slot_a998ce9_ec1f4', 'IBRAT IZIDAN: 38-amaliy mashg‘ulot', '2027-06-18', '10:00', '11:30', 'onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:48:33.908Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_a998ce9_ec1f4_39', 'c_11525bb_ec1f4', 'slot_a998ce9_ec1f4', 'IBRAT IZIDAN: 39-amaliy mashg‘ulot', '2027-06-25', '10:00', '11:30', 'onlayn', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T11:48:33.908Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ef1836b_bf799_1', 'c_2086a8b_bf799', 'slot_ef1836b_bf799', 'Ibrat flowers academy: 1-amaliy mashg‘ulot', '2026-09-22', '13:00', '14:00', '403-auditoriya', 'held', '1-mashg''ulot', 8, 'Valijonova Roziya Baxtiyor qizi', NULL, 'https://t.me/namsiflBT/11597', '2026-09-30T04:58:36.130Z', '2026-09-30T04:56:37.017Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ef1836b_bf799_2', 'c_2086a8b_bf799', 'slot_ef1836b_bf799', 'Ibrat flowers academy: 2-amaliy mashg‘ulot', '2026-09-29', '13:00', '14:00', '403-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-30T04:56:37.017Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ef1836b_bf799_3', 'c_2086a8b_bf799', 'slot_ef1836b_bf799', 'Ibrat flowers academy: 3-amaliy mashg‘ulot', '2026-10-06', '13:00', '14:00', '403-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-30T04:56:37.017Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ef1836b_bf799_4', 'c_2086a8b_bf799', 'slot_ef1836b_bf799', 'Ibrat flowers academy: 4-amaliy mashg‘ulot', '2026-10-13', '13:00', '14:00', '403-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-30T04:56:37.017Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ef1836b_bf799_5', 'c_2086a8b_bf799', 'slot_ef1836b_bf799', 'Ibrat flowers academy: 5-amaliy mashg‘ulot', '2026-10-20', '13:00', '14:00', '403-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-30T04:56:37.017Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ef1836b_bf799_6', 'c_2086a8b_bf799', 'slot_ef1836b_bf799', 'Ibrat flowers academy: 6-amaliy mashg‘ulot', '2026-10-27', '13:00', '14:00', '403-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-30T04:56:37.017Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ef1836b_bf799_7', 'c_2086a8b_bf799', 'slot_ef1836b_bf799', 'Ibrat flowers academy: 7-amaliy mashg‘ulot', '2026-11-03', '13:00', '14:00', '403-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-30T04:56:37.017Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ef1836b_bf799_8', 'c_2086a8b_bf799', 'slot_ef1836b_bf799', 'Ibrat flowers academy: 8-amaliy mashg‘ulot', '2026-11-10', '13:00', '14:00', '403-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-30T04:56:37.017Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ef1836b_bf799_9', 'c_2086a8b_bf799', 'slot_ef1836b_bf799', 'Ibrat flowers academy: 9-amaliy mashg‘ulot', '2026-11-17', '13:00', '14:00', '403-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-30T04:56:37.017Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ef1836b_bf799_10', 'c_2086a8b_bf799', 'slot_ef1836b_bf799', 'Ibrat flowers academy: 10-amaliy mashg‘ulot', '2026-11-24', '13:00', '14:00', '403-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-30T04:56:37.017Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ef1836b_bf799_11', 'c_2086a8b_bf799', 'slot_ef1836b_bf799', 'Ibrat flowers academy: 11-amaliy mashg‘ulot', '2026-12-01', '13:00', '14:00', '403-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-30T04:56:37.017Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ef1836b_bf799_12', 'c_2086a8b_bf799', 'slot_ef1836b_bf799', 'Ibrat flowers academy: 12-amaliy mashg‘ulot', '2026-12-08', '13:00', '14:00', '403-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-30T04:56:37.017Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ef1836b_bf799_13', 'c_2086a8b_bf799', 'slot_ef1836b_bf799', 'Ibrat flowers academy: 13-amaliy mashg‘ulot', '2026-12-15', '13:00', '14:00', '403-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-30T04:56:37.017Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ef1836b_bf799_14', 'c_2086a8b_bf799', 'slot_ef1836b_bf799', 'Ibrat flowers academy: 14-amaliy mashg‘ulot', '2026-12-22', '13:00', '14:00', '403-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-30T04:56:37.017Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ef1836b_bf799_15', 'c_2086a8b_bf799', 'slot_ef1836b_bf799', 'Ibrat flowers academy: 15-amaliy mashg‘ulot', '2026-12-29', '13:00', '14:00', '403-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-30T04:56:37.017Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ef1836b_bf799_16', 'c_2086a8b_bf799', 'slot_ef1836b_bf799', 'Ibrat flowers academy: 16-amaliy mashg‘ulot', '2027-01-05', '13:00', '14:00', '403-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-30T04:56:37.017Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ef1836b_bf799_17', 'c_2086a8b_bf799', 'slot_ef1836b_bf799', 'Ibrat flowers academy: 17-amaliy mashg‘ulot', '2027-01-12', '13:00', '14:00', '403-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-30T04:56:37.017Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ef1836b_bf799_18', 'c_2086a8b_bf799', 'slot_ef1836b_bf799', 'Ibrat flowers academy: 18-amaliy mashg‘ulot', '2027-01-19', '13:00', '14:00', '403-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-30T04:56:37.017Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ef1836b_bf799_19', 'c_2086a8b_bf799', 'slot_ef1836b_bf799', 'Ibrat flowers academy: 19-amaliy mashg‘ulot', '2027-01-26', '13:00', '14:00', '403-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-30T04:56:37.017Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ef1836b_bf799_20', 'c_2086a8b_bf799', 'slot_ef1836b_bf799', 'Ibrat flowers academy: 20-amaliy mashg‘ulot', '2027-02-02', '13:00', '14:00', '403-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-30T04:56:37.017Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ef1836b_bf799_21', 'c_2086a8b_bf799', 'slot_ef1836b_bf799', 'Ibrat flowers academy: 21-amaliy mashg‘ulot', '2027-02-09', '13:00', '14:00', '403-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-30T04:56:37.017Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ef1836b_bf799_22', 'c_2086a8b_bf799', 'slot_ef1836b_bf799', 'Ibrat flowers academy: 22-amaliy mashg‘ulot', '2027-02-16', '13:00', '14:00', '403-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-30T04:56:37.017Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ef1836b_bf799_23', 'c_2086a8b_bf799', 'slot_ef1836b_bf799', 'Ibrat flowers academy: 23-amaliy mashg‘ulot', '2027-02-23', '13:00', '14:00', '403-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-30T04:56:37.017Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ef1836b_bf799_24', 'c_2086a8b_bf799', 'slot_ef1836b_bf799', 'Ibrat flowers academy: 24-amaliy mashg‘ulot', '2027-03-02', '13:00', '14:00', '403-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-30T04:56:37.017Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ef1836b_bf799_25', 'c_2086a8b_bf799', 'slot_ef1836b_bf799', 'Ibrat flowers academy: 25-amaliy mashg‘ulot', '2027-03-09', '13:00', '14:00', '403-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-30T04:56:37.017Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ef1836b_bf799_26', 'c_2086a8b_bf799', 'slot_ef1836b_bf799', 'Ibrat flowers academy: 26-amaliy mashg‘ulot', '2027-03-16', '13:00', '14:00', '403-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-30T04:56:37.017Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ef1836b_bf799_27', 'c_2086a8b_bf799', 'slot_ef1836b_bf799', 'Ibrat flowers academy: 27-amaliy mashg‘ulot', '2027-03-23', '13:00', '14:00', '403-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-30T04:56:37.017Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ef1836b_bf799_28', 'c_2086a8b_bf799', 'slot_ef1836b_bf799', 'Ibrat flowers academy: 28-amaliy mashg‘ulot', '2027-03-30', '13:00', '14:00', '403-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-30T04:56:37.017Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ef1836b_bf799_29', 'c_2086a8b_bf799', 'slot_ef1836b_bf799', 'Ibrat flowers academy: 29-amaliy mashg‘ulot', '2027-04-06', '13:00', '14:00', '403-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-30T04:56:37.017Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ef1836b_bf799_30', 'c_2086a8b_bf799', 'slot_ef1836b_bf799', 'Ibrat flowers academy: 30-amaliy mashg‘ulot', '2027-04-13', '13:00', '14:00', '403-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-30T04:56:37.017Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ef1836b_bf799_31', 'c_2086a8b_bf799', 'slot_ef1836b_bf799', 'Ibrat flowers academy: 31-amaliy mashg‘ulot', '2027-04-20', '13:00', '14:00', '403-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-30T04:56:37.017Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ef1836b_bf799_32', 'c_2086a8b_bf799', 'slot_ef1836b_bf799', 'Ibrat flowers academy: 32-amaliy mashg‘ulot', '2027-04-27', '13:00', '14:00', '403-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-30T04:56:37.017Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ef1836b_bf799_33', 'c_2086a8b_bf799', 'slot_ef1836b_bf799', 'Ibrat flowers academy: 33-amaliy mashg‘ulot', '2027-05-04', '13:00', '14:00', '403-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-30T04:56:37.017Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ef1836b_bf799_34', 'c_2086a8b_bf799', 'slot_ef1836b_bf799', 'Ibrat flowers academy: 34-amaliy mashg‘ulot', '2027-05-11', '13:00', '14:00', '403-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-30T04:56:37.017Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ef1836b_bf799_35', 'c_2086a8b_bf799', 'slot_ef1836b_bf799', 'Ibrat flowers academy: 35-amaliy mashg‘ulot', '2027-05-18', '13:00', '14:00', '403-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-30T04:56:37.017Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ef1836b_bf799_36', 'c_2086a8b_bf799', 'slot_ef1836b_bf799', 'Ibrat flowers academy: 36-amaliy mashg‘ulot', '2027-05-25', '13:00', '14:00', '403-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-30T04:56:37.017Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ef1836b_bf799_37', 'c_2086a8b_bf799', 'slot_ef1836b_bf799', 'Ibrat flowers academy: 37-amaliy mashg‘ulot', '2027-06-01', '13:00', '14:00', '403-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-30T04:56:37.017Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ef1836b_bf799_38', 'c_2086a8b_bf799', 'slot_ef1836b_bf799', 'Ibrat flowers academy: 38-amaliy mashg‘ulot', '2027-06-08', '13:00', '14:00', '403-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-30T04:56:37.017Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ef1836b_bf799_39', 'c_2086a8b_bf799', 'slot_ef1836b_bf799', 'Ibrat flowers academy: 39-amaliy mashg‘ulot', '2027-06-15', '13:00', '14:00', '403-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-30T04:56:37.017Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ef1836b_bf799_40', 'c_2086a8b_bf799', 'slot_ef1836b_bf799', 'Ibrat flowers academy: 40-amaliy mashg‘ulot', '2027-06-22', '13:00', '14:00', '403-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-30T04:56:37.017Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ef1836b_bf799_41', 'c_2086a8b_bf799', 'slot_ef1836b_bf799', 'Ibrat flowers academy: 41-amaliy mashg‘ulot', '2027-06-29', '13:00', '14:00', '403-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-30T04:56:37.017Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4fd75b2_cf2c8_1', 'c_cb90143_cf2c7', 'slot_4fd75b2_cf2c8', 'Voleybol to''garagi: 1-amaliy mashg‘ulot', '2026-09-15', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4fd75b2_cf2c8_2', 'c_cb90143_cf2c7', 'slot_4fd75b2_cf2c8', 'Voleybol to''garagi: 2-amaliy mashg‘ulot', '2026-09-22', '14:20', '16:20', 'Ikkita fakultet sport zali', 'held', 'Soglom turmush tarziga amal qilindi', 15, 'Abtufattoyeva Mushtariybonu Sarvarjon qizi', NULL, 'https://t.me/namsiflBT/11496?single', '2026-10-03T12:44:56.637Z', '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4fd75b2_cf2c8_3', 'c_cb90143_cf2c7', 'slot_4fd75b2_cf2c8', 'Voleybol to''garagi: 3-amaliy mashg‘ulot', '2026-09-29', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4fd75b2_cf2c8_4', 'c_cb90143_cf2c7', 'slot_4fd75b2_cf2c8', 'Voleybol to''garagi: 4-amaliy mashg‘ulot', '2026-10-06', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4fd75b2_cf2c8_5', 'c_cb90143_cf2c7', 'slot_4fd75b2_cf2c8', 'Voleybol to''garagi: 5-amaliy mashg‘ulot', '2026-10-13', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4fd75b2_cf2c8_6', 'c_cb90143_cf2c7', 'slot_4fd75b2_cf2c8', 'Voleybol to''garagi: 6-amaliy mashg‘ulot', '2026-10-20', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4fd75b2_cf2c8_7', 'c_cb90143_cf2c7', 'slot_4fd75b2_cf2c8', 'Voleybol to''garagi: 7-amaliy mashg‘ulot', '2026-10-27', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4fd75b2_cf2c8_8', 'c_cb90143_cf2c7', 'slot_4fd75b2_cf2c8', 'Voleybol to''garagi: 8-amaliy mashg‘ulot', '2026-11-03', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4fd75b2_cf2c8_9', 'c_cb90143_cf2c7', 'slot_4fd75b2_cf2c8', 'Voleybol to''garagi: 9-amaliy mashg‘ulot', '2026-11-10', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4fd75b2_cf2c8_10', 'c_cb90143_cf2c7', 'slot_4fd75b2_cf2c8', 'Voleybol to''garagi: 10-amaliy mashg‘ulot', '2026-11-17', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4fd75b2_cf2c8_11', 'c_cb90143_cf2c7', 'slot_4fd75b2_cf2c8', 'Voleybol to''garagi: 11-amaliy mashg‘ulot', '2026-11-24', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4fd75b2_cf2c8_12', 'c_cb90143_cf2c7', 'slot_4fd75b2_cf2c8', 'Voleybol to''garagi: 12-amaliy mashg‘ulot', '2026-12-01', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4fd75b2_cf2c8_13', 'c_cb90143_cf2c7', 'slot_4fd75b2_cf2c8', 'Voleybol to''garagi: 13-amaliy mashg‘ulot', '2026-12-08', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4fd75b2_cf2c8_14', 'c_cb90143_cf2c7', 'slot_4fd75b2_cf2c8', 'Voleybol to''garagi: 14-amaliy mashg‘ulot', '2026-12-15', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4fd75b2_cf2c8_15', 'c_cb90143_cf2c7', 'slot_4fd75b2_cf2c8', 'Voleybol to''garagi: 15-amaliy mashg‘ulot', '2026-12-22', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4fd75b2_cf2c8_16', 'c_cb90143_cf2c7', 'slot_4fd75b2_cf2c8', 'Voleybol to''garagi: 16-amaliy mashg‘ulot', '2026-12-29', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4fd75b2_cf2c8_17', 'c_cb90143_cf2c7', 'slot_4fd75b2_cf2c8', 'Voleybol to''garagi: 17-amaliy mashg‘ulot', '2027-01-05', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4fd75b2_cf2c8_18', 'c_cb90143_cf2c7', 'slot_4fd75b2_cf2c8', 'Voleybol to''garagi: 18-amaliy mashg‘ulot', '2027-01-12', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4fd75b2_cf2c8_19', 'c_cb90143_cf2c7', 'slot_4fd75b2_cf2c8', 'Voleybol to''garagi: 19-amaliy mashg‘ulot', '2027-01-19', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4fd75b2_cf2c8_20', 'c_cb90143_cf2c7', 'slot_4fd75b2_cf2c8', 'Voleybol to''garagi: 20-amaliy mashg‘ulot', '2027-01-26', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4fd75b2_cf2c8_21', 'c_cb90143_cf2c7', 'slot_4fd75b2_cf2c8', 'Voleybol to''garagi: 21-amaliy mashg‘ulot', '2027-02-02', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4fd75b2_cf2c8_22', 'c_cb90143_cf2c7', 'slot_4fd75b2_cf2c8', 'Voleybol to''garagi: 22-amaliy mashg‘ulot', '2027-02-09', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4fd75b2_cf2c8_23', 'c_cb90143_cf2c7', 'slot_4fd75b2_cf2c8', 'Voleybol to''garagi: 23-amaliy mashg‘ulot', '2027-02-16', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4fd75b2_cf2c8_24', 'c_cb90143_cf2c7', 'slot_4fd75b2_cf2c8', 'Voleybol to''garagi: 24-amaliy mashg‘ulot', '2027-02-23', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4fd75b2_cf2c8_25', 'c_cb90143_cf2c7', 'slot_4fd75b2_cf2c8', 'Voleybol to''garagi: 25-amaliy mashg‘ulot', '2027-03-02', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4fd75b2_cf2c8_26', 'c_cb90143_cf2c7', 'slot_4fd75b2_cf2c8', 'Voleybol to''garagi: 26-amaliy mashg‘ulot', '2027-03-09', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4fd75b2_cf2c8_27', 'c_cb90143_cf2c7', 'slot_4fd75b2_cf2c8', 'Voleybol to''garagi: 27-amaliy mashg‘ulot', '2027-03-16', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4fd75b2_cf2c8_28', 'c_cb90143_cf2c7', 'slot_4fd75b2_cf2c8', 'Voleybol to''garagi: 28-amaliy mashg‘ulot', '2027-03-23', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4fd75b2_cf2c8_29', 'c_cb90143_cf2c7', 'slot_4fd75b2_cf2c8', 'Voleybol to''garagi: 29-amaliy mashg‘ulot', '2027-03-30', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4fd75b2_cf2c8_30', 'c_cb90143_cf2c7', 'slot_4fd75b2_cf2c8', 'Voleybol to''garagi: 30-amaliy mashg‘ulot', '2027-04-06', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4fd75b2_cf2c8_31', 'c_cb90143_cf2c7', 'slot_4fd75b2_cf2c8', 'Voleybol to''garagi: 31-amaliy mashg‘ulot', '2027-04-13', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4fd75b2_cf2c8_32', 'c_cb90143_cf2c7', 'slot_4fd75b2_cf2c8', 'Voleybol to''garagi: 32-amaliy mashg‘ulot', '2027-04-20', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4fd75b2_cf2c8_33', 'c_cb90143_cf2c7', 'slot_4fd75b2_cf2c8', 'Voleybol to''garagi: 33-amaliy mashg‘ulot', '2027-04-27', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4fd75b2_cf2c8_34', 'c_cb90143_cf2c7', 'slot_4fd75b2_cf2c8', 'Voleybol to''garagi: 34-amaliy mashg‘ulot', '2027-05-04', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4fd75b2_cf2c8_35', 'c_cb90143_cf2c7', 'slot_4fd75b2_cf2c8', 'Voleybol to''garagi: 35-amaliy mashg‘ulot', '2027-05-11', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4fd75b2_cf2c8_36', 'c_cb90143_cf2c7', 'slot_4fd75b2_cf2c8', 'Voleybol to''garagi: 36-amaliy mashg‘ulot', '2027-05-18', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4fd75b2_cf2c8_37', 'c_cb90143_cf2c7', 'slot_4fd75b2_cf2c8', 'Voleybol to''garagi: 37-amaliy mashg‘ulot', '2027-05-25', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4fd75b2_cf2c8_38', 'c_cb90143_cf2c7', 'slot_4fd75b2_cf2c8', 'Voleybol to''garagi: 38-amaliy mashg‘ulot', '2027-06-01', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4fd75b2_cf2c8_39', 'c_cb90143_cf2c7', 'slot_4fd75b2_cf2c8', 'Voleybol to''garagi: 39-amaliy mashg‘ulot', '2027-06-08', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4fd75b2_cf2c8_40', 'c_cb90143_cf2c7', 'slot_4fd75b2_cf2c8', 'Voleybol to''garagi: 40-amaliy mashg‘ulot', '2027-06-15', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_4fd75b2_cf2c8_41', 'c_cb90143_cf2c7', 'slot_4fd75b2_cf2c8', 'Voleybol to''garagi: 41-amaliy mashg‘ulot', '2027-06-22', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_82631aa_cf2c8_1', 'c_cb90143_cf2c7', 'slot_82631aa_cf2c8', 'Voleybol to''garagi: 1-amaliy mashg‘ulot', '2026-09-16', '14:20', '16:20', 'Ikkita fakultet sport zali', 'held', 'Dars jarayonida talabalar oz vaqtini unumli hamda mazmunli oʻtkazdi', 23, 'Abtufattoyeva Mushtariybonu Sarvarjon qizi', NULL, 'https://t.me/namsiflBT/11314?single', '2026-10-03T12:43:30.966Z', '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_82631aa_cf2c8_2', 'c_cb90143_cf2c7', 'slot_82631aa_cf2c8', 'Voleybol to''garagi: 2-amaliy mashg‘ulot', '2026-09-23', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_82631aa_cf2c8_3', 'c_cb90143_cf2c7', 'slot_82631aa_cf2c8', 'Voleybol to''garagi: 3-amaliy mashg‘ulot', '2026-09-30', '14:20', '16:20', 'Ikkita fakultet sport zali', 'held', 'Soglom turmush tarzi', 15, 'Abtufattoyeva Mushtariybonu Sarvarjon qizi', NULL, 'https://t.me/namsiflBT/11496?single', '2026-10-03T12:47:58.436Z', '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_82631aa_cf2c8_4', 'c_cb90143_cf2c7', 'slot_82631aa_cf2c8', 'Voleybol to''garagi: 4-amaliy mashg‘ulot', '2026-10-07', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_82631aa_cf2c8_5', 'c_cb90143_cf2c7', 'slot_82631aa_cf2c8', 'Voleybol to''garagi: 5-amaliy mashg‘ulot', '2026-10-14', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_82631aa_cf2c8_6', 'c_cb90143_cf2c7', 'slot_82631aa_cf2c8', 'Voleybol to''garagi: 6-amaliy mashg‘ulot', '2026-10-21', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_82631aa_cf2c8_7', 'c_cb90143_cf2c7', 'slot_82631aa_cf2c8', 'Voleybol to''garagi: 7-amaliy mashg‘ulot', '2026-10-28', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_82631aa_cf2c8_8', 'c_cb90143_cf2c7', 'slot_82631aa_cf2c8', 'Voleybol to''garagi: 8-amaliy mashg‘ulot', '2026-11-04', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_82631aa_cf2c8_9', 'c_cb90143_cf2c7', 'slot_82631aa_cf2c8', 'Voleybol to''garagi: 9-amaliy mashg‘ulot', '2026-11-11', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_82631aa_cf2c8_10', 'c_cb90143_cf2c7', 'slot_82631aa_cf2c8', 'Voleybol to''garagi: 10-amaliy mashg‘ulot', '2026-11-18', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_82631aa_cf2c8_11', 'c_cb90143_cf2c7', 'slot_82631aa_cf2c8', 'Voleybol to''garagi: 11-amaliy mashg‘ulot', '2026-11-25', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_82631aa_cf2c8_12', 'c_cb90143_cf2c7', 'slot_82631aa_cf2c8', 'Voleybol to''garagi: 12-amaliy mashg‘ulot', '2026-12-02', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_82631aa_cf2c8_13', 'c_cb90143_cf2c7', 'slot_82631aa_cf2c8', 'Voleybol to''garagi: 13-amaliy mashg‘ulot', '2026-12-09', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_82631aa_cf2c8_14', 'c_cb90143_cf2c7', 'slot_82631aa_cf2c8', 'Voleybol to''garagi: 14-amaliy mashg‘ulot', '2026-12-16', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_82631aa_cf2c8_15', 'c_cb90143_cf2c7', 'slot_82631aa_cf2c8', 'Voleybol to''garagi: 15-amaliy mashg‘ulot', '2026-12-23', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_82631aa_cf2c8_16', 'c_cb90143_cf2c7', 'slot_82631aa_cf2c8', 'Voleybol to''garagi: 16-amaliy mashg‘ulot', '2026-12-30', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_82631aa_cf2c8_17', 'c_cb90143_cf2c7', 'slot_82631aa_cf2c8', 'Voleybol to''garagi: 17-amaliy mashg‘ulot', '2027-01-06', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_82631aa_cf2c8_18', 'c_cb90143_cf2c7', 'slot_82631aa_cf2c8', 'Voleybol to''garagi: 18-amaliy mashg‘ulot', '2027-01-13', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_82631aa_cf2c8_19', 'c_cb90143_cf2c7', 'slot_82631aa_cf2c8', 'Voleybol to''garagi: 19-amaliy mashg‘ulot', '2027-01-20', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_82631aa_cf2c8_20', 'c_cb90143_cf2c7', 'slot_82631aa_cf2c8', 'Voleybol to''garagi: 20-amaliy mashg‘ulot', '2027-01-27', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_82631aa_cf2c8_21', 'c_cb90143_cf2c7', 'slot_82631aa_cf2c8', 'Voleybol to''garagi: 21-amaliy mashg‘ulot', '2027-02-03', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_82631aa_cf2c8_22', 'c_cb90143_cf2c7', 'slot_82631aa_cf2c8', 'Voleybol to''garagi: 22-amaliy mashg‘ulot', '2027-02-10', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_82631aa_cf2c8_23', 'c_cb90143_cf2c7', 'slot_82631aa_cf2c8', 'Voleybol to''garagi: 23-amaliy mashg‘ulot', '2027-02-17', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_82631aa_cf2c8_24', 'c_cb90143_cf2c7', 'slot_82631aa_cf2c8', 'Voleybol to''garagi: 24-amaliy mashg‘ulot', '2027-02-24', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_82631aa_cf2c8_25', 'c_cb90143_cf2c7', 'slot_82631aa_cf2c8', 'Voleybol to''garagi: 25-amaliy mashg‘ulot', '2027-03-03', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_82631aa_cf2c8_26', 'c_cb90143_cf2c7', 'slot_82631aa_cf2c8', 'Voleybol to''garagi: 26-amaliy mashg‘ulot', '2027-03-10', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_82631aa_cf2c8_27', 'c_cb90143_cf2c7', 'slot_82631aa_cf2c8', 'Voleybol to''garagi: 27-amaliy mashg‘ulot', '2027-03-17', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_82631aa_cf2c8_28', 'c_cb90143_cf2c7', 'slot_82631aa_cf2c8', 'Voleybol to''garagi: 28-amaliy mashg‘ulot', '2027-03-24', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_82631aa_cf2c8_29', 'c_cb90143_cf2c7', 'slot_82631aa_cf2c8', 'Voleybol to''garagi: 29-amaliy mashg‘ulot', '2027-03-31', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_82631aa_cf2c8_30', 'c_cb90143_cf2c7', 'slot_82631aa_cf2c8', 'Voleybol to''garagi: 30-amaliy mashg‘ulot', '2027-04-07', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_82631aa_cf2c8_31', 'c_cb90143_cf2c7', 'slot_82631aa_cf2c8', 'Voleybol to''garagi: 31-amaliy mashg‘ulot', '2027-04-14', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_82631aa_cf2c8_32', 'c_cb90143_cf2c7', 'slot_82631aa_cf2c8', 'Voleybol to''garagi: 32-amaliy mashg‘ulot', '2027-04-21', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_82631aa_cf2c8_33', 'c_cb90143_cf2c7', 'slot_82631aa_cf2c8', 'Voleybol to''garagi: 33-amaliy mashg‘ulot', '2027-04-28', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_82631aa_cf2c8_34', 'c_cb90143_cf2c7', 'slot_82631aa_cf2c8', 'Voleybol to''garagi: 34-amaliy mashg‘ulot', '2027-05-05', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_82631aa_cf2c8_35', 'c_cb90143_cf2c7', 'slot_82631aa_cf2c8', 'Voleybol to''garagi: 35-amaliy mashg‘ulot', '2027-05-12', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_82631aa_cf2c8_36', 'c_cb90143_cf2c7', 'slot_82631aa_cf2c8', 'Voleybol to''garagi: 36-amaliy mashg‘ulot', '2027-05-19', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_82631aa_cf2c8_37', 'c_cb90143_cf2c7', 'slot_82631aa_cf2c8', 'Voleybol to''garagi: 37-amaliy mashg‘ulot', '2027-05-26', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_82631aa_cf2c8_38', 'c_cb90143_cf2c7', 'slot_82631aa_cf2c8', 'Voleybol to''garagi: 38-amaliy mashg‘ulot', '2027-06-02', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_82631aa_cf2c8_39', 'c_cb90143_cf2c7', 'slot_82631aa_cf2c8', 'Voleybol to''garagi: 39-amaliy mashg‘ulot', '2027-06-09', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_82631aa_cf2c8_40', 'c_cb90143_cf2c7', 'slot_82631aa_cf2c8', 'Voleybol to''garagi: 40-amaliy mashg‘ulot', '2027-06-16', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_82631aa_cf2c8_41', 'c_cb90143_cf2c7', 'slot_82631aa_cf2c8', 'Voleybol to''garagi: 41-amaliy mashg‘ulot', '2027-06-23', '14:20', '16:20', 'Ikkita fakultet sport zali', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T06:21:42.472Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_34a2814_15a21_1', 'c_d1019f6_15a21', 'slot_34a2814_15a21', 'Media club: 1-amaliy mashg‘ulot', '2026-10-08', '11:00', '12:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T13:01:18.241Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_34a2814_15a21_2', 'c_d1019f6_15a21', 'slot_34a2814_15a21', 'Media club: 2-amaliy mashg‘ulot', '2026-10-15', '11:00', '12:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T13:01:18.241Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_34a2814_15a21_3', 'c_d1019f6_15a21', 'slot_34a2814_15a21', 'Media club: 3-amaliy mashg‘ulot', '2026-10-22', '11:00', '12:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T13:01:18.241Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_34a2814_15a21_4', 'c_d1019f6_15a21', 'slot_34a2814_15a21', 'Media club: 4-amaliy mashg‘ulot', '2026-10-29', '11:00', '12:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T13:01:18.241Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_34a2814_15a21_5', 'c_d1019f6_15a21', 'slot_34a2814_15a21', 'Media club: 5-amaliy mashg‘ulot', '2026-11-05', '11:00', '12:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T13:01:18.241Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_34a2814_15a21_6', 'c_d1019f6_15a21', 'slot_34a2814_15a21', 'Media club: 6-amaliy mashg‘ulot', '2026-11-12', '11:00', '12:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T13:01:18.241Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_34a2814_15a21_7', 'c_d1019f6_15a21', 'slot_34a2814_15a21', 'Media club: 7-amaliy mashg‘ulot', '2026-11-19', '11:00', '12:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T13:01:18.241Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_34a2814_15a21_8', 'c_d1019f6_15a21', 'slot_34a2814_15a21', 'Media club: 8-amaliy mashg‘ulot', '2026-11-26', '11:00', '12:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T13:01:18.241Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_34a2814_15a21_9', 'c_d1019f6_15a21', 'slot_34a2814_15a21', 'Media club: 9-amaliy mashg‘ulot', '2026-12-03', '11:00', '12:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T13:01:18.241Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_34a2814_15a21_10', 'c_d1019f6_15a21', 'slot_34a2814_15a21', 'Media club: 10-amaliy mashg‘ulot', '2026-12-10', '11:00', '12:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T13:01:18.241Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_34a2814_15a21_11', 'c_d1019f6_15a21', 'slot_34a2814_15a21', 'Media club: 11-amaliy mashg‘ulot', '2026-12-17', '11:00', '12:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T13:01:18.241Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_34a2814_15a21_12', 'c_d1019f6_15a21', 'slot_34a2814_15a21', 'Media club: 12-amaliy mashg‘ulot', '2026-12-24', '11:00', '12:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T13:01:18.241Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_34a2814_15a21_13', 'c_d1019f6_15a21', 'slot_34a2814_15a21', 'Media club: 13-amaliy mashg‘ulot', '2026-12-31', '11:00', '12:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T13:01:18.241Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_34a2814_15a21_14', 'c_d1019f6_15a21', 'slot_34a2814_15a21', 'Media club: 14-amaliy mashg‘ulot', '2027-01-07', '11:00', '12:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T13:01:18.241Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_34a2814_15a21_15', 'c_d1019f6_15a21', 'slot_34a2814_15a21', 'Media club: 15-amaliy mashg‘ulot', '2027-01-14', '11:00', '12:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T13:01:18.241Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_34a2814_15a21_16', 'c_d1019f6_15a21', 'slot_34a2814_15a21', 'Media club: 16-amaliy mashg‘ulot', '2027-01-21', '11:00', '12:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T13:01:18.241Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_34a2814_15a21_17', 'c_d1019f6_15a21', 'slot_34a2814_15a21', 'Media club: 17-amaliy mashg‘ulot', '2027-01-28', '11:00', '12:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T13:01:18.241Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_34a2814_15a21_18', 'c_d1019f6_15a21', 'slot_34a2814_15a21', 'Media club: 18-amaliy mashg‘ulot', '2027-02-04', '11:00', '12:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T13:01:18.241Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_34a2814_15a21_19', 'c_d1019f6_15a21', 'slot_34a2814_15a21', 'Media club: 19-amaliy mashg‘ulot', '2027-02-11', '11:00', '12:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T13:01:18.241Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_34a2814_15a21_20', 'c_d1019f6_15a21', 'slot_34a2814_15a21', 'Media club: 20-amaliy mashg‘ulot', '2027-02-18', '11:00', '12:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T13:01:18.241Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_34a2814_15a21_21', 'c_d1019f6_15a21', 'slot_34a2814_15a21', 'Media club: 21-amaliy mashg‘ulot', '2027-02-25', '11:00', '12:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T13:01:18.241Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_34a2814_15a21_22', 'c_d1019f6_15a21', 'slot_34a2814_15a21', 'Media club: 22-amaliy mashg‘ulot', '2027-03-04', '11:00', '12:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T13:01:18.241Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_34a2814_15a21_23', 'c_d1019f6_15a21', 'slot_34a2814_15a21', 'Media club: 23-amaliy mashg‘ulot', '2027-03-11', '11:00', '12:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T13:01:18.241Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_34a2814_15a21_24', 'c_d1019f6_15a21', 'slot_34a2814_15a21', 'Media club: 24-amaliy mashg‘ulot', '2027-03-18', '11:00', '12:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T13:01:18.241Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_34a2814_15a21_25', 'c_d1019f6_15a21', 'slot_34a2814_15a21', 'Media club: 25-amaliy mashg‘ulot', '2027-03-25', '11:00', '12:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T13:01:18.241Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_34a2814_15a21_26', 'c_d1019f6_15a21', 'slot_34a2814_15a21', 'Media club: 26-amaliy mashg‘ulot', '2027-04-01', '11:00', '12:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T13:01:18.241Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_34a2814_15a21_27', 'c_d1019f6_15a21', 'slot_34a2814_15a21', 'Media club: 27-amaliy mashg‘ulot', '2027-04-08', '11:00', '12:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T13:01:18.241Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_34a2814_15a21_28', 'c_d1019f6_15a21', 'slot_34a2814_15a21', 'Media club: 28-amaliy mashg‘ulot', '2027-04-15', '11:00', '12:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T13:01:18.241Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_34a2814_15a21_29', 'c_d1019f6_15a21', 'slot_34a2814_15a21', 'Media club: 29-amaliy mashg‘ulot', '2027-04-22', '11:00', '12:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T13:01:18.241Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_34a2814_15a21_30', 'c_d1019f6_15a21', 'slot_34a2814_15a21', 'Media club: 30-amaliy mashg‘ulot', '2027-04-29', '11:00', '12:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T13:01:18.241Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_34a2814_15a21_31', 'c_d1019f6_15a21', 'slot_34a2814_15a21', 'Media club: 31-amaliy mashg‘ulot', '2027-05-06', '11:00', '12:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T13:01:18.241Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_34a2814_15a21_32', 'c_d1019f6_15a21', 'slot_34a2814_15a21', 'Media club: 32-amaliy mashg‘ulot', '2027-05-13', '11:00', '12:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T13:01:18.241Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_34a2814_15a21_33', 'c_d1019f6_15a21', 'slot_34a2814_15a21', 'Media club: 33-amaliy mashg‘ulot', '2027-05-20', '11:00', '12:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T13:01:18.241Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_34a2814_15a21_34', 'c_d1019f6_15a21', 'slot_34a2814_15a21', 'Media club: 34-amaliy mashg‘ulot', '2027-05-27', '11:00', '12:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T13:01:18.241Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_34a2814_15a21_35', 'c_d1019f6_15a21', 'slot_34a2814_15a21', 'Media club: 35-amaliy mashg‘ulot', '2027-06-03', '11:00', '12:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T13:01:18.241Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_34a2814_15a21_36', 'c_d1019f6_15a21', 'slot_34a2814_15a21', 'Media club: 36-amaliy mashg‘ulot', '2027-06-10', '11:00', '12:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T13:01:18.241Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_34a2814_15a21_37', 'c_d1019f6_15a21', 'slot_34a2814_15a21', 'Media club: 37-amaliy mashg‘ulot', '2027-06-17', '11:00', '12:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T13:01:18.241Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_34a2814_15a21_38', 'c_d1019f6_15a21', 'slot_34a2814_15a21', 'Media club: 38-amaliy mashg‘ulot', '2027-06-24', '11:00', '12:30', 'bo''sh xonada', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-09-29T13:01:18.241Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b186563_c64f5_1', 'c_23cbc13_c64f4', 'slot_b186563_c64f5', 'Student girls'' club: 1-amaliy mashg‘ulot', '2026-09-17', '11:30', '12:30', '428-auditoriya', 'held', '1-mashg''ulot e''longa berish', 15, 'Zayniddinova Zilolabonu', NULL, 'https://t.me/manaviyat_namSIFL/34186', '2026-10-03T09:00:51.771Z', '2026-10-03T08:58:23.349Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b186563_c64f5_2', 'c_23cbc13_c64f4', 'slot_b186563_c64f5', 'Student girls'' club: 2-amaliy mashg‘ulot', '2026-09-24', '11:30', '12:30', '428-auditoriya', 'held', '2-mashg''ulot', 15, 'Zayniddinova Zilolabonu', NULL, 'https://t.me/manaviyat_namSIFL/34543', '2026-10-03T09:01:20.230Z', '2026-10-03T08:58:23.349Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b186563_c64f5_3', 'c_23cbc13_c64f4', 'slot_b186563_c64f5', 'Student girls'' club: 3-amaliy mashg‘ulot', '2026-10-01', '11:30', '12:30', '428-auditoriya', 'held', '3-mashg''ulot', 7, 'Zayniddinova Zilolabonu', NULL, 'https://t.me/namsiflBT/11737', '2026-10-03T09:02:15.615Z', '2026-10-03T08:58:23.349Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b186563_c64f5_4', 'c_23cbc13_c64f4', 'slot_b186563_c64f5', 'Student girls'' club: 4-amaliy mashg‘ulot', '2026-10-08', '11:30', '12:30', '428-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T08:58:23.349Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b186563_c64f5_5', 'c_23cbc13_c64f4', 'slot_b186563_c64f5', 'Student girls'' club: 5-amaliy mashg‘ulot', '2026-10-15', '11:30', '12:30', '428-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T08:58:23.349Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b186563_c64f5_6', 'c_23cbc13_c64f4', 'slot_b186563_c64f5', 'Student girls'' club: 6-amaliy mashg‘ulot', '2026-10-22', '11:30', '12:30', '428-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T08:58:23.349Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b186563_c64f5_7', 'c_23cbc13_c64f4', 'slot_b186563_c64f5', 'Student girls'' club: 7-amaliy mashg‘ulot', '2026-10-29', '11:30', '12:30', '428-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T08:58:23.349Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b186563_c64f5_8', 'c_23cbc13_c64f4', 'slot_b186563_c64f5', 'Student girls'' club: 8-amaliy mashg‘ulot', '2026-11-05', '11:30', '12:30', '428-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T08:58:23.349Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b186563_c64f5_9', 'c_23cbc13_c64f4', 'slot_b186563_c64f5', 'Student girls'' club: 9-amaliy mashg‘ulot', '2026-11-12', '11:30', '12:30', '428-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T08:58:23.349Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b186563_c64f5_10', 'c_23cbc13_c64f4', 'slot_b186563_c64f5', 'Student girls'' club: 10-amaliy mashg‘ulot', '2026-11-19', '11:30', '12:30', '428-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T08:58:23.349Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b186563_c64f5_11', 'c_23cbc13_c64f4', 'slot_b186563_c64f5', 'Student girls'' club: 11-amaliy mashg‘ulot', '2026-11-26', '11:30', '12:30', '428-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T08:58:23.349Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b186563_c64f5_12', 'c_23cbc13_c64f4', 'slot_b186563_c64f5', 'Student girls'' club: 12-amaliy mashg‘ulot', '2026-12-03', '11:30', '12:30', '428-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T08:58:23.349Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b186563_c64f5_13', 'c_23cbc13_c64f4', 'slot_b186563_c64f5', 'Student girls'' club: 13-amaliy mashg‘ulot', '2026-12-10', '11:30', '12:30', '428-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T08:58:23.349Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b186563_c64f5_14', 'c_23cbc13_c64f4', 'slot_b186563_c64f5', 'Student girls'' club: 14-amaliy mashg‘ulot', '2026-12-17', '11:30', '12:30', '428-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T08:58:23.349Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b186563_c64f5_15', 'c_23cbc13_c64f4', 'slot_b186563_c64f5', 'Student girls'' club: 15-amaliy mashg‘ulot', '2026-12-24', '11:30', '12:30', '428-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T08:58:23.349Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b186563_c64f5_16', 'c_23cbc13_c64f4', 'slot_b186563_c64f5', 'Student girls'' club: 16-amaliy mashg‘ulot', '2026-12-31', '11:30', '12:30', '428-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T08:58:23.349Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b186563_c64f5_17', 'c_23cbc13_c64f4', 'slot_b186563_c64f5', 'Student girls'' club: 17-amaliy mashg‘ulot', '2027-01-07', '11:30', '12:30', '428-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T08:58:23.349Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b186563_c64f5_18', 'c_23cbc13_c64f4', 'slot_b186563_c64f5', 'Student girls'' club: 18-amaliy mashg‘ulot', '2027-01-14', '11:30', '12:30', '428-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T08:58:23.349Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b186563_c64f5_19', 'c_23cbc13_c64f4', 'slot_b186563_c64f5', 'Student girls'' club: 19-amaliy mashg‘ulot', '2027-01-21', '11:30', '12:30', '428-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T08:58:23.349Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b186563_c64f5_20', 'c_23cbc13_c64f4', 'slot_b186563_c64f5', 'Student girls'' club: 20-amaliy mashg‘ulot', '2027-01-28', '11:30', '12:30', '428-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T08:58:23.349Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b186563_c64f5_21', 'c_23cbc13_c64f4', 'slot_b186563_c64f5', 'Student girls'' club: 21-amaliy mashg‘ulot', '2027-02-04', '11:30', '12:30', '428-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T08:58:23.349Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b186563_c64f5_22', 'c_23cbc13_c64f4', 'slot_b186563_c64f5', 'Student girls'' club: 22-amaliy mashg‘ulot', '2027-02-11', '11:30', '12:30', '428-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T08:58:23.349Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b186563_c64f5_23', 'c_23cbc13_c64f4', 'slot_b186563_c64f5', 'Student girls'' club: 23-amaliy mashg‘ulot', '2027-02-18', '11:30', '12:30', '428-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T08:58:23.349Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b186563_c64f5_24', 'c_23cbc13_c64f4', 'slot_b186563_c64f5', 'Student girls'' club: 24-amaliy mashg‘ulot', '2027-02-25', '11:30', '12:30', '428-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T08:58:23.349Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b186563_c64f5_25', 'c_23cbc13_c64f4', 'slot_b186563_c64f5', 'Student girls'' club: 25-amaliy mashg‘ulot', '2027-03-04', '11:30', '12:30', '428-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T08:58:23.349Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b186563_c64f5_26', 'c_23cbc13_c64f4', 'slot_b186563_c64f5', 'Student girls'' club: 26-amaliy mashg‘ulot', '2027-03-11', '11:30', '12:30', '428-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T08:58:23.349Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b186563_c64f5_27', 'c_23cbc13_c64f4', 'slot_b186563_c64f5', 'Student girls'' club: 27-amaliy mashg‘ulot', '2027-03-18', '11:30', '12:30', '428-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T08:58:23.349Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b186563_c64f5_28', 'c_23cbc13_c64f4', 'slot_b186563_c64f5', 'Student girls'' club: 28-amaliy mashg‘ulot', '2027-03-25', '11:30', '12:30', '428-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T08:58:23.349Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b186563_c64f5_29', 'c_23cbc13_c64f4', 'slot_b186563_c64f5', 'Student girls'' club: 29-amaliy mashg‘ulot', '2027-04-01', '11:30', '12:30', '428-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T08:58:23.349Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b186563_c64f5_30', 'c_23cbc13_c64f4', 'slot_b186563_c64f5', 'Student girls'' club: 30-amaliy mashg‘ulot', '2027-04-08', '11:30', '12:30', '428-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T08:58:23.349Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b186563_c64f5_31', 'c_23cbc13_c64f4', 'slot_b186563_c64f5', 'Student girls'' club: 31-amaliy mashg‘ulot', '2027-04-15', '11:30', '12:30', '428-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T08:58:23.349Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b186563_c64f5_32', 'c_23cbc13_c64f4', 'slot_b186563_c64f5', 'Student girls'' club: 32-amaliy mashg‘ulot', '2027-04-22', '11:30', '12:30', '428-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T08:58:23.349Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b186563_c64f5_33', 'c_23cbc13_c64f4', 'slot_b186563_c64f5', 'Student girls'' club: 33-amaliy mashg‘ulot', '2027-04-29', '11:30', '12:30', '428-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T08:58:23.349Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b186563_c64f5_34', 'c_23cbc13_c64f4', 'slot_b186563_c64f5', 'Student girls'' club: 34-amaliy mashg‘ulot', '2027-05-06', '11:30', '12:30', '428-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T08:58:23.349Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b186563_c64f5_35', 'c_23cbc13_c64f4', 'slot_b186563_c64f5', 'Student girls'' club: 35-amaliy mashg‘ulot', '2027-05-13', '11:30', '12:30', '428-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T08:58:23.349Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b186563_c64f5_36', 'c_23cbc13_c64f4', 'slot_b186563_c64f5', 'Student girls'' club: 36-amaliy mashg‘ulot', '2027-05-20', '11:30', '12:30', '428-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T08:58:23.349Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b186563_c64f5_37', 'c_23cbc13_c64f4', 'slot_b186563_c64f5', 'Student girls'' club: 37-amaliy mashg‘ulot', '2027-05-27', '11:30', '12:30', '428-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T08:58:23.349Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b186563_c64f5_38', 'c_23cbc13_c64f4', 'slot_b186563_c64f5', 'Student girls'' club: 38-amaliy mashg‘ulot', '2027-06-03', '11:30', '12:30', '428-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T08:58:23.349Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b186563_c64f5_39', 'c_23cbc13_c64f4', 'slot_b186563_c64f5', 'Student girls'' club: 39-amaliy mashg‘ulot', '2027-06-10', '11:30', '12:30', '428-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T08:58:23.349Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b186563_c64f5_40', 'c_23cbc13_c64f4', 'slot_b186563_c64f5', 'Student girls'' club: 40-amaliy mashg‘ulot', '2027-06-17', '11:30', '12:30', '428-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T08:58:23.349Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_b186563_c64f5_41', 'c_23cbc13_c64f4', 'slot_b186563_c64f5', 'Student girls'' club: 41-amaliy mashg‘ulot', '2027-06-24', '11:30', '12:30', '428-auditoriya', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T08:58:23.349Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7b0ed10_ccd46_1', 'c_33a8bdd_ccd46', 'slot_7b0ed10_ccd46', 'Stol tennisi yigitlarga: 1-amaliy mashg‘ulot', '2026-10-12', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.630Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7b0ed10_ccd46_2', 'c_33a8bdd_ccd46', 'slot_7b0ed10_ccd46', 'Stol tennisi yigitlarga: 2-amaliy mashg‘ulot', '2026-10-19', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.630Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7b0ed10_ccd46_3', 'c_33a8bdd_ccd46', 'slot_7b0ed10_ccd46', 'Stol tennisi yigitlarga: 3-amaliy mashg‘ulot', '2026-10-26', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.630Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7b0ed10_ccd46_4', 'c_33a8bdd_ccd46', 'slot_7b0ed10_ccd46', 'Stol tennisi yigitlarga: 4-amaliy mashg‘ulot', '2026-11-02', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.630Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7b0ed10_ccd46_5', 'c_33a8bdd_ccd46', 'slot_7b0ed10_ccd46', 'Stol tennisi yigitlarga: 5-amaliy mashg‘ulot', '2026-11-09', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.630Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7b0ed10_ccd46_6', 'c_33a8bdd_ccd46', 'slot_7b0ed10_ccd46', 'Stol tennisi yigitlarga: 6-amaliy mashg‘ulot', '2026-11-16', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.630Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7b0ed10_ccd46_7', 'c_33a8bdd_ccd46', 'slot_7b0ed10_ccd46', 'Stol tennisi yigitlarga: 7-amaliy mashg‘ulot', '2026-11-23', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.630Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7b0ed10_ccd46_8', 'c_33a8bdd_ccd46', 'slot_7b0ed10_ccd46', 'Stol tennisi yigitlarga: 8-amaliy mashg‘ulot', '2026-11-30', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.630Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7b0ed10_ccd46_9', 'c_33a8bdd_ccd46', 'slot_7b0ed10_ccd46', 'Stol tennisi yigitlarga: 9-amaliy mashg‘ulot', '2026-12-07', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.630Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7b0ed10_ccd46_10', 'c_33a8bdd_ccd46', 'slot_7b0ed10_ccd46', 'Stol tennisi yigitlarga: 10-amaliy mashg‘ulot', '2026-12-14', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.630Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7b0ed10_ccd46_11', 'c_33a8bdd_ccd46', 'slot_7b0ed10_ccd46', 'Stol tennisi yigitlarga: 11-amaliy mashg‘ulot', '2026-12-21', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.630Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7b0ed10_ccd46_12', 'c_33a8bdd_ccd46', 'slot_7b0ed10_ccd46', 'Stol tennisi yigitlarga: 12-amaliy mashg‘ulot', '2026-12-28', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.630Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7b0ed10_ccd46_13', 'c_33a8bdd_ccd46', 'slot_7b0ed10_ccd46', 'Stol tennisi yigitlarga: 13-amaliy mashg‘ulot', '2027-01-04', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.630Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7b0ed10_ccd46_14', 'c_33a8bdd_ccd46', 'slot_7b0ed10_ccd46', 'Stol tennisi yigitlarga: 14-amaliy mashg‘ulot', '2027-01-11', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.630Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7b0ed10_ccd46_15', 'c_33a8bdd_ccd46', 'slot_7b0ed10_ccd46', 'Stol tennisi yigitlarga: 15-amaliy mashg‘ulot', '2027-01-18', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.630Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7b0ed10_ccd46_16', 'c_33a8bdd_ccd46', 'slot_7b0ed10_ccd46', 'Stol tennisi yigitlarga: 16-amaliy mashg‘ulot', '2027-01-25', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.630Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7b0ed10_ccd46_17', 'c_33a8bdd_ccd46', 'slot_7b0ed10_ccd46', 'Stol tennisi yigitlarga: 17-amaliy mashg‘ulot', '2027-02-01', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.630Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7b0ed10_ccd46_18', 'c_33a8bdd_ccd46', 'slot_7b0ed10_ccd46', 'Stol tennisi yigitlarga: 18-amaliy mashg‘ulot', '2027-02-08', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.630Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7b0ed10_ccd46_19', 'c_33a8bdd_ccd46', 'slot_7b0ed10_ccd46', 'Stol tennisi yigitlarga: 19-amaliy mashg‘ulot', '2027-02-15', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.630Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7b0ed10_ccd46_20', 'c_33a8bdd_ccd46', 'slot_7b0ed10_ccd46', 'Stol tennisi yigitlarga: 20-amaliy mashg‘ulot', '2027-02-22', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.630Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7b0ed10_ccd46_21', 'c_33a8bdd_ccd46', 'slot_7b0ed10_ccd46', 'Stol tennisi yigitlarga: 21-amaliy mashg‘ulot', '2027-03-01', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.630Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7b0ed10_ccd46_22', 'c_33a8bdd_ccd46', 'slot_7b0ed10_ccd46', 'Stol tennisi yigitlarga: 22-amaliy mashg‘ulot', '2027-03-08', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.630Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7b0ed10_ccd46_23', 'c_33a8bdd_ccd46', 'slot_7b0ed10_ccd46', 'Stol tennisi yigitlarga: 23-amaliy mashg‘ulot', '2027-03-15', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.630Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7b0ed10_ccd46_24', 'c_33a8bdd_ccd46', 'slot_7b0ed10_ccd46', 'Stol tennisi yigitlarga: 24-amaliy mashg‘ulot', '2027-03-22', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.630Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7b0ed10_ccd46_25', 'c_33a8bdd_ccd46', 'slot_7b0ed10_ccd46', 'Stol tennisi yigitlarga: 25-amaliy mashg‘ulot', '2027-03-29', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.630Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7b0ed10_ccd46_26', 'c_33a8bdd_ccd46', 'slot_7b0ed10_ccd46', 'Stol tennisi yigitlarga: 26-amaliy mashg‘ulot', '2027-04-05', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.630Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7b0ed10_ccd46_27', 'c_33a8bdd_ccd46', 'slot_7b0ed10_ccd46', 'Stol tennisi yigitlarga: 27-amaliy mashg‘ulot', '2027-04-12', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.630Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7b0ed10_ccd46_28', 'c_33a8bdd_ccd46', 'slot_7b0ed10_ccd46', 'Stol tennisi yigitlarga: 28-amaliy mashg‘ulot', '2027-04-19', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.630Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7b0ed10_ccd46_29', 'c_33a8bdd_ccd46', 'slot_7b0ed10_ccd46', 'Stol tennisi yigitlarga: 29-amaliy mashg‘ulot', '2027-04-26', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.630Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7b0ed10_ccd46_30', 'c_33a8bdd_ccd46', 'slot_7b0ed10_ccd46', 'Stol tennisi yigitlarga: 30-amaliy mashg‘ulot', '2027-05-03', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.630Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7b0ed10_ccd46_31', 'c_33a8bdd_ccd46', 'slot_7b0ed10_ccd46', 'Stol tennisi yigitlarga: 31-amaliy mashg‘ulot', '2027-05-10', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.630Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7b0ed10_ccd46_32', 'c_33a8bdd_ccd46', 'slot_7b0ed10_ccd46', 'Stol tennisi yigitlarga: 32-amaliy mashg‘ulot', '2027-05-17', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.630Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7b0ed10_ccd46_33', 'c_33a8bdd_ccd46', 'slot_7b0ed10_ccd46', 'Stol tennisi yigitlarga: 33-amaliy mashg‘ulot', '2027-05-24', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.630Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7b0ed10_ccd46_34', 'c_33a8bdd_ccd46', 'slot_7b0ed10_ccd46', 'Stol tennisi yigitlarga: 34-amaliy mashg‘ulot', '2027-05-31', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.630Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7b0ed10_ccd46_35', 'c_33a8bdd_ccd46', 'slot_7b0ed10_ccd46', 'Stol tennisi yigitlarga: 35-amaliy mashg‘ulot', '2027-06-07', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.630Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7b0ed10_ccd46_36', 'c_33a8bdd_ccd46', 'slot_7b0ed10_ccd46', 'Stol tennisi yigitlarga: 36-amaliy mashg‘ulot', '2027-06-14', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.630Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_7b0ed10_ccd46_37', 'c_33a8bdd_ccd46', 'slot_7b0ed10_ccd46', 'Stol tennisi yigitlarga: 37-amaliy mashg‘ulot', '2027-06-21', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.630Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_626d81c_ccd47_1', 'c_33a8bdd_ccd46', 'slot_626d81c_ccd47', 'Stol tennisi yigitlarga: 1-amaliy mashg‘ulot', '2026-10-07', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.631Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_626d81c_ccd47_2', 'c_33a8bdd_ccd46', 'slot_626d81c_ccd47', 'Stol tennisi yigitlarga: 2-amaliy mashg‘ulot', '2026-10-14', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.631Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_626d81c_ccd47_3', 'c_33a8bdd_ccd46', 'slot_626d81c_ccd47', 'Stol tennisi yigitlarga: 3-amaliy mashg‘ulot', '2026-10-21', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.631Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_626d81c_ccd47_4', 'c_33a8bdd_ccd46', 'slot_626d81c_ccd47', 'Stol tennisi yigitlarga: 4-amaliy mashg‘ulot', '2026-10-28', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.631Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_626d81c_ccd47_5', 'c_33a8bdd_ccd46', 'slot_626d81c_ccd47', 'Stol tennisi yigitlarga: 5-amaliy mashg‘ulot', '2026-11-04', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.631Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_626d81c_ccd47_6', 'c_33a8bdd_ccd46', 'slot_626d81c_ccd47', 'Stol tennisi yigitlarga: 6-amaliy mashg‘ulot', '2026-11-11', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.631Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_626d81c_ccd47_7', 'c_33a8bdd_ccd46', 'slot_626d81c_ccd47', 'Stol tennisi yigitlarga: 7-amaliy mashg‘ulot', '2026-11-18', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.631Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_626d81c_ccd47_8', 'c_33a8bdd_ccd46', 'slot_626d81c_ccd47', 'Stol tennisi yigitlarga: 8-amaliy mashg‘ulot', '2026-11-25', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.631Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_626d81c_ccd47_9', 'c_33a8bdd_ccd46', 'slot_626d81c_ccd47', 'Stol tennisi yigitlarga: 9-amaliy mashg‘ulot', '2026-12-02', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.631Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_626d81c_ccd47_10', 'c_33a8bdd_ccd46', 'slot_626d81c_ccd47', 'Stol tennisi yigitlarga: 10-amaliy mashg‘ulot', '2026-12-09', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.631Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_626d81c_ccd47_11', 'c_33a8bdd_ccd46', 'slot_626d81c_ccd47', 'Stol tennisi yigitlarga: 11-amaliy mashg‘ulot', '2026-12-16', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.631Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_626d81c_ccd47_12', 'c_33a8bdd_ccd46', 'slot_626d81c_ccd47', 'Stol tennisi yigitlarga: 12-amaliy mashg‘ulot', '2026-12-23', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.631Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_626d81c_ccd47_13', 'c_33a8bdd_ccd46', 'slot_626d81c_ccd47', 'Stol tennisi yigitlarga: 13-amaliy mashg‘ulot', '2026-12-30', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.631Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_626d81c_ccd47_14', 'c_33a8bdd_ccd46', 'slot_626d81c_ccd47', 'Stol tennisi yigitlarga: 14-amaliy mashg‘ulot', '2027-01-06', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.631Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_626d81c_ccd47_15', 'c_33a8bdd_ccd46', 'slot_626d81c_ccd47', 'Stol tennisi yigitlarga: 15-amaliy mashg‘ulot', '2027-01-13', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.631Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_626d81c_ccd47_16', 'c_33a8bdd_ccd46', 'slot_626d81c_ccd47', 'Stol tennisi yigitlarga: 16-amaliy mashg‘ulot', '2027-01-20', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.631Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_626d81c_ccd47_17', 'c_33a8bdd_ccd46', 'slot_626d81c_ccd47', 'Stol tennisi yigitlarga: 17-amaliy mashg‘ulot', '2027-01-27', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.631Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_626d81c_ccd47_18', 'c_33a8bdd_ccd46', 'slot_626d81c_ccd47', 'Stol tennisi yigitlarga: 18-amaliy mashg‘ulot', '2027-02-03', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.631Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_626d81c_ccd47_19', 'c_33a8bdd_ccd46', 'slot_626d81c_ccd47', 'Stol tennisi yigitlarga: 19-amaliy mashg‘ulot', '2027-02-10', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.631Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_626d81c_ccd47_20', 'c_33a8bdd_ccd46', 'slot_626d81c_ccd47', 'Stol tennisi yigitlarga: 20-amaliy mashg‘ulot', '2027-02-17', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.631Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_626d81c_ccd47_21', 'c_33a8bdd_ccd46', 'slot_626d81c_ccd47', 'Stol tennisi yigitlarga: 21-amaliy mashg‘ulot', '2027-02-24', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.631Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_626d81c_ccd47_22', 'c_33a8bdd_ccd46', 'slot_626d81c_ccd47', 'Stol tennisi yigitlarga: 22-amaliy mashg‘ulot', '2027-03-03', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.631Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_626d81c_ccd47_23', 'c_33a8bdd_ccd46', 'slot_626d81c_ccd47', 'Stol tennisi yigitlarga: 23-amaliy mashg‘ulot', '2027-03-10', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.631Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_626d81c_ccd47_24', 'c_33a8bdd_ccd46', 'slot_626d81c_ccd47', 'Stol tennisi yigitlarga: 24-amaliy mashg‘ulot', '2027-03-17', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.631Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_626d81c_ccd47_25', 'c_33a8bdd_ccd46', 'slot_626d81c_ccd47', 'Stol tennisi yigitlarga: 25-amaliy mashg‘ulot', '2027-03-24', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.631Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_626d81c_ccd47_26', 'c_33a8bdd_ccd46', 'slot_626d81c_ccd47', 'Stol tennisi yigitlarga: 26-amaliy mashg‘ulot', '2027-03-31', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.631Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_626d81c_ccd47_27', 'c_33a8bdd_ccd46', 'slot_626d81c_ccd47', 'Stol tennisi yigitlarga: 27-amaliy mashg‘ulot', '2027-04-07', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.631Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_626d81c_ccd47_28', 'c_33a8bdd_ccd46', 'slot_626d81c_ccd47', 'Stol tennisi yigitlarga: 28-amaliy mashg‘ulot', '2027-04-14', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.631Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_626d81c_ccd47_29', 'c_33a8bdd_ccd46', 'slot_626d81c_ccd47', 'Stol tennisi yigitlarga: 29-amaliy mashg‘ulot', '2027-04-21', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.631Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_626d81c_ccd47_30', 'c_33a8bdd_ccd46', 'slot_626d81c_ccd47', 'Stol tennisi yigitlarga: 30-amaliy mashg‘ulot', '2027-04-28', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.631Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_626d81c_ccd47_31', 'c_33a8bdd_ccd46', 'slot_626d81c_ccd47', 'Stol tennisi yigitlarga: 31-amaliy mashg‘ulot', '2027-05-05', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.631Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_626d81c_ccd47_32', 'c_33a8bdd_ccd46', 'slot_626d81c_ccd47', 'Stol tennisi yigitlarga: 32-amaliy mashg‘ulot', '2027-05-12', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.631Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_626d81c_ccd47_33', 'c_33a8bdd_ccd46', 'slot_626d81c_ccd47', 'Stol tennisi yigitlarga: 33-amaliy mashg‘ulot', '2027-05-19', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.631Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_626d81c_ccd47_34', 'c_33a8bdd_ccd46', 'slot_626d81c_ccd47', 'Stol tennisi yigitlarga: 34-amaliy mashg‘ulot', '2027-05-26', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.631Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_626d81c_ccd47_35', 'c_33a8bdd_ccd46', 'slot_626d81c_ccd47', 'Stol tennisi yigitlarga: 35-amaliy mashg‘ulot', '2027-06-02', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.631Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_626d81c_ccd47_36', 'c_33a8bdd_ccd46', 'slot_626d81c_ccd47', 'Stol tennisi yigitlarga: 36-amaliy mashg‘ulot', '2027-06-09', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.631Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_626d81c_ccd47_37', 'c_33a8bdd_ccd46', 'slot_626d81c_ccd47', 'Stol tennisi yigitlarga: 37-amaliy mashg‘ulot', '2027-06-16', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.631Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_626d81c_ccd47_38', 'c_33a8bdd_ccd46', 'slot_626d81c_ccd47', 'Stol tennisi yigitlarga: 38-amaliy mashg‘ulot', '2027-06-23', '15:00', '16:00', 'Sport zal', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:16:18.631Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_698d93a_b26bd_1', 'c_f702a75_b26bd', 'slot_698d93a_b26bd', 'Rus tili so''zlashuvi: 1-amaliy mashg‘ulot', '2026-10-06', '16:00', '17:00', 'TTJ faollar zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:31:59.037Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_698d93a_b26bd_2', 'c_f702a75_b26bd', 'slot_698d93a_b26bd', 'Rus tili so''zlashuvi: 2-amaliy mashg‘ulot', '2026-10-13', '16:00', '17:00', 'TTJ faollar zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:31:59.037Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_698d93a_b26bd_3', 'c_f702a75_b26bd', 'slot_698d93a_b26bd', 'Rus tili so''zlashuvi: 3-amaliy mashg‘ulot', '2026-10-20', '16:00', '17:00', 'TTJ faollar zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:31:59.037Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_698d93a_b26bd_4', 'c_f702a75_b26bd', 'slot_698d93a_b26bd', 'Rus tili so''zlashuvi: 4-amaliy mashg‘ulot', '2026-10-27', '16:00', '17:00', 'TTJ faollar zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:31:59.037Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_698d93a_b26bd_5', 'c_f702a75_b26bd', 'slot_698d93a_b26bd', 'Rus tili so''zlashuvi: 5-amaliy mashg‘ulot', '2026-11-03', '16:00', '17:00', 'TTJ faollar zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:31:59.037Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_698d93a_b26bd_6', 'c_f702a75_b26bd', 'slot_698d93a_b26bd', 'Rus tili so''zlashuvi: 6-amaliy mashg‘ulot', '2026-11-10', '16:00', '17:00', 'TTJ faollar zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:31:59.037Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_698d93a_b26bd_7', 'c_f702a75_b26bd', 'slot_698d93a_b26bd', 'Rus tili so''zlashuvi: 7-amaliy mashg‘ulot', '2026-11-17', '16:00', '17:00', 'TTJ faollar zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:31:59.037Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_698d93a_b26bd_8', 'c_f702a75_b26bd', 'slot_698d93a_b26bd', 'Rus tili so''zlashuvi: 8-amaliy mashg‘ulot', '2026-11-24', '16:00', '17:00', 'TTJ faollar zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:31:59.037Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_698d93a_b26bd_9', 'c_f702a75_b26bd', 'slot_698d93a_b26bd', 'Rus tili so''zlashuvi: 9-amaliy mashg‘ulot', '2026-12-01', '16:00', '17:00', 'TTJ faollar zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:31:59.037Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_698d93a_b26bd_10', 'c_f702a75_b26bd', 'slot_698d93a_b26bd', 'Rus tili so''zlashuvi: 10-amaliy mashg‘ulot', '2026-12-08', '16:00', '17:00', 'TTJ faollar zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:31:59.037Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_698d93a_b26bd_11', 'c_f702a75_b26bd', 'slot_698d93a_b26bd', 'Rus tili so''zlashuvi: 11-amaliy mashg‘ulot', '2026-12-15', '16:00', '17:00', 'TTJ faollar zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:31:59.037Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_698d93a_b26bd_12', 'c_f702a75_b26bd', 'slot_698d93a_b26bd', 'Rus tili so''zlashuvi: 12-amaliy mashg‘ulot', '2026-12-22', '16:00', '17:00', 'TTJ faollar zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:31:59.037Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_698d93a_b26bd_13', 'c_f702a75_b26bd', 'slot_698d93a_b26bd', 'Rus tili so''zlashuvi: 13-amaliy mashg‘ulot', '2026-12-29', '16:00', '17:00', 'TTJ faollar zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:31:59.037Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_698d93a_b26bd_14', 'c_f702a75_b26bd', 'slot_698d93a_b26bd', 'Rus tili so''zlashuvi: 14-amaliy mashg‘ulot', '2027-01-05', '16:00', '17:00', 'TTJ faollar zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:31:59.037Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_698d93a_b26bd_15', 'c_f702a75_b26bd', 'slot_698d93a_b26bd', 'Rus tili so''zlashuvi: 15-amaliy mashg‘ulot', '2027-01-12', '16:00', '17:00', 'TTJ faollar zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:31:59.037Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_698d93a_b26bd_16', 'c_f702a75_b26bd', 'slot_698d93a_b26bd', 'Rus tili so''zlashuvi: 16-amaliy mashg‘ulot', '2027-01-19', '16:00', '17:00', 'TTJ faollar zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:31:59.037Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_698d93a_b26bd_17', 'c_f702a75_b26bd', 'slot_698d93a_b26bd', 'Rus tili so''zlashuvi: 17-amaliy mashg‘ulot', '2027-01-26', '16:00', '17:00', 'TTJ faollar zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:31:59.037Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_698d93a_b26bd_18', 'c_f702a75_b26bd', 'slot_698d93a_b26bd', 'Rus tili so''zlashuvi: 18-amaliy mashg‘ulot', '2027-02-02', '16:00', '17:00', 'TTJ faollar zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:31:59.037Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_698d93a_b26bd_19', 'c_f702a75_b26bd', 'slot_698d93a_b26bd', 'Rus tili so''zlashuvi: 19-amaliy mashg‘ulot', '2027-02-09', '16:00', '17:00', 'TTJ faollar zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:31:59.037Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_698d93a_b26bd_20', 'c_f702a75_b26bd', 'slot_698d93a_b26bd', 'Rus tili so''zlashuvi: 20-amaliy mashg‘ulot', '2027-02-16', '16:00', '17:00', 'TTJ faollar zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:31:59.037Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_698d93a_b26bd_21', 'c_f702a75_b26bd', 'slot_698d93a_b26bd', 'Rus tili so''zlashuvi: 21-amaliy mashg‘ulot', '2027-02-23', '16:00', '17:00', 'TTJ faollar zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:31:59.037Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_698d93a_b26bd_22', 'c_f702a75_b26bd', 'slot_698d93a_b26bd', 'Rus tili so''zlashuvi: 22-amaliy mashg‘ulot', '2027-03-02', '16:00', '17:00', 'TTJ faollar zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:31:59.037Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_698d93a_b26bd_23', 'c_f702a75_b26bd', 'slot_698d93a_b26bd', 'Rus tili so''zlashuvi: 23-amaliy mashg‘ulot', '2027-03-09', '16:00', '17:00', 'TTJ faollar zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:31:59.037Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_698d93a_b26bd_24', 'c_f702a75_b26bd', 'slot_698d93a_b26bd', 'Rus tili so''zlashuvi: 24-amaliy mashg‘ulot', '2027-03-16', '16:00', '17:00', 'TTJ faollar zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:31:59.037Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_698d93a_b26bd_25', 'c_f702a75_b26bd', 'slot_698d93a_b26bd', 'Rus tili so''zlashuvi: 25-amaliy mashg‘ulot', '2027-03-23', '16:00', '17:00', 'TTJ faollar zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:31:59.037Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_698d93a_b26bd_26', 'c_f702a75_b26bd', 'slot_698d93a_b26bd', 'Rus tili so''zlashuvi: 26-amaliy mashg‘ulot', '2027-03-30', '16:00', '17:00', 'TTJ faollar zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:31:59.037Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_698d93a_b26bd_27', 'c_f702a75_b26bd', 'slot_698d93a_b26bd', 'Rus tili so''zlashuvi: 27-amaliy mashg‘ulot', '2027-04-06', '16:00', '17:00', 'TTJ faollar zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:31:59.037Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_698d93a_b26bd_28', 'c_f702a75_b26bd', 'slot_698d93a_b26bd', 'Rus tili so''zlashuvi: 28-amaliy mashg‘ulot', '2027-04-13', '16:00', '17:00', 'TTJ faollar zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:31:59.037Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_698d93a_b26bd_29', 'c_f702a75_b26bd', 'slot_698d93a_b26bd', 'Rus tili so''zlashuvi: 29-amaliy mashg‘ulot', '2027-04-20', '16:00', '17:00', 'TTJ faollar zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:31:59.037Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_698d93a_b26bd_30', 'c_f702a75_b26bd', 'slot_698d93a_b26bd', 'Rus tili so''zlashuvi: 30-amaliy mashg‘ulot', '2027-04-27', '16:00', '17:00', 'TTJ faollar zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:31:59.037Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_698d93a_b26bd_31', 'c_f702a75_b26bd', 'slot_698d93a_b26bd', 'Rus tili so''zlashuvi: 31-amaliy mashg‘ulot', '2027-05-04', '16:00', '17:00', 'TTJ faollar zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:31:59.037Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_698d93a_b26bd_32', 'c_f702a75_b26bd', 'slot_698d93a_b26bd', 'Rus tili so''zlashuvi: 32-amaliy mashg‘ulot', '2027-05-11', '16:00', '17:00', 'TTJ faollar zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:31:59.037Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_698d93a_b26bd_33', 'c_f702a75_b26bd', 'slot_698d93a_b26bd', 'Rus tili so''zlashuvi: 33-amaliy mashg‘ulot', '2027-05-18', '16:00', '17:00', 'TTJ faollar zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:31:59.037Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_698d93a_b26bd_34', 'c_f702a75_b26bd', 'slot_698d93a_b26bd', 'Rus tili so''zlashuvi: 34-amaliy mashg‘ulot', '2027-05-25', '16:00', '17:00', 'TTJ faollar zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:31:59.037Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_698d93a_b26bd_35', 'c_f702a75_b26bd', 'slot_698d93a_b26bd', 'Rus tili so''zlashuvi: 35-amaliy mashg‘ulot', '2027-06-01', '16:00', '17:00', 'TTJ faollar zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:31:59.037Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_698d93a_b26bd_36', 'c_f702a75_b26bd', 'slot_698d93a_b26bd', 'Rus tili so''zlashuvi: 36-amaliy mashg‘ulot', '2027-06-08', '16:00', '17:00', 'TTJ faollar zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:31:59.037Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_698d93a_b26bd_37', 'c_f702a75_b26bd', 'slot_698d93a_b26bd', 'Rus tili so''zlashuvi: 37-amaliy mashg‘ulot', '2027-06-15', '16:00', '17:00', 'TTJ faollar zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:31:59.037Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_698d93a_b26bd_38', 'c_f702a75_b26bd', 'slot_698d93a_b26bd', 'Rus tili so''zlashuvi: 38-amaliy mashg‘ulot', '2027-06-22', '16:00', '17:00', 'TTJ faollar zalida', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:31:59.037Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_f244b58_d5594_1', 'c_80a1dc2_d5594', 'slot_f244b58_d5594', 'Manfaatli mutolaa: 1-amaliy mashg‘ulot', '2026-10-01', '15:00', '16:00', 'ARM', 'held', '1-mashg''ulot e''lon berish', 15, 'Tursinmatova Ruxshona Farhodjon qizi', NULL, 'https://t.me/namsiflBT/11552', '2026-10-03T09:53:31.609Z', '2026-10-03T09:51:50.676Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_f244b58_d5594_2', 'c_80a1dc2_d5594', 'slot_f244b58_d5594', 'Manfaatli mutolaa: 2-amaliy mashg‘ulot', '2026-10-08', '15:00', '16:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:51:50.676Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_f244b58_d5594_3', 'c_80a1dc2_d5594', 'slot_f244b58_d5594', 'Manfaatli mutolaa: 3-amaliy mashg‘ulot', '2026-10-15', '15:00', '16:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:51:50.676Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_f244b58_d5594_4', 'c_80a1dc2_d5594', 'slot_f244b58_d5594', 'Manfaatli mutolaa: 4-amaliy mashg‘ulot', '2026-10-22', '15:00', '16:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:51:50.676Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_f244b58_d5594_5', 'c_80a1dc2_d5594', 'slot_f244b58_d5594', 'Manfaatli mutolaa: 5-amaliy mashg‘ulot', '2026-10-29', '15:00', '16:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:51:50.676Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_f244b58_d5594_6', 'c_80a1dc2_d5594', 'slot_f244b58_d5594', 'Manfaatli mutolaa: 6-amaliy mashg‘ulot', '2026-11-05', '15:00', '16:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:51:50.676Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_f244b58_d5594_7', 'c_80a1dc2_d5594', 'slot_f244b58_d5594', 'Manfaatli mutolaa: 7-amaliy mashg‘ulot', '2026-11-12', '15:00', '16:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:51:50.676Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_f244b58_d5594_8', 'c_80a1dc2_d5594', 'slot_f244b58_d5594', 'Manfaatli mutolaa: 8-amaliy mashg‘ulot', '2026-11-19', '15:00', '16:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:51:50.676Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_f244b58_d5594_9', 'c_80a1dc2_d5594', 'slot_f244b58_d5594', 'Manfaatli mutolaa: 9-amaliy mashg‘ulot', '2026-11-26', '15:00', '16:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:51:50.676Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_f244b58_d5594_10', 'c_80a1dc2_d5594', 'slot_f244b58_d5594', 'Manfaatli mutolaa: 10-amaliy mashg‘ulot', '2026-12-03', '15:00', '16:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:51:50.676Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_f244b58_d5594_11', 'c_80a1dc2_d5594', 'slot_f244b58_d5594', 'Manfaatli mutolaa: 11-amaliy mashg‘ulot', '2026-12-10', '15:00', '16:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:51:50.676Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_f244b58_d5594_12', 'c_80a1dc2_d5594', 'slot_f244b58_d5594', 'Manfaatli mutolaa: 12-amaliy mashg‘ulot', '2026-12-17', '15:00', '16:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:51:50.676Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_f244b58_d5594_13', 'c_80a1dc2_d5594', 'slot_f244b58_d5594', 'Manfaatli mutolaa: 13-amaliy mashg‘ulot', '2026-12-24', '15:00', '16:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:51:50.676Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_f244b58_d5594_14', 'c_80a1dc2_d5594', 'slot_f244b58_d5594', 'Manfaatli mutolaa: 14-amaliy mashg‘ulot', '2026-12-31', '15:00', '16:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:51:50.676Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_f244b58_d5594_15', 'c_80a1dc2_d5594', 'slot_f244b58_d5594', 'Manfaatli mutolaa: 15-amaliy mashg‘ulot', '2027-01-07', '15:00', '16:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:51:50.676Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_f244b58_d5594_16', 'c_80a1dc2_d5594', 'slot_f244b58_d5594', 'Manfaatli mutolaa: 16-amaliy mashg‘ulot', '2027-01-14', '15:00', '16:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:51:50.676Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_f244b58_d5594_17', 'c_80a1dc2_d5594', 'slot_f244b58_d5594', 'Manfaatli mutolaa: 17-amaliy mashg‘ulot', '2027-01-21', '15:00', '16:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:51:50.676Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_f244b58_d5594_18', 'c_80a1dc2_d5594', 'slot_f244b58_d5594', 'Manfaatli mutolaa: 18-amaliy mashg‘ulot', '2027-01-28', '15:00', '16:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:51:50.676Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_f244b58_d5594_19', 'c_80a1dc2_d5594', 'slot_f244b58_d5594', 'Manfaatli mutolaa: 19-amaliy mashg‘ulot', '2027-02-04', '15:00', '16:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:51:50.676Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_f244b58_d5594_20', 'c_80a1dc2_d5594', 'slot_f244b58_d5594', 'Manfaatli mutolaa: 20-amaliy mashg‘ulot', '2027-02-11', '15:00', '16:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:51:50.676Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_f244b58_d5594_21', 'c_80a1dc2_d5594', 'slot_f244b58_d5594', 'Manfaatli mutolaa: 21-amaliy mashg‘ulot', '2027-02-18', '15:00', '16:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:51:50.676Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_f244b58_d5594_22', 'c_80a1dc2_d5594', 'slot_f244b58_d5594', 'Manfaatli mutolaa: 22-amaliy mashg‘ulot', '2027-02-25', '15:00', '16:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:51:50.676Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_f244b58_d5594_23', 'c_80a1dc2_d5594', 'slot_f244b58_d5594', 'Manfaatli mutolaa: 23-amaliy mashg‘ulot', '2027-03-04', '15:00', '16:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:51:50.676Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_f244b58_d5594_24', 'c_80a1dc2_d5594', 'slot_f244b58_d5594', 'Manfaatli mutolaa: 24-amaliy mashg‘ulot', '2027-03-11', '15:00', '16:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:51:50.676Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_f244b58_d5594_25', 'c_80a1dc2_d5594', 'slot_f244b58_d5594', 'Manfaatli mutolaa: 25-amaliy mashg‘ulot', '2027-03-18', '15:00', '16:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:51:50.676Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_f244b58_d5594_26', 'c_80a1dc2_d5594', 'slot_f244b58_d5594', 'Manfaatli mutolaa: 26-amaliy mashg‘ulot', '2027-03-25', '15:00', '16:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:51:50.676Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_f244b58_d5594_27', 'c_80a1dc2_d5594', 'slot_f244b58_d5594', 'Manfaatli mutolaa: 27-amaliy mashg‘ulot', '2027-04-01', '15:00', '16:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:51:50.676Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_f244b58_d5594_28', 'c_80a1dc2_d5594', 'slot_f244b58_d5594', 'Manfaatli mutolaa: 28-amaliy mashg‘ulot', '2027-04-08', '15:00', '16:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:51:50.676Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_f244b58_d5594_29', 'c_80a1dc2_d5594', 'slot_f244b58_d5594', 'Manfaatli mutolaa: 29-amaliy mashg‘ulot', '2027-04-15', '15:00', '16:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:51:50.676Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_f244b58_d5594_30', 'c_80a1dc2_d5594', 'slot_f244b58_d5594', 'Manfaatli mutolaa: 30-amaliy mashg‘ulot', '2027-04-22', '15:00', '16:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:51:50.676Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_f244b58_d5594_31', 'c_80a1dc2_d5594', 'slot_f244b58_d5594', 'Manfaatli mutolaa: 31-amaliy mashg‘ulot', '2027-04-29', '15:00', '16:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:51:50.676Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_f244b58_d5594_32', 'c_80a1dc2_d5594', 'slot_f244b58_d5594', 'Manfaatli mutolaa: 32-amaliy mashg‘ulot', '2027-05-06', '15:00', '16:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:51:50.676Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_f244b58_d5594_33', 'c_80a1dc2_d5594', 'slot_f244b58_d5594', 'Manfaatli mutolaa: 33-amaliy mashg‘ulot', '2027-05-13', '15:00', '16:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:51:50.676Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_f244b58_d5594_34', 'c_80a1dc2_d5594', 'slot_f244b58_d5594', 'Manfaatli mutolaa: 34-amaliy mashg‘ulot', '2027-05-20', '15:00', '16:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:51:50.676Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_f244b58_d5594_35', 'c_80a1dc2_d5594', 'slot_f244b58_d5594', 'Manfaatli mutolaa: 35-amaliy mashg‘ulot', '2027-05-27', '15:00', '16:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:51:50.676Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_f244b58_d5594_36', 'c_80a1dc2_d5594', 'slot_f244b58_d5594', 'Manfaatli mutolaa: 36-amaliy mashg‘ulot', '2027-06-03', '15:00', '16:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:51:50.676Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_f244b58_d5594_37', 'c_80a1dc2_d5594', 'slot_f244b58_d5594', 'Manfaatli mutolaa: 37-amaliy mashg‘ulot', '2027-06-10', '15:00', '16:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:51:50.676Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_f244b58_d5594_38', 'c_80a1dc2_d5594', 'slot_f244b58_d5594', 'Manfaatli mutolaa: 38-amaliy mashg‘ulot', '2027-06-17', '15:00', '16:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:51:50.676Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_f244b58_d5594_39', 'c_80a1dc2_d5594', 'slot_f244b58_d5594', 'Manfaatli mutolaa: 39-amaliy mashg‘ulot', '2027-06-24', '15:00', '16:00', 'ARM', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-03T09:51:50.676Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ad5624e_71920_1', 'c_4190d91_71920', 'slot_ad5624e_71920', 'Volshebniye ruki: 1-amaliy mashg‘ulot', '2026-09-29', '12:00', '13:00', '506', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-05T10:41:02.752Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ad5624e_71920_2', 'c_4190d91_71920', 'slot_ad5624e_71920', 'Volshebniye ruki: 2-amaliy mashg‘ulot', '2026-10-06', '12:00', '13:00', '506', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-05T10:41:02.752Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ad5624e_71920_3', 'c_4190d91_71920', 'slot_ad5624e_71920', 'Volshebniye ruki: 3-amaliy mashg‘ulot', '2026-10-13', '12:00', '13:00', '506', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-05T10:41:02.752Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ad5624e_71920_4', 'c_4190d91_71920', 'slot_ad5624e_71920', 'Volshebniye ruki: 4-amaliy mashg‘ulot', '2026-10-20', '12:00', '13:00', '506', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-05T10:41:02.752Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ad5624e_71920_5', 'c_4190d91_71920', 'slot_ad5624e_71920', 'Volshebniye ruki: 5-amaliy mashg‘ulot', '2026-10-27', '12:00', '13:00', '506', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-05T10:41:02.752Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ad5624e_71920_6', 'c_4190d91_71920', 'slot_ad5624e_71920', 'Volshebniye ruki: 6-amaliy mashg‘ulot', '2026-11-03', '12:00', '13:00', '506', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-05T10:41:02.752Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ad5624e_71920_7', 'c_4190d91_71920', 'slot_ad5624e_71920', 'Volshebniye ruki: 7-amaliy mashg‘ulot', '2026-11-10', '12:00', '13:00', '506', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-05T10:41:02.752Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ad5624e_71920_8', 'c_4190d91_71920', 'slot_ad5624e_71920', 'Volshebniye ruki: 8-amaliy mashg‘ulot', '2026-11-17', '12:00', '13:00', '506', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-05T10:41:02.752Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ad5624e_71920_9', 'c_4190d91_71920', 'slot_ad5624e_71920', 'Volshebniye ruki: 9-amaliy mashg‘ulot', '2026-11-24', '12:00', '13:00', '506', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-05T10:41:02.752Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ad5624e_71920_10', 'c_4190d91_71920', 'slot_ad5624e_71920', 'Volshebniye ruki: 10-amaliy mashg‘ulot', '2026-12-01', '12:00', '13:00', '506', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-05T10:41:02.752Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ad5624e_71920_11', 'c_4190d91_71920', 'slot_ad5624e_71920', 'Volshebniye ruki: 11-amaliy mashg‘ulot', '2026-12-08', '12:00', '13:00', '506', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-05T10:41:02.752Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ad5624e_71920_12', 'c_4190d91_71920', 'slot_ad5624e_71920', 'Volshebniye ruki: 12-amaliy mashg‘ulot', '2026-12-15', '12:00', '13:00', '506', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-05T10:41:02.752Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ad5624e_71920_13', 'c_4190d91_71920', 'slot_ad5624e_71920', 'Volshebniye ruki: 13-amaliy mashg‘ulot', '2026-12-22', '12:00', '13:00', '506', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-05T10:41:02.752Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ad5624e_71920_14', 'c_4190d91_71920', 'slot_ad5624e_71920', 'Volshebniye ruki: 14-amaliy mashg‘ulot', '2026-12-29', '12:00', '13:00', '506', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-05T10:41:02.752Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ad5624e_71920_15', 'c_4190d91_71920', 'slot_ad5624e_71920', 'Volshebniye ruki: 15-amaliy mashg‘ulot', '2027-01-05', '12:00', '13:00', '506', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-05T10:41:02.752Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ad5624e_71920_16', 'c_4190d91_71920', 'slot_ad5624e_71920', 'Volshebniye ruki: 16-amaliy mashg‘ulot', '2027-01-12', '12:00', '13:00', '506', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-05T10:41:02.752Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ad5624e_71920_17', 'c_4190d91_71920', 'slot_ad5624e_71920', 'Volshebniye ruki: 17-amaliy mashg‘ulot', '2027-01-19', '12:00', '13:00', '506', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-05T10:41:02.752Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ad5624e_71920_18', 'c_4190d91_71920', 'slot_ad5624e_71920', 'Volshebniye ruki: 18-amaliy mashg‘ulot', '2027-01-26', '12:00', '13:00', '506', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-05T10:41:02.752Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ad5624e_71920_19', 'c_4190d91_71920', 'slot_ad5624e_71920', 'Volshebniye ruki: 19-amaliy mashg‘ulot', '2027-02-02', '12:00', '13:00', '506', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-05T10:41:02.752Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ad5624e_71920_20', 'c_4190d91_71920', 'slot_ad5624e_71920', 'Volshebniye ruki: 20-amaliy mashg‘ulot', '2027-02-09', '12:00', '13:00', '506', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-05T10:41:02.752Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ad5624e_71920_21', 'c_4190d91_71920', 'slot_ad5624e_71920', 'Volshebniye ruki: 21-amaliy mashg‘ulot', '2027-02-16', '12:00', '13:00', '506', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-05T10:41:02.752Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ad5624e_71920_22', 'c_4190d91_71920', 'slot_ad5624e_71920', 'Volshebniye ruki: 22-amaliy mashg‘ulot', '2027-02-23', '12:00', '13:00', '506', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-05T10:41:02.752Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ad5624e_71920_23', 'c_4190d91_71920', 'slot_ad5624e_71920', 'Volshebniye ruki: 23-amaliy mashg‘ulot', '2027-03-02', '12:00', '13:00', '506', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-05T10:41:02.752Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ad5624e_71920_24', 'c_4190d91_71920', 'slot_ad5624e_71920', 'Volshebniye ruki: 24-amaliy mashg‘ulot', '2027-03-09', '12:00', '13:00', '506', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-05T10:41:02.752Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ad5624e_71920_25', 'c_4190d91_71920', 'slot_ad5624e_71920', 'Volshebniye ruki: 25-amaliy mashg‘ulot', '2027-03-16', '12:00', '13:00', '506', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-05T10:41:02.752Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ad5624e_71920_26', 'c_4190d91_71920', 'slot_ad5624e_71920', 'Volshebniye ruki: 26-amaliy mashg‘ulot', '2027-03-23', '12:00', '13:00', '506', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-05T10:41:02.752Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ad5624e_71920_27', 'c_4190d91_71920', 'slot_ad5624e_71920', 'Volshebniye ruki: 27-amaliy mashg‘ulot', '2027-03-30', '12:00', '13:00', '506', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-05T10:41:02.752Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ad5624e_71920_28', 'c_4190d91_71920', 'slot_ad5624e_71920', 'Volshebniye ruki: 28-amaliy mashg‘ulot', '2027-04-06', '12:00', '13:00', '506', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-05T10:41:02.752Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ad5624e_71920_29', 'c_4190d91_71920', 'slot_ad5624e_71920', 'Volshebniye ruki: 29-amaliy mashg‘ulot', '2027-04-13', '12:00', '13:00', '506', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-05T10:41:02.752Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ad5624e_71920_30', 'c_4190d91_71920', 'slot_ad5624e_71920', 'Volshebniye ruki: 30-amaliy mashg‘ulot', '2027-04-20', '12:00', '13:00', '506', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-05T10:41:02.752Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ad5624e_71920_31', 'c_4190d91_71920', 'slot_ad5624e_71920', 'Volshebniye ruki: 31-amaliy mashg‘ulot', '2027-04-27', '12:00', '13:00', '506', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-05T10:41:02.752Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ad5624e_71920_32', 'c_4190d91_71920', 'slot_ad5624e_71920', 'Volshebniye ruki: 32-amaliy mashg‘ulot', '2027-05-04', '12:00', '13:00', '506', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-05T10:41:02.752Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ad5624e_71920_33', 'c_4190d91_71920', 'slot_ad5624e_71920', 'Volshebniye ruki: 33-amaliy mashg‘ulot', '2027-05-11', '12:00', '13:00', '506', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-05T10:41:02.752Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ad5624e_71920_34', 'c_4190d91_71920', 'slot_ad5624e_71920', 'Volshebniye ruki: 34-amaliy mashg‘ulot', '2027-05-18', '12:00', '13:00', '506', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-05T10:41:02.752Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ad5624e_71920_35', 'c_4190d91_71920', 'slot_ad5624e_71920', 'Volshebniye ruki: 35-amaliy mashg‘ulot', '2027-05-25', '12:00', '13:00', '506', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-05T10:41:02.752Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ad5624e_71920_36', 'c_4190d91_71920', 'slot_ad5624e_71920', 'Volshebniye ruki: 36-amaliy mashg‘ulot', '2027-06-01', '12:00', '13:00', '506', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-05T10:41:02.752Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ad5624e_71920_37', 'c_4190d91_71920', 'slot_ad5624e_71920', 'Volshebniye ruki: 37-amaliy mashg‘ulot', '2027-06-08', '12:00', '13:00', '506', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-05T10:41:02.752Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ad5624e_71920_38', 'c_4190d91_71920', 'slot_ad5624e_71920', 'Volshebniye ruki: 38-amaliy mashg‘ulot', '2027-06-15', '12:00', '13:00', '506', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-05T10:41:02.752Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_ad5624e_71920_39', 'c_4190d91_71920', 'slot_ad5624e_71920', 'Volshebniye ruki: 39-amaliy mashg‘ulot', '2027-06-22', '12:00', '13:00', '506', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-05T10:41:02.752Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_dc91677_65544_1', 'c_c272675_65543', 'slot_dc91677_65544', 'AI START: 1-amaliy mashg‘ulot', '2026-09-29', '12:00', '12:30', 'KARYERA MARKAZIDA', 'held', 'Tanishtiruv', 15, 'Nafisa Sotiboldiyeva', NULL, 'https://t.me/namsiflBT/11650?single', '2026-10-06T17:34:11.903Z', '2026-10-06T17:32:41.668Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_dc91677_65544_2', 'c_c272675_65543', 'slot_dc91677_65544', 'AI START: 2-amaliy mashg‘ulot', '2026-10-06', '12:00', '12:30', 'KARYERA MARKAZIDA', 'held', 'Promt yozish', 15, 'Nafisa Sotiboldiyeva', NULL, 'https://t.me/manaviyat_namSIFL/35290?single', '2026-10-06T17:34:43.192Z', '2026-10-06T17:32:41.668Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_dc91677_65544_3', 'c_c272675_65543', 'slot_dc91677_65544', 'AI START: 3-amaliy mashg‘ulot', '2026-10-13', '12:00', '12:30', 'KARYERA MARKAZIDA', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-06T17:32:41.668Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_dc91677_65544_4', 'c_c272675_65543', 'slot_dc91677_65544', 'AI START: 4-amaliy mashg‘ulot', '2026-10-20', '12:00', '12:30', 'KARYERA MARKAZIDA', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-06T17:32:41.668Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_dc91677_65544_5', 'c_c272675_65543', 'slot_dc91677_65544', 'AI START: 5-amaliy mashg‘ulot', '2026-10-27', '12:00', '12:30', 'KARYERA MARKAZIDA', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-06T17:32:41.668Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_dc91677_65544_6', 'c_c272675_65543', 'slot_dc91677_65544', 'AI START: 6-amaliy mashg‘ulot', '2026-11-03', '12:00', '12:30', 'KARYERA MARKAZIDA', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-06T17:32:41.668Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_dc91677_65544_7', 'c_c272675_65543', 'slot_dc91677_65544', 'AI START: 7-amaliy mashg‘ulot', '2026-11-10', '12:00', '12:30', 'KARYERA MARKAZIDA', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-06T17:32:41.668Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_dc91677_65544_8', 'c_c272675_65543', 'slot_dc91677_65544', 'AI START: 8-amaliy mashg‘ulot', '2026-11-17', '12:00', '12:30', 'KARYERA MARKAZIDA', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-06T17:32:41.668Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_dc91677_65544_9', 'c_c272675_65543', 'slot_dc91677_65544', 'AI START: 9-amaliy mashg‘ulot', '2026-11-24', '12:00', '12:30', 'KARYERA MARKAZIDA', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-06T17:32:41.668Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_dc91677_65544_10', 'c_c272675_65543', 'slot_dc91677_65544', 'AI START: 10-amaliy mashg‘ulot', '2026-12-01', '12:00', '12:30', 'KARYERA MARKAZIDA', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-06T17:32:41.668Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_dc91677_65544_11', 'c_c272675_65543', 'slot_dc91677_65544', 'AI START: 11-amaliy mashg‘ulot', '2026-12-08', '12:00', '12:30', 'KARYERA MARKAZIDA', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-06T17:32:41.668Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_dc91677_65544_12', 'c_c272675_65543', 'slot_dc91677_65544', 'AI START: 12-amaliy mashg‘ulot', '2026-12-15', '12:00', '12:30', 'KARYERA MARKAZIDA', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-06T17:32:41.668Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_dc91677_65544_13', 'c_c272675_65543', 'slot_dc91677_65544', 'AI START: 13-amaliy mashg‘ulot', '2026-12-22', '12:00', '12:30', 'KARYERA MARKAZIDA', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-06T17:32:41.668Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_dc91677_65544_14', 'c_c272675_65543', 'slot_dc91677_65544', 'AI START: 14-amaliy mashg‘ulot', '2026-12-29', '12:00', '12:30', 'KARYERA MARKAZIDA', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-06T17:32:41.668Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_dc91677_65544_15', 'c_c272675_65543', 'slot_dc91677_65544', 'AI START: 15-amaliy mashg‘ulot', '2027-01-05', '12:00', '12:30', 'KARYERA MARKAZIDA', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-06T17:32:41.668Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_dc91677_65544_16', 'c_c272675_65543', 'slot_dc91677_65544', 'AI START: 16-amaliy mashg‘ulot', '2027-01-12', '12:00', '12:30', 'KARYERA MARKAZIDA', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-06T17:32:41.668Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_dc91677_65544_17', 'c_c272675_65543', 'slot_dc91677_65544', 'AI START: 17-amaliy mashg‘ulot', '2027-01-19', '12:00', '12:30', 'KARYERA MARKAZIDA', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-06T17:32:41.668Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_dc91677_65544_18', 'c_c272675_65543', 'slot_dc91677_65544', 'AI START: 18-amaliy mashg‘ulot', '2027-01-26', '12:00', '12:30', 'KARYERA MARKAZIDA', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-06T17:32:41.668Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_dc91677_65544_19', 'c_c272675_65543', 'slot_dc91677_65544', 'AI START: 19-amaliy mashg‘ulot', '2027-02-02', '12:00', '12:30', 'KARYERA MARKAZIDA', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-06T17:32:41.668Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_dc91677_65544_20', 'c_c272675_65543', 'slot_dc91677_65544', 'AI START: 20-amaliy mashg‘ulot', '2027-02-09', '12:00', '12:30', 'KARYERA MARKAZIDA', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-06T17:32:41.668Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_dc91677_65544_21', 'c_c272675_65543', 'slot_dc91677_65544', 'AI START: 21-amaliy mashg‘ulot', '2027-02-16', '12:00', '12:30', 'KARYERA MARKAZIDA', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-06T17:32:41.668Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_dc91677_65544_22', 'c_c272675_65543', 'slot_dc91677_65544', 'AI START: 22-amaliy mashg‘ulot', '2027-02-23', '12:00', '12:30', 'KARYERA MARKAZIDA', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-06T17:32:41.668Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_dc91677_65544_23', 'c_c272675_65543', 'slot_dc91677_65544', 'AI START: 23-amaliy mashg‘ulot', '2027-03-02', '12:00', '12:30', 'KARYERA MARKAZIDA', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-06T17:32:41.668Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_dc91677_65544_24', 'c_c272675_65543', 'slot_dc91677_65544', 'AI START: 24-amaliy mashg‘ulot', '2027-03-09', '12:00', '12:30', 'KARYERA MARKAZIDA', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-06T17:32:41.668Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_dc91677_65544_25', 'c_c272675_65543', 'slot_dc91677_65544', 'AI START: 25-amaliy mashg‘ulot', '2027-03-16', '12:00', '12:30', 'KARYERA MARKAZIDA', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-06T17:32:41.668Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_dc91677_65544_26', 'c_c272675_65543', 'slot_dc91677_65544', 'AI START: 26-amaliy mashg‘ulot', '2027-03-23', '12:00', '12:30', 'KARYERA MARKAZIDA', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-06T17:32:41.668Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_dc91677_65544_27', 'c_c272675_65543', 'slot_dc91677_65544', 'AI START: 27-amaliy mashg‘ulot', '2027-03-30', '12:00', '12:30', 'KARYERA MARKAZIDA', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-06T17:32:41.668Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_dc91677_65544_28', 'c_c272675_65543', 'slot_dc91677_65544', 'AI START: 28-amaliy mashg‘ulot', '2027-04-06', '12:00', '12:30', 'KARYERA MARKAZIDA', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-06T17:32:41.668Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_dc91677_65544_29', 'c_c272675_65543', 'slot_dc91677_65544', 'AI START: 29-amaliy mashg‘ulot', '2027-04-13', '12:00', '12:30', 'KARYERA MARKAZIDA', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-06T17:32:41.668Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_dc91677_65544_30', 'c_c272675_65543', 'slot_dc91677_65544', 'AI START: 30-amaliy mashg‘ulot', '2027-04-20', '12:00', '12:30', 'KARYERA MARKAZIDA', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-06T17:32:41.668Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_dc91677_65544_31', 'c_c272675_65543', 'slot_dc91677_65544', 'AI START: 31-amaliy mashg‘ulot', '2027-04-27', '12:00', '12:30', 'KARYERA MARKAZIDA', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-06T17:32:41.668Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_dc91677_65544_32', 'c_c272675_65543', 'slot_dc91677_65544', 'AI START: 32-amaliy mashg‘ulot', '2027-05-04', '12:00', '12:30', 'KARYERA MARKAZIDA', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-06T17:32:41.668Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_dc91677_65544_33', 'c_c272675_65543', 'slot_dc91677_65544', 'AI START: 33-amaliy mashg‘ulot', '2027-05-11', '12:00', '12:30', 'KARYERA MARKAZIDA', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-06T17:32:41.668Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_dc91677_65544_34', 'c_c272675_65543', 'slot_dc91677_65544', 'AI START: 34-amaliy mashg‘ulot', '2027-05-18', '12:00', '12:30', 'KARYERA MARKAZIDA', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-06T17:32:41.668Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_dc91677_65544_35', 'c_c272675_65543', 'slot_dc91677_65544', 'AI START: 35-amaliy mashg‘ulot', '2027-05-25', '12:00', '12:30', 'KARYERA MARKAZIDA', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-06T17:32:41.668Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_dc91677_65544_36', 'c_c272675_65543', 'slot_dc91677_65544', 'AI START: 36-amaliy mashg‘ulot', '2027-06-01', '12:00', '12:30', 'KARYERA MARKAZIDA', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-06T17:32:41.668Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_dc91677_65544_37', 'c_c272675_65543', 'slot_dc91677_65544', 'AI START: 37-amaliy mashg‘ulot', '2027-06-08', '12:00', '12:30', 'KARYERA MARKAZIDA', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-06T17:32:41.668Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_dc91677_65544_38', 'c_c272675_65543', 'slot_dc91677_65544', 'AI START: 38-amaliy mashg‘ulot', '2027-06-15', '12:00', '12:30', 'KARYERA MARKAZIDA', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-06T17:32:41.668Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

INSERT INTO public.club_sessions (id, club_id, slot_id, topic, date, time, time_end, location, status, held_note, attendee_count, conductor_name, photo_file_id, telegram_link, held_date, created_at)
VALUES ('ses_slot_dc91677_65544_39', 'c_c272675_65543', 'slot_dc91677_65544', 'AI START: 39-amaliy mashg‘ulot', '2027-06-22', '12:00', '12:30', 'KARYERA MARKAZIDA', 'planned', '', NULL, NULL, NULL, NULL, NULL, '2026-10-06T17:32:41.668Z')
ON CONFLICT (id) DO UPDATE SET
  club_id = EXCLUDED.club_id,
  slot_id = EXCLUDED.slot_id,
  topic = EXCLUDED.topic,
  date = EXCLUDED.date,
  time = EXCLUDED.time,
  time_end = EXCLUDED.time_end,
  location = EXCLUDED.location,
  status = EXCLUDED.status,
  held_note = EXCLUDED.held_note,
  attendee_count = EXCLUDED.attendee_count,
  conductor_name = EXCLUDED.conductor_name,
  photo_file_id = EXCLUDED.photo_file_id,
  telegram_link = EXCLUDED.telegram_link,
  held_date = EXCLUDED.held_date;

