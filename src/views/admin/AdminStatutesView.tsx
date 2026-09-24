import React, { useState, useEffect } from 'react';
import { Scroll, Check, X, FileText, MessageSquare, Trash2, AlertTriangle, ShieldAlert } from 'lucide-react';
import { I18N, Language } from '../../lib/i18n';
import { storage } from '../../lib/storage';
import { StatusBadge, CategoryTag } from '../../components/common/Badge';
import { Modal } from '../../components/common/Modal';
import { Club } from '../../types';

export const AdminStatutesView: React.FC<{
  lang: Language;
  showToast: (msg: string, type?: 'ok' | 'err') => void;
  onRefresh: () => void;
  defaultFilter?: 'all' | 'pending' | 'approved' | 'rejected';
}> = ({ lang, showToast, onRefresh, defaultFilter = 'all' }) => {
  const t = I18N[lang];
  const [clubs, setClubs] = useState<Club[]>(storage.getClubs());
  const [statusFilter, setStatusFilter] = useState<'all' | 'pending' | 'approved' | 'rejected'>(defaultFilter);

  // Review modal state
  const [selectedClub, setSelectedClub] = useState<Club | null>(null);
  const [reviewStatus, setReviewStatus] = useState<'approved' | 'rejected'>('approved');
  const [reviewComment, setReviewComment] = useState('');
  const [isModalOpen, setIsModalOpen] = useState(false);

  // Delete modal state
  const [clubToDelete, setClubToDelete] = useState<Club | null>(null);
  const [deleteReason, setDeleteReason] = useState('');
  const [isDeleteModalOpen, setIsDeleteModalOpen] = useState(false);

  useEffect(() => {
    const unsub = storage.subscribe(() => {
      setClubs(storage.getClubs());
    });
    return unsub;
  }, []);

  const refreshList = () => {
    setClubs(storage.getClubs());
    onRefresh();
  };

  const handleOpenReview = (club: Club, status: 'approved' | 'rejected') => {
    setSelectedClub(club);
    setReviewStatus(status);
    setReviewComment(club.adminComment || '');
    setIsModalOpen(true);
  };

  const handleSaveReview = () => {
    if (!selectedClub) return;
    try {
      storage.reviewStatute(selectedClub.id, reviewStatus, reviewComment, 'Hamidulla Abdualiyev');
      showToast(
        reviewStatus === 'approved'
          ? 'To‘garak muvaffaqiyatli tasdiqlandi va rahbar hamda talabalarga bildirishnoma yuborildi!'
          : 'Nizom rad etildi va rahbariga xabar yuborildi',
        'ok'
      );
      setIsModalOpen(false);
      refreshList();
    } catch (err: unknown) {
      const msg = err instanceof Error ? err.message : 'Xatolik yuz berdi';
      showToast(msg, 'err');
    }
  };

  const handleDirectRejectAndDelete = () => {
    if (!selectedClub) return;
    const clubName = selectedClub.name;
    const reason = reviewComment.trim() || 'Nizom rad etildi va to‘garak Bosh admin tomonidan tizimdan butunlay o‘chirib tashlandi';
    try {
      storage.deleteClub(selectedClub.id, reason, 'Hamidulla Abdualiyev (Bosh admin)');
      showToast(`«${clubName}» to‘garagi rad etildi va tizimdan butunlay o‘chirib tashlandi!`, 'ok');
      setIsModalOpen(false);
      setSelectedClub(null);
      refreshList();
    } catch (err: unknown) {
      const msg = err instanceof Error ? err.message : 'Xatolik yuz berdi';
      showToast(msg, 'err');
    }
  };

  const handleOpenDelete = (club: Club, defaultReason?: string) => {
    setClubToDelete(club);
    setDeleteReason(
      defaultReason ||
      (club.statuteStatus === 'rejected'
        ? (club.adminComment ? `Nizom rad etilgan (${club.adminComment})` : 'Nizom talablariga javob bermaydi')
        : 'Administrator tomonidan o‘chirildi')
    );
    setIsDeleteModalOpen(true);
  };

  const handleConfirmDelete = () => {
    if (!clubToDelete) return;
    try {
      const clubName = clubToDelete.name;
      storage.deleteClub(clubToDelete.id, deleteReason, 'Hamidulla Abdualiyev (Bosh admin)');
      showToast(`«${clubName}» to‘garagi tizimdan butunlay o‘chirib tashlandi!`, 'ok');
      setIsDeleteModalOpen(false);
      setClubToDelete(null);
      refreshList();
    } catch (err: unknown) {
      const msg = err instanceof Error ? err.message : 'O‘chirishda xatolik yuz berdi';
      showToast(msg, 'err');
    }
  };

  const handleDeleteAllRejected = () => {
    if (rejectedCount === 0) return;
    if (window.confirm(`Rostdan ham barcha ${rejectedCount} ta rad etilgan to‘garakni tizimdan butunlay o‘chirib tashlamoqchimisiz?`)) {
      try {
        const count = storage.deleteAllRejectedClubs('Hamidulla Abdualiyev (Bosh admin)');
        showToast(`${count} ta rad etilgan to‘garak tizimdan butunlay o‘chirildi!`, 'ok');
        refreshList();
      } catch (err: unknown) {
        const msg = err instanceof Error ? err.message : 'Xatolik yuz berdi';
        showToast(msg, 'err');
      }
    }
  };

  const pendingCount = clubs.filter((c) => c.statuteStatus === 'pending').length;
  const approvedCount = clubs.filter((c) => c.statuteStatus === 'approved').length;
  const rejectedCount = clubs.filter((c) => c.statuteStatus === 'rejected').length;

  const filteredClubs = clubs.filter((c) => {
    if (statusFilter === 'all') return true;
    return c.statuteStatus === statusFilter;
  });

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
        <div>
          <h1 className="text-xl sm:text-2xl font-black text-slate-900 leading-tight flex items-center gap-2">
            <Scroll className="w-6 h-6 text-blue-600" />
            <span>{t.admin.statuteReview}</span>
          </h1>
          <p className="text-sm text-slate-500 mt-1">
            To‘garaklar nizomlarini ko‘rib chiqish, tasdiqlash yoki rad etilganlarini tizimdan butunlay o‘chirib tashlash
          </p>
        </div>

        {rejectedCount > 0 && (
          <button
            type="button"
            onClick={handleDeleteAllRejected}
            className="px-4 py-2.5 rounded-xl bg-rose-600 hover:bg-rose-700 text-white text-xs sm:text-sm font-black transition-all shadow-md flex items-center gap-2 cursor-pointer active:scale-98"
          >
            <Trash2 className="w-4 h-4" />
            <span>Barcha rad etilganlarni o‘chirish ({rejectedCount})</span>
          </button>
        )}
      </div>

      {/* Prominent Banner for Rejected Clubs */}
      {rejectedCount > 0 && (
        <div className="p-4 sm:p-5 rounded-2xl bg-rose-50 border-2 border-rose-400 text-rose-950 flex flex-col sm:flex-row items-start sm:items-center justify-between gap-4 shadow-md">
          <div className="flex items-start gap-3.5">
            <div className="w-10 h-10 rounded-xl bg-rose-600 text-white flex items-center justify-center shrink-0 shadow-xs mt-0.5">
              <ShieldAlert className="w-6 h-6" />
            </div>
            <div>
              <p className="text-base font-black text-rose-900">
                Rad etilgan to‘garaklar: {rejectedCount} ta
              </p>
              <p className="text-xs text-rose-800 mt-0.5 leading-relaxed">
                Ushbu to‘garaklar talablarga javob bermagan. Quyidagi <b>«Barcha rad etilganlarni o‘chirish»</b> tugmasi orqali hammasini bittada, yoki ro‘yxatdagi qizil tugma orqali har birini alohida-alohida tizimdan butunlay o‘chirib tashlashingiz mumkin.
              </p>
            </div>
          </div>
          <div className="flex items-center gap-2 shrink-0 w-full sm:w-auto">
            <button
              type="button"
              onClick={handleDeleteAllRejected}
              className="w-full sm:w-auto px-4 py-2.5 rounded-xl bg-rose-600 hover:bg-rose-700 text-white text-xs font-black transition-all shadow-md flex items-center justify-center gap-2 cursor-pointer"
            >
              <Trash2 className="w-4 h-4" />
              <span>Barchasini o‘chirib tashlash</span>
            </button>
          </div>
        </div>
      )}

      {/* Filter Tabs */}
      <div className="flex flex-wrap items-center gap-2">
        <button
          type="button"
          onClick={() => setStatusFilter('all')}
          className={`px-3.5 py-1.5 rounded-xl text-xs font-bold transition-all cursor-pointer ${
            statusFilter === 'all'
              ? 'bg-slate-900 text-white shadow-xs'
              : 'bg-white border border-slate-200 text-slate-600 hover:bg-slate-50'
          }`}
        >
          {t.common.all} ({clubs.length})
        </button>
        <button
          type="button"
          onClick={() => setStatusFilter('pending')}
          className={`px-3.5 py-1.5 rounded-xl text-xs font-bold transition-all cursor-pointer ${
            statusFilter === 'pending'
              ? 'bg-amber-600 text-white shadow-xs'
              : 'bg-white border border-slate-200 text-slate-600 hover:bg-slate-50'
          }`}
        >
          {t.common.pending} ({pendingCount})
        </button>
        <button
          type="button"
          onClick={() => setStatusFilter('approved')}
          className={`px-3.5 py-1.5 rounded-xl text-xs font-bold transition-all cursor-pointer ${
            statusFilter === 'approved'
              ? 'bg-emerald-600 text-white shadow-xs'
              : 'bg-white border border-slate-200 text-slate-600 hover:bg-slate-50'
          }`}
        >
          {t.common.approved} ({approvedCount})
        </button>
        <button
          type="button"
          onClick={() => setStatusFilter('rejected')}
          className={`px-3.5 py-1.5 rounded-xl text-xs font-bold transition-all cursor-pointer flex items-center gap-1.5 ${
            statusFilter === 'rejected'
              ? 'bg-rose-600 text-white shadow-xs ring-2 ring-rose-300'
              : 'bg-white border border-rose-300 text-rose-700 hover:bg-rose-50'
          }`}
        >
          <Trash2 className="w-3.5 h-3.5" />
          <span>{t.common.rejected} ({rejectedCount})</span>
        </button>
      </div>

      {/* Table */}
      <div className="bg-white rounded-2xl border border-slate-200 overflow-hidden shadow-xs">
        <div className="overflow-x-auto">
          <table className="w-full text-left text-sm">
            <thead className="bg-slate-50/70 text-xs font-bold text-slate-500 uppercase border-b border-slate-100">
              <tr>
                <th className="px-5 py-3.5">{t.common.club}</th>
                <th className="px-5 py-3.5">{t.common.leader}</th>
                <th className="px-5 py-3.5">{t.common.file}</th>
                <th className="px-5 py-3.5">{t.common.status}</th>
                <th className="px-5 py-3.5 text-right font-black text-slate-800">
                  Amallar va O‘chirish
                </th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-100">
              {filteredClubs.length === 0 ? (
                <tr>
                  <td colSpan={5} className="px-5 py-10 text-center text-slate-400">
                    <p className="font-bold text-slate-600">{t.common.empty}</p>
                    <p className="text-xs text-slate-400 mt-1">Ko‘rsatilgan toifa bo‘yicha to‘garaklar yo‘q</p>
                  </td>
                </tr>
              ) : (
                filteredClubs.map((c) => {
                  const isRejected = c.statuteStatus === 'rejected';

                  return (
                    <tr
                      key={c.id}
                      className={`hover:bg-slate-50/50 transition-colors ${
                        isRejected ? 'bg-rose-50/40' : ''
                      }`}
                    >
                      <td className="px-5 py-3.5">
                        <div className="font-bold text-slate-900">{c.name}</div>
                        <div className="mt-1">
                          <CategoryTag categoryId={c.categoryName_uz || c.category} lang={lang} ball={c.categoryBall} />
                        </div>
                      </td>
                      <td className="px-5 py-3.5 font-medium text-slate-700">
                        <div>{c.leaderName}</div>
                        <div className="text-xs text-slate-400">{c.faculty}</div>
                      </td>
                      <td className="px-5 py-3.5">
                        {c.statuteFile ? (
                          <a
                            href={c.statuteFile.url}
                            target="_blank"
                            rel="noopener noreferrer"
                            download={c.statuteFile.name}
                            className="inline-flex items-center gap-1.5 px-2.5 py-1 rounded-lg text-xs font-bold text-blue-700 bg-blue-50 hover:bg-blue-100 border border-blue-200 transition-colors"
                          >
                            <FileText className="w-3.5 h-3.5" />
                            <span>Nizom (PDF)</span>
                          </a>
                        ) : (
                          <span className="text-xs text-slate-400 italic">Yuklanmagan</span>
                        )}
                      </td>
                      <td className="px-5 py-3.5">
                        <StatusBadge status={c.statuteStatus} lang={lang} />
                        {c.adminComment && (
                          <div className="text-xs text-slate-500 mt-1 flex items-start gap-1">
                            <MessageSquare className="w-3 h-3 text-slate-400 shrink-0 mt-0.5" />
                            <span>{c.adminComment}</span>
                          </div>
                        )}
                      </td>
                      <td className="px-5 py-3.5 text-right whitespace-nowrap">
                        <div className="inline-flex items-center gap-2 justify-end">
                          {/* Approve Button */}
                          <button
                            type="button"
                            onClick={() => handleOpenReview(c, 'approved')}
                            className="px-2.5 py-1.5 rounded-xl bg-emerald-600 hover:bg-emerald-700 text-white text-xs font-bold transition-all inline-flex items-center gap-1 shadow-2xs cursor-pointer"
                            title="Nizomni tasdiqlash"
                          >
                            <Check className="w-3.5 h-3.5" />
                            <span>{t.common.approve}</span>
                          </button>

                          {/* Reject / Review Button */}
                          {!isRejected ? (
                            <button
                              type="button"
                              onClick={() => handleOpenReview(c, 'rejected')}
                              className="px-2.5 py-1.5 rounded-xl bg-rose-50 hover:bg-rose-100 text-rose-700 border border-rose-200 text-xs font-bold transition-all inline-flex items-center gap-1 cursor-pointer"
                              title="Nizomni rad etish"
                            >
                              <X className="w-3.5 h-3.5" />
                              <span>{t.common.reject}</span>
                            </button>
                          ) : (
                            <button
                              type="button"
                              onClick={() => handleOpenReview(c, 'approved')}
                              className="px-2.5 py-1.5 rounded-xl bg-slate-100 hover:bg-slate-200 text-slate-700 text-xs font-bold transition-all inline-flex items-center gap-1 cursor-pointer"
                              title="Qayta ko‘rib chiqish"
                            >
                              <span>Qayta ko‘rish</span>
                            </button>
                          )}

                          {/* CLEAR & PROMINENT DELETE BUTTON (ALWAYS AVAILABLE) */}
                          <button
                            type="button"
                            onClick={() => handleOpenDelete(c)}
                            className={`px-3 py-1.5 rounded-xl text-xs font-black transition-all inline-flex items-center gap-1.5 cursor-pointer shadow-xs ${
                              isRejected
                                ? 'bg-rose-600 hover:bg-rose-700 text-white ring-2 ring-rose-300'
                                : 'bg-rose-50 hover:bg-rose-100 text-rose-700 border border-rose-200'
                            }`}
                            title={isRejected ? 'Rad etilgan to‘garakni butunlay o‘chirish' : 'To‘garakni tizimdan o‘chirish'}
                          >
                            <Trash2 className="w-3.5 h-3.5" />
                            <span>{isRejected ? 'Rad etilganini o‘chirish' : 'O‘chirish'}</span>
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

      {/* Review Modal */}
      <Modal
        isOpen={isModalOpen}
        onClose={() => setIsModalOpen(false)}
        title={t.modal.reviewStatute}
        footer={
          <div className="w-full flex flex-col sm:flex-row items-stretch sm:items-center justify-between gap-2.5">
            {/* If status is rejected: Big Direct Delete Button */}
            {reviewStatus === 'rejected' ? (
              <button
                type="button"
                onClick={handleDirectRejectAndDelete}
                className="px-4 py-2.5 rounded-xl bg-rose-600 hover:bg-rose-700 text-white text-xs sm:text-sm font-extrabold transition-all shadow-md flex items-center justify-center gap-2 cursor-pointer active:scale-98"
                title="To‘garakni darhol rad etib, tizimdan butunlay o‘chirib tashlash"
              >
                <Trash2 className="w-4 h-4" />
                <span>Rad etish va to‘garakni butunlay o‘chirib tashlash</span>
              </button>
            ) : (
              <div />
            )}

            <div className="flex items-center justify-end gap-2">
              <button
                type="button"
                onClick={() => setIsModalOpen(false)}
                className="px-4 py-2 rounded-xl border border-slate-200 text-slate-700 text-xs font-bold hover:bg-slate-50 transition-colors cursor-pointer"
              >
                {t.common.cancel}
              </button>

              {/* Standard status change button */}
              <button
                type="button"
                onClick={handleSaveReview}
                className={`px-4 py-2 rounded-xl text-white text-xs font-bold transition-all shadow-md cursor-pointer ${
                  reviewStatus === 'approved'
                    ? 'bg-emerald-600 hover:bg-emerald-700'
                    : 'bg-slate-700 hover:bg-slate-800'
                }`}
              >
                {reviewStatus === 'approved' ? t.common.approve : 'Faqat rad etish (o‘chirmay saqlash)'}
              </button>
            </div>
          </div>
        }
      >
        <div className="space-y-4">
          <div>
            <span className="text-xs font-bold text-slate-500 uppercase">{t.common.club}:</span>
            <p className="text-sm font-bold text-slate-900 mt-0.5">{selectedClub?.name}</p>
          </div>

          <div>
            <label className="block text-xs font-bold text-slate-700 mb-1">
              {t.common.status}:
            </label>
            <div className="flex gap-2">
              <button
                type="button"
                onClick={() => setReviewStatus('approved')}
                className={`flex-1 py-2.5 rounded-xl border text-xs font-bold transition-all cursor-pointer ${
                  reviewStatus === 'approved'
                    ? 'bg-emerald-50 border-emerald-500 text-emerald-800 font-extrabold shadow-2xs'
                    : 'border-slate-200 text-slate-600 hover:bg-slate-50'
                }`}
              >
                ✓ {t.common.approve}
              </button>
              <button
                type="button"
                onClick={() => setReviewStatus('rejected')}
                className={`flex-1 py-2.5 rounded-xl border text-xs font-bold transition-all cursor-pointer ${
                  reviewStatus === 'rejected'
                    ? 'bg-rose-50 border-rose-500 text-rose-800 font-extrabold shadow-2xs'
                    : 'border-slate-200 text-slate-600 hover:bg-slate-50'
                }`}
              >
                ✕ {t.common.reject}
              </button>
            </div>
          </div>

          {reviewStatus === 'rejected' && (
            <div className="p-3.5 rounded-xl bg-rose-50 border border-rose-300 text-rose-900 text-xs space-y-1.5">
              <p className="font-extrabold flex items-center gap-1.5 text-rose-700 text-sm">
                <AlertTriangle className="w-4 h-4 text-rose-600" />
                <span>To‘garakni tizimdan butunlay o‘chirish imkoniyati:</span>
              </p>
              <p className="text-rose-800 text-xs leading-relaxed">
                Pastdagi qizil <b>«Rad etish va to‘garakni butunlay o‘chirib tashlash»</b> tugmasini bossangiz, to‘garak barcha foydalanuvchilar (rahbar, talabalar) panelidan va serverdan darhol o‘chirib tashlanadi.
              </p>
            </div>
          )}

          <div>
            <label className="block text-xs font-bold text-slate-700 mb-1">
              {t.common.comment} (Sabab yoki izoh):
            </label>
            <textarea
              rows={3}
              value={reviewComment}
              onChange={(e) => setReviewComment(e.target.value)}
              placeholder="Nizom talablarga mos kelmaydi..."
              className="w-full px-3.5 py-2.5 rounded-xl border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600 transition-colors"
            />
          </div>
        </div>
      </Modal>

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
              className="px-5 py-2 rounded-xl bg-rose-600 hover:bg-rose-700 text-white text-xs font-bold transition-all shadow-md flex items-center gap-1.5 cursor-pointer"
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
                «<b>{clubToDelete?.name}</b>» to‘garagi, uning dars jadvali va barcha tegishli yozuvlari butunlay o‘chiriladi.
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
              placeholder="Masalan: Nizom talablarga javob bermaydi va to‘garak faoliyati bekor qilindi..."
              className="w-full px-3.5 py-2 rounded-xl border border-slate-200 text-xs sm:text-sm focus:outline-none focus:ring-2 focus:ring-rose-500/20 focus:border-rose-500 transition-colors"
            />
          </div>
        </div>
      </Modal>
    </div>
  );
};
