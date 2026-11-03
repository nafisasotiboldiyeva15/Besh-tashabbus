import { createClient, SupabaseClient } from '@supabase/supabase-js';

// Read credentials from environment variables safely
const supabaseUrl = (typeof import.meta !== 'undefined' && import.meta?.env?.VITE_SUPABASE_URL) || '';
const supabaseAnonKey = (typeof import.meta !== 'undefined' && import.meta?.env?.VITE_SUPABASE_ANON_KEY) || '';

const isConfigured = Boolean(
  supabaseUrl &&
  supabaseAnonKey &&
  !supabaseUrl.includes('your-project-id') &&
  !supabaseAnonKey.includes('your-anon-public-key') &&
  supabaseUrl.startsWith('http')
);

export let supabase: SupabaseClient | null = null;

if (isConfigured) {
  try {
    supabase = createClient(supabaseUrl, supabaseAnonKey, {
      auth: {
        persistSession: true,
        autoRefreshToken: true,
      },
    });
    console.info('[Supabase] Initialized successfully with remote project:', supabaseUrl);
  } catch (err) {
    console.warn('[Supabase] Failed to initialize Supabase client:', err);
    supabase = null;
  }
} else {
  console.info('[Supabase] Standalone mode active (Express server & database.json persistence).');
}

/**
 * Permanently delete a club member from Supabase database tables if configured.
 * Safely targets `club_memberships` and fallback `memberships` table.
 */
export async function deleteSupabaseMembership(membershipId: string): Promise<{ success: boolean; error?: string }> {
  if (!membershipId) {
    return { success: false, error: 'A’zo ID ko‘rsatilmadi' };
  }

  if (!supabase) {
    // Supabase credentials not set in environment, server & local DB handle full persistence
    return { success: true };
  }

  try {
    // Attempt deletion in 'club_memberships'
    const { error: err1 } = await supabase
      .from('club_memberships')
      .delete()
      .eq('id', membershipId);

    if (err1) {
      console.warn('[Supabase] club_memberships delete warning:', err1.message);
      // Attempt fallback in 'memberships'
      const { error: err2 } = await supabase
        .from('memberships')
        .delete()
        .eq('id', membershipId);

      if (err2) {
        console.warn('[Supabase] memberships delete warning:', err2.message);
        return { success: false, error: err1.message || err2.message };
      }
    }

    console.info(`[Supabase] Member ${membershipId} deleted successfully from Supabase.`);
    return { success: true };
  } catch (e) {
    const msg = e instanceof Error ? e.message : 'Supabase xatoligi';
    console.warn('[Supabase] Exception deleting membership:', msg);
    return { success: false, error: msg };
  }
}

/**
 * Purge legacy AI START club ('c_2040bdb_97be1') and all its associated
 * sessions, schedules, memberships, reports, and telegram links from Supabase.
 * Preserves the current AI START club ('c_c272675_65543') and all other 20 clubs.
 */
export async function purgeLegacyAiStartFromSupabase(): Promise<{ success: boolean; message: string; error?: string }> {
  if (!supabase) {
    return {
      success: false,
      message: 'Supabase bilan to‘g‘ridan-to‘g‘ri ulanish amalga oshmadi (VITE_SUPABASE_URL va VITE_SUPABASE_ANON_KEY muhitda o‘rnatilmagan)',
    };
  }

  const legacyId = 'c_2040bdb_97be1';
  try {
    // 1. Delete associated sessions (with telegram links)
    await supabase.from('club_sessions').delete().eq('club_id', legacyId);
    // 2. Delete associated schedules
    await supabase.from('club_schedules').delete().eq('club_id', legacyId);
    // 3. Delete associated memberships
    await supabase.from('club_memberships').delete().eq('club_id', legacyId);
    // 4. Delete associated reports
    await supabase.from('club_reports').delete().eq('club_id', legacyId);
    // 5. Delete associated annual reports
    await supabase.from('club_annual_reports').delete().eq('club_id', legacyId);
    // 6. Delete club record itself
    const { error: clubErr } = await supabase.from('clubs').delete().eq('id', legacyId);

    if (clubErr) {
      return { success: false, message: 'Supabase clubs jadvalidan o‘chirishda xatolik', error: clubErr.message };
    }

    return {
      success: true,
      message: 'Supabase bazasidan eski AI START (c_2040bdb_97be1) to‘liq o‘chirildi. Hozirgi AI START (c_c272675_65543) va qolgan 20 to‘garak saqlandi.',
    };
  } catch (err: any) {
    return { success: false, message: 'Supabase operatsiyasida istisno yuz berdi', error: err?.message };
  }
}

