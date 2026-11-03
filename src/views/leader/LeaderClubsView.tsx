import React, { useState, useEffect } from 'react';
import { Plus, Users, Calendar, FileText, Upload, MapPin, Clock, CalendarDays, CheckCircle2, AlertTriangle, Sparkles, Trash2 } from 'lucide-react';
import { I18N, Language, CATEGORIES } from '../../lib/i18n';
import { storage, ymd, normalizeClubTime } from '../../lib/storage';
import { StatusBadge, CategoryTag } from '../../components/common/Badge';
import { Modal } from '../../components/common/Modal';
import { Club, User } from '../../types';

export const LeaderClubsView: React.FC<{
  user: User;
  lang: Language;
  showToast: (msg: string, type?: 'ok' | 'err') => void;
  onRefresh: () => void;
}> = ({ user, lang, showToast, onRefresh }) => {
  const t = I18N[lang];
  const [clubs, setClubs] = useState<Club[]>(storage.getClubs(user.id));

  // Delete modal state
  const [clubToDelete, setClubToDelete] = useState<Club | null>(null);
  const [isDeleteOpen, setIsDeleteOpen] = useState(false);

  // Auto-subscribe to real-time updates from server / admin
  useEffect(() => {
    const unsub = storage.subscribe(() => {
      setClubs(storage.getClubs(user.id));
    });
    return unsub;
  }, [user.id]);

  // Create club modal state
  const [isCreateOpen, setIsCreateOpen] = useState(false);
  const [clubName, setClubName] = useState('');
  const [clubCategory, setClubCategory] = useState(CATEGORIES[0].id);
  const [clubFaculty, setClubFaculty] = useState(user.faculty || 'Ingliz tili fakulteti');
  const [clubDescription, setClubDescription] = useState('');
  const [clubRoom, setClubRoom] = useState('');
  const today = ymd(new Date());
  const futureDate = new Date();
  futureDate.setDate(futureDate.getDate() + 90);
  const [clubStartDate, setClubStartDate] = useState(today);
  const [clubEndDate, setClubEndDate] = useState(ymd(futureDate));
  const [clubTimeStart, setClubTimeStart] = useState('11:00');
  const [clubTimeEnd, setClubTimeEnd] = useState('12:30');
  const [selectedDays, setSelectedDays] = useState<number[]>([2, 4]); // Seshanba, Payshanba by default
  const [statuteFile, setStatuteFile] = useState<{ name: string; mime: string; data: string } | null>(null);

  // Upload statute modal state
  const [isUploadOpen, setIsUploadOpen] = useState(false);
  const [selectedClubId, setSelectedClubId] = useState<string | null>(null);
  const [newStatuteFile, setNewStatuteFile] = useState<{ name: string; mime: string; data: string } | null>(null);

  const refreshList = () => {
    setClubs(storage.getClubs(user.id));
    onRefresh();
  };

  const handleOpenDelete = (club: Club) => {
    setClubToDelete(club);
    setIsDeleteOpen(true);
  };

  const handleConfirmDelete = () => {
    if (!clubToDelete) return;
    try {
      const name = clubToDelete.name;
      storage.deleteClub(clubToDelete.id, 'To‘garak rahbari tomonidan o‘chirildi', user.fullName);
      showToast(`«${name}» to‘garagi muvaffaqiyatli o‘chirildi`, 'ok');
      setIsDeleteOpen(false);
      setClubToDelete(null);
      refreshList();
    } catch (err: unknown) {
      const msg = err instanceof Error ? err.message : 'Xatolik yuz berdi';
      showToast(msg, 'err');
    }
  };

  const handleToggleDay = (dayNum: number) => {
    setSelectedDays((prev) =>
      prev.includes(dayNum) ? prev.filter((d) => d !== dayNum) : [...prev, dayNum].sort()
    );
  };

  const handleFileChange = (e: React.ChangeEvent<HTMLInputElement>, isNewUpload: boolean = false) => {
    const file = e.target.files?.[0];
    if (!file) return;

    if (file.size > 10 * 1024 * 1024) {
      showToast('Fayl hajmi 10 MB dan oshmasligi kerak', 'err');
      return;
    }

    const reader = new FileReader();
    reader.onload = () => {
      const obj = {
        name: file.name,
        mime: file.type || 'application/pdf',
        data: reader.result as string,
      };
      if (isNewUpload) {
        setNewStatuteFile(obj);
      } else {
        setStatuteFile(obj);
      }
    };
    reader.readAsDataURL(file);
  };

  const handleCreateSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    if (!clubName.trim()) {
      showToast(t.common.required, 'err');
      return;
    }
    if (!clubRoom.trim()) {
      showToast("Iltimos, o'tkaziladigan bino va auditoriya/xonani kiriting", 'err');
      return;
    }
    if (selectedDays.length === 0) {
      showToast("Kamida bitta hafta kunini tanlang", 'err');
      return;
    }
    if (clubEndDate < clubStartDate) {
      showToast(t.sch.badPeriod, 'err');
      return;
    }

    try {
      storage.createClub({
        name: clubName,
        category: clubCategory,
        description: clubDescription,
        faculty: clubFaculty,
        leaderId: user.id,
        room: clubRoom,
        startDate: clubStartDate,
        endDate: clubEndDate,
        weekdays: selectedDays,
        timeStart: clubTimeStart,
        timeEnd: clubTimeEnd,
        statuteFile: statuteFile || undefined,
      });

      showToast(t.common.saved, 'ok');
      setIsCreateOpen(false);
      setClubName('');
      setClubDescription('');
      setClubRoom('');
      setStatuteFile(null);
      refreshList();
    } catch (err: unknown) {
      const msg = err instanceof Error ? err.message : 'Xatolik';
      showToast(msg, 'err');
    }
  };

  const handleUploadStatuteSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    if (!selectedClubId || !newStatuteFile) {
      showToast(t.common.selectPdf, 'err');
      return;
    }
    try {
      storage.uploadStatute(selectedClubId, newStatuteFile, user.id);
      showToast(t.common.saved, 'ok');
      setIsUploadOpen(false);
      setSelectedClubId(null);
      setNewStatuteFile(null);
      refreshList();
    } catch (err: unknown) {
      const msg = err instanceof Error ? err.message : 'Xatolik';
      showToast(msg, 'err');
    }
  };

  return (
    <div className="space-y-6">
      <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
        <div>
          <h1 className="text-xl sm:text-2xl font-black text-slate-900 leading-tight">
            {t.leader.title}
          </h1>
          <p className="text-sm text-slate-500 mt-1">
            {t.leader.sub}
          </p>
        </div>

        <button
          type="button"
          onClick={() => setIsCreateOpen(true)}
          className="px-4 py-2.5 rounded-xl bg-blue-600 hover:bg-blue-700 active:scale-98 text-white text-xs sm:text-sm font-bold transition-all flex items-center gap-2 shadow-md shadow-blue-600/20 cursor-pointer self-start sm:self-auto"
        >
          <Plus className="w-4 h-4" />
          <span>{t.leader.newClub}</span>
        </button>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
        {clubs.length === 0 ? (
          <div className="col-span-full p-10 text-center bg-white rounded-3xl border border-slate-200 text-slate-500 shadow-2xs">
            <p className="text-base font-bold text-slate-800">{t.leader.noClub}</p>
            <p className="text-xs text-slate-400 mt-1 max-w-md mx-auto">
              Nizom yuklash, auditoriya belgilash va dars reja-grafigini tuzish uchun yuqoridagi <b>"{t.leader.newClub}"</b> tugmasini bosing.
            </p>
          </div>
        ) : (
          clubs.map((c) => (
            <div
              key={c.id}
              className="bg-white rounded-2xl border border-slate-200 p-5 shadow-xs flex flex-col justify-between"
            >
              <div>
                <div className="flex items-start justify-between gap-2 mb-2">
                  <h3 className="text-base font-extrabold text-slate-900 leading-snug">
                    {c.name}
                  </h3>
                  <StatusBadge status={c.statuteStatus} lang={lang} />
                </div>

                <div className="mb-3">
                  <CategoryTag categoryId={c.categoryName_uz || c.category} lang={lang} ball={c.categoryBall} />
                </div>

                <p className="text-xs text-slate-600 line-clamp-3 mb-4 leading-relaxed">
                  {c.description || 'Tavsif kiritilmagan'}
                </p>

                {/* Status Announcement Banner for Leader */}
                {c.statuteStatus === 'approved' ? (
                  <div className="p-3 rounded-xl bg-emerald-50 border border-emerald-200 text-emerald-950 text-xs mb-3 flex items-start gap-2.5 shadow-2xs">
                    <CheckCircle2 className="w-4 h-4 text-emerald-600 shrink-0 mt-0.5" />
                    <div>
                      <p className="font-extrabold text-emerald-800 flex items-center gap-1.5">
                        <span>To‘garak rasman tasdiqlandi!</span>
                        <span className="px-1.5 py-0.2 rounded-md bg-emerald-200/80 text-emerald-800 text-[10px]">Faol</span>
                      </p>
                      <p className="text-[11px] text-emerald-700 mt-0.5">
                        Institut Bosh admini (Hamidulla Abdualiyev) tomonidan to‘liq tasdiqlandi. Talabalar qabuli ochiq va dars jadvali amal qilmoqda.
                      </p>
                      {c.adminComment && (
                        <p className="text-[11px] text-emerald-900 mt-1 font-semibold italic bg-emerald-100/60 p-1.5 rounded-lg border border-emerald-200/60">
                          Bosh admin izohi: «{c.adminComment}»
                        </p>
                      )}
                    </div>
                  </div>
                ) : c.statuteStatus === 'rejected' ? (
                  <div className="p-3 rounded-xl bg-rose-50 border border-rose-200 text-rose-950 text-xs mb-3 flex items-start gap-2.5 shadow-2xs">
                    <AlertTriangle className="w-4 h-4 text-rose-600 shrink-0 mt-0.5" />
                    <div>
                      <p className="font-extrabold text-rose-800">Nizom rad etildi / Qaytarildi</p>
                      <p className="text-[11px] text-rose-700 mt-0.5">
                        {c.adminComment ? `Sabab/Izoh: «${c.adminComment}»` : 'Nizom belgilangan talablarga to‘liq javob bermadi.'}
                      </p>
                      <p className="text-[11px] text-rose-600 mt-1 font-medium">
                        Iltimos, kamchiliklarni to‘g‘rilab, pastdagi "Nizomni yangilash" tugmasi orqali qayta yuklang.
                      </p>
                    </div>
                  </div>
                ) : (
                  <div className="p-3 rounded-xl bg-amber-50 border border-amber-200 text-amber-950 text-xs mb-3 flex items-start gap-2.5 shadow-2xs">
                    <Clock className="w-4 h-4 text-amber-600 shrink-0 mt-0.5 animate-pulse" />
                    <div>
                      <p className="font-extrabold text-amber-800">Tasdiqlanish jarayonida (Kutilmoqda)</p>
                      <p className="text-[11px] text-amber-700 mt-0.5">
                        To‘garak va nizom Bosh admin tomonidan ko‘rib chiqilishi kutilmoqda. Admin tasdiqlashi bilan xabarnomalar panelingizda bildirishnoma chiqadi.
                      </p>
                    </div>
                  </div>
                )}

                <div className="space-y-2 pt-3 border-t border-slate-100 text-xs">
                  <div className="flex items-center justify-between text-slate-600">
                    <span className="flex items-center gap-1.5 text-slate-400">
                      <MapPin className="w-3.5 h-3.5 text-blue-600" />
                      <span>{t.common.place}:</span>
                    </span>
                    <span className="font-bold text-slate-800">{c.room || 'Belgilanmagan'}</span>
                  </div>

                  <div className="flex items-center justify-between text-slate-600">
                    <span className="flex items-center gap-1.5 text-slate-400">
                      <Users className="w-3.5 h-3.5" />
                      <span>{t.common.members}:</span>
                    </span>
                    <span className="font-extrabold text-blue-700">{c.memberCount} nafar</span>
                  </div>

                  <div className="flex items-center justify-between text-slate-600">
                    <span className="flex items-center gap-1.5 text-slate-400">
                      <Calendar className="w-3.5 h-3.5" />
                      <span>{t.common.sessions}:</span>
                    </span>
                    <span className="font-bold text-slate-700">
                      {c.heldSessionCount || 0} / {c.sessionCount} ta o'tildi
                    </span>
                  </div>

                  <div className="flex items-center justify-between text-slate-600">
                    <span className="text-slate-400">{t.leader.statuteStatus}:</span>
                    {c.statuteFile ? (
                      <a
                        href={c.statuteFile.url}
                        target="_blank"
                        rel="noopener noreferrer"
                        download={c.statuteFile.name}
                        className="inline-flex items-center gap-1 text-xs font-bold text-blue-700 hover:text-blue-900"
                      >
                        <FileText className="w-3.5 h-3.5" />
                        <span>Nizom (PDF)</span>
                      </a>
                    ) : (
                      <span className="text-xs text-rose-500 font-bold italic">Nizom yuklanmagan</span>
                    )}
                  </div>
                </div>
              </div>

              <div className="pt-4 mt-4 border-t border-slate-100 flex flex-col gap-2">
                <button
                  type="button"
                  onClick={() => {
                    setSelectedClubId(c.id);
                    setIsUploadOpen(true);
                  }}
                  className="w-full py-2.5 rounded-xl border border-slate-200 hover:bg-slate-50 text-slate-700 text-xs font-bold transition-all flex items-center justify-center gap-1.5 cursor-pointer shadow-2xs"
                >
                  <Upload className="w-3.5 h-3.5 text-blue-600" />
                  <span>{c.statuteFile ? "Nizomni yangilash" : t.leader.uploadStatute}</span>
                </button>

                {c.statuteStatus === 'rejected' && (
                  <button
                    type="button"
                    onClick={() => handleOpenDelete(c)}
                    className="w-full py-2.5 rounded-xl bg-rose-50 hover:bg-rose-100 text-rose-700 border border-rose-200 text-xs font-bold transition-all flex items-center justify-center gap-1.5 cursor-pointer shadow-2xs"
                    title="Rad etilgan to‘garakni o‘chirish"
                  >
                    <Trash2 className="w-3.5 h-3.5 text-rose-600" />
                    <span>Rad etilgan to‘garakni o‘chirish</span>
                  </button>
                )}
              </div>
            </div>
          ))
        )}
      </div>

      {/* Comprehensive Create Club Modal with room, schedule, dates and statute */}
      <Modal
        isOpen={isCreateOpen}
        onClose={() => setIsCreateOpen(false)}
        title={t.modal.createClub}
        footer={
          <>
            <button
              type="button"
              onClick={() => setIsCreateOpen(false)}
              className="px-4 py-2 rounded-xl border border-slate-200 text-slate-700 text-xs font-bold hover:bg-slate-50 transition-colors"
            >
              {t.common.cancel}
            </button>
            <button
              type="button"
              onClick={handleCreateSubmit}
              className="px-4 py-2 rounded-xl bg-blue-600 hover:bg-blue-700 text-white text-xs font-bold transition-all shadow-md cursor-pointer"
            >
              {t.leader.createClub}
            </button>
          </>
        }
      >
        <form onSubmit={handleCreateSubmit} className="space-y-3.5 max-h-[75vh] overflow-y-auto pr-1">
          {/* Club Name */}
          <div>
            <label className="block text-xs font-bold text-slate-700 mb-1">
              {t.modal.clubName} *
            </label>
            <input
              type="text"
              required
              value={clubName}
              onChange={(e) => setClubName(e.target.value)}
              placeholder="Masalan: Nemis tili so'zlashuv klubi, Dasturlash to'garagi..."
              className="w-full px-3.5 py-2.5 rounded-xl border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600 transition-colors"
            />
          </div>

          {/* 5 Tashabbus Category */}
          <div>
            <label className="block text-xs font-bold text-slate-700 mb-1">
              {t.modal.pickCat} *
            </label>
            <select
              value={clubCategory}
              onChange={(e) => setClubCategory(e.target.value)}
              className="w-full px-3.5 py-2.5 rounded-xl border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600 transition-colors bg-white font-medium"
            >
              {CATEGORIES.map((cat) => (
                <option key={cat.id} value={cat.id}>
                  {lang === 'ru' ? cat.name_ru : cat.name_uz} ({cat.ball} {t.common.ball})
                </option>
              ))}
            </select>
          </div>

          {/* Faculty / Building */}
          <div>
            <label className="block text-xs font-bold text-slate-700 mb-1">
              {t.common.faculty} *
            </label>
            <input
              type="text"
              required
              value={clubFaculty}
              onChange={(e) => setClubFaculty(e.target.value)}
              placeholder="Ingliz tili fakulteti"
              className="w-full px-3.5 py-2.5 rounded-xl border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600 transition-colors"
            />
          </div>

          {/* Room / Location */}
          <div>
            <label className="block text-xs font-bold text-slate-700 mb-1">
              {t.modal.roomLabel} *
            </label>
            <input
              type="text"
              required
              value={clubRoom}
              onChange={(e) => setClubRoom(e.target.value)}
              placeholder={t.modal.roomPh}
              className="w-full px-3.5 py-2.5 rounded-xl border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600 transition-colors"
            />
          </div>

          {/* Schedule Period Dates */}
          <div className="grid grid-cols-2 gap-2">
            <div>
              <label className="block text-xs font-bold text-slate-700 mb-1">
                {t.sch.startDate} *
              </label>
              <input
                type="date"
                required
                value={clubStartDate}
                onChange={(e) => setClubStartDate(e.target.value)}
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
                value={clubEndDate}
                onChange={(e) => setClubEndDate(e.target.value)}
                className="w-full px-3 py-2 rounded-xl border border-slate-200 text-xs focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600 transition-colors"
              />
            </div>
          </div>

          {/* Weekdays */}
          <div>
            <label className="block text-xs font-bold text-slate-700 mb-1.5">
              {t.modal.scheduleDays} *
            </label>
            <div className="grid grid-cols-4 sm:grid-cols-7 gap-1.5 text-xs">
              {t.sch.days.map((dayName, idx) => {
                const dayNum = idx + 1;
                const isSelected = selectedDays.includes(dayNum);
                return (
                  <button
                    key={dayNum}
                    type="button"
                    onClick={() => handleToggleDay(dayNum)}
                    className={`py-1.5 px-1 rounded-lg text-center font-bold transition-all cursor-pointer ${
                      isSelected
                        ? 'bg-blue-600 text-white shadow-2xs'
                        : 'bg-slate-100 text-slate-600 hover:bg-slate-200'
                    }`}
                  >
                    {dayName.slice(0, 3)}
                  </button>
                );
              })}
            </div>
          </div>

          {/* Time start & end */}
          <div className="grid grid-cols-2 gap-2">
            <div>
              <label className="block text-xs font-bold text-slate-700 mb-1">
                {t.sch.timeStart} *
              </label>
              <input
                type="time"
                required
                value={clubTimeStart}
                onChange={(e) => setClubTimeStart(normalizeClubTime(e.target.value))}
                className="w-full px-3 py-2 rounded-xl border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600 transition-colors"
              />
              <div className="flex flex-wrap gap-1 mt-1.5">
                {['09:00', '10:00', '11:00', '12:00', '14:00', '15:00', '16:00'].map((p) => (
                  <button
                    key={p}
                    type="button"
                    onClick={() => {
                      setClubTimeStart(p);
                      const [h, m] = p.split(':').map(Number);
                      setClubTimeEnd(`${String(h + 1).padStart(2, '0')}:${String(m + 30 >= 60 ? m - 30 : m + 30).padStart(2, '0')}`);
                    }}
                    className={`px-1.5 py-0.5 text-[10px] rounded font-bold transition-all cursor-pointer ${
                      clubTimeStart === p
                        ? 'bg-blue-600 text-white shadow-xs'
                        : 'bg-slate-100 hover:bg-slate-200 text-slate-700'
                    }`}
                  >
                    {p}
                  </button>
                ))}
              </div>
              {clubTimeStart && (
                <span className="text-[10px] text-emerald-700 font-bold block mt-1">
                  Tanlangan: {clubTimeStart} (Kunduzgi vaqt)
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
                value={clubTimeEnd}
                onChange={(e) => setClubTimeEnd(normalizeClubTime(e.target.value))}
                className="w-full px-3 py-2 rounded-xl border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600 transition-colors"
              />
              <div className="flex flex-wrap gap-1 mt-1.5">
                {['10:30', '11:30', '12:30', '13:30', '15:30', '16:30', '17:30'].map((p) => (
                  <button
                    key={p}
                    type="button"
                    onClick={() => setClubTimeEnd(p)}
                    className={`px-1.5 py-0.5 text-[10px] rounded font-bold transition-all cursor-pointer ${
                      clubTimeEnd === p
                        ? 'bg-blue-600 text-white shadow-xs'
                        : 'bg-slate-100 hover:bg-slate-200 text-slate-700'
                    }`}
                  >
                    {p}
                  </button>
                ))}
              </div>
              {clubTimeEnd && (
                <span className="text-[10px] text-emerald-700 font-bold block mt-1">
                  Tugash: {clubTimeEnd}
                </span>
              )}
            </div>
          </div>

          {/* Description */}
          <div>
            <label className="block text-xs font-bold text-slate-700 mb-1">
              {t.common.description}
            </label>
            <textarea
              rows={2}
              value={clubDescription}
              onChange={(e) => setClubDescription(e.target.value)}
              placeholder="To‘garak maqsadi, vazifalari va talabalar uchun qulayliklari..."
              className="w-full px-3.5 py-2.5 rounded-xl border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600 transition-colors"
            />
          </div>

          {/* Statute File Upload */}
          <div className="p-3.5 rounded-2xl bg-blue-50/70 border border-blue-200/80">
            <label className="block text-xs font-extrabold text-blue-950 mb-1">
              {t.modal.statuteFile} (Majburiy nizom hujjati)
            </label>
            <p className="text-[11px] text-blue-700/80 mb-2">
              Kafedra yoki Yoshlar ishlari bo'limi tomonidan tasdiqlangan to'garak Nizomi faylini yuklang.
            </p>
            <input
              type="file"
              accept=".pdf,application/pdf"
              onChange={(e) => handleFileChange(e, false)}
              className="w-full text-xs text-slate-500 file:mr-3 file:py-2 file:px-3 file:rounded-xl file:border-0 file:text-xs file:font-bold file:bg-blue-600 file:text-white hover:file:bg-blue-700 cursor-pointer"
            />
            {statuteFile && (
              <span className="text-xs text-emerald-700 font-extrabold block mt-1.5">
                ✓ {statuteFile.name} tanlandi
              </span>
            )}
          </div>
        </form>
      </Modal>

      {/* Upload Statute Modal */}
      <Modal
        isOpen={isUploadOpen}
        onClose={() => setIsUploadOpen(false)}
        title={t.leader.uploadStatute}
        footer={
          <>
            <button
              type="button"
              onClick={() => setIsUploadOpen(false)}
              className="px-4 py-2 rounded-xl border border-slate-200 text-slate-700 text-xs font-bold hover:bg-slate-50 transition-colors"
            >
              {t.common.cancel}
            </button>
            <button
              type="button"
              onClick={handleUploadStatuteSubmit}
              className="px-4 py-2 rounded-xl bg-blue-600 hover:bg-blue-700 text-white text-xs font-bold transition-all shadow-md cursor-pointer"
            >
              {t.common.save}
            </button>
          </>
        }
      >
        <form onSubmit={handleUploadStatuteSubmit} className="space-y-4">
          <p className="text-xs text-slate-600">
            To'garakning rasmiy tasdiqlangan nizomi yoki rejasini PDF formatida yuklang.
          </p>

          <div>
            <label className="block text-xs font-bold text-slate-700 mb-1">
              {t.modal.statuteFile} *
            </label>
            <input
              type="file"
              required
              accept=".pdf,application/pdf"
              onChange={(e) => handleFileChange(e, true)}
              className="w-full text-xs text-slate-500 file:mr-3 file:py-2 file:px-3 file:rounded-xl file:border-0 file:text-xs file:font-bold file:bg-blue-50 file:text-blue-700 hover:file:bg-blue-100 cursor-pointer"
            />
            {newStatuteFile && (
              <span className="text-xs text-emerald-600 font-bold block mt-1">
                ✓ {newStatuteFile.name} tanlandi
              </span>
            )}
          </div>
        </form>
      </Modal>

      {/* Delete Confirmation Modal for Leader */}
      <Modal
        isOpen={isDeleteOpen}
        onClose={() => setIsDeleteOpen(false)}
        title="Rad etilgan to‘garakni o‘chirish"
        footer={
          <>
            <button
              type="button"
              onClick={() => setIsDeleteOpen(false)}
              className="px-4 py-2 rounded-xl border border-slate-200 text-slate-700 text-xs font-bold hover:bg-slate-50 transition-colors cursor-pointer"
            >
              {t.common.cancel}
            </button>
            <button
              type="button"
              onClick={handleConfirmDelete}
              className="px-4 py-2 rounded-xl bg-rose-600 hover:bg-rose-700 text-white text-xs font-bold transition-all shadow-md flex items-center gap-1.5 cursor-pointer"
            >
              <Trash2 className="w-3.5 h-3.5" />
              <span>O‘chirib tashlash</span>
            </button>
          </>
        }
      >
        <div className="space-y-4">
          <div className="p-3.5 bg-rose-50 border border-rose-300 rounded-xl text-rose-950 flex items-start gap-2.5">
            <AlertTriangle className="w-5 h-5 text-rose-600 shrink-0 mt-0.5" />
            <div className="text-xs space-y-1">
              <p className="font-extrabold text-rose-900 text-sm">
                Rad etilgan to‘garakni o‘chirishni xohlaysizmi?
              </p>
              <p className="text-rose-800">
                «<b>{clubToDelete?.name}</b>» to‘garagi paneldan butunlay o‘chiriladi. Keyinchalik kamchiliklarni to‘g‘rilab, yangi to‘garak yaratishingiz mumkin.
              </p>
            </div>
          </div>
        </div>
      </Modal>
    </div>
  );
};
