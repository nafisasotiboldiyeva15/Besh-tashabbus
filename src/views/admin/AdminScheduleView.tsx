import React, { useState } from 'react';
import { CalendarDays, Download, Filter, MapPin, Send, ExternalLink } from 'lucide-react';
import { I18N, Language } from '../../lib/i18n';
import { storage, fmtD, weekdayOf } from '../../lib/storage';
import { StatusBadge } from '../../components/common/Badge';
import { ScheduleSlot, Session, User } from '../../types';
import { downloadSchedulePDF } from '../../lib/pdf';

export const AdminScheduleView: React.FC<{
  user: User;
  lang: Language;
  showToast: (msg: string, type?: 'ok' | 'err') => void;
  onRefresh: () => void;
}> = ({ user, lang, showToast }) => {
  const t = I18N[lang];
  const clubs = storage.getClubs();
  const [selectedClubId, setSelectedClubId] = useState<string>('all');
  const [statusFilter, setStatusFilter] = useState<string>('all');

  const slots = storage.getSchedules(selectedClubId === 'all' ? undefined : selectedClubId);
  const allSessions = storage.getSessions(selectedClubId === 'all' ? undefined : selectedClubId);

  const filteredSessions = allSessions.filter((s) => {
    if (statusFilter !== 'all' && s.status !== statusFilter) return false;
    return true;
  });

  const [isExporting, setIsExporting] = useState(false);

  const handleDownloadPDF = async () => {
    setIsExporting(true);
    showToast(t.sch.pdfPreparing, 'ok');
    try {
      await downloadSchedulePDF('admin', slots, filteredSessions, user, lang);
      showToast(t.common.saved, 'ok');
    } catch {
      showToast('PDF yaratishda xatolik', 'err');
    } finally {
      setIsExporting(false);
    }
  };

  return (
    <div className="space-y-6">
      {/* Title & Actions */}
      <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
        <div>
          <h1 className="text-xl sm:text-2xl font-black text-slate-900 leading-tight">
            {t.admin.scheduleMonitor}
          </h1>
          <p className="text-sm text-slate-500 mt-1 max-w-2xl">
            {t.sch.adminSub}
          </p>
        </div>

        <button
          type="button"
          disabled={isExporting}
          onClick={handleDownloadPDF}
          className="px-4 py-2.5 rounded-xl border border-slate-200 bg-white hover:bg-slate-50 text-slate-700 text-xs sm:text-sm font-bold transition-all flex items-center gap-2 shadow-2xs cursor-pointer self-start sm:self-auto"
        >
          <Download className="w-4 h-4 text-blue-600" />
          <span>{t.sch.pdfAll}</span>
        </button>
      </div>

      {/* Filters */}
      <div className="flex flex-wrap items-center gap-3 p-4 bg-white rounded-2xl border border-slate-200 shadow-2xs">
        <div className="flex items-center gap-2 text-xs font-bold text-slate-500">
          <Filter className="w-4 h-4 text-blue-600" />
          <span>Filtrlar:</span>
        </div>

        {/* Club filter */}
        <select
          value={selectedClubId}
          onChange={(e) => setSelectedClubId(e.target.value)}
          className="px-3 py-1.5 rounded-xl border border-slate-200 text-xs font-bold text-slate-700 bg-white focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600"
        >
          <option value="all">Barcha to‘garaklar ({clubs.length})</option>
          {clubs.map((c) => (
            <option key={c.id} value={c.id}>
              {c.name} ({c.leaderName})
            </option>
          ))}
        </select>

        {/* Status filter */}
        <select
          value={statusFilter}
          onChange={(e) => setStatusFilter(e.target.value)}
          className="px-3 py-1.5 rounded-xl border border-slate-200 text-xs font-bold text-slate-700 bg-white focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600"
        >
          <option value="all">Barcha holatlar</option>
          <option value="planned">Rejalashtirilgan</option>
          <option value="held">O‘tkazilgan (Telegram havolalar bilan)</option>
          <option value="missed">O‘tkazilmagan</option>
        </select>
      </div>

      {/* Weekly schedule overview */}
      <div className="bg-white rounded-2xl border border-slate-200 overflow-hidden shadow-xs">
        <div className="px-5 py-4 border-b border-slate-100 flex items-center justify-between">
          <div className="flex items-center gap-2">
            <CalendarDays className="w-4 h-4 text-blue-600" />
            <h3 className="text-base font-bold text-slate-900">
              {t.sch.weeklyAll}
            </h3>
          </div>
          <span className="text-xs font-semibold text-slate-500">
            {slots.length} ta grafik
          </span>
        </div>

        <div className="overflow-x-auto">
          <table className="w-full text-left text-sm">
            <thead className="bg-slate-50/70 text-xs font-bold text-slate-500 uppercase border-b border-slate-100">
              <tr>
                <th className="px-5 py-3.5">{t.sch.weekday}</th>
                <th className="px-5 py-3.5">{t.common.club}</th>
                <th className="px-5 py-3.5">{t.common.leader}</th>
                <th className="px-5 py-3.5">{t.common.time}</th>
                <th className="px-5 py-3.5">{t.sch.room}</th>
                <th className="px-5 py-3.5">{t.sch.period}</th>
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
                      <td className="px-5 py-3.5 text-xs text-slate-600 font-semibold">
                        {s.leaderName}
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
                    </tr>
                  );
                })
              )}
            </tbody>
          </table>
        </div>
      </div>

      {/* Calendar List of Sessions with Topics, Rooms, Conductors, and Photos */}
      <div className="bg-white rounded-2xl border border-slate-200 overflow-hidden shadow-xs">
        <div className="px-5 py-4 border-b border-slate-100 flex items-center justify-between">
          <h3 className="text-base font-bold text-slate-900">
            {t.sch.calendar}
          </h3>
          <span className="text-xs text-slate-500 font-semibold">
            {filteredSessions.length} ta mashg‘ulot
          </span>
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
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-100">
              {filteredSessions.length === 0 ? (
                <tr>
                  <td colSpan={6} className="px-5 py-8 text-center text-slate-400">
                    {t.common.empty}
                  </td>
                </tr>
              ) : (
                filteredSessions.map((ses) => {
                  const dayName = t.sch.days[weekdayOf(ses.date) - 1] || '—';
                  return (
                    <tr key={ses.id} className="hover:bg-slate-50/50 transition-colors">
                      <td className="px-4 py-3.5 whitespace-nowrap">
                        <div className="font-extrabold text-slate-900">{fmtD(ses.date)}</div>
                        <div className="text-[11px] text-slate-400 font-semibold">
                          {dayName} • {ses.time}{ses.timeEnd ? `–${ses.timeEnd}` : ''}
                        </div>
                      </td>

                      <td className="px-4 py-3.5 font-bold text-slate-900">
                        {ses.clubName}
                      </td>

                      <td className="px-4 py-3.5 min-w-[200px]">
                        <span className="font-semibold text-slate-800 leading-snug">{ses.topic}</span>
                        {ses.conductorName && (
                          <div className="text-[11px] text-blue-700 font-bold mt-0.5">
                            O'tkazuvchi: {ses.conductorName}
                          </div>
                        )}
                      </td>

                      <td className="px-4 py-3.5 text-slate-700 font-semibold whitespace-nowrap">
                        <span className="inline-flex items-center gap-1">
                          <MapPin className="w-3.5 h-3.5 text-blue-600 shrink-0" />
                          <span>{ses.location || '—'}</span>
                        </span>
                      </td>

                      <td className="px-4 py-3.5 whitespace-nowrap">
                        <StatusBadge status={ses.status} lang={lang} />
                        {ses.attendeeCount ? (
                          <span className="text-[10px] text-emerald-700 font-bold block mt-0.5">
                            {ses.attendeeCount} nafar qatnashchi
                          </span>
                        ) : null}
                      </td>

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
                          <span className="text-xs text-slate-400 italic">
                            Havola kiritilmagan
                          </span>
                        )}
                      </td>
                    </tr>
                  );
                })
              )}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
};
