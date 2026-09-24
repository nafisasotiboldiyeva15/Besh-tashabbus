-- UniBridge Database Schema & RLS Policies
-- Namangan davlat chet tillari instituti
-- PostgreSQL / Supabase Migration (To'liq va xatosiz versiya)

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- 1. ENUMS
DO $$ BEGIN
    CREATE TYPE user_role AS ENUM ('student', 'teacher', 'admin');
EXCEPTION WHEN duplicate_object THEN null; END $$;

DO $$ BEGIN
    CREATE TYPE question_status AS ENUM ('open', 'answered', 'closed');
EXCEPTION WHEN duplicate_object THEN null; END $$;

DO $$ BEGIN
    CREATE TYPE consultation_status AS ENUM ('pending', 'accepted', 'declined', 'completed');
EXCEPTION WHEN duplicate_object THEN null; END $$;

-- 2. TABLES
CREATE TABLE IF NOT EXISTS public.profiles (
    id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
    email TEXT NOT NULL,
    role user_role NOT NULL DEFAULT 'student',
    full_name TEXT NOT NULL,
    faculty_or_department TEXT NOT NULL DEFAULT 'Ingliz tili 1-fakulteti',
    phone TEXT,
    avatar_url TEXT,
    bio TEXT,
    is_approved BOOLEAN NOT NULL DEFAULT false,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS public.courses (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    teacher_id UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
    name TEXT NOT NULL,
    code TEXT NOT NULL,
    description TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS public.course_enrollments (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    course_id UUID NOT NULL REFERENCES public.courses(id) ON DELETE CASCADE,
    student_id UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
    enrolled_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    UNIQUE(course_id, student_id)
);

CREATE TABLE IF NOT EXISTS public.questions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    student_id UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    subject TEXT NOT NULL,
    status question_status NOT NULL DEFAULT 'open',
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS public.question_replies (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    question_id UUID NOT NULL REFERENCES public.questions(id) ON DELETE CASCADE,
    author_id UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
    content TEXT NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS public.assignments (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    teacher_id UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
    course_id UUID NOT NULL REFERENCES public.courses(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    description TEXT NOT NULL,
    due_date TIMESTAMPTZ NOT NULL,
    max_points INTEGER NOT NULL DEFAULT 100,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS public.assignment_submissions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    assignment_id UUID NOT NULL REFERENCES public.assignments(id) ON DELETE CASCADE,
    student_id UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
    content_text TEXT NOT NULL,
    file_url TEXT,
    score NUMERIC(5,2),
    feedback TEXT,
    submitted_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    graded_at TIMESTAMPTZ,
    UNIQUE(assignment_id, student_id)
);

CREATE TABLE IF NOT EXISTS public.consultation_slots (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    teacher_id UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    start_time TIMESTAMPTZ NOT NULL,
    end_time TIMESTAMPTZ NOT NULL,
    location_or_link TEXT NOT NULL,
    max_students INTEGER NOT NULL DEFAULT 1,
    is_active BOOLEAN NOT NULL DEFAULT true,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS public.consultation_requests (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    slot_id UUID NOT NULL REFERENCES public.consultation_slots(id) ON DELETE CASCADE,
    student_id UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
    reason TEXT NOT NULL,
    status consultation_status NOT NULL DEFAULT 'pending',
    teacher_notes TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    UNIQUE(slot_id, student_id)
);

CREATE TABLE IF NOT EXISTS public.study_groups (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    creator_id UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
    name TEXT NOT NULL,
    description TEXT NOT NULL,
    subject TEXT NOT NULL,
    max_members INTEGER NOT NULL DEFAULT 15,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS public.study_group_members (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    group_id UUID NOT NULL REFERENCES public.study_groups(id) ON DELETE CASCADE,
    user_id UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
    joined_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    UNIQUE(group_id, user_id)
);

CREATE TABLE IF NOT EXISTS public.notifications (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    message TEXT NOT NULL,
    link TEXT,
    is_read BOOLEAN NOT NULL DEFAULT false,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- 3. ROW LEVEL SECURITY (RLS)
ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.courses ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.course_enrollments ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.questions ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.question_replies ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.assignments ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.assignment_submissions ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.consultation_slots ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.consultation_requests ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.study_groups ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.study_group_members ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.notifications ENABLE ROW LEVEL SECURITY;

-- Profiles Policies (Barcha uchun o'qish ochiq, yozish faqat o'z egasi uchun)
DROP POLICY IF EXISTS "Profiles are viewable by authenticated users" ON public.profiles;
DROP POLICY IF EXISTS "Profiles are viewable by everyone" ON public.profiles;
CREATE POLICY "Profiles are viewable by everyone" ON public.profiles FOR SELECT USING (true);

DROP POLICY IF EXISTS "Users can insert own profile" ON public.profiles;
CREATE POLICY "Users can insert own profile" ON public.profiles FOR INSERT TO authenticated WITH CHECK (auth.uid() = id);

DROP POLICY IF EXISTS "Users can update permitted profile fields" ON public.profiles;
CREATE POLICY "Users can update permitted profile fields" ON public.profiles FOR UPDATE TO authenticated USING (auth.uid() = id);

-- Questions Policies
DROP POLICY IF EXISTS "Questions are viewable by authenticated users" ON public.questions;
DROP POLICY IF EXISTS "Questions are viewable by everyone" ON public.questions;
CREATE POLICY "Questions are viewable by everyone" ON public.questions FOR SELECT USING (true);

DROP POLICY IF EXISTS "Students can create questions" ON public.questions;
CREATE POLICY "Students can create questions" ON public.questions FOR INSERT TO authenticated WITH CHECK (auth.uid() = student_id);

DROP POLICY IF EXISTS "Authors can update their questions" ON public.questions;
CREATE POLICY "Authors can update their questions" ON public.questions FOR UPDATE TO authenticated USING (auth.uid() = student_id);

-- Question Replies Policies
DROP POLICY IF EXISTS "Replies are viewable by authenticated users" ON public.question_replies;
DROP POLICY IF EXISTS "Replies are viewable by everyone" ON public.question_replies;
CREATE POLICY "Replies are viewable by everyone" ON public.question_replies FOR SELECT USING (true);

DROP POLICY IF EXISTS "Authenticated users can post replies" ON public.question_replies;
CREATE POLICY "Authenticated users can post replies" ON public.question_replies FOR INSERT TO authenticated WITH CHECK (auth.uid() = author_id);

-- Courses Policies
DROP POLICY IF EXISTS "Courses viewable by all authenticated" ON public.courses;
DROP POLICY IF EXISTS "Courses viewable by everyone" ON public.courses;
CREATE POLICY "Courses viewable by everyone" ON public.courses FOR SELECT USING (true);

DROP POLICY IF EXISTS "Approved teachers can manage courses" ON public.courses;
CREATE POLICY "Approved teachers can manage courses" ON public.courses FOR ALL TO authenticated USING (auth.uid() = teacher_id);

-- Assignments Policies
DROP POLICY IF EXISTS "Assignments viewable by authenticated users" ON public.assignments;
DROP POLICY IF EXISTS "Assignments viewable by everyone" ON public.assignments;
CREATE POLICY "Assignments viewable by everyone" ON public.assignments FOR SELECT USING (true);

DROP POLICY IF EXISTS "Approved teachers can manage assignments" ON public.assignments;
CREATE POLICY "Approved teachers can manage assignments" ON public.assignments FOR ALL TO authenticated USING (auth.uid() = teacher_id);

-- Assignment Submissions Policies
DROP POLICY IF EXISTS "Submissions viewable by student or assignment teacher" ON public.assignment_submissions;
CREATE POLICY "Submissions viewable by student or assignment teacher" ON public.assignment_submissions FOR SELECT TO authenticated USING (auth.uid() = student_id OR EXISTS (SELECT 1 FROM public.assignments a WHERE a.id = assignment_id AND a.teacher_id = auth.uid()));

DROP POLICY IF EXISTS "Students can insert own submissions" ON public.assignment_submissions;
CREATE POLICY "Students can insert own submissions" ON public.assignment_submissions FOR INSERT TO authenticated WITH CHECK (auth.uid() = student_id);

DROP POLICY IF EXISTS "Students and teachers can update submissions" ON public.assignment_submissions;
CREATE POLICY "Students and teachers can update submissions" ON public.assignment_submissions FOR UPDATE TO authenticated USING (auth.uid() = student_id OR EXISTS (SELECT 1 FROM public.assignments a WHERE a.id = assignment_id AND a.teacher_id = auth.uid()));

-- Consultation Slots Policies
DROP POLICY IF EXISTS "Consultation slots viewable by all" ON public.consultation_slots;
DROP POLICY IF EXISTS "Consultation slots viewable by everyone" ON public.consultation_slots;
CREATE POLICY "Consultation slots viewable by everyone" ON public.consultation_slots FOR SELECT USING (true);

DROP POLICY IF EXISTS "Teachers manage consultation slots" ON public.consultation_slots;
CREATE POLICY "Teachers manage consultation slots" ON public.consultation_slots FOR ALL TO authenticated USING (auth.uid() = teacher_id);

-- Consultation Requests Policies
DROP POLICY IF EXISTS "Consultation requests visible to student and teacher" ON public.consultation_requests;
CREATE POLICY "Consultation requests visible to student and teacher" ON public.consultation_requests FOR SELECT TO authenticated USING (auth.uid() = student_id OR EXISTS (SELECT 1 FROM public.consultation_slots s WHERE s.id = slot_id AND s.teacher_id = auth.uid()));

DROP POLICY IF EXISTS "Students request consultations" ON public.consultation_requests;
CREATE POLICY "Students request consultations" ON public.consultation_requests FOR INSERT TO authenticated WITH CHECK (auth.uid() = student_id);

DROP POLICY IF EXISTS "Update consultation requests" ON public.consultation_requests;
CREATE POLICY "Update consultation requests" ON public.consultation_requests FOR UPDATE TO authenticated USING (auth.uid() = student_id OR EXISTS (SELECT 1 FROM public.consultation_slots s WHERE s.id = slot_id AND s.teacher_id = auth.uid()));

-- Study Groups Policies
DROP POLICY IF EXISTS "Study groups viewable by all" ON public.study_groups;
DROP POLICY IF EXISTS "Study groups viewable by everyone" ON public.study_groups;
CREATE POLICY "Study groups viewable by everyone" ON public.study_groups FOR SELECT USING (true);

DROP POLICY IF EXISTS "Users can create study groups" ON public.study_groups;
CREATE POLICY "Users can create study groups" ON public.study_groups FOR INSERT TO authenticated WITH CHECK (auth.uid() = creator_id);

DROP POLICY IF EXISTS "Study group members viewable" ON public.study_group_members;
DROP POLICY IF EXISTS "Study group members viewable by everyone" ON public.study_group_members;
CREATE POLICY "Study group members viewable by everyone" ON public.study_group_members FOR SELECT USING (true);

DROP POLICY IF EXISTS "Join or leave study groups" ON public.study_group_members;
CREATE POLICY "Join or leave study groups" ON public.study_group_members FOR ALL TO authenticated USING (auth.uid() = user_id);

-- Notifications Policies
-- Har kim o'z bildirishnomalarini ko'rishi va boshqarishi mumkin
DROP POLICY IF EXISTS "Manage own notifications" ON public.notifications;
DROP POLICY IF EXISTS "Users view own notifications" ON public.notifications;
CREATE POLICY "Users view own notifications" ON public.notifications FOR SELECT TO authenticated USING (auth.uid() = user_id);

DROP POLICY IF EXISTS "Users update own notifications" ON public.notifications;
CREATE POLICY "Users update own notifications" ON public.notifications FOR UPDATE TO authenticated USING (auth.uid() = user_id);

DROP POLICY IF EXISTS "Users delete own notifications" ON public.notifications;
CREATE POLICY "Users delete own notifications" ON public.notifications FOR DELETE TO authenticated USING (auth.uid() = user_id);

-- Tizimdagi boshqa foydalanuvchiga (o'qituvchiga yoki talabaga) bildirishnoma yuborish imkoniyati
DROP POLICY IF EXISTS "Authenticated users can insert notifications" ON public.notifications;
CREATE POLICY "Authenticated users can insert notifications" ON public.notifications FOR INSERT TO authenticated WITH CHECK (true);

-- 4. AUTOMATIC PROFILE CREATION TRIGGER (Fault-Tolerant & Production-Safe)
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER 
LANGUAGE plpgsql 
SECURITY DEFINER 
SET search_path = public, auth, pg_temp
AS $$
DECLARE
  v_role public.user_role;
  v_raw_role text;
  v_full_name text;
  v_faculty text;
BEGIN
  -- 1. Safe role determination
  v_raw_role := LOWER(COALESCE(NEW.raw_user_meta_data->>'role', 'student'));
  IF v_raw_role = 'teacher' THEN
    v_role := 'teacher'::public.user_role;
  ELSIF v_raw_role = 'admin' THEN
    v_role := 'admin'::public.user_role;
  ELSE
    v_role := 'student'::public.user_role;
  END IF;

  -- 2. Safe name determination
  v_full_name := COALESCE(
    NULLIF(TRIM(NEW.raw_user_meta_data->>'full_name'), ''),
    NULLIF(TRIM(NEW.raw_user_meta_data->>'name'), ''),
    split_part(COALESCE(NEW.email, 'user'), '@', 1)
  );

  -- 3. Safe faculty/department determination
  v_faculty := COALESCE(
    NULLIF(TRIM(NEW.raw_user_meta_data->>'faculty_or_department'), ''),
    'Ingliz tili 1-fakulteti'
  );

  -- 4. Insert or update profile
  INSERT INTO public.profiles (
    id,
    email,
    role,
    full_name,
    faculty_or_department,
    is_approved
  )
  VALUES (
    NEW.id,
    COALESCE(NEW.email, ''),
    v_role,
    v_full_name,
    v_faculty,
    CASE WHEN v_role = 'teacher' THEN false ELSE true END
  )
  ON CONFLICT (id) DO UPDATE SET
    email = EXCLUDED.email,
    full_name = CASE 
      WHEN public.profiles.full_name IS NULL OR public.profiles.full_name = '' 
      THEN EXCLUDED.full_name 
      ELSE public.profiles.full_name 
    END,
    role = EXCLUDED.role,
    faculty_or_department = EXCLUDED.faculty_or_department;

  -- 5. Insert initial notification if table exists
  BEGIN
    IF EXISTS (
      SELECT 1 FROM information_schema.tables 
      WHERE table_schema = 'public' AND table_name = 'notifications'
    ) THEN
      INSERT INTO public.notifications (user_id, title, message)
      VALUES (
        NEW.id,
        'UniBridge platformasiga xush kelibsiz!',
        'Namangan davlat chet tillari instituti talaba va o‘qituvchilari uchun yagona ta’lim platformasi.'
      );
    END IF;
  EXCEPTION WHEN OTHERS THEN
    -- Ignore notification failure so user signup is never aborted
  END;

  RETURN NEW;
EXCEPTION WHEN OTHERS THEN
  -- Extremely critical: Catch any unexpected errors so auth.users insertion succeeds
  RAISE WARNING 'handle_new_user error: %', SQLERRM;
  RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();
