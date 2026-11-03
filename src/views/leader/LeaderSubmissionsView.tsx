import React, { useState, useEffect } from 'react';
import {
  Send,
  Calendar,
  ExternalLink,
  Plus,
  BookOpen,
  Users,
  Search,
  Filter,
  Link as LinkIcon,
  Trash2,
  Edit2,
  CheckCircle2
} from 'lucide-react';
import { I18N, Language } from '../../lib/i18n';
import { storage, fmtD } from '../../lib/storage';
import { User as UserType, Session, Club } from '../../types';
import { Modal } from '../../components/common/Modal';

export const LeaderSubmissionsView: React.FC<{
  user: UserType;
  lang: Language;
  showToast?: (msg: string, type?: 'ok' | 'err') => void;
  onRefresh?: () => void;
}> = ({ user, lang, showToast, onRefresh }) => {
  const t = I18N[lang];

  const [sessions, setSessions] = useState<Session[]>([]);
  const [clubs, setClubs] = useState<Club[]>([]);
  const [selectedClubFilter, setSelectedClubFilter] = useState<string>('all');
  const [searchQuery, setSearchQuery] = useState('');

  // Add/Edit Modal
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [targetSessionId, setTargetSessionId] = useState('');
  const [targetClubId, setTargetClubId] = useState('');
  const [targetTopic, setTargetTopic] = useState('');
  const [targetDate, setTargetDate] = useState(new Date().toISOString().split('T')[0]);
  const [targetAttendees, setTargetAttendees] = useState(15);
  const [targetNote, setTargetNote] = useState('');
  const [telegramLinkInput, setTelegramLinkInput] = useState('');
  const [modalError, setModalError] = useState('');

  const loadData = () => {
    const leaderClubs = storage.getClubs(user.id);
    setClubs(leaderClubs);
    const clubIds = new Set(leaderClubs.map((c) => c.id));

    const allSessions = storage.getSessions();
    const leaderSess = allSessions.filter((s) => clubIds.has(s.clubId) && Boolean(s.telegramLink));
    setSessions(leaderSess);

    if (onRefresh) onRefresh();
  };

  useEffect(() => {
    loadData();
    const unsub = storage.subscribe(() => {
      loadData();
    });
    return unsub;
  }, [user.id]);

  const clubMap = new Map<string, Club>();
  clubs.forEach((c) => clubMap.set(c.id, c));

  // Sort sessions by date descending
  const sortedSessions = [...sessions].sort((a, b) => {
    return new Date(b.date || b.createdAt || 0).getTime() - new Date(a.date || a.createdAt || 0).getTime();
  });

  const filteredSessions = sortedSessions.filter((ses) => {
    if (selectedClubFilter !== 'all' && ses.clubId !== selectedClubFilter) return false;

    if (searchQuery.trim()) {
      const q = searchQuery.toLowerCase();
      const club = clubMap.get(ses.clubId);
      const matchTopic = (ses.topic || '').toLowerCase().includes(q);
      const matchClub = (club?.name || '').toLowerCase().includes(q);
      const matchNote = (ses.heldNote || '').toLowerCase().includes(q);
      if (!matchTopic && !matchClub && !matchNote) return false;
    }

    return true;
  });

  const totalLinksCount = sessions.length;
  const totalAttendees = sessions.reduce((acc, s) => acc + (s.attendeeCount || 0), 0);

  const handleOpenAddModal = () => {
    setModalError('');
    setTargetSessionId('');
    setTargetClubId(clubs[0]?.id || user.clubId || '');
    setTargetTopic('Telegram kanalda yoritilgan dars mashg‘uloti');
    setTargetDate(new Date().toISOString().split('T')[0]);
    setTargetAttendees(15);
    setTargetNote('Rasmiy kanalda yoritildi.');
    setTelegramLinkInput('');
    setIsModalOpen(true);
  };

  const handleOpenEditModal = (ses: Session) => {
    setModalError('');
    setTargetSessionId(ses.id);
    setTargetClubId(ses.clubId);
    setTargetTopic(ses.topic || '');
    setTargetDate(ses.date || new Date().toISOString().split('T')[0]);
    setTargetAttendees(ses.attendeeCount || 15);
    setTargetNote(ses.heldNote || '');
    setTelegramLinkInput(ses.telegramLink || '');
    setIsModalOpen(true);
  };

  const handleDeleteLink = (ses: Session) => {
    if (window.confirm(`«${ses.topic}» darsidagi Telegram havolani o‘chirishni tasdiqlaysizmi?`)) {
      try {
        storage.updateSession(ses.id, { telegramLink: undefined });
        if (showToast) showToast('Telegram havola o‘chirildi', 'ok');
        loadData();
      } catch (err: any) {
        if (showToast) showToast(err.message || 'Xatolik yuz berdi', 'err');
      }
    }
  };

  const handleSaveTelegramLink = (e: React.FormEvent) => {
    e.preventDefault();
    setModalError('');
    const cleanLink = telegramLinkInput.trim();
    if (!cleanLink) {
      setModalError('Telegram havolani kiritish majburiy');
      return;
    }
    const finalLink = cleanLink.startsWith('http')
      ? cleanLink
      : cleanLink.startsWith('t.me/')
      ? `https://${cleanLink}`
      : `https://t.me/${cleanLink}`;

    try {
      if (targetSessionId) {
        storage.updateSession(targetSessionId, {
          telegramLink: finalLink,
          topic: targetTopic.trim() || undefined,
          date: targetDate,
          attendeeCount: Number(targetAttendees) || undefined,
          heldNote: targetNote.trim() || undefined,
        });
        if (showToast) showToast('Telegram havola muvaffaqiyatli yangilandi!', 'ok');
      } else {
        const club = clubMap.get(targetClubId);
        storage.createSession({
          clubId: targetClubId,
          topic: targetTopic.trim() || 'Telegram kanalda yoritilgan dars mashg‘uloti',
          date: targetDate,
          time: '14:00',
          location: club?.room || '305-auditoriya',
          status: 'held',
          heldNote: targetNote.trim() || 'Rasmiy kanalda yoritildi.',
          conductorName: user.fullName || club?.leaderName || 'To‘garak rahbari',
          attendeeCount: Number(targetAttendees) || 15,
          telegramLink: finalLink,
        });
        if (showToast) showToast('Telegram havola biriktirildi va to‘g‘ridan-to‘g‘ri e’lon qilindi!', 'ok');
      }
      setIsModalOpen(false);
      loadData();
    } catch (err: any) {
      setModalError(err.message || 'Saqlashda xatolik yuz berdi');
    }
  };

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
        <div>
          <h1 className="text-xl sm:text-2xl font-black text-slate-900 leading-tight flex items-center gap-2">
            <Send className="w-6 h-6 text-sky-500" />
            <span>Kanalda yoritilgan Telegram havolalar</span>
          </h1>
          <p className="text-xs sm:text-sm text-slate-500 mt-1 max-w-3xl">
            To‘garak dars mashg‘ulotlari va e’lonlaringiz yoritilgan rasmiy Telegram kanal postlari. Kiritilgan havolalar darhol tizimda aks etadi (tasdiqlash talab etilmaydi).
          </p>
        </div>

        <div className="flex flex-wrap items-center gap-2 self-start sm:self-auto">
          <button
            type="button"
            onClick={handleOpenAddModal}
            className="px-4 py-2 bg-gradient-to-r from-sky-500 to-blue-600 hover:from-sky-600 hover:to-blue-700 text-white rounded-xl text-xs font-bold transition-all shadow-md shadow-sky-500/20 flex items-center gap-2 cursor-pointer"
          >
            <Plus className="w-4 h-4" />
            <span>Yangi Telegram havola kiritish</span>
          </button>
        </div>
      </div>

      {/* Top Stat Counters */}
      <div className="grid grid-cols-1 sm:grid-cols-3 gap-3 sm:gap-4">
        <div className="bg-white rounded-2xl p-4 border border-slate-200/80 shadow-2xs">
          <div className="text-[11px] font-bold text-slate-500 uppercase tracking-wider">Jami kiritilgan havolalar</div>
          <div className="text-2xl font-black text-slate-900 mt-1">{totalLinksCount} ta</div>
          <div className="text-[10px] text-slate-400 mt-0.5">Kanalda e’lon qilingan mashg‘ulotlar</div>
        </div>

        <div className="bg-sky-50/60 rounded-2xl p-4 border border-sky-100 shadow-2xs">
          <div className="text-[11px] font-bold text-sky-800 uppercase tracking-wider">To‘garaklaringiz</div>
          <div className="text-2xl font-black text-sky-900 mt-1">{clubs.length} ta</div>
          <div className="text-[10px] text-sky-700 mt-0.5">Sizga biriktirilgan to‘garaklar</div>
        </div>

        <div className="bg-emerald-50/60 rounded-2xl p-4 border border-emerald-100 shadow-2xs">
          <div className="text-[11px] font-bold text-emerald-800 uppercase tracking-wider">Qamrab olingan talabalar</div>
          <div className="text-2xl font-black text-emerald-900 mt-1">{totalAttendees} nafar</div>
          <div className="text-[10px] text-emerald-700 mt-0.5">Mashg‘ulotlarda qatnashgan talabalar</div>
        </div>
      </div>

      {/* Filter and Search Bar */}
      <div className="bg-white rounded-3xl p-4 border border-slate-200/80 shadow-xs flex flex-col sm:flex-row items-stretch sm:items-center justify-between gap-3">
        <div className="relative flex-1 max-w-md">
          <Search className="w-4 h-4 text-slate-400 absolute left-3 top-1/2 -translate-y-1/2" />
          <input
            type="text"
            value={searchQuery}
            onChange={(e) => setSearchQuery(e.target.value)}
            placeholder="Mavzu yoki to‘garak nomi bo‘yicha qidiruv..."
            className="w-full pl-9 pr-3.5 py-2 rounded-xl border border-slate-200 text-xs focus:outline-none focus:ring-2 focus:ring-sky-500/20"
          />
        </div>

        {clubs.length > 1 && (
          <div className="inline-flex items-center gap-2">
            <Filter className="w-3.5 h-3.5 text-slate-400 shrink-0" />
            <select
              value={selectedClubFilter}
              onChange={(e) => setSelectedClubFilter(e.target.value)}
              className="px-3 py-2 rounded-xl border border-slate-200 bg-white text-xs font-semibold text-slate-700 focus:outline-none focus:ring-2 focus:ring-sky-500/20"
            >
              <option value="all">Barcha to‘garaklaringiz ({clubs.length})</option>
              {clubs.map((c) => (
                <option key={c.id} value={c.id}>
                  {c.name}
                </option>
              ))}
            </select>
          </div>
        )}
      </div>

      {/* Grid of Leader Telegram Links */}
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
        {filteredSessions.length === 0 ? (
          <div className="col-span-full p-12 text-center bg-white rounded-3xl border border-dashed border-slate-200 text-slate-400 space-y-3">
            <div className="w-12 h-12 rounded-2xl bg-sky-50 text-sky-500 flex items-center justify-center mx-auto">
              <Send className="w-6 h-6" />
            </div>
            <div className="text-sm font-bold text-slate-700">Telegram havolalar mavjud emas</div>
            <p className="text-xs text-slate-400 max-w-sm mx-auto">
              O‘tkazilgan dars mashg‘ulotlaringizning Telegram havolalarini «Yangi Telegram havola kiritish» tugmasi orqali kiriting. Ular to‘g‘ridan-to‘g‘ri saqlanadi va admin nazoratida aks etadi.
            </p>
          </div>
        ) : (
          filteredSessions.map((ses) => {
            const club = clubMap.get(ses.clubId);
            const cleanUrl = ses.telegramLink!.startsWith('http')
              ? ses.telegramLink!
              : `https://${ses.telegramLink}`;

            return (
              <div
                key={ses.id}
                className="bg-white rounded-3xl border border-slate-200/90 shadow-2xs hover:shadow-md transition-all p-5 flex flex-col justify-between gap-4"
              >
                <div className="space-y-3">
                  {/* Badge */}
                  <div className="flex items-center justify-between gap-2">
                    <span className="px-2.5 py-0.5 rounded-lg bg-blue-50 text-blue-800 text-[11px] font-extrabold truncate max-w-[200px]">
                      {club?.name || 'To‘garak'}
                    </span>
                    <span className="inline-flex items-center gap-1 px-2.5 py-0.5 rounded-full bg-emerald-50 text-emerald-800 text-[10px] font-extrabold border border-emerald-200">
                      <CheckCircle2 className="w-3 h-3 text-emerald-600" />
                      <span>Faol post</span>
                    </span>
                  </div>

                  {/* Title & Topic */}
                  <div>
                    <h3 className="text-sm font-extrabold text-slate-900 leading-snug">
                      {ses.topic || 'Dars mashg‘uloti'}
                    </h3>
                    <div className="flex flex-wrap items-center gap-3 mt-1.5 text-[11px] text-slate-500 font-medium">
                      <div className="flex items-center gap-1">
                        <Calendar className="w-3.5 h-3.5 text-sky-500 shrink-0" />
                        <span>{fmtD(ses.heldDate || ses.date || ses.createdAt)}</span>
                      </div>
                      {ses.attendeeCount ? (
                        <div className="flex items-center gap-1 text-emerald-700 font-bold">
                          <Users className="w-3.5 h-3.5 text-emerald-600 shrink-0" />
                          <span>{ses.attendeeCount} nafar talaba</span>
                        </div>
                      ) : null}
                    </div>
                  </div>

                  {/* Open Link Button */}
                  <a
                    href={cleanUrl}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="w-full py-2.5 px-3.5 rounded-xl bg-gradient-to-r from-sky-500 to-blue-600 hover:from-sky-600 hover:to-blue-700 text-white text-xs font-bold transition-all shadow-sm shadow-sky-500/20 flex items-center justify-between group cursor-pointer"
                  >
                    <div className="flex items-center gap-2 min-w-0">
                      <Send className="w-4 h-4 text-white shrink-0 group-hover:scale-110 transition-transform" />
                      <span className="truncate">Telegram kanal postini ochish</span>
                    </div>
                    <ExternalLink className="w-3.5 h-3.5 text-sky-100 shrink-0" />
                  </a>

                  {/* Note */}
                  {ses.heldNote && (
                    <div className="p-2.5 rounded-xl bg-slate-50 border border-slate-100 text-xs text-slate-600 italic">
                      "{ses.heldNote}"
                    </div>
                  )}
                </div>

                {/* Footer actions */}
                <div className="pt-3 border-t border-slate-100 flex items-center justify-between text-xs">
                  <span className="text-[11px] text-slate-400">
                    {ses.time || '14:00'} • {ses.location || club?.room || 'Auditoriya'}
                  </span>
                  <div className="flex items-center gap-1.5">
                    <button
                      type="button"
                      onClick={() => handleOpenEditModal(ses)}
                      className="p-1.5 rounded-lg text-slate-500 hover:text-blue-600 hover:bg-blue-50 transition-colors"
                      title="Tahrirlash"
                    >
                      <Edit2 className="w-3.5 h-3.5" />
                    </button>
                    <button
                      type="button"
                      onClick={() => handleDeleteLink(ses)}
                      className="p-1.5 rounded-lg text-slate-400 hover:text-rose-600 hover:bg-rose-50 transition-colors"
                      title="O‘chirish"
                    >
                      <Trash2 className="w-3.5 h-3.5" />
                    </button>
                  </div>
                </div>
              </div>
            );
          })
        )}
      </div>

      {/* Modal */}
      {isModalOpen && (
        <Modal
          isOpen={isModalOpen}
          onClose={() => setIsModalOpen(false)}
          title={targetSessionId ? 'Telegram havolani tahrirlash' : 'Yangi Telegram havola kiritish'}
        >
          <form onSubmit={handleSaveTelegramLink} className="space-y-4">
            {modalError && (
              <div className="p-3 rounded-xl bg-rose-50 border border-rose-200 text-rose-700 text-xs font-bold">
                {modalError}
              </div>
            )}

            {!targetSessionId && clubs.length > 1 && (
              <div>
                <label className="block text-xs font-bold text-slate-700 mb-1">
                  To‘garakni tanlang *
                </label>
                <select
                  required
                  value={targetClubId}
                  onChange={(e) => setTargetClubId(e.target.value)}
                  className="w-full px-3.5 py-2.5 rounded-xl border border-slate-200 text-xs focus:ring-2 focus:ring-sky-500/20"
                >
                  {clubs.map((c) => (
                    <option key={c.id} value={c.id}>
                      {c.name}
                    </option>
                  ))}
                </select>
              </div>
            )}

            <div>
              <label className="block text-xs font-bold text-slate-700 mb-1">
                Mashg‘ulot mavzusi *
              </label>
              <input
                type="text"
                required
                value={targetTopic}
                onChange={(e) => setTargetTopic(e.target.value)}
                placeholder="Masalan: Milliy hunarmandchilikning yangi yo‘nalishlari"
                className="w-full px-3.5 py-2.5 rounded-xl border border-slate-200 text-xs focus:ring-2 focus:ring-sky-500/20"
              />
            </div>

            <div className="grid grid-cols-2 gap-3">
              <div>
                <label className="block text-xs font-bold text-slate-700 mb-1">
                  O‘tkazilgan sana *
                </label>
                <input
                  type="date"
                  required
                  value={targetDate}
                  onChange={(e) => setTargetDate(e.target.value)}
                  className="w-full px-3 py-2 rounded-xl border border-slate-200 text-xs focus:ring-2 focus:ring-sky-500/20"
                />
              </div>
              <div>
                <label className="block text-xs font-bold text-slate-700 mb-1">
                  Qatnashgan talabalar soni
                </label>
                <input
                  type="number"
                  min="1"
                  max="500"
                  value={targetAttendees}
                  onChange={(e) => setTargetAttendees(Number(e.target.value))}
                  className="w-full px-3 py-2 rounded-xl border border-slate-200 text-xs focus:ring-2 focus:ring-sky-500/20"
                />
              </div>
            </div>

            <div>
              <label className="block text-xs font-bold text-slate-700 mb-1">
                Telegram kanal post havolasi *
              </label>
              <input
                type="text"
                required
                value={telegramLinkInput}
                onChange={(e) => setTelegramLinkInput(e.target.value)}
                placeholder="https://t.me/ibrat_namdchti_rasmiy/123 yoki t.me/..."
                className="w-full px-3.5 py-2.5 rounded-xl border border-slate-200 text-xs focus:ring-2 focus:ring-sky-500/20"
              />
              <p className="text-[11px] text-slate-400 mt-1">
                Ushbu dars haqida rasmiy Telegram kanalga joylangan post havolasi.
              </p>
            </div>

            <div>
              <label className="block text-xs font-bold text-slate-700 mb-1">
                Qisqacha izoh / natijalar
              </label>
              <textarea
                rows={2}
                value={targetNote}
                onChange={(e) => setTargetNote(e.target.value)}
                placeholder="Darsda o‘rganilgan mavzu va amaliy natijalar..."
                className="w-full px-3.5 py-2.5 rounded-xl border border-slate-200 text-xs focus:ring-2 focus:ring-sky-500/20"
              />
            </div>

            <div className="flex items-center justify-end gap-2 pt-3 border-t border-slate-100">
              <button
                type="button"
                onClick={() => setIsModalOpen(false)}
                className="px-4 py-2 rounded-xl text-xs font-bold text-slate-600 hover:bg-slate-100 cursor-pointer"
              >
                Bekor qilish
              </button>
              <button
                type="submit"
                className="px-5 py-2 bg-blue-600 hover:bg-blue-700 text-white rounded-xl text-xs font-bold shadow-md shadow-blue-500/20 cursor-pointer flex items-center gap-1.5"
              >
                <LinkIcon className="w-3.5 h-3.5" />
                <span>Havolani saqlash</span>
              </button>
            </div>
          </form>
        </Modal>
      )}
    </div>
  );
};
