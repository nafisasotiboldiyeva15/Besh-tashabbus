import React from 'react';
import { Image as ImageIcon, Calendar } from 'lucide-react';
import { I18N, Language } from '../../lib/i18n';
import { storage } from '../../lib/storage';

export const AdminSubmissionsView: React.FC<{ lang: Language }> = ({ lang }) => {
  const t = I18N[lang];
  const submissions = storage.getSubmissions();

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-xl sm:text-2xl font-black text-slate-900 leading-tight">
          {t.admin.allSubs}
        </h1>
        <p className="text-sm text-slate-500 mt-1">
          {t.student.workPhoto} va ma'lumotlar
        </p>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
        {submissions.length === 0 ? (
          <div className="col-span-full p-8 text-center bg-white rounded-2xl border border-slate-200 text-slate-400">
            {t.common.empty}
          </div>
        ) : (
          submissions.map((sub) => (
            <div
              key={sub.id}
              className="bg-white rounded-2xl border border-slate-200 p-4 shadow-xs flex flex-col justify-between"
            >
              <div>
                {/* Photo Proof */}
                {sub.photoFile ? (
                  <a
                    href={sub.photoFile.url}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="block aspect-4/3 rounded-xl overflow-hidden mb-3 border border-slate-100 bg-slate-50 group"
                  >
                    <img
                      src={sub.photoFile.url}
                      alt={sub.title}
                      className="w-full h-full object-cover group-hover:scale-103 transition-transform"
                    />
                  </a>
                ) : (
                  <div className="aspect-4/3 rounded-xl bg-slate-100 flex items-center justify-center text-slate-400 mb-3">
                    <ImageIcon className="w-8 h-8 opacity-40" />
                  </div>
                )}

                <h3 className="text-sm font-bold text-slate-900 leading-tight mb-1">
                  {sub.title}
                </h3>
                <span className="inline-block px-2 py-0.5 rounded-md bg-blue-50 text-blue-700 text-xs font-semibold mb-2">
                  {sub.clubName}
                </span>

                {sub.note && (
                  <p className="text-xs text-slate-600 line-clamp-2 italic mb-2">
                    "{sub.note}"
                  </p>
                )}
              </div>

              <div className="pt-3 border-t border-slate-100 flex items-center justify-between text-xs text-slate-500">
                <div>
                  <span className="font-bold text-slate-800">{sub.studentName}</span>
                  {sub.studentGroup && (
                    <span className="text-slate-400 ml-1">({sub.studentGroup})</span>
                  )}
                </div>
                <span>{sub.createdAt.slice(0, 10)}</span>
              </div>
            </div>
          ))
        )}
      </div>
    </div>
  );
};
