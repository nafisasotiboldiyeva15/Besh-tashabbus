import React, { useState, useEffect } from 'react';
import { FileCheck, FileText, MessageSquare, CheckCircle2, Clock, AlertTriangle, ArrowRight } from 'lucide-react';
import { I18N, Language } from '../../lib/i18n';
import { storage } from '../../lib/storage';
import { StatusBadge } from '../../components/common/Badge';
import { User, Membership } from '../../types';

export const StudentApplicationsView: React.FC<{
  user: User;
  lang: Language;
  onSelectView?: (view: string) => void;
}> = ({ user, lang, onSelectView }) => {
  const t = I18N[lang];
  const [memberships, setMemberships] = useState<Membership[]>(
    storage.getMemberships({ studentId: user.id })
  );

  useEffect(() => {
    setMemberships(storage.getMemberships({ studentId: user.id }));
    const unsub = storage.subscribe(() => {
      setMemberships(storage.getMemberships({ studentId: user.id }));
    });
    return unsub;
  }, [user.id]);

  const approvedCount = memberships.filter((m) => m.status === 'approved').length;
  const pendingCount = memberships.filter((m) => m.status === 'pending').length;

  return (
    <div className="space-y-6">
      <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
        <div>
          <h1 className="text-xl sm:text-2xl font-black text-slate-900 leading-tight">
            {t.student.myApps}
          </h1>
          <p className="text-sm text-slate-500 mt-1">
            To‘garaklarga yuborilgan arizalaringiz va ularning holati
          </p>
        </div>

        <div className="flex items-center gap-2">
          {approvedCount > 0 && (
            <div className="px-3.5 py-1.5 rounded-xl bg-emerald-50 border border-emerald-200 text-emerald-900 text-xs font-bold flex items-center gap-1.5">
              <CheckCircle2 className="w-3.5 h-3.5 text-emerald-600" />
              <span>Tasdiqlangan: <b>{approvedCount} ta</b></span>
            </div>
          )}
          {pendingCount > 0 && (
            <div className="px-3.5 py-1.5 rounded-xl bg-amber-50 border border-amber-200 text-amber-900 text-xs font-bold flex items-center gap-1.5">
              <Clock className="w-3.5 h-3.5 text-amber-600" />
              <span>Ko‘rib chiqilmoqda: <b>{pendingCount} ta</b></span>
            </div>
          )}
        </div>
      </div>

      {/* Success Notification Alert if has approved membership */}
      {approvedCount > 0 && (
        <div className="p-4 rounded-2xl bg-gradient-to-r from-emerald-50 to-teal-50 border border-emerald-200 text-emerald-950 flex flex-col sm:flex-row items-start sm:items-center justify-between gap-3 shadow-xs">
          <div className="flex items-start gap-3">
            <div className="w-9 h-9 rounded-xl bg-emerald-500 text-white flex items-center justify-center shrink-0 shadow-xs">
              <CheckCircle2 className="w-5 h-5" />
            </div>
            <div>
              <p className="text-sm font-extrabold text-emerald-900">
                A’zoligingiz rasman tasdiqlandi!
              </p>
              <p className="text-xs text-emerald-700 mt-0.5">
                Siz to‘garakning to‘laqonli a’zosi bo‘ldingiz. Mashg‘ulotlarda faol qatnashib, qatnashganlik fotodalillarini yuklab borishingiz mumkin.
              </p>
            </div>
          </div>
          {onSelectView && (
            <button
              type="button"
              onClick={() => onSelectView('myWork')}
              className="px-4 py-2 rounded-xl bg-emerald-600 hover:bg-emerald-700 text-white text-xs font-bold transition-all shadow-xs cursor-pointer flex items-center gap-1.5 shrink-0"
            >
              <span>Fotodalil yuklash</span>
              <ArrowRight className="w-3.5 h-3.5" />
            </button>
          )}
        </div>
      )}

      <div className="bg-white rounded-2xl border border-slate-200 overflow-hidden shadow-xs">
        <div className="overflow-x-auto">
          <table className="w-full text-left text-sm">
            <thead className="bg-slate-50/70 text-xs font-bold text-slate-500 uppercase border-b border-slate-100">
              <tr>
                <th className="px-5 py-3.5">{t.common.club}</th>
                <th className="px-5 py-3.5">{t.common.comment}</th>
                <th className="px-5 py-3.5">{t.common.file}</th>
                <th className="px-5 py-3.5">{t.common.status}</th>
                <th className="px-5 py-3.5 text-right">{t.common.date}</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-100">
              {memberships.length === 0 ? (
                <tr>
                  <td colSpan={5} className="px-5 py-12 text-center text-slate-400">
                    <Clock className="w-10 h-10 mx-auto text-slate-300 mb-2" />
                    <p className="text-sm font-bold text-slate-700">Hozircha arizalar mavjud emas</p>
                    <p className="text-xs text-slate-400 mt-1">
                      «To‘garaklar» bo‘limiga o‘tib, o‘zingiz qiziqqan to‘garakka a’zo bo‘lish uchun ariza topshirishingiz mumkin.
                    </p>
                  </td>
                </tr>
              ) : (
                memberships.map((m) => (
                  <tr key={m.id} className="hover:bg-slate-50/50 transition-colors">
                    <td className="px-5 py-3.5">
                      <div className="font-bold text-slate-900">{m.clubName}</div>
                      {m.status === 'approved' && (
                        <span className="inline-flex items-center gap-1 text-[11px] font-bold text-emerald-700 bg-emerald-50 px-2 py-0.5 rounded-md mt-1 border border-emerald-200">
                          <CheckCircle2 className="w-3 h-3" />
                          <span>Faol a’zo</span>
                        </span>
                      )}
                    </td>
                    <td className="px-5 py-3.5">
                      <div className="text-slate-700">{m.note || '—'}</div>
                      {m.adminComment && (
                        <div className="text-xs text-blue-700 font-semibold mt-1 flex items-start gap-1 bg-blue-50/60 p-2 rounded-lg border border-blue-100">
                          <MessageSquare className="w-3.5 h-3.5 shrink-0 mt-0.5 text-blue-600" />
                          <span>Admin/Rahbar izohi: {m.adminComment}</span>
                        </div>
                      )}
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
                    </td>
                    <td className="px-5 py-3.5 text-right text-xs text-slate-400 whitespace-nowrap">
                      {m.createdAt.slice(0, 10)}
                    </td>
                  </tr>
                ))
              )}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
};
