import React, { useState } from 'react';
import { Paperclip, Plus, FileText, ExternalLink, Calendar } from 'lucide-react';
import { I18N, Language } from '../../lib/i18n';
import { storage } from '../../lib/storage';
import { Modal } from '../../components/common/Modal';
import { Report, User, Club, Session } from '../../types';

export const LeaderReportsView: React.FC<{
  user: User;
  lang: Language;
  showToast: (msg: string, type?: 'ok' | 'err') => void;
  onRefresh: () => void;
}> = ({ user, lang, showToast, onRefresh }) => {
  const t = I18N[lang];
  const clubs = storage.getClubs(user.id);
  const sessions = storage.getSessions(undefined, user.id);
  const [reports, setReports] = useState<Report[]>(storage.getReports({ leaderId: user.id }));

  const [isModalOpen, setIsModalOpen] = useState(false);
  const [selectedClubFilter, setSelectedClubFilter] = useState<string>('all');
  const [reportClubId, setReportClubId] = useState(clubs[0]?.id || '');
  const [reportSessionId, setReportSessionId] = useState<string>('');
  const [reportTitle, setReportTitle] = useState('');
  const [reportSocialLink, setReportSocialLink] = useState('');
  const [reportNote, setReportNote] = useState('');
  const [reportPdfFile, setReportPdfFile] = useState<{ name: string; mime: string; data: string } | null>(null);

  const refreshList = () => {
    setReports(storage.getReports({ leaderId: user.id }));
    onRefresh();
  };

  const handleFileChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (!file) return;

    if (file.size > 8 * 1024 * 1024) {
      showToast('Fayl hajmi 8 MB dan oshmasligi kerak', 'err');
      return;
    }

    const reader = new FileReader();
    reader.onload = () => {
      setReportPdfFile({
        name: file.name,
        mime: file.type || 'application/pdf',
        data: reader.result as string,
      });
    };
    reader.readAsDataURL(file);
  };

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    if (!reportTitle.trim()) {
      showToast(t.common.required, 'err');
      return;
    }

    try {
      storage.createReport({
        clubId: reportClubId,
        sessionId: reportSessionId || null,
        leaderId: user.id,
        title: reportTitle,
        socialLink: reportSocialLink,
        note: reportNote,
        pdfFile: reportPdfFile || undefined,
      });

      showToast(t.common.saved, 'ok');
      setIsModalOpen(false);
      setReportTitle('');
      setReportSocialLink('');
      setReportNote('');
      setReportPdfFile(null);
      refreshList();
    } catch {
      showToast('Xatolik', 'err');
    }
  };

  return (
    <div className="space-y-6">
      <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
        <div>
          <h1 className="text-xl sm:text-2xl font-black text-slate-900 leading-tight">
            {t.nav.reports}
          </h1>
          <p className="text-sm text-slate-500 mt-1">
            {t.leader.pdfInfo} va {t.admin.socialLink}
          </p>
        </div>

        <button
          type="button"
          onClick={() => {
            if (clubs.length === 0) {
              showToast(t.leader.noClub, 'err');
              return;
            }
            if (selectedClubFilter !== 'all') {
              setReportClubId(selectedClubFilter);
            }
            setIsModalOpen(true);
          }}
          className="px-4 py-2.5 rounded-xl bg-blue-600 hover:bg-blue-700 active:scale-98 text-white text-xs sm:text-sm font-bold transition-all flex items-center gap-2 shadow-md shadow-blue-600/20 cursor-pointer self-start sm:self-auto"
        >
          <Plus className="w-4 h-4" />
          <span>{t.leader.newReport}</span>
        </button>
      </div>

      {/* Club Selector Tabs for Leader */}
      {clubs.length > 1 && (
        <div className="flex items-center gap-2 overflow-x-auto pb-1">
          <button
            type="button"
            onClick={() => setSelectedClubFilter('all')}
            className={`px-3.5 py-1.5 rounded-xl text-xs font-bold whitespace-nowrap transition-all cursor-pointer ${
              selectedClubFilter === 'all'
                ? 'bg-blue-600 text-white shadow-xs'
                : 'bg-white text-slate-700 hover:bg-slate-100 border border-slate-200'
            }`}
          >
            Barcha to‘garaklarim ({reports.length})
          </button>
          {clubs.map((c) => {
            const count = reports.filter((r) => r.clubId === c.id).length;
            const isSelected = selectedClubFilter === c.id;
            return (
              <button
                key={c.id}
                type="button"
                onClick={() => setSelectedClubFilter(c.id)}
                className={`inline-flex items-center gap-1.5 px-3 py-1.5 rounded-xl text-xs font-bold whitespace-nowrap transition-all cursor-pointer ${
                  isSelected
                    ? 'bg-blue-600 text-white shadow-xs'
                    : 'bg-white text-slate-700 hover:bg-slate-100 border border-slate-200'
                }`}
              >
                <span>{c.name}</span>
                <span
                  className={`text-[10px] px-1.5 py-0.2 rounded-full font-black ${
                    isSelected ? 'bg-white text-blue-700' : 'bg-slate-100 text-slate-600'
                  }`}
                >
                  {count}
                </span>
              </button>
            );
          })}
        </div>
      )}

      <div className="bg-white rounded-2xl border border-slate-200 overflow-hidden shadow-xs">
        <div className="overflow-x-auto">
          <table className="w-full text-left text-sm">
            <thead className="bg-slate-50/70 text-xs font-bold text-slate-500 uppercase border-b border-slate-100">
              <tr>
                <th className="px-5 py-3.5">{t.common.club}</th>
                <th className="px-5 py-3.5">{t.common.name}</th>
                <th className="px-5 py-3.5">{t.common.file}</th>
                <th className="px-5 py-3.5">{t.admin.socialLink}</th>
                <th className="px-5 py-3.5 text-right">{t.common.date}</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-100">
              {(() => {
                const list =
                  selectedClubFilter === 'all'
                    ? reports
                    : reports.filter((r) => r.clubId === selectedClubFilter);
                if (list.length === 0) {
                  return (
                    <tr>
                      <td colSpan={5} className="px-5 py-8 text-center text-slate-400">
                        {t.common.empty}
                      </td>
                    </tr>
                  );
                }
                return list.map((r) => (
                  <tr key={r.id} className="hover:bg-slate-50/50 transition-colors">
                    <td className="px-5 py-3.5 font-bold text-slate-900">
                      {r.clubName}
                      {r.sessionTopic && (
                        <div className="text-xs text-slate-400 font-normal mt-0.5">
                          {r.sessionTopic}
                        </div>
                      )}
                    </td>
                    <td className="px-5 py-3.5">
                      <div className="font-semibold text-slate-800">{r.title}</div>
                      {r.note && (
                        <div className="text-xs text-slate-500 mt-0.5">{r.note}</div>
                      )}
                    </td>
                    <td className="px-5 py-3.5">
                      {r.pdfFile ? (
                        <a
                          href={r.pdfFile.url}
                          target="_blank"
                          rel="noopener noreferrer"
                          download={r.pdfFile.name}
                          className="inline-flex items-center gap-1.5 px-2.5 py-1 rounded-lg text-xs font-bold text-blue-700 bg-blue-50 hover:bg-blue-100 border border-blue-200 transition-colors"
                        >
                          <FileText className="w-3.5 h-3.5" />
                          <span>PDF</span>
                        </a>
                      ) : (
                        <span className="text-xs text-slate-400">—</span>
                      )}
                    </td>
                    <td className="px-5 py-3.5">
                      {r.socialLink ? (
                        <a
                          href={r.socialLink}
                          target="_blank"
                          rel="noopener noreferrer"
                          className="inline-flex items-center gap-1 text-xs font-bold text-sky-600 hover:text-sky-800 underline truncate max-w-xs"
                        >
                          <span>{r.socialLink}</span>
                          <ExternalLink className="w-3.5 h-3.5 shrink-0" />
                        </a>
                      ) : (
                        <span className="text-xs text-slate-400">—</span>
                      )}
                    </td>
                    <td className="px-5 py-3.5 text-right text-xs text-slate-400 whitespace-nowrap">
                      {r.createdAt.slice(0, 10)}
                    </td>
                  </tr>
                ));
              })()}
            </tbody>
          </table>
        </div>
      </div>

      {/* Add Report Modal */}
      <Modal
        isOpen={isModalOpen}
        onClose={() => setIsModalOpen(false)}
        title={t.modal.reportTitle}
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
              onClick={handleSubmit}
              className="px-4 py-2 rounded-xl bg-blue-600 hover:bg-blue-700 text-white text-xs font-bold transition-all shadow-md cursor-pointer"
            >
              {t.common.save}
            </button>
          </>
        }
      >
        <form onSubmit={handleSubmit} className="space-y-3.5">
          <div>
            <label className="block text-xs font-bold text-slate-700 mb-1">
              {t.common.club}
            </label>
            <select
              value={reportClubId}
              onChange={(e) => setReportClubId(e.target.value)}
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
              {t.modal.forSession}
            </label>
            <select
              value={reportSessionId}
              onChange={(e) => setReportSessionId(e.target.value)}
              className="w-full px-3.5 py-2.5 rounded-xl border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600 transition-colors bg-white font-medium"
            >
              <option value="">Umumiy oylik hisobot (mashg'ulotga bog'lanmagan)</option>
              {sessions.map((s) => (
                <option key={s.id} value={s.id}>
                  {s.date} — {s.topic}
                </option>
              ))}
            </select>
          </div>

          <div>
            <label className="block text-xs font-bold text-slate-700 mb-1">
              {t.leader.reportTitle} *
            </label>
            <input
              type="text"
              required
              value={reportTitle}
              onChange={(e) => setReportTitle(e.target.value)}
              placeholder="Masalan: Institut doirasida debat turniri o‘tkazildi"
              className="w-full px-3.5 py-2.5 rounded-xl border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600 transition-colors"
            />
          </div>

          <div>
            <label className="block text-xs font-bold text-slate-700 mb-1">
              {t.admin.socialLink}
            </label>
            <input
              type="url"
              value={reportSocialLink}
              onChange={(e) => setReportSocialLink(e.target.value)}
              placeholder="https://t.me/institut_kanali/123 yoki Instagram/Facebook"
              className="w-full px-3.5 py-2.5 rounded-xl border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600 transition-colors"
            />
          </div>

          <div>
            <label className="block text-xs font-bold text-slate-700 mb-1">
              {t.common.comment}
            </label>
            <textarea
              rows={2}
              value={reportNote}
              onChange={(e) => setReportNote(e.target.value)}
              placeholder="Qisqacha axborot..."
              className="w-full px-3.5 py-2.5 rounded-xl border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600 transition-colors"
            />
          </div>

          <div>
            <label className="block text-xs font-bold text-slate-700 mb-1">
              {t.leader.pdfInfo} (PDF)
            </label>
            <input
              type="file"
              accept=".pdf,application/pdf,image/*"
              onChange={handleFileChange}
              className="w-full text-xs text-slate-500 file:mr-3 file:py-2 file:px-3 file:rounded-xl file:border-0 file:text-xs file:font-bold file:bg-blue-50 file:text-blue-700 hover:file:bg-blue-100 cursor-pointer"
            />
            {reportPdfFile && (
              <span className="text-xs text-emerald-600 font-bold block mt-1">
                ✓ {reportPdfFile.name} tanlandi
              </span>
            )}
          </div>
        </form>
      </Modal>
    </div>
  );
};
