import React, { useState } from 'react';
import { Image as ImageIcon, Camera, Calendar, User, CheckCircle2, Trash2, X, ZoomIn, Info } from 'lucide-react';
import { I18N, Language } from '../../lib/i18n';
import { storage } from '../../lib/storage';
import { User as UserType, Submission } from '../../types';
import { Modal } from '../../components/common/Modal';

export const LeaderSubmissionsView: React.FC<{
  user: UserType;
  lang: Language;
  showToast?: (msg: string, type?: 'ok' | 'err') => void;
  onRefresh?: () => void;
}> = ({ user, lang, showToast, onRefresh }) => {
  const t = I18N[lang];
  const [submissions, setSubmissions] = useState<Submission[]>(
    storage.getSubmissions({ leaderId: user.id })
  );
  const [selectedPhoto, setSelectedPhoto] = useState<{
    url: string;
    title: string;
    studentName: string;
    date: string;
    note?: string;
  } | null>(null);

  const refreshList = () => {
    setSubmissions(storage.getSubmissions({ leaderId: user.id }));
    if (onRefresh) onRefresh();
  };

  const handleDeleteSubmission = (id: string, title: string) => {
    if (window.confirm(`«${title}» fotodalilini o‘chirishni tasdiqlaysizmi?`)) {
      try {
        storage.deleteSubmission(id);
        if (showToast) showToast('Fotodalil muvaffaqiyatli o‘chirildi', 'ok');
        refreshList();
      } catch {
        if (showToast) showToast('O‘chirishda xatolik yuz berdi', 'err');
      }
    }
  };

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
        <div>
          <h1 className="text-xl sm:text-2xl font-black text-slate-900 leading-tight flex items-center gap-2">
            <Camera className="w-6 h-6 text-blue-600" />
            <span>{t.nav.submissions}</span>
          </h1>
          <p className="text-sm text-slate-500 mt-1">
            Talabalarning to‘garakdagi ishtirok fotodalillari (Tasdiqlash talab etilmaydi, to‘g‘ridan-to‘g‘ri qabul qilinadi)
          </p>
        </div>

        <div className="px-3.5 py-1.5 rounded-xl bg-blue-50 border border-blue-200 text-blue-900 text-xs font-bold">
          Jami fotodalillar: <span className="font-extrabold text-blue-700">{submissions.length} ta</span>
        </div>
      </div>

      {/* Info Banner */}
      <div className="p-4 rounded-2xl bg-emerald-50 border border-emerald-200 text-emerald-950 flex items-start gap-3 shadow-xs">
        <div className="w-8 h-8 rounded-xl bg-emerald-600 text-white flex items-center justify-center shrink-0 shadow-xs mt-0.5">
          <CheckCircle2 className="w-4 h-4" />
        </div>
        <div className="text-xs space-y-1">
          <p className="font-extrabold text-emerald-900 text-sm">
            To‘garak a’zolari yuklagan qatnashganlik fotodalillari
          </p>
          <p className="text-emerald-800 leading-relaxed">
            Talabalar (masalan, Husnida va boshqa a’zolar) to‘garagingiz mashg‘ulotida qatnashganligi bo‘yicha yuklagan barcha fotosuratlar quyida to‘g‘ridan-to‘g‘ri aks etadi. <b>Hech qanday qo‘shimcha tasdiqlov talab etilmaydi</b> — ular tizimda avtomatik hisobga olinadi.
          </p>
        </div>
      </div>

      {/* Submissions Grid */}
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-5">
        {submissions.length === 0 ? (
          <div className="col-span-full py-12 px-4 text-center bg-white rounded-2xl border border-slate-200 text-slate-400 space-y-3">
            <div className="w-14 h-14 rounded-2xl bg-slate-100 text-slate-400 flex items-center justify-center mx-auto">
              <Camera className="w-7 h-7" />
            </div>
            <div>
              <p className="text-sm font-bold text-slate-700">Hozircha a’zolar tomonidan yuklangan fotodalillar yo‘q</p>
              <p className="text-xs text-slate-400 mt-1 max-w-md mx-auto">
                Talabalar to‘garak mashg‘ulotlarida qatnashib foto dalil yuklashlari bilanoq, ular ushbu sahifada to‘liq namoyon bo‘ladi.
              </p>
            </div>
          </div>
        ) : (
          submissions.map((sub) => (
            <div
              key={sub.id}
              className="bg-white rounded-2xl border border-slate-200 overflow-hidden shadow-xs hover:shadow-md transition-all flex flex-col justify-between"
            >
              <div>
                {/* Photo Preview with Zoom action */}
                <div className="relative aspect-4/3 bg-slate-100 overflow-hidden group">
                  {sub.photoFile ? (
                    <>
                      <img
                        src={sub.photoFile.url}
                        alt={sub.title}
                        className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300 cursor-pointer"
                        onClick={() =>
                          setSelectedPhoto({
                            url: sub.photoFile!.url,
                            title: sub.title,
                            studentName: sub.studentName || 'Talaba',
                            date: sub.createdAt.slice(0, 10),
                            note: sub.note,
                          })
                        }
                      />
                      <button
                        type="button"
                        onClick={() =>
                          setSelectedPhoto({
                            url: sub.photoFile!.url,
                            title: sub.title,
                            studentName: sub.studentName || 'Talaba',
                            date: sub.createdAt.slice(0, 10),
                            note: sub.note,
                          })
                        }
                        className="absolute inset-0 bg-black/30 opacity-0 group-hover:opacity-100 transition-opacity flex items-center justify-center text-white text-xs font-bold gap-1.5 cursor-pointer"
                      >
                        <ZoomIn className="w-4 h-4" />
                        <span>Kattalashtirish</span>
                      </button>
                    </>
                  ) : (
                    <div className="w-full h-full flex items-center justify-center text-slate-400">
                      <ImageIcon className="w-8 h-8 opacity-40" />
                    </div>
                  )}

                  {/* Status Badge (Directly Accepted) */}
                  <div className="absolute top-2.5 right-2.5">
                    <span className="inline-flex items-center gap-1 px-2.5 py-1 rounded-full text-[11px] font-extrabold bg-emerald-600/90 text-white shadow-xs backdrop-blur-xs">
                      <CheckCircle2 className="w-3 h-3" />
                      <span>Qabul qilingan</span>
                    </span>
                  </div>
                </div>

                {/* Content */}
                <div className="p-4 space-y-2.5">
                  <div className="flex items-center justify-between gap-2">
                    <span className="px-2 py-0.5 rounded-md bg-blue-50 text-blue-700 text-xs font-extrabold truncate">
                      {sub.clubName || 'To‘garak'}
                    </span>
                    <span className="text-[11px] text-slate-400 font-medium">
                      {sub.createdAt.slice(0, 10)}
                    </span>
                  </div>

                  <h3 className="text-sm font-black text-slate-900 leading-snug line-clamp-2">
                    {sub.title}
                  </h3>

                  {sub.note && (
                    <p className="text-xs text-slate-600 italic line-clamp-2 bg-slate-50 p-2 rounded-lg border border-slate-100">
                      "{sub.note}"
                    </p>
                  )}
                </div>
              </div>

              {/* Footer info: Student Info & Delete */}
              <div className="p-3.5 bg-slate-50/80 border-t border-slate-100 flex items-center justify-between gap-2">
                <div className="flex items-center gap-2 min-w-0">
                  <div className="w-7 h-7 rounded-full bg-blue-100 text-blue-700 flex items-center justify-center shrink-0 font-black text-xs">
                    {(sub.studentName || 'T')[0]}
                  </div>
                  <div className="min-w-0">
                    <p className="text-xs font-extrabold text-slate-900 truncate">
                      {sub.studentName}
                    </p>
                    {sub.studentGroup && (
                      <p className="text-[11px] text-slate-500 truncate">
                        {sub.studentGroup}
                      </p>
                    )}
                  </div>
                </div>

                <button
                  type="button"
                  onClick={() => handleDeleteSubmission(sub.id, sub.title)}
                  className="p-1.5 rounded-lg text-slate-400 hover:text-rose-600 hover:bg-rose-50 transition-colors cursor-pointer"
                  title="Fotodalilni o‘chirish"
                >
                  <Trash2 className="w-3.5 h-3.5" />
                </button>
              </div>
            </div>
          ))
        )}
      </div>

      {/* Enlarged Photo Modal */}
      {selectedPhoto && (
        <Modal
          isOpen={!!selectedPhoto}
          onClose={() => setSelectedPhoto(null)}
          title={`Fotodalil: ${selectedPhoto.studentName}`}
          footer={
            <button
              type="button"
              onClick={() => setSelectedPhoto(null)}
              className="px-4 py-2 rounded-xl bg-slate-900 hover:bg-slate-800 text-white text-xs font-bold transition-all cursor-pointer"
            >
              Yopish
            </button>
          }
        >
          <div className="space-y-3">
            <div className="max-h-[65vh] overflow-hidden rounded-xl bg-black/5 flex items-center justify-center">
              <img
                src={selectedPhoto.url}
                alt={selectedPhoto.title}
                className="max-h-[60vh] w-auto max-w-full object-contain rounded-lg shadow-xs"
              />
            </div>

            <div className="space-y-1 text-xs">
              <div className="flex items-center justify-between text-slate-500">
                <span className="font-extrabold text-slate-900 text-sm">
                  {selectedPhoto.title}
                </span>
                <span>{selectedPhoto.date}</span>
              </div>
              <p className="text-slate-600">
                Yuklagan talaba: <b>{selectedPhoto.studentName}</b>
              </p>
              {selectedPhoto.note && (
                <p className="text-slate-700 italic bg-slate-50 p-2.5 rounded-xl border border-slate-200 mt-2">
                  Izoh: "{selectedPhoto.note}"
                </p>
              )}
            </div>
          </div>
        </Modal>
      )}
    </div>
  );
};