/**
 * Safely upsert a club into Supabase `clubs` table if Supabase is connected.
 */
export async function syncClubToSupabase(club: any): Promise<boolean> {
  if (!supabase || !club || !club.id) return false;
  try {
    const row = {
      id: club.id,
      name: club.name,
      category: club.category || "talaba_tashkil",
      description: club.description || "",
      faculty: club.faculty || "",
      leader_id: club.leaderId || null,
      leader_name: club.leaderName || "",
      room: club.room || "",
      start_date: club.startDate || null,
      end_date: club.endDate || null,
      weekdays: Array.isArray(club.weekdays) ? club.weekdays : [],
      time_start: club.timeStart || "",
      time_end: club.timeEnd || "",
      statute_status: club.statuteStatus || "pending",
      admin_comment: club.adminComment || "",
      statute_file_id: club.statuteFileId || null,
      statute_reviewed_at: club.statuteReviewedAt || null,
    };
    const { error } = await supabase.from("clubs").upsert(row, { onConflict: "id" });
    if (error) {
      console.warn("[Supabase] syncClubToSupabase error:", error.message);
      return false;
    }
    console.info("[Supabase] Club synced successfully:", club.name);
    return true;
  } catch (err) {
    console.warn("[Supabase] syncClubToSupabase exception:", err);
    return false;
  }
}

/**
 * Safely upsert schedule slots into Supabase `club_schedules` table.
 */
export async function syncScheduleToSupabase(slot: any): Promise<boolean> {
  if (!supabase || !slot || !slot.id) return false;
  try {
    const row = {
      id: slot.id,
      club_id: slot.clubId,
      weekday: slot.weekday,
      time_start: slot.timeStart || "",
      time_end: slot.timeEnd || "",
      room: slot.room || "",
      start_date: slot.startDate || "",
      end_date: slot.endDate || "",
    };
    const { error } = await supabase.from("club_schedules").upsert(row, { onConflict: "id" });
    if (error) {
      console.warn("[Supabase] syncScheduleToSupabase error:", error.message);
      return false;
    }
    return true;
  } catch {
    return false;
  }
}

/**
 * Safely upsert session into Supabase `club_sessions` table.
 */
export async function syncSessionToSupabase(session: any): Promise<boolean> {
  if (!supabase || !session || !session.id) return false;
  try {
    const row = {
      id: session.id,
      club_id: session.clubId,
      slot_id: session.slotId || null,
      topic: session.topic || "",
      date: session.date || "",
      time: session.time || "",
      time_end: session.timeEnd || "",
      location: session.location || "",
      status: session.status || "scheduled",
      held_note: session.heldNote || "",
      attendee_count: session.attendeeCount || null,
      conductor_name: session.conductorName || "",
      photo_file_id: session.photoFileId || null,
      telegram_link: session.telegramLink || null,
      held_date: session.heldDate || null,
    };
    const { error } = await supabase.from("club_sessions").upsert(row, { onConflict: "id" });
    if (error) {
      console.warn("[Supabase] syncSessionToSupabase error:", error.message);
      return false;
    }
    return true;
  } catch {
    return false;
  }
}

/**
 * Safely upsert membership into Supabase `club_memberships` table.
 */
export async function syncMembershipToSupabase(membership: any): Promise<boolean> {
  if (!supabase || !membership || !membership.id) return false;
  try {
    const row = {
      id: membership.id,
      club_id: membership.clubId,
      club_name: membership.clubName || "",
      student_id: membership.studentId || null,
      student_name: membership.studentName || "",
      student_group: membership.studentGroup || "",
      tutor_name: membership.tutorName || "",
      student_faculty: membership.studentFaculty || "",
      phone_or_telegram: membership.phoneOrTelegram || "",
      status: membership.status || "approved",
      note: membership.note || "",
      admin_comment: membership.adminComment || "",
      application_file_id: membership.applicationFileId || null,
    };
    const { error } = await supabase.from("club_memberships").upsert(row, { onConflict: "id" });
    if (error) {
      console.warn("[Supabase] syncMembershipToSupabase error:", error.message);
      return false;
    }
    return true;
  } catch {
    return false;
  }
}
