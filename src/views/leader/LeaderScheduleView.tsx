import React, { useState } from 'react';
import { CalendarDays, Plus, Download, Edit3, Trash2, Check, X, Clock, MapPin, Send, ExternalLink, Users } from 'lucide-react';
import { I18N, Language } from '../../lib/i18n';
import { storage, fmtD, weekdayOf, ymd, calculateSlotDates, normalizeClubTime } from '../../lib/storage';
import { StatusBadge } from '../../components/common/Badge';
import { Modal } from '../../components/common/Modal';
import { ScheduleSlot, Session, User, Club } from '../../types';
import { downloadSchedulePDF } from '../../lib/pdf';

export const LeaderScheduleView: React.FC<{
  user: User;
  lang: Language;
  showToast: (msg: string, type?: 'ok' | 'err') => void;
  onRefresh: () => void;
}> = ({ user, lang, showToast, onRefresh }) => {
  const t = I18N[lang];
  const clubs = storage.getClubs(user.id);
  const [slots, setSlots] = useState<ScheduleSlot[]>(storage.getSchedules(undefined, user.id));
  const [sessions, setSessions] = useState<Session[]>(storage.getSessions(undefined, user.id));

  // Slot modal state
  const [isSlotModalOpen, setIsSlotModalOpen] = useState(false);
  const [editingSlotId, setEditingSlotId] = useState<string | null>(null);
  const [slotClubId, setSlotClubId] = useState(clubs[0]?.id || '');
  const [slotWeekday, setSlotWeekday] = useState(1);
  const [slotTimeStart, setSlotTimeStart] = useState('11:00');
  const [slotTimeEnd, setSlotTimeEnd] = useState('12:30');
  const [slotRoom, setSlotRoom] = useState('');
  const today = ymd(new Date());
  const futureDate = new Date();
  futureDate.setDate(futureDate.getDate() + 90);
  const [slotStartDate, setSlotStartDate] = useState(today);
  const [slotEndDate, setSlotEndDate] = useState(ymd(futureDate));

  // Topic edit modal state
  const [isTopicModalOpen, setIsTopicModalOpen] = useState(false);
  const [editingSessionId, setEditingSessionId] = useState<string | null>(null);
  const [sessionTopic, setSessionTopic] = useState('');

  // Extra session modal state
  const [isExtraModalOpen, setIsExtraModalOpen] = useState(false);
  const [extraClubId, setExtraClubId] = useState(clubs[0]?.id || '');
  const [extraTopic, setExtraTopic] = useState('');
  const [extraDate, setExtraDate] = useState(today);
  const [extraTime, setExtraTime] = useState('11:00');
  const [extraLocation, setExtraLocation] = useState('');
  const [extraConductor, setExtraConductor] = useState(user.fullName);

  // Held session with Telegram link modal state
  const [isPhotoModalOpen, setIsPhotoModalOpen] = useState(false);
  const [targetSession, setTargetSession] = useState<Session | null>(null);
  const [heldNote, setHeldNote] = useState('');
  const [attendeeCount, setAttendeeCount] = useState<number>(15);
  const [conductorName, setConductorName] = useState(user.fullName);
  const [sessionTelegramLink, setSessionTelegramLink] = useState('');

  const [isExporting, setIsExporting] = useState(false);

  const refreshData = () => {
    setSlots(storage.getSchedules(undefined, user.id));
    setSessions(storage.getSessions(undefined, user.id));
    onRefresh();
  };

  const previewCount = calculateSlotDates({
    weekday: slotWeekday,
    startDate: slotStartDate,
    endDate: slotEndDate,
  }).length;

  const handleOpenSlotModal = (slot?: ScheduleSlot) => {
    if (clubs.length === 0) {
      showToast(t.leader.noClub, 'err');
      return;
    }
    if (slot) {
      setEditingSlotId(slot.id);
      setSlotClubId(slot.clubId);
      setSlotWeekday(slot.weekday);
      setSlotTimeStart(normalizeClubTime(slot.timeStart));
      setSlotTimeEnd(normalizeClubTime(slot.timeEnd));
      setSlotRoom(slot.room);
      setSlotStartDate(slot.startDate);
      setSlotEndDate(slot.endDate);
    } else {
      setEditingSlotId(null);
      setSlotClubId(clubs[0].id);
      setSlotWeekday(1);
      setSlotTimeStart('11:00');
      setSlotTimeEnd('12:30');
      setSlotRoom(clubs[0]?.room || '2-o‘quv binosi, 304-auditoriya');
      setSlotStartDate(today);
      setSlotEndDate(ymd(futureDate));
    }
    setIsSlotModalOpen(true);
  };

  const handleSaveSlot = (e: React.FormEvent) => {
    e.preventDefault();
    if (!slotRoom.trim()) {
      showToast(t.common.required, 'err');
      return;
    }
    if (slotEndDate < slotStartDate) {
      showToast(t.sch.badPeriod, 'err');
      return;
    }

    try {
      storage.saveScheduleSlot({
        id: editingSlotId || undefined,
        clubId: slotClubId,
        weekday: slotWeekday,
        timeStart: slotTimeStart,
        timeEnd: slotTimeEnd,
        room: slotRoom,
        startDate: slotStartDate,
        endDate: slotEndDate,
      });

      showToast(t.sch.generated.replace('{n}', previewCount.toString()), 'ok');
      setIsSlotModalOpen(false);
      refreshData();
    } catch (err: unknown) {
      const msg = err instanceof Error ? err.message : 'Xatolik';
      showToast(msg, 'err');
    }
  };

  const handleDeleteSlot = (id: string) => {
    if (window.confirm(t.sch.confirmDelete)) {
      storage.deleteScheduleSlot(id);
      showToast(t.common.saved, 'ok');
      refreshData();
    }
  };

  // Open modal to mark session held with Telegram link
  const handleOpenPhotoModal = (ses: Session) => {
    setTargetSession(ses);
    setHeldNote(ses.heldNote || '');
    setAttendeeCount(ses.attendeeCount || 15);
    setConductorName(ses.conductorName || user.fullName);
    setSessionTelegramLink(ses.telegramLink || '');
    setIsPhotoModalOpen(true);
  };

  const handleSaveHeldWithPhoto = (e: React.FormEvent) => {
    e.preventDefault();
    if (!targetSession) return;
    const cleanLink = sessionTelegramLink.trim();
    if (!cleanLink) {
      showToast('Kanalda yoritilgan Telegram post havolasini kiritish majburiy', 'err');
      return;
    }
    if (!cleanLink.startsWith('http://') && !cleanLink.startsWith('https://') && !cleanLink.startsWith('t.me/')) {
      showToast('Havola to‘g‘ri formatda bo‘lishi kerak (masalan: https://t.me/kanal/123)', 'err');
      return;
    }

    try {
      storage.markSessionHeldWithPhoto({
        sessionId: targetSession.id,
        status: 'held',
        note: heldNote,
        attendeeCount,
        conductorName,
        telegramLink: cleanLink.startsWith('t.me/') ? `https://${cleanLink}` : cleanLink,
        userId: user.id,
      });

      showToast(
        "Mashg‘ulot o‘tkazilgani va Telegram havola saqlandi. Oldingi havolasi kiritilmagan darslar 'O‘tilmadi'ga o‘tkazildi.",
        'ok'
      );
      setIsPhotoModalOpen(false);
      refreshData();
    } catch (err: unknown) {
      const msg = err instanceof Error ? err.message : 'Xatolik';
      showToast(msg, 'err');
    }
  };

  const handleMarkMissed = (id: string) => {
    try {
      storage.updateSessionStatus(id, 'missed');
      showToast(t.common.saved, 'ok');
      refreshData();
    } catch {
      showToast('Xatolik', 'err');
    }
  };

  const handleSaveTopic = (e: React.FormEvent) => {
    e.preventDefault();
    if (!editingSessionId || !sessionTopic.trim()) return;
    try {
      storage.updateSessionTopic(editingSessionId, sessionTopic);
      showToast(t.common.saved, 'ok');
      setIsTopicModalOpen(false);
      refreshData();
    } catch {
      showToast('Xatolik', 'err');
    }
  };

  const handleSaveExtraSession = (e: React.FormEvent) => {
    e.preventDefault();
    if (!extraTopic.trim() || !extraLocation.trim()) {
      showToast(t.common.required, 'err');
      return;
    }
    try {
      storage.addExtraSession({
        clubId: extraClubId,
        topic: extraTopic,
        date: extraDate,
        time: extraTime,
        location: extraLocation,
        conductorName: extraConductor,
      });

      showToast(t.common.saved, 'ok');
      setIsExtraModalOpen(false);
      setExtraTopic('');
      refreshData();
    } catch {
      showToast('Xatolik', 'err');
    }
  };

  const handleDownloadPDF = async () => {
    setIsExporting(true);
    showToast(t.sch.pdfPreparing, 'ok');
    try {
      await downloadSchedulePDF('leader', slots, sessions, user, lang);
      showToast(t.common.saved, 'ok');
    } catch {
      showToast('PDF yaratishda xatolik', 'err');
    } finally {
      setIsExporting(false);
    }
  };

  if (clubs.length === 0) {
    return (
      <div className="bg-white rounded-3xl border border-slate-200 p-10 text-center text-slate-500 shadow-2xs">
        <p className="font-bold text-base text-slate-800">{t.leader.noClub}</p>
        <p className="text-xs text-slate-400 mt-1">Avval "Mening to'garaklarim" bo'limida to'garak oching.</p>
      </div>
    );
  }

  return (
    <div className="space-y-6">
      {/* Title & Actions */}
      <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
        <div>
          <h1 className="text-xl sm:text-2xl font-black text-slate-900 leading-tight">
            {t.nav.schedule}
          </h1>
          <p className="text-sm text-slate-500 mt-1 max-w-2xl">
            {t.sch.leaderSub}
          </p>
        </div>

        <div className="flex items-center gap-2">
          <button
            type="button"
            disabled={isExporting}
            onClick={handleDownloadPDF}
            className="px-3.5 py-2.5 rounded-xl border border-slate-200 bg-white hover:bg-slate-50 text-slate-700 text-xs sm:text-sm font-bold transition-all flex items-center gap-1.5 shadow-2xs cursor-pointer"
          >
            <Download className="w-4 h-4 text-blue-600" />
            <span>{t.sch.pdf}</span>
          </button>
          <button
            type="button"
            onClick={() => handleOpenSlotModal()}
            className="px-4 py-2.5 rounded-xl bg-blue-600 hover:bg-blue-700 active:scale-98 text-white text-xs sm:text-sm font-bold transition-all flex items-center gap-1.5 shadow-md shadow-blue-600/20 cursor-pointer"
          >
            <Plus className="w-4 h-4" />
            <span>{t.sch.addSlot}</span>
          </button>
        </div>
      </div>

      {/* Weekly recurring timetable */}
      <div className="bg-white rounded-2xl border border-slate-200 overflow-hidden shadow-xs">
        <div className="px-5 py-4 border-b border-slate-100 flex items-center justify-between">
          <div className="flex items-center gap-2">
            <CalendarDays className="w-4 h-4 text-blue-600" />
            <h3 className="text-base font-bold text-slate-900">
              {t.sch.weekly}
            </h3>
          </div>
          <span className="text-xs font-semibold text-slate-500">
            {slots.length} ta dars jadvali
          </span>
        </div>

        <div className="overflow-x-auto">
          <table className="w-full text-left text-sm">
            <thead className="bg-slate-50/70 text-xs font-bold text-slate-500 uppercase border-b border-slate-100">
              <tr>
                <th className="px-5 py-3.5">{t.sch.weekday}</th>
                <th className="px-5 py-3.5">{t.common.club}</th>
                <th className="px-5 py-3.5">{t.common.time}</th>
                <th className="px-5 py-3.5">{t.sch.room}</th>
                <th className="px-5 py-3.5">{t.sch.period}</th>
                <th className="px-5 py-3.5 text-right">{t.common.actions}</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-100">
              {slots.length === 0 ? (
                <tr>
                  <td colSpan={6} className="px-5 py-8 text-center text-slate-400">
                    {t.sch.noSlots}
                  </td>
                </tr>
              ) : (
                slots.map((s, idx) => {
                  const dayName = t.sch.days[s.weekday - 1] || '—';
                  const isFirstOfDay = idx === 0 || slots[idx - 1].weekday !== s.weekday;
                  return (
                    <tr
                      key={s.id}
                      className={`hover:bg-slate-50/50 transition-colors ${
                        isFirstOfDay && idx > 0 ? 'border-t-2 border-slate-200' : ''
                      }`}
                    >
                      <td className="px-5 py-3.5 font-extrabold text-blue-700 whitespace-nowrap">
                        {isFirstOfDay ? dayName : ''}
                      </td>
                      <td className="px-5 py-3.5 font-bold text-slate-900">
                        {s.clubName}
                      </td>
                      <td className="px-5 py-3.5 font-bold text-slate-800 whitespace-nowrap">
                        {s.timeStart} {s.timeEnd ? `– ${s.timeEnd}` : ''}
                      </td>
                      <td className="px-5 py-3.5 text-slate-700 font-semibold">
                        {s.room}
                      </td>
                      <td className="px-5 py-3.5 text-xs text-slate-500 whitespace-nowrap">
                        <div>{fmtD(s.startDate)} — {fmtD(s.endDate)}</div>
                        <div className="text-[11px] text-blue-600 font-bold mt-0.5">
                          {s.sessionCount} ta mashg‘ulot ({t.sch.everyWeek})
                        </div>
                      </td>
                      <td className="px-5 py-3.5 text-right">
                        <div className="inline-flex items-center gap-1.5">
                          <button
                            type="button"
                            onClick={() => handleOpenSlotModal(s)}
                            className="p-1.5 rounded-lg border border-slate-200 hover:bg-slate-50 text-slate-600 hover:text-slate-900 transition-colors cursor-pointer"
                            title={t.sch.editSlot}
                          >
                            <Edit3 className="w-3.5 h-3.5" />
                          </button>
                          <button
                            type="button"
                            onClick={() => handleDeleteSlot(s.id)}
                            className="p-1.5 rounded-lg border border-rose-200 bg-rose-50 hover:bg-rose-100 text-rose-700 transition-colors cursor-pointer"
                            title={t.common.delete}
                          >
                            <Trash2 className="w-3.5 h-3.5" />
                          </button>
                        </div>
                      </td>
                    </tr>
                  );
                })
              )}
            </tbody>
          </table>
        </div>
      </div>

      {/* Calendar List of Sessions with Topics, Rooms and Photo Evidence */}
      <div className="bg-white rounded-2xl border border-slate-200 overflow-hidden shadow-xs">
        <div className="px-5 py-4 border-b border-slate-100 flex items-center justify-between">
          <div className="flex items-center gap-2">
            <h3 className="text-base font-bold text-slate-900">
              {t.sch.calendar}
            </h3>
            <span className="text-xs text-slate-500 font-semibold">
              ({sessions.length} ta dars rejasi)
            </span>
          </div>

          <button
            type="button"
            onClick={() => setIsExtraModalOpen(true)}
            className="px-3 py-1.5 rounded-lg border border-slate-200 bg-white hover:bg-slate-50 text-slate-700 text-xs font-bold transition-all shadow-2xs cursor-pointer"
          >
            + {t.sch.extra}
          </button>
        </div>

        <div className="overflow-x-auto">
          <table className="w-full text-left text-sm">
            <thead className="bg-slate-50/70 text-xs font-bold text-slate-500 uppercase border-b border-slate-100">
              <tr>
                <th className="px-4 py-3.5">{t.common.date}</th>
                <th className="px-4 py-3.5">{t.common.club}</th>
                <th className="px-4 py-3.5">{t.common.topic}</th>
                <th className="px-4 py-3.5">{t.common.place}</th>
                <th className="px-4 py-3.5">{t.common.status}</th>
                <th className="px-4 py-3.5">{t.common.photoProof}</th>
                <th className="px-4 py-3.5 text-right">{t.common.actions}</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-100">
              {sessions.length === 0 ? (
                <tr>
                  <td colSpan={7} className="px-5 py-8 text-center text-slate-400">
                    {t.common.empty}
                  </td>
                </tr>
              ) : (
                sessions.map((ses) => {
                  const dayName = t.sch.days[weekdayOf(ses.date) - 1] || '—';
                  const isToday = ses.date === today;
                  return (
                    <tr
                      key={ses.id}
                      className={`hover:bg-slate-50/50 transition-colors ${
                        isToday ? 'bg-amber-50/40' : ''
                      }`}
                    >
                      {/* Date & Time */}
                      <td className="px-4 py-3.5 whitespace-nowrap">
                        <div className="font-extrabold text-slate-900">{fmtD(ses.date)}</div>
                        <div className="text-[11px] text-slate-400 font-semibold">
                          {dayName} • {ses.time}{ses.timeEnd ? `–${ses.timeEnd}` : ''}
                        </div>
                      </td>

                      {/* Club Name */}
                      <td className="px-4 py-3.5 font-bold text-slate-900">
                        {ses.clubName}
                      </td>

                      {/* Topic */}
                      <td className="px-4 py-3.5 min-w-[200px]">
                        <div className="flex items-center gap-1.5">
                          <span className="font-semibold text-slate-800 leading-snug">{ses.topic}</span>
                          <button
                            type="button"
                            onClick={() => {
                              setEditingSessionId(ses.id);
                              setSessionTopic(ses.rawTopic || ses.topic);
                              setIsTopicModalOpen(true);
                            }}
                            className="p-1 rounded text-slate-400 hover:text-slate-700 hover:bg-slate-100 cursor-pointer shrink-0"
                            title={t.sch.editTopic}
                          >
                            <Edit3 className="w-3 h-3" />
                          </button>
                        </div>
                        {ses.conductorName && (
                          <div className="text-[10px] text-blue-600 font-bold mt-0.5">
                            Mas'ul: {ses.conductorName}
                          </div>
                        )}
                      </td>

                      {/* Location / Room */}
                      <td className="px-4 py-3.5 text-slate-700 font-semibold whitespace-nowrap">
                        <span className="inline-flex items-center gap-1">
                          <MapPin className="w-3 h-3 text-blue-600 shrink-0" />
                          <span>{ses.location || '—'}</span>
                        </span>
                      </td>

                      {/* Status */}
                      <td className="px-4 py-3.5">
                        <StatusBadge status={ses.status} lang={lang} />
                        {ses.attendeeCount ? (
                          <span className="text-[10px] text-emerald-700 font-bold block mt-0.5">
                            {ses.attendeeCount} nafar qatnashdi
                          </span>
                        ) : null}
                      </td>

                      {/* Telegram Link Column */}
                      <td className="px-4 py-3.5 whitespace-nowrap">
                        {ses.telegramLink ? (
                          <a
                            href={ses.telegramLink.startsWith('http') ? ses.telegramLink : `https://${ses.telegramLink}`}
                            target="_blank"
                            rel="noopener noreferrer"
                            className="inline-flex items-center gap-1.5 px-3 py-1.5 rounded-xl bg-sky-50 hover:bg-sky-100 text-sky-700 border border-sky-200 text-xs font-bold transition-all shadow-2xs group"
                            title="Telegram postini ochish"
                          >
                            <Send className="w-3.5 h-3.5 text-sky-500 group-hover:scale-110 transition-transform" />
                            <span>Telegram post ↗</span>
                          </a>
                        ) : (
                          <span className="text-[11px] text-slate-400 italic">
                            Havola kiritilmagan
                          </span>
                        )}
                      </td>

                      {/* Actions */}
                      <td className="px-4 py-3.5 text-right whitespace-nowrap">
                        <div className="inline-flex items-center gap-1.5">
                          <button
                            type="button"
                            onClick={() => handleOpenPhotoModal(ses)}
                            className={`px-2.5 py-1.5 rounded-xl text-xs font-bold transition-all flex items-center gap-1.5 cursor-pointer ${
                              ses.status === 'held'
                                ? 'bg-sky-50 hover:bg-sky-100 text-sky-800 border border-sky-300'
                                : 'bg-blue-600 hover:bg-blue-700 text-white shadow-xs'
                            }`}
                            title={ses.status === 'held' ? "Havolani yangilash" : "Dars o'tildi — Telegram havola"}
                          >
                            <Send className="w-3.5 h-3.5" />
                            <span>{ses.status === 'held' ? "Havolani yangilash" : t.sch.photoUploadBtn}</span>
                          </button>

                          {ses.status !== 'missed' && (
                            <button
                              type="button"
                              onClick={() => handleMarkMissed(ses.id)}
                              className="p-1.5 rounded-lg border border-slate-200 text-slate-400 hover:text-rose-600 hover:bg-rose-50 transition-colors cursor-pointer"
                              title={t.leader.markMissed}
                            >
                              <X className="w-3.5 h-3.5" />
                            </button>
                          )}
                        </div>
                      </td>
                    </tr>
                  );
                })
              )}
            </tbody>
          </table>
        </div>
      </div>

      {/* Add / Edit Slot Modal */}
      <Modal
        isOpen={isSlotModalOpen}
        onClose={() => setIsSlotModalOpen(false)}
        title={editingSlotId ? t.sch.editSlot : t.sch.addSlot}
        footer={
          <>
            <button
              type="button"
              onClick={() => setIsSlotModalOpen(false)}
              className="px-4 py-2 rounded-xl border border-slate-200 text-slate-700 text-xs font-bold hover:bg-slate-50 transition-colors"
            >
              {t.common.cancel}
            </button>
            <button
              type="button"
              onClick={handleSaveSlot}
              className="px-4 py-2 rounded-xl bg-blue-600 hover:bg-blue-700 text-white text-xs font-bold transition-all shadow-md cursor-pointer"
            >
              {t.common.save}
            </button>
          </>
        }
      >
        <form onSubmit={handleSaveSlot} className="space-y-3.5">
          <div>
            <label className="block text-xs font-bold text-slate-700 mb-1">
              {t.common.club}
            </label>
            <select
              value={slotClubId}
              disabled={!!editingSlotId}
              onChange={(e) => setSlotClubId(e.target.value)}
              className="w-full px-3.5 py-2.5 rounded-xl border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600 transition-colors bg-white font-medium"
            >
              {clubs.map((c) => (
                <option key={c.id} value={c.id}>
                  {c.name}
                </option>
              ))}
            </select>
          </div>

          <div>
            <label className="block text-xs font-bold text-slate-700 mb-1">
              {t.sch.weekday} *
            </label>
            <select
              value={slotWeekday}
              onChange={(e) => setSlotWeekday(Number(e.target.value))}
              className="w-full px-3.5 py-2.5 rounded-xl border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600 transition-colors bg-white font-medium"
            >
              {t.sch.days.map((day, idx) => (
                <option key={idx} value={idx + 1}>
                  {day}
                </option>
              ))}
            </select>
          </div>

          <div className="grid grid-cols-2 gap-2">
            <div>
              <label className="block text-xs font-bold text-slate-700 mb-1">
                {t.sch.timeStart} *
              </label>
              <input
                type="time"
                required
                value={slotTimeStart}
                onChange={(e) => setSlotTimeStart(normalizeClubTime(e.target.value))}
                className="w-full px-3 py-2 rounded-xl border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600 transition-colors"
              />
              <div className="flex flex-wrap gap-1 mt-1.5">
                {['09:00', '10:00', '11:00', '12:00', '14:00', '15:00', '16:00'].map((p) => (
                  <button
                    key={p}
                    type="button"
                    onClick={() => {
                      setSlotTimeStart(p);
                      const [h, m] = p.split(':').map(Number);
                      setSlotTimeEnd(`${String(h + 1).padStart(2, '0')}:${String(m + 30 >= 60 ? m - 30 : m + 30).padStart(2, '0')}`);
                    }}
                    className={`px-1.5 py-0.5 text-[10px] rounded font-bold transition-all cursor-pointer ${
                      slotTimeStart === p
                        ? 'bg-blue-600 text-white shadow-xs'
                        : 'bg-slate-100 hover:bg-slate-200 text-slate-700'
                    }`}
                  >
                    {p}
                  </button>
                ))}
              </div>
              {slotTimeStart && (
                <span className="text-[10px] text-emerald-700 font-bold block mt-1">
                  Tanlangan: {slotTimeStart} (Kunduzgi vaqt)
                </span>
              )}
            </div>
            <div>
              <label className="block text-xs font-bold text-slate-700 mb-1">
                {t.sch.timeEnd} *
              </label>
              <input
                type="time"
                required
                value={slotTimeEnd}
                onChange={(e) => setSlotTimeEnd(normalizeClubTime(e.target.value))}
                className="w-full px-3 py-2 rounded-xl border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600 transition-colors"
              />
              <div className="flex flex-wrap gap-1 mt-1.5">
                {['10:30', '11:30', '12:30', '13:30', '15:30', '16:30', '17:30'].map((p) => (
                  <button
                    key={p}
                    type="button"
                    onClick={() => setSlotTimeEnd(p)}
                    className={`px-1.5 py-0.5 text-[10px] rounded font-bold transition-all cursor-pointer ${
                      slotTimeEnd === p
                        ? 'bg-blue-600 text-white shadow-xs'
                        : 'bg-slate-100 hover:bg-slate-200 text-slate-700'
                    }`}
                  >
                    {p}
                  </button>
                ))}
              </div>
              {slotTimeEnd && (
                <span className="text-[10px] text-emerald-700 font-bold block mt-1">
                  Tugash: {slotTimeEnd}
                </span>
              )}
            </div>
          </div>

          <div>
            <label className="block text-xs font-bold text-slate-700 mb-1">
              {t.sch.room} *
            </label>
            <input
              type="text"
              required
              value={slotRoom}
              onChange={(e) => setSlotRoom(e.target.value)}
              placeholder={t.sch.roomPh}
              className="w-full px-3.5 py-2.5 rounded-xl border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600 transition-colors"
            />
          </div>

          <div className="grid grid-cols-2 gap-2">
            <div>
              <label className="block text-xs font-bold text-slate-700 mb-1">
                {t.sch.startDate} *
              </label>
              <input
                type="date"
                required
                value={slotStartDate}
                onChange={(e) => setSlotStartDate(e.target.value)}
                className="w-full px-3 py-2 rounded-xl border border-slate-200 text-xs focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600 transition-colors"
              />
            </div>
            <div>
              <label className="block text-xs font-bold text-slate-700 mb-1">
                {t.sch.endDate} *
              </label>
              <input
                type="date"
                required
                value={slotEndDate}
                onChange={(e) => setSlotEndDate(e.target.value)}
                className="w-full px-3 py-2 rounded-xl border border-slate-200 text-xs focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600 transition-colors"
              />
            </div>
          </div>

          <div className="p-3 rounded-xl bg-blue-50 border border-blue-200 text-blue-900 text-xs font-bold flex items-center gap-2">
            <Clock className="w-4 h-4 text-blue-600 shrink-0" />
            <span>{t.sch.preview.replace('{n}', previewCount.toString())}</span>
          </div>
        </form>
      </Modal>

      {/* Held Session with Telegram Link Modal */}
      <Modal
        isOpen={isPhotoModalOpen}
        onClose={() => setIsPhotoModalOpen(false)}
        title={t.leader.heldModalTitle}
        footer={
          <>
            <button
              type="button"
              onClick={() => setIsPhotoModalOpen(false)}
              className="px-4 py-2 rounded-xl border border-slate-200 text-slate-700 text-xs font-bold hover:bg-slate-50 transition-colors"
            >
              {t.common.cancel}
            </button>
            <button
              type="button"
              onClick={handleSaveHeldWithPhoto}
              className="px-4 py-2 rounded-xl bg-blue-600 hover:bg-blue-700 text-white text-xs font-bold transition-all shadow-md cursor-pointer flex items-center gap-1.5"
            >
              <Send className="w-3.5 h-3.5" />
              <span>Tasdiqlash va Havolani saqlash</span>
            </button>
          </>
        }
      >
        {targetSession && (
          <form onSubmit={handleSaveHeldWithPhoto} className="space-y-4">
            <div className="p-3 rounded-xl bg-slate-50 border border-slate-100 text-xs space-y-1">
              <div className="font-extrabold text-slate-900">{targetSession.clubName}</div>
              <div className="text-slate-600">Mavzu: <span className="font-bold">{targetSession.topic}</span></div>
              <div className="text-slate-500">
                Sana va vaqt: <b>{fmtD(targetSession.date)}</b>, {targetSession.time} • Xona: <b>{targetSession.location}</b>
              </div>
            </div>

            {/* Telegram Link Input */}
            <div>
              <label className="block text-xs font-extrabold text-slate-900 mb-1">
                Kanalda yoritilgan Telegram post havolasi *
              </label>
              <p className="text-[11px] text-slate-500 mb-2">
                Mashg‘ulot o‘tkazilganligi va to‘garak a’zolari qatnashganligi kanalimizda yoritilgan post havolasini kiriting.
              </p>
              <div className="relative">
                <div className="absolute inset-y-0 left-0 pl-3.5 flex items-center pointer-events-none text-sky-500">
                  <Send className="w-4 h-4" />
                </div>
                <input
                  type="url"
                  value={sessionTelegramLink}
                  onChange={(e) => setSessionTelegramLink(e.target.value)}
                  placeholder="https://t.me/kanal_nomi/123"
                  className="w-full pl-10 pr-3.5 py-2.5 rounded-xl border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-sky-500/20 focus:border-sky-500 transition-colors"
                  required
                />
              </div>
            </div>

            <div className="grid grid-cols-2 gap-2">
              <div>
                <label className="block text-xs font-bold text-slate-700 mb-1">
                  Qatnashgan talabalar soni
                </label>
                <input
                  type="number"
                  min={1}
                  max={200}
                  value={attendeeCount}
                  onChange={(e) => setAttendeeCount(Number(e.target.value))}
                  className="w-full px-3 py-2 rounded-xl border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600 transition-colors"
                />
              </div>
              <div>
                <label className="block text-xs font-bold text-slate-700 mb-1">
                  O'tkazuvchi mas'ul shaxs
                </label>
                <input
                  type="text"
                  value={conductorName}
                  onChange={(e) => setConductorName(e.target.value)}
                  className="w-full px-3 py-2 rounded-xl border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600 transition-colors"
                />
              </div>
            </div>

            <div>
              <label className="block text-xs font-bold text-slate-700 mb-1">
                Dars jarayoni bo'yicha qisqacha izoh
              </label>
              <textarea
                rows={2}
                value={heldNote}
                onChange={(e) => setHeldNote(e.target.value)}
                placeholder="Darsda nimalar o'rganildi, amaliy topshiriqlar..."
                className="w-full px-3.5 py-2 rounded-xl border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600 transition-colors"
              />
            </div>
          </form>
        )}
      </Modal>

      {/* Edit Session Topic Modal */}
      <Modal
        isOpen={isTopicModalOpen}
        onClose={() => setIsTopicModalOpen(false)}
        title={t.sch.editTopic}
        footer={
          <>
            <button
              type="button"
              onClick={() => setIsTopicModalOpen(false)}
              className="px-4 py-2 rounded-xl border border-slate-200 text-slate-700 text-xs font-bold hover:bg-slate-50 transition-colors"
            >
              {t.common.cancel}
            </button>
            <button
              type="button"
              onClick={handleSaveTopic}
              className="px-4 py-2 rounded-xl bg-blue-600 hover:bg-blue-700 text-white text-xs font-bold transition-all shadow-md cursor-pointer"
            >
              {t.common.save}
            </button>
          </>
        }
      >
        <form onSubmit={handleSaveTopic} className="space-y-3">
          <div>
            <label className="block text-xs font-bold text-slate-700 mb-1">
              {t.common.topic}
            </label>
            <input
              type="text"
              required
              value={sessionTopic}
              onChange={(e) => setSessionTopic(e.target.value)}
              placeholder="Masalan: Notiqlik mahorati — amaliy seminar"
              className="w-full px-3.5 py-2.5 rounded-xl border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600 transition-colors"
            />
          </div>
        </form>
      </Modal>

      {/* Add Extra Session Modal */}
      <Modal
        isOpen={isExtraModalOpen}
        onClose={() => setIsExtraModalOpen(false)}
        title={t.modal.addSession}
        footer={
          <>
            <button
              type="button"
              onClick={() => setIsExtraModalOpen(false)}
              className="px-4 py-2 rounded-xl border border-slate-200 text-slate-700 text-xs font-bold hover:bg-slate-50 transition-colors"
            >
              {t.common.cancel}
            </button>
            <button
              type="button"
              onClick={handleSaveExtraSession}
              className="px-4 py-2 rounded-xl bg-blue-600 hover:bg-blue-700 text-white text-xs font-bold transition-all shadow-md cursor-pointer"
            >
              {t.leader.addSession}
            </button>
          </>
        }
      >
        <form onSubmit={handleSaveExtraSession} className="space-y-3.5">
          <div>
            <label className="block text-xs font-bold text-slate-700 mb-1">
              {t.common.club}
            </label>
            <select
              value={extraClubId}
              onChange={(e) => setExtraClubId(e.target.value)}
              className="w-full px-3.5 py-2.5 rounded-xl border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600 transition-colors bg-white font-medium"
            >
              {clubs.map((c) => (
                <option key={c.id} value={c.id}>
                  {c.name}
                </option>
              ))}
            </select>
          </div>

          <div>
            <label className="block text-xs font-bold text-slate-700 mb-1">
              {t.common.topic} *
            </label>
            <input
              type="text"
              required
              value={extraTopic}
              onChange={(e) => setExtraTopic(e.target.value)}
              placeholder="Qo‘shimcha mashg‘ulot mavzusi"
              className="w-full px-3.5 py-2.5 rounded-xl border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600 transition-colors"
            />
          </div>

          <div className="grid grid-cols-2 gap-2">
            <div>
              <label className="block text-xs font-bold text-slate-700 mb-1">
                {t.common.date} *
              </label>
              <input
                type="date"
                required
                value={extraDate}
                onChange={(e) => setExtraDate(e.target.value)}
                className="w-full px-3 py-2 rounded-xl border border-slate-200 text-xs focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600 transition-colors"
              />
            </div>
            <div>
              <label className="block text-xs font-bold text-slate-700 mb-1">
                {t.common.time} *
              </label>
              <input
                type="time"
                required
                value={extraTime}
                onChange={(e) => setExtraTime(normalizeClubTime(e.target.value))}
                className="w-full px-3 py-2 rounded-xl border border-slate-200 text-xs focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600 transition-colors"
              />
              <div className="flex flex-wrap gap-1 mt-1">
                {['09:00', '10:00', '11:00', '12:00', '14:00', '15:00', '16:00'].map((p) => (
                  <button
                    key={p}
                    type="button"
                    onClick={() => setExtraTime(p)}
                    className={`px-1.5 py-0.5 text-[9px] rounded font-bold transition-all cursor-pointer ${
                      extraTime === p
                        ? 'bg-blue-600 text-white shadow-xs'
                        : 'bg-slate-100 hover:bg-slate-200 text-slate-700'
                    }`}
                  >
                    {p}
                  </button>
                ))}
              </div>
              {extraTime && (
                <span className="text-[10px] text-emerald-700 font-bold block mt-1">
                  Tanlangan: {extraTime} (Kunduzgi vaqt)
                </span>
              )}
            </div>
          </div>

          <div>
            <label className="block text-xs font-bold text-slate-700 mb-1">
              {t.common.place} *
            </label>
            <input
              type="text"
              required
              value={extraLocation}
              onChange={(e) => setExtraLocation(e.target.value)}
              placeholder={t.sch.roomPh}
              className="w-full px-3.5 py-2.5 rounded-xl border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600 transition-colors"
            />
          </div>

          <div>
            <label className="block text-xs font-bold text-slate-700 mb-1">
              {t.common.conductor}
            </label>
            <input
              type="text"
              value={extraConductor}
              onChange={(e) => setExtraConductor(e.target.value)}
              placeholder="Masalan: Nafisa Sotiboldiyeva"
              className="w-full px-3.5 py-2.5 rounded-xl border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600 transition-colors"
            />
          </div>
        </form>
      </Modal>
    </div>
  );
};
