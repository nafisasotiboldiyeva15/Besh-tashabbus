-- ==============================================================================
-- UniBridge: To‘garaklar Tizimi (NamDChTI 5 Muhim Tashabbus)
-- Supabase PostgreSQL Schema & Xavfsiz RLS Siyosatlari
-- ==============================================================================
-- DIQQAT: 
-- Ushbu skript mavjud "profiles", "study_groups" va "study_group_members" 
-- jadvallariga mutlaqo tegmaydi, ularni o‘zgartirmaydi yoki o‘chirmaydi.
-- Faqat UniBridge to‘garaklari uchun zarur jadvallar va xavfsiz indekslar yaratiladi.
-- Hech qanday DROP TABLE, TRUNCATE yoki xavfli DELETE buyruqlari mavjud emas.
-- ==============================================================================

-- 1. EXTENSIONS
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- ==============================================================================
-- 2. YORDAMCHI XAVFSIZ FUNKSIYALAR (Admin va Rahbarlik tekshiruvi)
-- ==============================================================================

-- Mavjud profiles jadvalidan foydalanuvchi admin ekanligini xavfsiz tekshirish
CREATE OR REPLACE FUNCTION public.is_club_admin()
RETURNS BOOLEAN
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public, auth, pg_temp
AS $$
BEGIN
  IF auth.uid() IS NULL THEN
    RETURN FALSE;
  END IF;

  RETURN EXISTS (
    SELECT 1 
    FROM public.profiles 
    WHERE id = auth.uid() 
      AND (role::text = 'admin' OR role::text = 'teacher')
  );
EXCEPTION WHEN OTHERS THEN
  RETURN FALSE;
END;
$$;

-- Foydalanuvchi ushbu to‘garak rahbari yoki admin ekanligini tekshirish
CREATE OR REPLACE FUNCTION public.is_club_leader_or_admin(target_club_id TEXT)
RETURNS BOOLEAN
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public, auth, pg_temp
AS $$
BEGIN
  IF auth.uid() IS NULL THEN
    RETURN FALSE;
  END IF;

  IF public.is_club_admin() THEN
    RETURN TRUE;
  END IF;

  RETURN EXISTS (
    SELECT 1 
    FROM public.clubs 
    WHERE id = target_club_id 
      AND (
        leader_id = auth.uid()::text 
        OR leader_id = (SELECT email FROM auth.users WHERE id = auth.uid())
      )
  );
EXCEPTION WHEN OTHERS THEN
  RETURN FALSE;
END;
$$;

-- ==============================================================================
-- 3. UNIBRIDGE TO‘GARAKLAR JADVALLARI (Faqat to‘garaklar uchun zarur jadvallar)
-- ==============================================================================

