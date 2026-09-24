import React, { useState, useEffect } from 'react';
import { Compass, Users, Calendar, FileText, CheckCircle, Clock, Camera, Search, Filter, MapPin, Sparkles } from 'lucide-react';
import { I18N, Language, CATEGORIES } from '../../lib/i18n';
import { storage } from '../../lib/storage';
import { StatusBadge, CategoryTag } from '../../components/common/Badge';
import { Modal } from '../../components/common/Modal';
import { Club, User } from '../../types';

const WEEKDAY_NAMES = ['', 'Dushanba', 'Seshanba', 'Chorshanba', 'Payshanba', 'Juma', 'Shanba', 'Yakshanba'];

export const StudentBrowseView: React.FC<{
  user: User;
  lang: Language;
  showToast: (msg: string, type?: 'ok' | 'err') => void;
  onRefresh: () => void;
  onSelectView?: (view: string) => void;
}> = ({ user, lang, showToast, onRefresh, onSelectView }) => {
  const t = I18N[lang];
  const [clubs, setClubs] = useState<Club[]>(storage.getClubs());
  const [myMemberships, setMyMemberships] = useState(storage.getMemberships({ studentId: user.id }));
  const [searchQuery, setSearchQuery] = useState('');
  const [selectedCat, setSelectedCat] = useState<string>('all');
  const [statusFilter, setStatusFilter] = useState<'all' | 'approved'>('all');

  const [selectedClub, setSelectedClub] = useState<Club | null>(null);
  const [isApplyOpen, setIsApplyOpen] = useState(false);
  const [applyNote, setApplyNote] = useState('');
  const [appFile, setAppFile] = useState<{ name: string; mime: string; data: string } | null>(null);

  // Auto-subscribe to real-time changes from server
  useEffect(() => {
    const unsub = storage.subscribe(() => {
      setClubs(storage.getClubs());
      setMyMemberships(storage.getMemberships({ studentId: user.id }));
    });
    return unsub;
  }, [user.id]);

  const handleFileChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (!file) return;

    if (file.size > 8 * 1024 * 1024) {
      showToast('Fayl hajmi 8 MB dan oshmasligi kerak', 'err');
      return;
    }

    const reader = new FileReader();
    reader.onload = () => {
      setAppFile({
        name: file.name,
        mime: file.type || 'application/pdf',
        data: reader.result as string,
      });
    };
    reader.readAsDataURL(file);
  };

  const handleOpenApply = (club: Club) => {
    setSelectedClub(club);
    setApplyNote('');
    setAppFile(null);
    setIsApplyOpen(true);
  };

  const handleApplySubmit = (e: React.FormEvent) => {
    e.preventDefault();
    if (!selectedClub) return;

    try {
      storage.applyForClub({
        clubId: selectedClub.id,
        studentId: user.id,
        note: applyNote,
        applicationFile: appFile || undefined,
      });

      showToast(t.common.saved, 'ok');
      setIsApplyOpen(false);
      setMyMemberships(storage.getMemberships({ studentId: user.id }));
      onRefresh();
    } catch (err: unknown) {
      const msg = err instanceof Error ? err.message : 'Xatolik';
      showToast(msg, 'err');
    }
  };

  // Filtered clubs
  const filteredClubs = clubs.filter((c) => {
    const matchesSearch =
      !searchQuery ||
      c.name.toLowerCase().includes(searchQuery.toLowerCase()) ||
      (c.leaderName && c.leaderName.toLowerCase().includes(searchQuery.toLowerCase())) ||
      (c.room && c.room.toLowerCase().includes(searchQuery.toLowerCase())) ||
      (c.description && c.description.toLowerCase().includes(searchQuery.toLowerCase()));

    const matchesCat = selectedCat === 'all' || c.category === selectedCat;
    const matchesStatus = statusFilter === 'all' || c.statuteStatus === 'approved';

    return matchesSearch && matchesCat && matchesStatus;
  });

  return (
    <div className="space-y-6">
      {/* Title & Info Banner */}
      <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
        <div>
          <h1 className="text-xl sm:text-2xl font-black text-slate-900 leading-tight flex items-center gap-2">
            <Compass className="w-6 h-6 text-blue-600" />
            <span>{t.nav.browse}</span>
          </h1>
          <p className="text-sm text-slate-500 mt-1">
            Institutimizda tashkil etilgan 5 ta muhim tashabbus to‘garaklari ro‘yxati, dars jadvallari va a’zolik imkoniyatlari
          </p>
        </div>

        {/* Quick Stats Pill */}
        <div className="flex items-center gap-2 self-start sm:self-auto">
          <div className="px-3.5 py-1.5 rounded-xl bg-blue-50 border border-blue-200 text-blue-900 text-xs font-bold">
            Jami: <span className="font-extrabold text-blue-700">{clubs.length} ta to‘garak</span>
          </div>
          <div className="px-3.5 py-1.5 rounded-xl bg-emerald-50 border border-emerald-200 text-emerald-900 text-xs font-bold">
            Faol: <span className="font-extrabold text-emerald-700">{clubs.filter((c) => c.statuteStatus === 'approved').length} ta</span>
          </div>
        </div>
      </div>

      {/* Filter and Search Bar */}
      <div className="bg-white rounded-2xl border border-slate-200 p-4 shadow-xs space-y-3">
        <div className="flex flex-col sm:flex-row gap-3">
          {/* Search Bar */}
          <div className="relative flex-1">
            <Search className="w-4 h-4 text-slate-400 absolute left-3.5 top-1/2 -translate-y-1/2" />
            <input
              type="text"
              value={searchQuery}
              onChange={(e) => setSearchQuery(e.target.value)}
              placeholder="To‘garak nomi, rahbari yoki xonasi bo‘yicha qidirish..."
              className="w-full pl-10 pr-4 py-2.5 rounded-xl border border-slate-200 text-xs sm:text-sm focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600 transition-colors"
            />
          </div>

          {/* Status Tabs */}
          <div className="inline-flex rounded-xl border border-slate-200 p-1 bg-slate-100 text-xs font-bold">
            <button
              type="button"
              onClick={() => setStatusFilter('all')}
              className={`px-3 py-1.5 rounded-lg transition-all ${
                statusFilter === 'all'
                  ? 'bg-white text-blue-700 shadow-2xs font-extrabold'
                  : 'text-slate-600 hover:text-slate-900'
              }`}
            >
              Barchasi ({clubs.length})
            </button>
            <button
              type="button"
              onClick={() => setStatusFilter('approved')}
              className={`px-3 py-1.5 rounded-lg transition-all ${
                statusFilter === 'approved'
                  ? 'bg-white text-emerald-700 shadow-2xs font-extrabold'
                  : 'text-slate-600 hover:text-slate-900'
              }`}
            >
              ✓ Tasdiqlanganlar ({clubs.filter((c) => c.statuteStatus === 'approved').length})
            </button>
          </div>
        </div>

        {/* Category Pills */}
        <div className="flex items-center gap-1.5 overflow-x-auto pb-1 pt-1 text-xs scrollbar-none">
          <button
            type="button"
            onClick={() => setSelectedCat('all')}
            className={`px-3 py-1.5 rounded-xl font-bold transition-all shrink-0 cursor-pointer ${
              selectedCat === 'all'
                ? 'bg-slate-900 text-white shadow-2xs'
                : 'bg-slate-100 hover:bg-slate-200 text-slate-700'
            }`}
          >
            Barcha tashabbuslar
          </button>
          {CATEGORIES.map((cat) => (
            <button
              key={cat.id}
              type="button"
              onClick={() => setSelectedCat(cat.id)}
              className={`px-3 py-1.5 rounded-xl font-bold transition-all shrink-0 cursor-pointer ${
                selectedCat === cat.id
                  ? 'bg-blue-600 text-white shadow-2xs'
                  : 'bg-slate-100 hover:bg-slate-200 text-slate-700'
              }`}
            >
              {lang === 'uz' ? cat.name_uz : cat.name_ru}
            </button>
          ))}
        </div>
      </div>

      {/* Clubs Grid */}
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
        {filteredClubs.map((c) => {
          const membership = myMemberships.find((m) => m.clubId === c.id);
          const isMember = membership?.status === 'approved';
          const isPending = membership?.status === 'pending';
          const isApproved = c.statuteStatus === 'approved';

          return (
            <div
              key={c.id}
              className="bg-white rounded-2xl border border-slate-200 p-5 shadow-xs flex flex-col justify-between hover:border-blue-300 transition-all hover:shadow-md"
            >
              <div>
                <div className="flex items-start justify-between gap-2 mb-2">
                  <h3 className="text-base font-extrabold text-slate-900 leading-snug">
                    {c.name}
                  </h3>
                  {isMember ? (
                    <span className="inline-flex items-center gap-1 px-2.5 py-0.5 rounded-full text-xs font-bold bg-emerald-50 text-emerald-700 border border-emerald-200 shrink-0">
                      <CheckCircle className="w-3.5 h-3.5" />
                      <span>{t.student.alreadyMember}</span>
                    </span>
                  ) : isPending ? (
                    <span className="inline-flex items-center gap-1 px-2.5 py-0.5 rounded-full text-xs font-bold bg-amber-50 text-amber-700 border border-amber-200 shrink-0">
                      <Clock className="w-3.5 h-3.5 animate-pulse" />
                      <span>{t.student.applied}</span>
                    </span>
                  ) : isApproved ? (
                    <span className="inline-flex items-center gap-1 px-2.5 py-0.5 rounded-full text-[11px] font-bold bg-emerald-50 text-emerald-700 border border-emerald-200 shrink-0">
                      ✓ Faol
                    </span>
                  ) : (
                    <span className="inline-flex items-center gap-1 px-2.5 py-0.5 rounded-full text-[11px] font-bold bg-amber-50 text-amber-700 border border-amber-200 shrink-0">
                      ⏳ Kutilmoqda
                    </span>
                  )}
                </div>

                <div className="mb-3">
                  <CategoryTag categoryId={c.categoryName_uz || c.category} lang={lang} ball={c.categoryBall} />
                </div>

                <p className="text-xs text-slate-600 line-clamp-3 mb-4 leading-relaxed">
                  {c.description || 'To‘garak haqida umumiy maʼlumot kiritilmagan'}
                </p>

                <div className="space-y-2 pt-3 border-t border-slate-100 text-xs">
                  <div className="flex items-center justify-between text-slate-600">
                    <span className="text-slate-400">{t.common.leader}:</span>
                    <span className="font-bold text-slate-800">{c.leaderName}</span>
                  </div>

                  <div className="flex items-center justify-between text-slate-600">
                    <span className="text-slate-400">{t.common.place}:</span>
                    <span className="font-extrabold text-blue-700">{c.room || 'Belgilanmagan'}</span>
                  </div>

                  {c.weekdays && c.weekdays.length > 0 && (
                    <div className="flex items-start justify-between text-slate-600 gap-2">
                      <span className="text-slate-400 shrink-0">Dars vaqti:</span>
                      <span className="font-bold text-slate-800 text-right">
                        {c.weekdays.map((d) => WEEKDAY_NAMES[d] || d).join(', ')}
                        {c.timeStart && ` (${c.timeStart} - ${c.timeEnd})`}
                      </span>
                    </div>
                  )}

                  <div className="flex items-center justify-between text-slate-600">
                    <span className="text-slate-400">{t.common.members}:</span>
                    <span className="font-extrabold text-blue-700">{c.memberCount || 0} nafar talaba</span>
                  </div>

                  <div className="flex items-center justify-between text-slate-600">
                    <span className="text-slate-400">Nizom:</span>
                    {c.statuteFile ? (
                      <a
                        href={c.statuteFile.url}
                        target="_blank"
                        rel="noopener noreferrer"
                        download={c.statuteFile.name}
                        className="inline-flex items-center gap-1 text-[11px] font-bold text-blue-700 hover:text-blue-900 bg-blue-50 px-2 py-0.5 rounded-md border border-blue-200"
                        title="Nizomni yuklab olish"
                      >
                        <FileText className="w-3 h-3" />
                        <span>PDF Nizom</span>
                      </a>
                    ) : (
                      <span className="text-slate-400 italic text-[11px]">Nizom yuklanmagan</span>
                    )}
                  </div>
                </div>
              </div>

              {/* Action Buttons */}
              <div className="pt-4 mt-4 border-t border-slate-100">
                {isMember ? (
                  <div className="space-y-2">
                    <div className="w-full py-2 rounded-xl bg-emerald-50 text-emerald-800 border border-emerald-200 text-xs font-bold text-center">
                      ✓ {t.student.alreadyMember}
                    </div>
                    {onSelectView && (
                      <button
                        type="button"
                        onClick={() => onSelectView('myWork')}
                        className="w-full py-2 rounded-xl bg-teal-600 hover:bg-teal-700 text-white text-xs font-bold flex items-center justify-center gap-1.5 transition-all cursor-pointer shadow-xs"
                      >
                        <Camera className="w-3.5 h-3.5" />
                        <span>Qatnashganlik fotodalili yuklash</span>
                      </button>
                    )}
                  </div>
                ) : isPending ? (
                  <button
                    disabled
                    className="w-full py-2.5 rounded-xl bg-amber-50 text-amber-800 border border-amber-200 text-xs font-bold"
                  >
                    ⏳ {t.student.applied}
                  </button>
                ) : (
                  <button
                    type="button"
                    onClick={() => handleOpenApply(c)}
                    className="w-full py-2.5 rounded-xl bg-blue-600 hover:bg-blue-700 active:scale-98 text-white text-xs font-bold transition-all shadow-md shadow-blue-600/20 cursor-pointer flex items-center justify-center gap-1.5"
                  >
                    <Sparkles className="w-3.5 h-3.5" />
                    <span>{t.student.apply}</span>
                  </button>
                )}
              </div>
            </div>
          );
        })}
      </div>

      {/* Empty State */}
      {filteredClubs.length === 0 && (
        <div className="py-16 px-4 text-center bg-white rounded-3xl border border-slate-200 shadow-2xs">
          <Compass className="w-12 h-12 text-slate-300 mx-auto mb-3" />
          <h3 className="text-base font-bold text-slate-800">To‘garaklar topilmadi</h3>
          <p className="text-xs text-slate-500 mt-1 max-w-md mx-auto">
            {searchQuery || selectedCat !== 'all' || statusFilter !== 'all'
              ? 'Tanlangan filtr yoki qidiruv bo‘yicha to‘garaklar mavjud emas. Filtrlarni tozalab ko‘ring.'
              : 'Institutimizda to‘garaklar rahbarlar tomonidan shakllantirilmoqda. Tez orada barcha tashkil etilgan to‘garaklar shu yerda paydo bo‘ladi.'}
          </p>
          {(searchQuery || selectedCat !== 'all' || statusFilter !== 'all') && (
            <button
              type="button"
              onClick={() => {
                setSearchQuery('');
                setSelectedCat('all');
                setStatusFilter('all');
              }}
              className="mt-4 px-4 py-2 rounded-xl bg-slate-100 hover:bg-slate-200 text-slate-700 text-xs font-bold transition-colors cursor-pointer"
            >
              Filtrlarni tozalash
            </button>
          )}
        </div>
      )}

      {/* Apply Modal */}
      <Modal
        isOpen={isApplyOpen}
        onClose={() => setIsApplyOpen(false)}
        title={t.modal.applyTitle}
        footer={
          <>
            <button
              type="button"
              onClick={() => setIsApplyOpen(false)}
              className="px-4 py-2 rounded-xl border border-slate-200 text-slate-700 text-xs font-bold hover:bg-slate-50 transition-colors cursor-pointer"
            >
              {t.common.cancel}
            </button>
            <button
              type="button"
              onClick={handleApplySubmit}
              className="px-4 py-2 rounded-xl bg-blue-600 hover:bg-blue-700 text-white text-xs font-bold transition-all shadow-md cursor-pointer"
            >
              {t.student.applyTo}
            </button>
          </>
        }
      >
        <form onSubmit={handleApplySubmit} className="space-y-3.5">
          <div className="p-3 bg-blue-50/60 rounded-xl border border-blue-100">
            <span className="text-[11px] font-bold text-blue-700 uppercase">{t.common.club}:</span>
            <p className="text-sm font-extrabold text-blue-950 mt-0.5">{selectedClub?.name}</p>
            <p className="text-xs text-blue-800 mt-0.5">Mas'ul rahbar: {selectedClub?.leaderName}</p>
          </div>

          <div>
            <label className="block text-xs font-bold text-slate-700 mb-1">
              {t.modal.note} (Nega a'zo bo'lmoqchisiz?)
            </label>
            <textarea
              rows={3}
              value={applyNote}
              onChange={(e) => setApplyNote(e.target.value)}
              placeholder="Qisqacha qiziqishingiz haqida yozing..."
              className="w-full px-3.5 py-2.5 rounded-xl border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600 transition-colors"
            />
          </div>

          <div>
            <label className="block text-xs font-bold text-slate-700 mb-1">
              {t.student.appFile} (Ixtiyoriy)
            </label>
            <input
              type="file"
              accept=".pdf,application/pdf,image/*"
              onChange={handleFileChange}
              className="w-full text-xs text-slate-500 file:mr-3 file:py-2 file:px-3 file:rounded-xl file:border-0 file:text-xs file:font-bold file:bg-blue-50 file:text-blue-700 hover:file:bg-blue-100 cursor-pointer"
            />
            {appFile && (
              <span className="text-xs text-emerald-600 font-bold block mt-1">
                ✓ {appFile.name} tanlandi
              </span>
            )}
          </div>
        </form>
      </Modal>
    </div>
  );
};
