import React, { useState, useEffect } from 'react';
import { Users, FileText, User, Calendar, Trash2, Search, Filter, AlertTriangle, ShieldAlert, Sparkles, Plus, Clock, MapPin, CheckCircle2 } from 'lucide-react';
import { I18N, Language, CATEGORIES } from '../../lib/i18n';
import { storage, normalizeClubTime } from '../../lib/storage';
import { StatusBadge, CategoryTag } from '../../components/common/Badge';
import { Modal } from '../../components/common/Modal';
import { Club, User as UserType } from '../../types';

export const AdminClubsView: React.FC<{
  lang: Language;
  showToast?: (msg: string, type?: 'ok' | 'err') => void;
  onRefresh?: () => void;
}> = ({ lang, showToast, onRefresh }) => {
  const t = I18N[lang];
  const [clubs, setClubs] = useState<Club[]>(storage.getClubs());
  const [users, setUsers] = useState<UserType[]>(storage.getUsers());
  const [searchQuery, setSearchQuery] = useState('');
  const [statusFilter, setStatusFilter] = useState<'all' | 'approved' | 'pending' | 'rejected'>('all');
  const [selectedCat, setSelectedCat] = useState<string>('all');

  // Delete modal state
  const [clubToDelete, setClubToDelete] = useState<Club | null>(null);
  const [deleteReason, setDeleteReason] = useState('');
  const [isDeleteModalOpen, setIsDeleteModalOpen] = useState(false);

  // Create club modal state
  const [isCreateModalOpen, setIsCreateModalOpen] = useState(false);
  const [newClubName, setNewClubName] = useState('');
  const [newClubCategory, setNewClubCategory] = useState(CATEGORIES[0]?.id || 'madaniyat');
  const [newClubLeaderId, setNewClubLeaderId] = useState('');
  const [newCustomLeaderName, setNewCustomLeaderName] = useState('');
  const [newClubFaculty, setNewClubFaculty] = useState('Ingliz tili 1-fakulteti');
  const [newClubRoom, setNewClubRoom] = useState('');
  const [newClubDescription, setNewClubDescription] = useState('');
  const [newClubStartDate, setNewClubStartDate] = useState('2026-09-01');
  const [newClubEndDate, setNewClubEndDate] = useState('2027-06-30');
  const [newClubDays, setNewClubDays] = useState<number[]>([1, 3]);
  const [newClubTimeStart, setNewClubTimeStart] = useState('11:00');
  const [newClubTimeEnd, setNewClubTimeEnd] = useState('12:30');
  const [newClubStatus, setNewClubStatus] = useState<'approved' | 'pending'>('approved');

  const refreshList = () => {
    setClubs(storage.getClubs());
    setUsers(storage.getUsers());
  };

  useEffect(() => {
    refreshList();
    const unsub = storage.subscribe(() => {
      refreshList();
    });
    return unsub;
  }, []);

  const leaders = users.filter((u) => u.role === 'leader' || u.role === 'admin');

  const handleOpenDelete = (club: Club) => {
    setClubToDelete(club);
    setDeleteReason(
      club.statuteStatus === 'rejected'
        ? (club.adminComment ? `Nizom rad etilgan (${club.adminComment})` : 'Nizom talablarga mos kelmaydi')
        : 'Administrator tomonidan o‘chirildi'
    );
    setIsDeleteModalOpen(true);
  };

  const handleConfirmDelete = () => {
    if (!clubToDelete) return;
    try {
      const clubName = clubToDelete.name;
      storage.deleteClub(clubToDelete.id, deleteReason, 'Hamidulla Abdualiyev (Bosh admin)');
      if (showToast) {
        showToast(`«${clubName}» to‘garagi tizimdan muvaffaqiyatli o‘chirib tashlandi!`, 'ok');
      }
      setIsDeleteModalOpen(false);
      setClubToDelete(null);
      refreshList();
      if (onRefresh) onRefresh();
    } catch (err: unknown) {
      const msg = err instanceof Error ? err.message : 'O‘chirishda xatolik yuz berdi';
      if (showToast) showToast(msg, 'err');
    }
  };

  const handleDeleteAllRejected = () => {
    const rejectedClubs = clubs.filter((c) => c.statuteStatus === 'rejected');
    if (rejectedClubs.length === 0) return;
    try {
      rejectedClubs.forEach((c) => {
        storage.deleteClub(c.id, 'Rad etilgan to‘garak', 'Hamidulla Abdualiyev (Bosh admin)');
      });
      if (showToast) {
        showToast(`${rejectedClubs.length} ta rad etilgan to‘garak o‘chirildi`, 'ok');
      }
      refreshList();
      if (onRefresh) onRefresh();
    } catch (err: unknown) {
      const msg = err instanceof Error ? err.message : 'O‘chirishda xatolik yuz berdi';
      if (showToast) showToast(msg, 'err');
    }
  };

  const handleToggleDay = (day: number) => {
    setNewClubDays((prev) =>
      prev.includes(day) ? prev.filter((d) => d !== day) : [...prev, day].sort()
    );
  };

  const handleCreateClubSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    if (!newClubName.trim()) {
      if (showToast) showToast('To‘garak nomini kiriting', 'err');
      return;
    }
    if (!newClubRoom.trim()) {
      if (showToast) showToast('O‘tkaziladigan xona yoki bino nomini kiriting', 'err');
      return;
    }
    if (newClubDays.length === 0) {
      if (showToast) showToast('Kamida bitta hafta kunini belgilang', 'err');
      return;
    }

    let finalLeaderId = newClubLeaderId;

    // If new leader is typed
    if (!finalLeaderId && newCustomLeaderName.trim()) {
      const cleanUname = 'rahbar_' + Math.random().toString(36).substring(2, 7);
      const createdUser = storage.createUserByAdmin({
        username: cleanUname,
        password: 'rahbar123',
        fullName: newCustomLeaderName.trim(),
        role: 'leader',
        faculty: newClubFaculty,
      });
      finalLeaderId = createdUser.id;
    }

    if (!finalLeaderId) {
      // Default to first available leader or admin
      finalLeaderId = leaders[0]?.id || 'u_admin_001';
    }

    try {
      storage.createClub({
        name: newClubName.trim(),
        category: newClubCategory,
        description: newClubDescription.trim() || '5 muhim tashabbus doirasidagi to‘garak mashg‘ulotlari.',
        faculty: newClubFaculty,
        leaderId: finalLeaderId,
        room: newClubRoom.trim(),
        startDate: newClubStartDate,
        endDate: newClubEndDate,
        weekdays: newClubDays,
        timeStart: newClubTimeStart,
        timeEnd: newClubTimeEnd,
        statuteStatus: newClubStatus,
        adminComment: newClubStatus === 'approved' ? 'Bosh administrator tomonidan rasman tasdiqlandi.' : '',
      });

      if (showToast) {
        showToast(`«${newClubName.trim()}» to‘garagi tizimga muvaffaqiyatli qo‘shildi!`, 'ok');
      }

      setIsCreateModalOpen(false);
      setNewClubName('');
      setNewClubRoom('');
      setNewClubDescription('');
      setNewCustomLeaderName('');
      refreshList();
      if (onRefresh) onRefresh();
    } catch (err: unknown) {
      const msg = err instanceof Error ? err.message : 'To‘garak qo‘shishda xatolik yuz berdi';
      if (showToast) showToast(msg, 'err');
    }
  };

  const pendingCount = clubs.filter((c) => c.statuteStatus === 'pending').length;
  const approvedCount = clubs.filter((c) => c.statuteStatus === 'approved').length;
  const rejectedCount = clubs.filter((c) => c.statuteStatus === 'rejected').length;

  const filteredClubs = clubs.filter((c) => {
    const matchesSearch =
      !searchQuery ||
      c.name.toLowerCase().includes(searchQuery.toLowerCase()) ||
      (c.leaderName && c.leaderName.toLowerCase().includes(searchQuery.toLowerCase())) ||
      (c.room && c.room.toLowerCase().includes(searchQuery.toLowerCase())) ||
      (c.description && c.description.toLowerCase().includes(searchQuery.toLowerCase()));

    const matchesStatus = statusFilter === 'all' || c.statuteStatus === statusFilter;
    const matchesCat = selectedCat === 'all' || c.category === selectedCat;

    return matchesSearch && matchesStatus && matchesCat;
  });

  const weekDayLabels = ['', 'Dush', 'Sesh', 'Chor', 'Pay', 'Juma', 'Shan', 'Yak'];

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
        <div>
          <h1 className="text-xl sm:text-2xl font-black text-slate-900 leading-tight">
            {t.nav.clubs}
          </h1>
          <p className="text-sm text-slate-500 mt-1">
            Institut to‘garaklari ro‘yxati, holati va to‘liq boshqaruvi
          </p>
        </div>

        {/* Action Buttons */}
        <div className="flex flex-wrap items-center gap-2.5">
          <button
            type="button"
            onClick={() => setIsCreateModalOpen(true)}
            className="px-4 py-2 rounded-xl bg-blue-600 hover:bg-blue-700 text-white text-xs sm:text-sm font-bold transition-all shadow-md shadow-blue-600/20 flex items-center gap-2 cursor-pointer active:scale-98"
          >
            <Plus className="w-4 h-4" />
            <span>Yangi to‘garak qo‘shish</span>
          </button>
        </div>
      </div>

      {/* Quick stats pills */}
      <div className="flex flex-wrap items-center gap-2">
        <div className="px-3 py-1.5 rounded-xl bg-blue-50 border border-blue-200 text-blue-900 text-xs font-bold">
          Jami to‘garaklar: <span className="font-extrabold text-blue-700">{clubs.length} ta</span>
        </div>
        <div className="px-3 py-1.5 rounded-xl bg-emerald-50 border border-emerald-200 text-emerald-900 text-xs font-bold">
          Tasdiqlangan: <span className="font-extrabold text-emerald-700">{approvedCount} ta</span>
        </div>
        <div className="px-3 py-1.5 rounded-xl bg-amber-50 border border-amber-200 text-amber-900 text-xs font-bold">
          Kutilmoqda: <span className="font-extrabold text-amber-700">{pendingCount} ta</span>
        </div>
        {rejectedCount > 0 && (
          <button
            type="button"
            onClick={() => setStatusFilter('rejected')}
            className="px-3 py-1.5 rounded-xl bg-rose-50 hover:bg-rose-100 border border-rose-300 text-rose-900 text-xs font-bold flex items-center gap-1.5 cursor-pointer transition-all"
          >
            <span className="w-2 h-2 rounded-full bg-rose-600 animate-ping"></span>
            <span>Rad etilgan: <b className="text-rose-700 underline">{rejectedCount} ta</b></span>
          </button>
        )}
      </div>

      {/* Prominent Rejected Alert Banner */}
      {rejectedCount > 0 && (
        <div className="p-4 rounded-2xl bg-rose-50 border border-rose-300 text-rose-950 flex flex-col sm:flex-row items-start sm:items-center justify-between gap-3 shadow-xs">
          <div className="flex items-start gap-3">
            <div className="w-9 h-9 rounded-xl bg-rose-600 text-white flex items-center justify-center shrink-0 shadow-xs">
              <ShieldAlert className="w-5 h-5" />
            </div>
            <div>
              <p className="text-sm font-extrabold text-rose-900">
                Rad etilgan to‘garaklar mavjud ({rejectedCount} ta)
              </p>
              <p className="text-xs text-rose-700 mt-0.5">
                Talablarga mos kelmagan to‘garaklarni quyidagi qizil «Rad etilgan to‘garakni o‘chirish» tugmalari orqali tizimdan butunlay o‘chirib tashlashingiz mumkin.
              </p>
            </div>
          </div>
          <div className="flex items-center gap-2 shrink-0">
            <button
              type="button"
              onClick={handleDeleteAllRejected}
              className="px-4 py-2 rounded-xl bg-rose-600 hover:bg-rose-700 text-white text-xs font-black transition-all shadow-xs cursor-pointer flex items-center gap-1.5"
            >
              <Trash2 className="w-3.5 h-3.5" />
              <span>Barcha rad etilganlarni o‘chirish</span>
            </button>
            {statusFilter !== 'rejected' && (
              <button
                type="button"
                onClick={() => setStatusFilter('rejected')}
                className="px-3 py-2 rounded-xl bg-white border border-rose-300 text-rose-800 text-xs font-bold transition-all shadow-xs cursor-pointer hover:bg-rose-100"
              >
                <span>Ro‘yxatni ko‘rish</span>
              </button>
            )}
          </div>
        </div>
      )}

      {/* Filter and Search controls */}
      <div className="bg-white rounded-2xl border border-slate-200 p-4 shadow-xs space-y-3">
        <div className="flex flex-col sm:flex-row gap-3">
          {/* Search bar */}
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

          {/* Status Filter Tabs */}
          <div className="inline-flex rounded-xl border border-slate-200 p-1 bg-slate-100 text-xs font-bold flex-wrap">
            <button
              type="button"
              onClick={() => setStatusFilter('all')}
              className={`px-3 py-1.5 rounded-lg transition-all ${
                statusFilter === 'all' ? 'bg-white text-slate-900 shadow-xs' : 'text-slate-600 hover:text-slate-900'
              }`}
            >
              Barchasi ({clubs.length})
            </button>
            <button
              type="button"
              onClick={() => setStatusFilter('approved')}
              className={`px-3 py-1.5 rounded-lg transition-all ${
                statusFilter === 'approved' ? 'bg-emerald-600 text-white shadow-xs' : 'text-slate-600 hover:text-slate-900'
              }`}
            >
              Tasdiqlangan ({approvedCount})
            </button>
            <button
              type="button"
              onClick={() => setStatusFilter('pending')}
              className={`px-3 py-1.5 rounded-lg transition-all ${
                statusFilter === 'pending' ? 'bg-amber-600 text-white shadow-xs' : 'text-slate-600 hover:text-slate-900'
              }`}
            >
              Kutilmoqda ({pendingCount})
            </button>
            <button
              type="button"
              onClick={() => setStatusFilter('rejected')}
              className={`px-3 py-1.5 rounded-lg transition-all ${
                statusFilter === 'rejected' ? 'bg-rose-600 text-white shadow-xs' : 'text-rose-700 hover:text-rose-900 font-extrabold'
              }`}
            >
              Rad etilgan ({rejectedCount})
            </button>
          </div>
        </div>

        {/* Category Pills */}
        <div className="flex items-center gap-1.5 overflow-x-auto pb-1 text-xs">
          <button
            type="button"
            onClick={() => setSelectedCat('all')}
            className={`px-3 py-1 rounded-lg shrink-0 font-medium transition-colors ${
              selectedCat === 'all'
                ? 'bg-slate-900 text-white font-bold'
                : 'bg-slate-100 text-slate-600 hover:bg-slate-200'
            }`}
          >
            Barcha yo‘nalishlar
          </button>
          {CATEGORIES.map((cat) => (
            <button
              key={cat.id}
              type="button"
              onClick={() => setSelectedCat(cat.id)}
              className={`px-3 py-1 rounded-lg shrink-0 font-medium transition-colors ${
                selectedCat === cat.id
                  ? 'bg-blue-600 text-white font-bold'
                  : 'bg-slate-100 text-slate-600 hover:bg-slate-200'
              }`}
            >
              {lang === 'ru' ? cat.name_ru : cat.name_uz}
            </button>
          ))}
        </div>
      </div>

      {/* Clubs List */}
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-5">
        {filteredClubs.length === 0 ? (
          <div className="col-span-full py-12 px-4 text-center bg-white rounded-2xl border border-slate-200 space-y-4">
            <div className="w-16 h-16 rounded-2xl bg-blue-50 text-blue-600 flex items-center justify-center mx-auto">
              <Users className="w-8 h-8" />
            </div>
            <div>
              <p className="text-base font-bold text-slate-800">
                To‘garaklar ro‘yxati bo‘sh yoki qidiruv bo‘yicha topilmadi
              </p>
              <p className="text-xs text-slate-400 mt-1 max-w-md mx-auto">
                Tizimda to‘garaklar mavjud emas. Quyidagi «Yangi to‘garak qo‘shish» tugmasi orqali yangi to‘garak tashkil qilishingiz mumkin.
              </p>
            </div>
            <div className="flex flex-wrap items-center justify-center gap-3 pt-2">
              <button
                type="button"
                onClick={() => setIsCreateModalOpen(true)}
                className="px-5 py-2.5 bg-blue-600 hover:bg-blue-700 text-white text-xs sm:text-sm font-bold rounded-xl shadow-md transition-all flex items-center gap-2 cursor-pointer"
              >
                <Plus className="w-4 h-4" />
                <span>Yangi to‘garak qo‘shish</span>
              </button>
            </div>
          </div>
        ) : (
          filteredClubs.map((club) => {
            const isRejected = club.statuteStatus === 'rejected';

            return (
              <div
                key={club.id}
                className={`bg-white rounded-2xl border transition-all duration-200 flex flex-col justify-between overflow-hidden shadow-xs hover:shadow-md ${
                  isRejected ? 'border-rose-400 ring-2 ring-rose-200/80 bg-rose-50/20' : 'border-slate-200 hover:border-slate-300'
                }`}
              >
                <div className="p-5 space-y-4">
                  {/* Category & Status badges */}
                  <div className="flex items-start justify-between gap-2">
                    <CategoryTag categoryId={club.category} lang={lang} />
                    <StatusBadge status={club.statuteStatus} lang={lang} />
                  </div>

                  {/* Title & Description */}
                  <div>
                    <h3 className="font-extrabold text-slate-900 text-base leading-snug line-clamp-2">
                      {club.name}
                    </h3>
                    {club.description && (
                      <p className="text-xs text-slate-500 mt-1.5 line-clamp-2 leading-relaxed">
                        {club.description}
                      </p>
                    )}
                  </div>

                  {/* Rejection comment banner */}
                  {isRejected && (
                    <div className="p-3 bg-rose-100/90 border border-rose-300 rounded-xl text-xs space-y-1">
                      <div className="flex items-center gap-1.5 font-extrabold text-rose-900">
                        <AlertTriangle className="w-3.5 h-3.5 text-rose-600 shrink-0" />
                        <span>Nizom rad etilgan:</span>
                      </div>
                      <p className="text-rose-800 text-[11px] leading-relaxed">
                        {club.adminComment || 'Talablarga javob bermaydi'}
                      </p>
                    </div>
                  )}

                  {/* Meta details */}
                  <div className="space-y-1.5 pt-1 text-xs text-slate-600 border-t border-slate-100">
                    <div className="flex items-center gap-2">
                      <User className="w-3.5 h-3.5 text-slate-400 shrink-0" />
                      <span className="font-semibold text-slate-800 truncate">
                        {club.leaderName || 'To‘garak rahbari'}
                      </span>
                    </div>

                    {club.room && (
                      <div className="flex items-center gap-2">
                        <MapPin className="w-3.5 h-3.5 text-slate-400 shrink-0" />
                        <span className="truncate">{club.room}</span>
                      </div>
                    )}

                    {club.timeStart && (
                      <div className="flex items-center gap-2">
                        <Clock className="w-3.5 h-3.5 text-slate-400 shrink-0" />
                        <span>
                          {club.timeStart} – {club.timeEnd || '16:00'}
                          {club.weekdays && club.weekdays.length > 0 && (
                            <span className="text-slate-400 font-medium ml-1">
                              ({club.weekdays.map((d) => weekDayLabels[d]).join(', ')})
                            </span>
                          )}
                        </span>
                      </div>
                    )}

                    <div className="flex items-center gap-2">
                      <Users className="w-3.5 h-3.5 text-slate-400 shrink-0" />
                      <span>{club.memberCount || 0} ta a’zo talaba</span>
                    </div>
                  </div>
                </div>

                {/* Footer with Actions */}
                <div className="p-3.5 bg-slate-50 border-t border-slate-100 flex items-center justify-between gap-2">
                  <span className="text-[11px] font-bold text-slate-400">
                    ID: {club.id}
                  </span>

                  {/* Delete Button */}
                  <button
                    type="button"
                    onClick={() => handleOpenDelete(club)}
                    className={`px-3 py-1.5 rounded-xl text-xs font-bold transition-all flex items-center gap-1.5 cursor-pointer ${
                      isRejected
                        ? 'bg-rose-600 hover:bg-rose-700 text-white shadow-xs'
                        : 'text-rose-600 hover:bg-rose-100/70 border border-rose-200'
                    }`}
                    title={isRejected ? 'Rad etilgan to‘garakni tizimdan o‘chirish' : 'To‘garakni tizimdan o‘chirish'}
                  >
                    <Trash2 className="w-3.5 h-3.5 shrink-0" />
                    <span>{isRejected ? 'Rad etilganni o‘chirish' : 'O‘chirish'}</span>
                  </button>
                </div>
              </div>
            );
          })
        )}
      </div>

      {/* Delete Confirmation Modal */}
      <Modal
        isOpen={isDeleteModalOpen}
        onClose={() => setIsDeleteModalOpen(false)}
        title="To‘garakni butunlay o‘chirib tashlash"
        footer={
          <>
            <button
              type="button"
              onClick={() => setIsDeleteModalOpen(false)}
              className="px-4 py-2 rounded-xl border border-slate-200 text-slate-700 text-xs font-bold hover:bg-slate-50 transition-colors cursor-pointer"
            >
              Bekor qilish
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
                To‘garakni tizimdan o‘chirishni tasdiqlaysizmi?
              </p>
              <p className="text-rose-800">
                «<b>{clubToDelete?.name}</b>» to‘garagi, uning dars jadvali, mashg‘ulotlari va talabalar arizalari tizimdan to‘liq o‘chiriladi.
              </p>
              <p className="text-rose-700 font-semibold">
                Mas'ul rahbar: {clubToDelete?.leaderName} ({clubToDelete?.faculty})
              </p>
            </div>
          </div>

          <div>
            <label className="block text-xs font-bold text-slate-700 mb-1">
              O‘chirish sababi (To‘garak rahbariga bildirishnoma sifatida yuboriladi):
            </label>
            <textarea
              rows={2}
              value={deleteReason}
              onChange={(e) => setDeleteReason(e.target.value)}
              placeholder="Masalan: Nizom rad etilgan va to‘garak faoliyati bekor qilindi..."
              className="w-full px-3.5 py-2 rounded-xl border border-slate-200 text-xs sm:text-sm focus:outline-none focus:ring-2 focus:ring-rose-500/20 focus:border-rose-500 transition-colors"
            />
          </div>
        </div>
      </Modal>

      {/* Admin Create Club Modal */}
      <Modal
        isOpen={isCreateModalOpen}
        onClose={() => setIsCreateModalOpen(false)}
        title="Yangi to‘garak tashkil qilish (Admin)"
        footer={
          <>
            <button
              type="button"
              onClick={() => setIsCreateModalOpen(false)}
              className="px-4 py-2 rounded-xl border border-slate-200 text-slate-700 text-xs font-bold hover:bg-slate-50 transition-colors cursor-pointer"
            >
              Bekor qilish
            </button>
            <button
              type="button"
              onClick={handleCreateClubSubmit}
              className="px-5 py-2 rounded-xl bg-blue-600 hover:bg-blue-700 text-white text-xs font-bold transition-all shadow-md flex items-center gap-1.5 cursor-pointer"
            >
              <CheckCircle2 className="w-3.5 h-3.5" />
              <span>To‘garakni saqlash</span>
            </button>
          </>
        }
      >
        <form onSubmit={handleCreateClubSubmit} className="space-y-4 max-h-[75vh] overflow-y-auto px-1 py-1">
          <div>
            <label className="block text-xs font-bold text-slate-700 mb-1">
              To‘garak nomi *
            </label>
            <input
              type="text"
              required
              value={newClubName}
              onChange={(e) => setNewClubName(e.target.value)}
              placeholder="Masalan: «Mohir qo‘llar» to‘garagi"
              className="w-full px-3.5 py-2.5 rounded-xl border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600 transition-colors"
            />
          </div>

          <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
            <div>
              <label className="block text-xs font-bold text-slate-700 mb-1">
                5 muhim tashabbus yo‘nalishi *
              </label>
              <select
                value={newClubCategory}
                onChange={(e) => setNewClubCategory(e.target.value)}
                className="w-full px-3 py-2 rounded-xl border border-slate-200 text-xs font-medium focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600 bg-white"
              >
                {CATEGORIES.map((c) => (
                  <option key={c.id} value={c.id}>
                    {lang === 'ru' ? c.name_ru : c.name_uz}
                  </option>
                ))}
              </select>
            </div>

            <div>
              <label className="block text-xs font-bold text-slate-700 mb-1">
                To‘garak holati
              </label>
              <select
                value={newClubStatus}
                onChange={(e) => setNewClubStatus(e.target.value as 'approved' | 'pending')}
                className="w-full px-3 py-2 rounded-xl border border-slate-200 text-xs font-medium focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600 bg-white"
              >
                <option value="approved">Tasdiqlangan (Faoliyatga tayyor)</option>
                <option value="pending">Ko‘rib chiqilmoqda (Kutilmoqda)</option>
              </select>
            </div>
          </div>

          <div>
            <label className="block text-xs font-bold text-slate-700 mb-1">
              Biriktirilgan rahbar *
            </label>
            <select
              value={newClubLeaderId}
              onChange={(e) => setNewClubLeaderId(e.target.value)}
              className="w-full px-3 py-2 rounded-xl border border-slate-200 text-xs font-medium focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600 bg-white"
            >
              <option value="">-- Mavjud rahbarlardan birini tanlang --</option>
              {leaders.map((u) => (
                <option key={u.id} value={u.id}>
                  {u.fullName} (@{u.username}) — {u.faculty || 'Institut'}
                </option>
              ))}
            </select>
            <p className="text-[11px] text-slate-400 mt-1">
              Yoki yangi rahbar ismini kiriting (quyida):
            </p>
            <input
              type="text"
              value={newCustomLeaderName}
              onChange={(e) => {
                setNewCustomLeaderName(e.target.value);
                if (e.target.value) setNewClubLeaderId('');
              }}
              placeholder="Yangi rahbar F.I.Sh. (Masalan: Sotiboldiyeva Nafisa)"
              className="w-full mt-1.5 px-3 py-2 rounded-xl border border-slate-200 text-xs focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600"
            />
          </div>

          <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
            <div>
              <label className="block text-xs font-bold text-slate-700 mb-1">
                Fakultet / Bo‘lim
              </label>
              <input
                type="text"
                value={newClubFaculty}
                onChange={(e) => setNewClubFaculty(e.target.value)}
                placeholder="Ingliz tili 1-fakulteti"
                className="w-full px-3 py-2 rounded-xl border border-slate-200 text-xs focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600"
              />
            </div>
            <div>
              <label className="block text-xs font-bold text-slate-700 mb-1">
                O‘tkaziladigan xona / Auditoriya *
              </label>
              <input
                type="text"
                required
                value={newClubRoom}
                onChange={(e) => setNewClubRoom(e.target.value)}
                placeholder="Masalan: 204-auditoriya / Sport zali"
                className="w-full px-3 py-2 rounded-xl border border-slate-200 text-xs focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600"
              />
            </div>
          </div>

          {/* Weekdays */}
          <div>
            <label className="block text-xs font-bold text-slate-700 mb-1.5">
              Hafta kunlari *
            </label>
            <div className="flex flex-wrap gap-2">
              {[
                { day: 1, name: 'Dushanba' },
                { day: 2, name: 'Seshanba' },
                { day: 3, name: 'Chorshanba' },
                { day: 4, name: 'Payshanba' },
                { day: 5, name: 'Juma' },
                { day: 6, name: 'Shanba' },
              ].map((item) => (
                <button
                  key={item.day}
                  type="button"
                  onClick={() => handleToggleDay(item.day)}
                  className={`px-3 py-1.5 rounded-xl text-xs font-bold transition-all cursor-pointer ${
                    newClubDays.includes(item.day)
                      ? 'bg-blue-600 text-white shadow-xs'
                      : 'bg-slate-100 text-slate-600 hover:bg-slate-200'
                  }`}
                >
                  {item.name}
                </button>
              ))}
            </div>
          </div>

          {/* Time range */}
          <div className="grid grid-cols-2 gap-3">
            <div>
              <label className="block text-xs font-bold text-slate-700 mb-1">
                Boshlanish vaqti
              </label>
              <input
                type="time"
                value={newClubTimeStart}
                onChange={(e) => setNewClubTimeStart(normalizeClubTime(e.target.value))}
                className="w-full px-3 py-2 rounded-xl border border-slate-200 text-xs focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600"
              />
              <div className="flex flex-wrap gap-1 mt-1">
                {['09:00', '10:00', '11:00', '12:00', '14:00', '15:00', '16:00'].map((p) => (
                  <button
                    key={p}
                    type="button"
                    onClick={() => {
                      setNewClubTimeStart(p);
                      const [h, m] = p.split(':').map(Number);
                      setNewClubTimeEnd(`${String(h + 1).padStart(2, '0')}:${String(m + 30 >= 60 ? m - 30 : m + 30).padStart(2, '0')}`);
                    }}
                    className={`px-1.5 py-0.5 text-[9px] rounded font-bold transition-all cursor-pointer ${
                      newClubTimeStart === p
                        ? 'bg-blue-600 text-white shadow-xs'
                        : 'bg-slate-100 hover:bg-slate-200 text-slate-700'
                    }`}
                  >
                    {p}
                  </button>
                ))}
              </div>
              {newClubTimeStart && (
                <span className="text-[10px] text-emerald-700 font-bold block mt-1">
                  Tanlangan: {newClubTimeStart} (Kunduzgi vaqt)
                </span>
              )}
            </div>
            <div>
              <label className="block text-xs font-bold text-slate-700 mb-1">
                Tugash vaqti
              </label>
              <input
                type="time"
                value={newClubTimeEnd}
                onChange={(e) => setNewClubTimeEnd(normalizeClubTime(e.target.value))}
                className="w-full px-3 py-2 rounded-xl border border-slate-200 text-xs focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600"
              />
              <div className="flex flex-wrap gap-1 mt-1">
                {['10:30', '11:30', '12:30', '13:30', '15:30', '16:30', '17:30'].map((p) => (
                  <button
                    key={p}
                    type="button"
                    onClick={() => setNewClubTimeEnd(p)}
                    className={`px-1.5 py-0.5 text-[9px] rounded font-bold transition-all cursor-pointer ${
                      newClubTimeEnd === p
                        ? 'bg-blue-600 text-white shadow-xs'
                        : 'bg-slate-100 hover:bg-slate-200 text-slate-700'
                    }`}
                  >
                    {p}
                  </button>
                ))}
              </div>
              {newClubTimeEnd && (
                <span className="text-[10px] text-emerald-700 font-bold block mt-1">
                  Tugash: {newClubTimeEnd}
                </span>
              )}
            </div>
          </div>

          {/* Description */}
          <div>
            <label className="block text-xs font-bold text-slate-700 mb-1">
              To‘garak haqida qisqacha tavsif
            </label>
            <textarea
              rows={2}
              value={newClubDescription}
              onChange={(e) => setNewClubDescription(e.target.value)}
              placeholder="To‘garakning asosiy maqsad va vazifalari..."
              className="w-full px-3.5 py-2 rounded-xl border border-slate-200 text-xs sm:text-sm focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600"
            />
          </div>
        </form>
      </Modal>
    </div>
  );
};
