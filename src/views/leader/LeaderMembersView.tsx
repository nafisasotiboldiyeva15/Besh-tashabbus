import React, { useState } from 'react';
import { FileCheck, FileText, Check, X, MessageSquare } from 'lucide-react';
import { I18N, Language } from '../../lib/i18n';
import { storage } from '../../lib/storage';
import { StatusBadge } from '../../components/common/Badge';
import { Modal } from '../../components/common/Modal';
import { Membership, User } from '../../types';

export const LeaderMembersView: React.FC<{
  user: User;
  lang: Language;
  showToast: (msg: string, type?: 'ok' | 'err') => void;
  onRefresh: () => void;
}> = ({ user, lang, showToast, onRefresh }) => {
  const t = I18N[lang];
  const [memberships, setMemberships] = useState<Membership[]>(
    storage.getMemberships({ leaderId: user.id })
  );
  const [selectedMembership, setSelectedMembership] = useState<Membership | null>(null);
  const [reviewStatus, setReviewStatus] = useState<'approved' | 'rejected'>('approved');
  const [reviewComment, setReviewComment] = useState('');
  const [isModalOpen, setIsModalOpen] = useState(false);

  const refreshList = () => {
    setMemberships(storage.getMemberships({ leaderId: user.id }));
    onRefresh();
  };

  const handleOpenReview = (m: Membership, status: 'approved' | 'rejected') => {
    setSelectedMembership(m);
    setReviewStatus(status);
    setReviewComment(m.adminComment || '');
    setIsModalOpen(true);
  };

  const handleSaveReview = () => {
    if (!selectedMembership) return;
    try {
      storage.reviewMembership(selectedMembership.id, reviewStatus, reviewComment);
      showToast(t.common.saved, 'ok');
      setIsModalOpen(false);
      refreshList();
    } catch (err: unknown) {
      const msg = err instanceof Error ? err.message : 'Xatolik';
      showToast(msg, 'err');
    }
  };

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-xl sm:text-2xl font-black text-slate-900 leading-tight">
          {t.leader.membersOf}
        </h1>
        <p className="text-sm text-slate-500 mt-1">
          {t.leader.membersSub}
        </p>
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
                <th className="px-5 py-3.5 text-right">{t.common.actions}</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-100">
              {memberships.length === 0 ? (
                <tr>
                  <td colSpan={5} className="px-5 py-8 text-center text-slate-400">
                    {t.common.empty}
                  </td>
                </tr>
              ) : (
                memberships.map((m) => (
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
                    <td className="px-5 py-3.5 font-bold text-slate-800">
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
                    <td className="px-5 py-3.5 text-right whitespace-nowrap">
                      <div className="inline-flex items-center gap-1.5">
                        {m.status !== 'approved' && (
                          <button
                            type="button"
                            onClick={() => handleOpenReview(m, 'approved')}
                            className="px-2.5 py-1.5 rounded-lg bg-emerald-600 hover:bg-emerald-700 text-white text-xs font-bold transition-all inline-flex items-center gap-1 shadow-2xs cursor-pointer"
                          >
                            <Check className="w-3.5 h-3.5" />
                            <span>{t.common.approve}</span>
                          </button>
                        )}
                        {m.status !== 'rejected' && (
                          <button
                            type="button"
                            onClick={() => handleOpenReview(m, 'rejected')}
                            className="px-2.5 py-1.5 rounded-lg bg-rose-600 hover:bg-rose-700 text-white text-xs font-bold transition-all inline-flex items-center gap-1 shadow-2xs cursor-pointer"
                          >
                            <X className="w-3.5 h-3.5" />
                            <span>{t.common.reject}</span>
                          </button>
                        )}
                      </div>
                    </td>
                  </tr>
                ))
              )}
            </tbody>
          </table>
        </div>
      </div>

      {/* Review Membership Modal */}
      <Modal
        isOpen={isModalOpen}
        onClose={() => setIsModalOpen(false)}
        title={t.modal.reviewApp}
        footer={
          <>
            <button
              type="button"
              onClick={() => setIsModalOpen(false)}
              className="px-4 py-2 rounded-xl border border-slate-200 text-slate-700 text-xs font-bold hover:bg-slate-50 transition-colors"
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
              {reviewStatus === 'approved' ? t.common.approve : t.common.reject}
            </button>
          </>
        }
      >
        <div className="space-y-4">
          <div>
            <span className="text-xs font-bold text-slate-500 uppercase">{t.common.student}:</span>
            <p className="text-sm font-bold text-slate-900 mt-0.5">{selectedMembership?.studentName}</p>
          </div>

          <div>
            <label className="block text-xs font-bold text-slate-700 mb-1">
              {t.common.status}:
            </label>
            <div className="flex gap-2">
              <button
                type="button"
                onClick={() => setReviewStatus('approved')}
                className={`flex-1 py-2 rounded-xl border text-xs font-bold transition-all ${
                  reviewStatus === 'approved'
                    ? 'bg-emerald-50 border-emerald-500 text-emerald-800'
                    : 'border-slate-200 text-slate-600 hover:bg-slate-50'
                }`}
              >
                {t.common.approve}
              </button>
              <button
                type="button"
                onClick={() => setReviewStatus('rejected')}
                className={`flex-1 py-2 rounded-xl border text-xs font-bold transition-all ${
                  reviewStatus === 'rejected'
                    ? 'bg-rose-50 border-rose-500 text-rose-800'
                    : 'border-slate-200 text-slate-600 hover:bg-slate-50'
                }`}
              >
                {t.common.reject}
              </button>
            </div>
          </div>

          <div>
            <label className="block text-xs font-bold text-slate-700 mb-1">
              {t.common.comment} (Talabaga javob izohi):
            </label>
            <textarea
              rows={3}
              value={reviewComment}
              onChange={(e) => setReviewComment(e.target.value)}
              placeholder="A'zolik bo‘yicha talabaga xabar yoki izoh..."
              className="w-full px-3.5 py-2.5 rounded-xl border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600 transition-colors"
            />
          </div>
        </div>
      </Modal>
    </div>
  );
};