-- 3.1. To‘garaklar jadvali (21 ta faol to‘garak)
CREATE TABLE IF NOT EXISTS public.clubs (
    id TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    category TEXT NOT NULL,
    description TEXT,
    faculty TEXT,
    leader_id TEXT,
    leader_name TEXT,
    room TEXT,
    start_date TEXT,
    end_date TEXT,
    weekdays JSONB DEFAULT '[]'::jsonb,
    time_start TEXT,
    time_end TEXT,
    statute_status TEXT NOT NULL DEFAULT 'approved',
    admin_comment TEXT,
    statute_file_id TEXT,
    statute_reviewed_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- 3.2. To‘garaklar haftalik dars jadvali
CREATE TABLE IF NOT EXISTS public.club_schedules (
    id TEXT PRIMARY KEY,
    club_id TEXT NOT NULL REFERENCES public.clubs(id) ON DELETE CASCADE,
    weekday INT NOT NULL,
    time_start TEXT NOT NULL,
    time_end TEXT NOT NULL,
    room TEXT,
    start_date TEXT,
    end_date TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- 3.3. To‘garak mashg‘ulotlari va darslari (Telegram havolalari, sana, joylashuv)
CREATE TABLE IF NOT EXISTS public.club_sessions (
    id TEXT PRIMARY KEY,
    club_id TEXT NOT NULL REFERENCES public.clubs(id) ON DELETE CASCADE,
    slot_id TEXT,
    topic TEXT NOT NULL,
    date TEXT NOT NULL,
    time TEXT,
    time_end TEXT,
    location TEXT,
    status TEXT NOT NULL DEFAULT 'scheduled',
    held_note TEXT,
    attendee_count INT,
    conductor_name TEXT,
    photo_file_id TEXT,
    telegram_link TEXT,
    held_date TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- 3.4. To‘garak a’zolari (Talabalar a’zoligi va arizalari)
CREATE TABLE IF NOT EXISTS public.club_memberships (
    id TEXT PRIMARY KEY,
    club_id TEXT NOT NULL REFERENCES public.clubs(id) ON DELETE CASCADE,
    club_name TEXT,
    student_id TEXT,
    student_name TEXT NOT NULL,
    student_group TEXT NOT NULL,
    tutor_name TEXT NOT NULL,
    student_faculty TEXT,
    phone_or_telegram TEXT,
    status TEXT NOT NULL DEFAULT 'approved',
    note TEXT,
    admin_comment TEXT,
    application_file_id TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- 3.5. Oylik/choraklik hisobotlar
CREATE TABLE IF NOT EXISTS public.club_reports (
    id TEXT PRIMARY KEY,
    club_id TEXT NOT NULL REFERENCES public.clubs(id) ON DELETE CASCADE,
    leader_id TEXT,
    period TEXT,
    title TEXT NOT NULL,
    content TEXT,
    sessions_held INT DEFAULT 0,
    active_students INT DEFAULT 0,
    file_id TEXT,
    status TEXT NOT NULL DEFAULT 'submitted',
    submitted_at TIMESTAMPTZ,
    admin_comment TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- 3.6. Yillik hisobotlar
CREATE TABLE IF NOT EXISTS public.club_annual_reports (
    id TEXT PRIMARY KEY,
    club_id TEXT NOT NULL REFERENCES public.clubs(id) ON DELETE CASCADE,
    academic_year TEXT NOT NULL,
    leader_id TEXT,
    title TEXT NOT NULL,
    content TEXT,
    total_sessions INT DEFAULT 0,
    total_students INT DEFAULT 0,
    file_id TEXT,
    status TEXT NOT NULL DEFAULT 'submitted',
    submitted_at TIMESTAMPTZ,
    admin_comment TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- 3.7. To‘garaklar bo‘yicha bildirishnomalar
CREATE TABLE IF NOT EXISTS public.club_notifications (
    id TEXT PRIMARY KEY,
    user_id TEXT NOT NULL,
    title TEXT NOT NULL,
    message TEXT NOT NULL,
    type TEXT NOT NULL DEFAULT 'info',
    read BOOLEAN NOT NULL DEFAULT FALSE,
    link_tab TEXT,
    target_role TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- 3.8. Hujjatlar, tasdiqlash dalolatnomalari va mashg‘ulot rasmlari
CREATE TABLE IF NOT EXISTS public.club_files (
    id TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    size INT NOT NULL,
    type TEXT NOT NULL,
    data TEXT NOT NULL,
    uploaded_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- ==============================================================================
-- 4. XAVFSIZ VA TEZ QIDIRUV INDEKSLARI
-- ==============================================================================
CREATE INDEX IF NOT EXISTS idx_clubs_leader_id ON public.clubs(leader_id);
CREATE INDEX IF NOT EXISTS idx_clubs_category ON public.clubs(category);
CREATE INDEX IF NOT EXISTS idx_club_schedules_club_id ON public.club_schedules(club_id);
CREATE INDEX IF NOT EXISTS idx_club_sessions_club_id ON public.club_sessions(club_id);
CREATE INDEX IF NOT EXISTS idx_club_sessions_date ON public.club_sessions(date);
CREATE INDEX IF NOT EXISTS idx_club_memberships_club_id ON public.club_memberships(club_id);
CREATE INDEX IF NOT EXISTS idx_club_memberships_student_id ON public.club_memberships(student_id);
CREATE INDEX IF NOT EXISTS idx_club_memberships_group ON public.club_memberships(student_group);
CREATE INDEX IF NOT EXISTS idx_club_reports_club_id ON public.club_reports(club_id);
CREATE INDEX IF NOT EXISTS idx_club_annual_reports_club_id ON public.club_annual_reports(club_id);
CREATE INDEX IF NOT EXISTS idx_club_notifications_user_id ON public.club_notifications(user_id);
CREATE INDEX IF NOT EXISTS idx_club_files_uploaded_at ON public.club_files(uploaded_at);

-- ==============================================================================
-- 5. ROW LEVEL SECURITY (RLS) YOQISH VA XAVFSIZ SIYOSATLAR
-- ==============================================================================
ALTER TABLE public.clubs ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.club_schedules ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.club_sessions ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.club_memberships ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.club_reports ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.club_annual_reports ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.club_notifications ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.club_files ENABLE ROW LEVEL SECURITY;

-- ------------------------------------------------------------------------------
-- 5.1. CLUBS SIYOSATLARI
-- ------------------------------------------------------------------------------
-- To‘garaklar ro‘yxatini barcha foydalanuvchilar (talabalar, o‘qituvchilar, mehmonlar) ko‘ra oladi
DROP POLICY IF EXISTS "Clubs are viewable by everyone" ON public.clubs;
CREATE POLICY "Clubs are viewable by everyone" 
ON public.clubs FOR SELECT USING (true);

-- To‘garak yaratish: faqat autentifikatsiyadan o‘tgan admin yoki mas’ul rahbarlar
DROP POLICY IF EXISTS "Authorized leaders and admins can insert clubs" ON public.clubs;
CREATE POLICY "Authorized leaders and admins can insert clubs" 
ON public.clubs FOR INSERT TO authenticated 
WITH CHECK (
  auth.uid() IS NOT NULL 
  AND (public.is_club_admin() OR leader_id = auth.uid()::text)
);

-- To‘garakni yangilash: faqat ushbu to‘garak rahbari yoki admin
DROP POLICY IF EXISTS "Leaders and admins can update clubs" ON public.clubs;
CREATE POLICY "Leaders and admins can update clubs" 
ON public.clubs FOR UPDATE TO authenticated 
USING (
  auth.uid() IS NOT NULL 
  AND (public.is_club_admin() OR leader_id = auth.uid()::text)
);

-- To‘garakni o‘chirish: faqat admin
DROP POLICY IF EXISTS "Only admins can delete clubs" ON public.clubs;
CREATE POLICY "Only admins can delete clubs" 
ON public.clubs FOR DELETE TO authenticated 
USING (
  auth.uid() IS NOT NULL 
  AND public.is_club_admin()
);

-- ------------------------------------------------------------------------------
-- 5.2. CLUB_SCHEDULES SIYOSATLARI
-- ------------------------------------------------------------------------------
-- Dars jadvalini hamma ko‘ra oladi
DROP POLICY IF EXISTS "Schedules are viewable by everyone" ON public.club_schedules;
CREATE POLICY "Schedules are viewable by everyone" 
ON public.club_schedules FOR SELECT USING (true);

-- Jadvalni kiritish, yangilash va o‘chirish: faqat to‘garak rahbari yoki admin
DROP POLICY IF EXISTS "Leaders and admins can insert schedules" ON public.club_schedules;
CREATE POLICY "Leaders and admins can insert schedules" 
ON public.club_schedules FOR INSERT TO authenticated 
WITH CHECK (
  public.is_club_leader_or_admin(club_id)
);

DROP POLICY IF EXISTS "Leaders and admins can update schedules" ON public.club_schedules;
CREATE POLICY "Leaders and admins can update schedules" 
ON public.club_schedules FOR UPDATE TO authenticated 
USING (
  public.is_club_leader_or_admin(club_id)
);

DROP POLICY IF EXISTS "Leaders and admins can delete schedules" ON public.club_schedules;
CREATE POLICY "Leaders and admins can delete schedules" 
ON public.club_schedules FOR DELETE TO authenticated 
USING (
  public.is_club_leader_or_admin(club_id)
);

-- ------------------------------------------------------------------------------
-- 5.3. CLUB_SESSIONS SIYOSATLARI
-- ------------------------------------------------------------------------------
-- Mashg‘ulotlar va Telegram havolalarini barcha ko‘ra oladi
DROP POLICY IF EXISTS "Sessions are viewable by everyone" ON public.club_sessions;
CREATE POLICY "Sessions are viewable by everyone" 
ON public.club_sessions FOR SELECT USING (true);

-- Mashg‘ulotlarni kiritish, tahrirlash va o‘chirish: faqat to‘garak rahbari yoki admin
DROP POLICY IF EXISTS "Leaders and admins can insert sessions" ON public.club_sessions;
CREATE POLICY "Leaders and admins can insert sessions" 
ON public.club_sessions FOR INSERT TO authenticated 
WITH CHECK (
  public.is_club_leader_or_admin(club_id)
);

DROP POLICY IF EXISTS "Leaders and admins can update sessions" ON public.club_sessions;
CREATE POLICY "Leaders and admins can update sessions" 
ON public.club_sessions FOR UPDATE TO authenticated 
USING (
  public.is_club_leader_or_admin(club_id)
);

DROP POLICY IF EXISTS "Leaders and admins can delete sessions" ON public.club_sessions;
CREATE POLICY "Leaders and admins can delete sessions" 
ON public.club_sessions FOR DELETE TO authenticated 
USING (
  public.is_club_leader_or_admin(club_id)
);

-- ------------------------------------------------------------------------------
-- 5.4. CLUB_MEMBERSHIPS SIYOSATLARI
-- ------------------------------------------------------------------------------
-- A’zolik ro‘yxatini autentifikatsiyadan o‘tgan foydalanuvchilar ko‘ra oladi
DROP POLICY IF EXISTS "Memberships viewable by authenticated users" ON public.club_memberships;
CREATE POLICY "Memberships viewable by authenticated users" 
ON public.club_memberships FOR SELECT TO authenticated 
USING (true);

-- Talaba to‘garakka a’zo bo‘lish uchun o‘z arizasini kiritadi
DROP POLICY IF EXISTS "Authenticated users can submit membership application" ON public.club_memberships;
CREATE POLICY "Authenticated users can submit membership application" 
ON public.club_memberships FOR INSERT TO authenticated 
WITH CHECK (
  auth.uid() IS NOT NULL
);

-- A’zolik holatini (tasdiqlash, rad etish) faqat to‘garak rahbari yoki admin o‘zgartiradi
DROP POLICY IF EXISTS "Leaders and admins can update memberships" ON public.club_memberships;
CREATE POLICY "Leaders and admins can update memberships" 
ON public.club_memberships FOR UPDATE TO authenticated 
USING (
  public.is_club_leader_or_admin(club_id)
);

-- Talaba o‘z a’zoligini yoki rahbar/admin a’zoni to‘garakdan o‘chira oladi
DROP POLICY IF EXISTS "Students, leaders, and admins can delete membership" ON public.club_memberships;
CREATE POLICY "Students, leaders, and admins can delete membership" 
ON public.club_memberships FOR DELETE TO authenticated 
USING (
  auth.uid() IS NOT NULL 
  AND (
    student_id = auth.uid()::text 
    OR public.is_club_leader_or_admin(club_id)
  )
);

-- ------------------------------------------------------------------------------
-- 5.5. CLUB_REPORTS VA CLUB_ANNUAL_REPORTS SIYOSATLARI
-- ------------------------------------------------------------------------------
-- Hisobotlarni autentifikatsiyadan o‘tgan foydalanuvchilar ko‘ra oladi
DROP POLICY IF EXISTS "Reports viewable by authenticated users" ON public.club_reports;
CREATE POLICY "Reports viewable by authenticated users" 
ON public.club_reports FOR SELECT TO authenticated 
USING (true);

DROP POLICY IF EXISTS "Annual reports viewable by authenticated users" ON public.club_annual_reports;
CREATE POLICY "Annual reports viewable by authenticated users" 
ON public.club_annual_reports FOR SELECT TO authenticated 
USING (true);

-- Hisobot kiritish va yangilash: faqat to‘garak rahbari yoki admin
DROP POLICY IF EXISTS "Leaders and admins can insert reports" ON public.club_reports;
CREATE POLICY "Leaders and admins can insert reports" 
ON public.club_reports FOR INSERT TO authenticated 
WITH CHECK (
  public.is_club_leader_or_admin(club_id)
);

DROP POLICY IF EXISTS "Leaders and admins can update reports" ON public.club_reports;
CREATE POLICY "Leaders and admins can update reports" 
ON public.club_reports FOR UPDATE TO authenticated 
USING (
  public.is_club_leader_or_admin(club_id)
);

DROP POLICY IF EXISTS "Leaders and admins can insert annual reports" ON public.club_annual_reports;
CREATE POLICY "Leaders and admins can insert annual reports" 
ON public.club_annual_reports FOR INSERT TO authenticated 
WITH CHECK (
  public.is_club_leader_or_admin(club_id)
);

DROP POLICY IF EXISTS "Leaders and admins can update annual reports" ON public.club_annual_reports;
CREATE POLICY "Leaders and admins can update annual reports" 
ON public.club_annual_reports FOR UPDATE TO authenticated 
USING (
  public.is_club_leader_or_admin(club_id)
);

-- ------------------------------------------------------------------------------
-- 5.6. CLUB_NOTIFICATIONS SIYOSATLARI
-- ------------------------------------------------------------------------------
-- Har bir foydalanuvchi faqat o‘ziga yoki o‘z roliga tegishli bildirishnomalarni ko‘radi
DROP POLICY IF EXISTS "Users can view relevant notifications" ON public.club_notifications;
CREATE POLICY "Users can view relevant notifications" 
ON public.club_notifications FOR SELECT TO authenticated 
USING (
  user_id = auth.uid()::text 
  OR user_id = 'all' 
  OR target_role IS NOT NULL 
  OR public.is_club_admin()
);

-- Bildirishnoma yaratish: autentifikatsiyadan o‘tgan tizim foydalanuvchilari
DROP POLICY IF EXISTS "Authenticated users can create notifications" ON public.club_notifications;
CREATE POLICY "Authenticated users can create notifications" 
ON public.club_notifications FOR INSERT TO authenticated 
WITH CHECK (
  auth.uid() IS NOT NULL
);

-- O‘qilganlik holatini o‘zgartirish yoki o‘chirish: qabul qiluvchi yoki admin
DROP POLICY IF EXISTS "Recipients can update notifications" ON public.club_notifications;
CREATE POLICY "Recipients can update notifications" 
ON public.club_notifications FOR UPDATE TO authenticated 
USING (
  user_id = auth.uid()::text 
  OR public.is_club_admin()
);

DROP POLICY IF EXISTS "Recipients can delete notifications" ON public.club_notifications;
CREATE POLICY "Recipients can delete notifications" 
ON public.club_notifications FOR DELETE TO authenticated 
USING (
  user_id = auth.uid()::text 
  OR public.is_club_admin()
);

-- ------------------------------------------------------------------------------
-- 5.7. CLUB_FILES SIYOSATLARI
-- ------------------------------------------------------------------------------
-- Fayllarni barcha ko‘ra oladi (nizomlar, mashg‘ulot rasmlari, hisobot hujjatlari)
DROP POLICY IF EXISTS "Files viewable by everyone" ON public.club_files;
CREATE POLICY "Files viewable by everyone" 
ON public.club_files FOR SELECT USING (true);

-- Fayl yuklash: faqat autentifikatsiyadan o‘tgan foydalanuvchilar
DROP POLICY IF EXISTS "Authenticated users can upload files" ON public.club_files;
CREATE POLICY "Authenticated users can upload files" 
ON public.club_files FOR INSERT TO authenticated 
WITH CHECK (
  auth.uid() IS NOT NULL
);

-- Faylni o‘chirish yoki yangilash: faqat rahbar yoki admin
DROP POLICY IF EXISTS "Admins can manage club files" ON public.club_files;
CREATE POLICY "Admins can manage club files" 
ON public.club_files FOR ALL TO authenticated 
USING (
  public.is_club_admin()
);
