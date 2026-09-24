import React, { useState, useEffect } from 'react';
import { FileCheck, FileText, Filter, MessageSquare, Check, X, ShieldCheck } from 'lucide-react';
import { I18N, Language } from '../../lib/i18n';
import { storage } from '../../lib/storage';
import { StatusBadge } from '../../components/common/Badge';
import { Modal } from '../../components/common/Modal';
import { Membership } from '../../types';

export const AdminMembershipsView: React.FC<{
  lang: Language;
  showToast?: (msg: string, type?: 'ok' | 'err') => void;
  onRefresh?: () => void;
}> = ({ lang, showToast, onRefresh }) => {
  const t = I18N[lang];
  const [selectedClubId, setSelectedClubId] = useState<string>('');
  const [statusFilter, setStatusFilter] = useState<'all' | 'pending' | 'approved' | 'rejected'>('all');
  const [memberships, setMemberships] = useState<Membership[]>(
    storage.getMemberships({ clubId: selectedClubId || undefined })
  );
  const clubs = storage.getClubs();

  // Review modal state
  const [selectedMembership, setSelectedMembership] = useState<Membership | null>(null);
  const [reviewStatus, setReviewStatus] = useState<'approved' | 'rejected'>('approved');
  const [reviewComment, setReviewComment] = useState('');
  const [isModalOpen, setIsModalOpen] = useState(false);

  const refreshList = () => {
    setMemberships(storage.getMemberships({ clubId: selectedClubId || undefined }));
    if (onRefresh) onRefresh();
  };

  useEffect(() => {
    refreshList();
    const unsub = storage.subscribe(() => {
      refreshList();
    });
    return unsub;
  }, [selectedClubId]);

  const handleOpenReview = (m: Membership, status: 'approved' | 'rejected') => {
    setSelectedMembership(m);
    setReviewStatus(status);
    setReviewComment(m.adminComment || '');
    setIsModalOpen(true);
  };

  const handleSaveReview = () => {
    if (!selectedMembership) return;
    try {
      storage.reviewMembership(
        selectedMembership.id,
        reviewStatus,
        reviewComment,
        'Hamidulla Abdualiyev (Bosh admin)'
      );
      if (showToast) {
        showToast(
          reviewStatus === 'approved'
            ? 'Talaba a’zoligi tasdiqlandi va talabaga bildirishnoma yuborildi!'
            : 'Ariza rad etildi va talabaga xabar yuborildi',
          'ok'
        );
      }
      setIsModalOpen(false);
      refreshList();
    } catch (err: unknown) {
      const msg = err instanceof Error ? err.message : 'Xatolik';
      if (showToast) showToast(msg, 'err');
    }
  };

  const filteredMemberships = memberships.filter((m) => {
    if (statusFilter === 'all') return true;
    return m.status === statusFilter;
  });

  return (
    <div className="space-y-6">
      <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
        <div>
          <h1 className="text-xl sm:text-2xl font-black text-slate-900 leading-tight flex items-center gap-2">
            <ShieldCheck className="w-6 h-6 text-blue-600" />
            <span>{t.admin.membershipReview}</span>
          </h1>
          <p className="text-sm text-slate-500 mt-1">
            Talabalarning to‘garaklarga a’zo bo‘lish arizalarini ko‘rish, tasdiqlash yoki rad etish
          </p>
        </div>

        {/* Filter controls */}
        <div className="flex flex-wrap items-center gap-2">
          {/* Status filter tabs */}
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
              Barchasi ({memberships.length})
            </button>
            <button
              type="button"
              onClick={() => setStatusFilter('pending')}
              className={`px-3 py-1.5 rounded-lg transition-all ${
                statusFilter === 'pending'
                  ? 'bg-white text-amber-700 shadow-2xs font-extrabold'
                  : 'text-slate-600 hover:text-slate-900'
              }`}
            >
              Kutilmoqda ({memberships.filter((m) => m.status === 'pending').length})
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
              Tasdiqlangan ({memberships.filter((m) => m.status === 'approved').length})
            </button>
          </div>

          {/* Filter by club */}
          <div className="inline-flex items-center gap-2">
            <Filter className="w-4 h-4 text-slate-400" />
            <select
              value={selectedClubId}
              onChange={(e) => setSelectedClubId(e.target.value)}
              className="px-3 py-2 rounded-xl border border-slate-200 bg-white text-xs font-semibold text-slate-700 focus:outline-none focus:ring-2 focus:ring-blue-500/20"
            >
              <option value="">Barcha to‘garaklar ({clubs.length})</option>
              {clubs.map((c) => (
                <option key={c.id} value={c.id}>
                  {c.name}
                </option>
              ))}
            </select>
          </div>
        </div>
      </div>

      <div className="bg-white rounded-2xl border border-slate-200 overflow-hidden shadow-xs">
        <div className="overflow-x-auto">
          <table className="w-full text-left text-sm">
            <thead className="bg-slate-50/70 text-xs font-bold text-slate-500 uppercase border-b border-slate-100">
              <tr>
                <th className="px-5 py-3.5">{t.common.student}</th>
                <th className="px-5 py-3.5">{t.common.club}</th>
                <th className="px-5 py-3.5">{t.common.file}</th>
                <th className="px-5 py-3.5">{t.common.status}</th>
                <th className="px-5 py-3.5">{t.common.date}</th>
                <th className="px-5 py-3.5 text-right">{t.common.actions}</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-100">
              {filteredMemberships.length === 0 ? (
                <tr>
                  <td colSpan={6} className="px-5 py-8 text-center text-slate-400">
                    {t.common.empty}
                  </td>
                </tr>
              ) : (
                filteredMemberships.map((m) => (
                  <tr key={m.id} className="hover:bg-slate-50/50 transition-colors">
                    <td className="px-5 py-3.5">
                      <div className="font-bold text-slate-900">{m.studentName}</div>
                      <div className="text-xs text-slate-400 mt-0.5">
                        {[m.studentFaculty, m.studentGroup].filter(Boolean).join(' · ')}
                      </div>
                      {m.note && (
                        <div className="text-xs text-slate-600 mt-1 italic">
                          "{m.note}"
                        </div>
                      )}
                    </td>
                    <td className="px-5 py-3.5 font-semibold text-slate-800">
                      {m.clubName}
                    </td>
                    <td className="px-5 py-3.5">
                      {m.applicationFile ? (
                        <a
                          href={m.applicationFile.url}
                          target="_blank"
                          rel="noopener noreferrer"
                          download={m.applicationFile.name}
                          className="inline-flex items-center gap-1.5 px-2.5 py-1 rounded-lg text-xs font-bold text-blue-700 bg-blue-50 hover:bg-blue-100 border border-blue-200 transition-colors"
                        >
                          <FileText className="w-3.5 h-3.5" />
                          <span>Ariza (PDF)</span>
                        </a>
                      ) : (
                        <span className="text-xs text-slate-400">—</span>
                      )}
                    </td>
                    <td className="px-5 py-3.5">
                      <StatusBadge status={m.status} lang={lang} />
                      {m.adminComment && (
                        <div className="text-xs text-slate-500 mt-1 flex items-start gap-1">
                          <MessageSquare className="w-3 h-3 text-slate-400 shrink-0 mt-0.5" />
                          <span>{m.adminComment}</span>
                        </div>
                      )}
                    </td>
                    <td className="px-5 py-3.5 text-xs text-slate-400 whitespace-nowrap">
                      {m.createdAt.slice(0, 10)}
                    </td>
                    <td className="px-5 py-3.5 text-right whitespace-nowrap">
                      {m.status === 'pending' ? (
                        <div className="flex items-center justify-end gap-1.5">
                          <button
                            type="button"
                            onClick={() => handleOpenReview(m, 'approved')}
                            className="inline-flex items-center gap-1 px-3 py-1.5 rounded-lg text-xs font-bold bg-emerald-600 hover:bg-emerald-700 text-white transition-colors cursor-pointer shadow-xs"
                            title="Tasdiqlash"
                          >
                            <Check className="w-3.5 h-3.5" />
                            <span>{t.common.approve}</span>
                          </button>
                          <button
                            type="button"
                            onClick={() => handleOpenReview(m, 'rejected')}
                            className="inline-flex items-center gap-1 px-3 py-1.5 rounded-lg text-xs font-bold bg-rose-50 hover:bg-rose-100 text-rose-700 border border-rose-200 transition-colors cursor-pointer"
                            title="Rad etish"
                          >
                            <X className="w-3.5 h-3.5" />
                            <span>{t.common.reject}</span>
                          </button>
                        </div>
                      ) : (
                        <button
                          type="button"
                          onClick={() => handleOpenReview(m, m.status === 'approved' ? 'rejected' : 'approved')}
                          className="text-xs font-bold text-blue-600 hover:text-blue-800 hover:underline cursor-pointer"
                        >
                          Holatni o‘zgartirish
                        </button>
                      )}
                    </td>
                  </tr>
                ))
              )}
            </tbody>
          </table>
        </div>
      </div>

      {/* Review Modal */}
      <Modal
        isOpen={isModalOpen}
        onClose={() => setIsModalOpen(false)}
        title={reviewStatus === 'approved' ? 'Arizani tasdiqlash' : 'Arizani rad etish'}
        footer={
          <>
            <button
              type="button"
              onClick={() => setIsModalOpen(false)}
              className="px-4 py-2 rounded-xl border border-slate-200 text-slate-700 text-xs font-bold hover:bg-slate-50 transition-colors cursor-pointer"
            >
              {t.common.cancel}
            </button>
            <button
              type="button"
              onClick={handleSaveReview}
              className={`px-4 py-2 rounded-xl text-white text-xs font-bold transition-all shadow-md cursor-pointer ${
                reviewStatus === 'approved' ? 'bg-emerald-600 hover:bg-emerald-700' : 'bg-rose-600 hover:bg-rose-700'
              }`}
            >
              {t.common.save}
            </button>
          </>
        }
      >
        <div className="space-y-4">
          <div className="p-3 bg-slate-50 rounded-xl border border-slate-200 text-xs space-y-1">
            <p><span className="font-bold text-slate-500">Talaba:</span> <span className="font-extrabold text-slate-900">{selectedMembership?.studentName}</span></p>
            <p><span className="font-bold text-slate-500">To‘garak:</span> <span className="font-bold text-blue-700">{selectedMembership?.clubName}</span></p>
          </div>

          <div>
            <label className="block text-xs font-bold text-slate-700 mb-1">
              Holat
            </label>
            <div className="grid grid-cols-2 gap-2">
              <button
                type="button"
                onClick={() => setReviewStatus('approved')}
                className={`py-2 px-3 rounded-xl border text-xs font-bold flex items-center justify-center gap-1.5 transition-all cursor-pointer ${
                  reviewStatus === 'approved'
                    ? 'border-emerald-600 bg-emerald-50 text-emerald-700 shadow-2xs font-extrabold'
                    : 'border-slate-200 text-slate-600 hover:bg-slate-50'
                }`}
              >
                <Check className="w-4 h-4 text-emerald-600" />
                <span>{t.common.approved}</span>
              </button>
              <button
                type="button"
                onClick={() => setReviewStatus('rejected')}
                className={`py-2 px-3 rounded-xl border text-xs font-bold flex items-center justify-center gap-1.5 transition-all cursor-pointer ${
                  reviewStatus === 'rejected'
                    ? 'border-rose-600 bg-rose-50 text-rose-700 shadow-2xs font-extrabold'
                    : 'border-slate-200 text-slate-600 hover:bg-slate-50'
                }`}
              >
                <X className="w-4 h-4 text-rose-600" />
                <span>{t.common.rejected}</span>
              </button>
            </div>
          </div>

          <div>
            <label className="block text-xs font-bold text-slate-700 mb-1">
              Talabaga bildirishnoma / Izoh (Ixtiyoriy)
            </label>
            <textarea
              rows={3}
              value={reviewComment}
              onChange={(e) => setReviewComment(e.target.value)}
              placeholder="Talabaga ko‘rsatiladigan izoh yoki tabrik so‘zini kiriting..."
              className="w-full px-3.5 py-2.5 rounded-xl border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600 transition-colors"
            />
            <p className="text-[11px] text-slate-400 mt-1">
              Saqlangan zahoti talabaning xabarnomalar qo‘ng‘irog‘iga rasmiy xabar yetib boradi.
            </p>
          </div>
        </div>
      </Modal>
    </div>
  );
};
