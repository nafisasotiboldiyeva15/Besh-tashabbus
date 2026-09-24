import React, { useState } from 'react';
import {
  Camera,
  Plus,
  CheckCircle2,
  AlertCircle,
  X,
  Trash2,
  Calendar,
  Layers,
  Sparkles,
  ArrowRight,
  Clock,
} from 'lucide-react';
import { I18N, Language, CATEGORIES } from '../../lib/i18n';
import { storage, fmtD, ymd } from '../../lib/storage';
import { Modal } from '../../components/common/Modal';
import { User, Submission } from '../../types';

export const StudentWorkView: React.FC<{
  user: User;
  lang: Language;
  showToast: (msg: string, type?: 'ok' | 'err') => void;
  onRefresh: () => void;
  onSelectView?: (view: string) => void;
}> = ({ user, lang, showToast, onRefresh, onSelectView }) => {
  const t = I18N[lang];

  // Clubs list: student's clubs or all active clubs (no approval required)
  const allClubs = storage.getClubs().filter((c) => c.statuteStatus !== 'rejected');
  const myApprovedMemberships = storage
    .getMemberships({ studentId: user.id })
    .filter((m) => m.status === 'approved');

  const [submissions, setSubmissions] = useState<Submission[]>(
    storage.getSubmissions({ studentId: user.id })
  );

  const [selectedClubFilter, setSelectedClubFilter] = useState<string>('all');
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [selectedClubId, setSelectedClubId] = useState(
    myApprovedMemberships[0]?.clubId || allClubs[0]?.id || ''
  );
  const [selectedSessionId, setSelectedSessionId] = useState<string>('');
  const [title, setTitle] = useState('');
  const [note, setNote] = useState('');
  const [sessionDate, setSessionDate] = useState(ymd(new Date()));
  const [photoFile, setPhotoFile] = useState<{ name: string; mime: string; data: string } | null>(null);
  const [photoModal, setPhotoModal] = useState<{ url: string; title: string; subtitle: string } | null>(null);
  const [isSubmitting, setIsSubmitting] = useState(false);

  // Sessions for the currently selected club in modal
  const activeModalClub = storage.getClubs().find((c) => c.id === selectedClubId);
  const clubSessions = selectedClubId ? storage.getSessions(selectedClubId) : [];

  const refreshList = () => {
    setSubmissions(storage.getSubmissions({ studentId: user.id }));
    onRefresh();
  };

  const handleOpenModal = (clubId?: string) => {
    const initialClubId =
      clubId ||
      (selectedClubFilter !== 'all' ? selectedClubFilter : '') ||
      myApprovedMemberships[0]?.clubId ||
      allClubs[0]?.id ||
      '';
    setSelectedClubId(initialClubId);
    setSelectedSessionId('');
    setTitle('');
    setNote('');
    setSessionDate(ymd(new Date()));
    setPhotoFile(null);
    setIsModalOpen(true);
  };

  const handlePhotoChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (!file) return;

    if (file.size > 10 * 1024 * 1024) {
      showToast('Surat hajmi 10 MB dan oshmasligi kerak', 'err');
      return;
    }

    const reader = new FileReader();
    reader.onload = () => {
      setPhotoFile({
        name: file.name,
        mime: file.type || 'image/jpeg',
        data: reader.result as string,
      });
    };
    reader.readAsDataURL(file);
  };

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    if (!selectedClubId) {
      showToast('To‘garakni tanlang', 'err');
      return;
    }
    if (!photoFile) {
      showToast('To‘garakda qatnashganligingizni tasdiqlovchi fotosuratni yuklang', 'err');
      return;
    }

    setIsSubmitting(true);
    try {
      const chosenSession = clubSessions.find((s) => s.id === selectedSessionId);
      const chosenClub = myApprovedMemberships.find((m) => m.clubId === selectedClubId);
      const defaultTitle = chosenSession
        ? `${chosenSession.date} — ${chosenSession.topic}`
        : `${sessionDate} kungi mashg‘ulotda ishtirok`;

      storage.createSubmission({
        clubId: selectedClubId,
        sessionId: selectedSessionId || null,
        studentId: user.id,
        title: title.trim() || defaultTitle,
        note: note.trim(),
        photoFile,
      });

      showToast('Fotodalil muvaffaqiyatli yuklandi!', 'ok');
      setIsModalOpen(false);
      setPhotoFile(null);
      setTitle('');
      setNote('');
      refreshList();
    } catch {
      showToast('Xatolik yuz berdi', 'err');
    } finally {
      setIsSubmitting(false);
    }
  };

  const handleDelete = (id: string) => {
    if (confirm('Ushbu fotodalilni o‘chirishni xohlaysizmi?')) {
      storage.deleteSubmission(id);
      showToast('Fotodalil o‘chirildi', 'ok');
      refreshList();
    }
  };

  // Filtered submissions list
  const filteredSubmissions =
    selectedClubFilter === 'all'
      ? submissions
      : submissions.filter((s) => s.clubId === selectedClubFilter);

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
        <div>
          <h1 className="text-xl sm:text-2xl font-black text-slate-900 leading-tight flex items-center gap-2.5">
            <span className="p-2 rounded-xl bg-teal-50 text-teal-700 border border-teal-200">
              <Camera className="w-6 h-6" />
            </span>
            <span>To‘garak mashg‘ulotlarida qatnashganlik fotodalillari</span>
          </h1>
          <p className="text-sm text-slate-500 mt-1">
            To‘garakka qatnashganligingiz isboti sifatida mashg‘ulot o‘tkazilgan kuni bevosita fotodalil yuklang.
          </p>
        </div>

        {myApprovedMemberships.length > 0 && (
          <button
            type="button"
            onClick={() => handleOpenModal()}
            className="px-4 py-2.5 rounded-xl bg-teal-700 hover:bg-teal-800 active:scale-98 text-white text-xs sm:text-sm font-bold transition-all flex items-center gap-2 shadow-md shadow-teal-700/20 cursor-pointer self-start sm:self-auto"
          >
            <Plus className="w-4 h-4" />
            <span>Fotodalil yuklash</span>
          </button>
        )}
      </div>

      {/* When student has NO approved club memberships */}
      {myApprovedMemberships.length === 0 ? (
        <div className="bg-white rounded-3xl border border-dashed border-slate-300 p-8 sm:p-12 text-center max-w-2xl mx-auto shadow-xs space-y-4">
          <div className="w-16 h-16 rounded-2xl bg-amber-50 text-amber-600 flex items-center justify-center mx-auto">
            <AlertCircle className="w-8 h-8" />
          </div>
          <div>
            <h3 className="text-lg font-black text-slate-900">
              Siz hali tasdiqlangan to‘garak a'zosi emassiz
            </h3>
            <p className="text-sm text-slate-500 mt-1.5 leading-relaxed max-w-md mx-auto">
              Darslarda qatnashganlik fotodalilini yuklash uchun avval to‘garakka a'zolik arizasi topshirishingiz va to‘garak rahbari arizangizni tasdiqlashi kerak.
            </p>
          </div>
          {onSelectView && (
            <button
              type="button"
              onClick={() => onSelectView('browse')}
              className="inline-flex items-center gap-2 px-5 py-2.5 rounded-xl bg-teal-700 hover:bg-teal-800 text-white text-sm font-bold shadow-md shadow-teal-700/20 transition-all cursor-pointer"
            >
              <span>To‘garaklar ro‘yxatiga o‘tish</span>
              <ArrowRight className="w-4 h-4" />
            </button>
          )}
        </div>
      ) : (
        <>
          {/* Quick Stats & Enrolled Clubs Strip */}
          <div className="bg-white p-4 sm:p-5 rounded-2xl border border-slate-200 shadow-xs flex flex-col md:flex-row md:items-center justify-between gap-4">
            <div className="flex flex-wrap items-center gap-3 sm:gap-6 text-xs">
              <div>
                <span className="text-slate-400 font-medium">A'zo bo‘lgan to‘garaklaringiz:</span>
                <span className="ml-1.5 font-black text-slate-900">{myApprovedMemberships.length} ta</span>
              </div>
              <div className="h-4 w-px bg-slate-200 hidden sm:block" />
              <div>
                <span className="text-slate-400 font-medium">Yuklangan fotodalillar:</span>
                <span className="ml-1.5 font-black text-teal-800">{submissions.length} ta</span>
              </div>
            </div>

            {/* Club Filter Tabs */}
            {myApprovedMemberships.length > 1 && (
              <div className="flex items-center gap-1.5 overflow-x-auto pb-1 scrollbar-thin">
                <button
                  type="button"
                  onClick={() => setSelectedClubFilter('all')}
                  className={`px-3 py-1.5 rounded-xl text-xs font-bold whitespace-nowrap transition-all cursor-pointer ${
                    selectedClubFilter === 'all'
                      ? 'bg-teal-700 text-white shadow-xs'
                      : 'bg-slate-100 text-slate-700 hover:bg-slate-200'
                  }`}
                >
                  Barcha to‘garaklarim ({submissions.length})
                </button>
                {myApprovedMemberships.map((m) => {
                  const count = submissions.filter((s) => s.clubId === m.clubId).length;
                  const isSelected = selectedClubFilter === m.clubId;
                  return (
                    <button
                      key={m.clubId}
                      type="button"
                      onClick={() => setSelectedClubFilter(m.clubId)}
                      className={`inline-flex items-center gap-1 px-3 py-1.5 rounded-xl text-xs font-bold whitespace-nowrap transition-all cursor-pointer ${
                        isSelected
                          ? 'bg-teal-700 text-white shadow-xs'
                          : 'bg-slate-100 text-slate-700 hover:bg-slate-200'
                      }`}
                    >
                      <span className="truncate max-w-[140px]">{m.clubName}</span>
                      <span
                        className={`text-[10px] px-1.5 py-0.2 rounded-full font-black ${
                          isSelected ? 'bg-white text-teal-800' : 'bg-teal-100 text-teal-800'
                        }`}
                      >
                        {count}
                      </span>
                    </button>
                  );
                })}
              </div>
            )}
          </div>

          {/* Submissions Gallery Grid */}
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
            {filteredSubmissions.length === 0 ? (
              <div className="col-span-full p-10 text-center bg-white rounded-3xl border border-dashed border-slate-300 text-slate-400 space-y-2">
                <Camera className="w-10 h-10 mx-auto text-slate-300" />
                <div className="text-sm font-bold text-slate-700">
                  Hozircha qatnashganlik fotodalili yuklanmagan
                </div>
                <p className="text-xs text-slate-400 max-w-sm mx-auto">
                  To‘garak mashg‘ulotida qatnashgan kuningiz dars jarayonidan fotodalil yuklang, bu sizning darsdagi ishtirokingizni tasdiqlaydi.
                </p>
                <div className="pt-2">
                  <button
                    type="button"
                    onClick={() => handleOpenModal()}
                    className="px-4 py-2 rounded-xl bg-teal-700 hover:bg-teal-800 text-white text-xs font-bold transition-all shadow-xs cursor-pointer"
                  >
                    + Birinchi fotodalilni yuklash
                  </button>
                </div>
              </div>
            ) : (
              filteredSubmissions.map((sub) => (
                <div
                  key={sub.id}
                  className="bg-white rounded-3xl border border-slate-200 overflow-hidden shadow-xs hover:border-teal-300 hover:shadow-md transition-all flex flex-col justify-between group"
                >
                  {/* Photo with Overlay */}
                  <div className="relative aspect-4/3 bg-slate-100 overflow-hidden">
                    {sub.photoFile ? (
                      <button
                        type="button"
                        onClick={() =>
                          setPhotoModal({
                            url: sub.photoFile!.url,
                            title: sub.title || sub.clubName || 'Fotodalil',
                            subtitle: `${fmtD(sub.createdAt)} · ${sub.clubName || ''}`,
                          })
                        }
                        className="w-full h-full block cursor-pointer group"
                      >
                        <img
                          src={sub.photoFile.url}
                          alt={sub.title}
                          className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300"
                        />
                        <div className="absolute inset-0 bg-gradient-to-t from-black/60 via-transparent to-transparent opacity-80 group-hover:opacity-60 transition-opacity" />
                        <div className="absolute bottom-3 left-3 right-3 text-left">
                          <span className="inline-flex items-center gap-1 px-2.5 py-0.5 rounded-full text-[11px] font-extrabold bg-emerald-500 text-white shadow-xs">
                            <CheckCircle2 className="w-3 h-3" />
                            <span>Qatnashganlik tasdiqlangan</span>
                          </span>
                        </div>
                      </button>
                    ) : (
                      <div className="w-full h-full flex items-center justify-center text-slate-400">
                        <Camera className="w-10 h-10 opacity-40" />
                      </div>
                    )}
                  </div>

                  {/* Details Body */}
                  <div className="p-4 space-y-2 flex-1 flex flex-col justify-between">
                    <div>
                      <div className="flex items-center justify-between gap-2 mb-1">
                        <span className="px-2 py-0.5 rounded-md bg-teal-50 text-teal-800 text-[11px] font-extrabold truncate max-w-[200px]">
                          {sub.clubName || 'To‘garak'}
                        </span>
                        <span className="text-[11px] text-slate-400 font-semibold whitespace-nowrap">
                          {fmtD(sub.createdAt)}
                        </span>
                      </div>

                      <h3 className="text-sm font-extrabold text-slate-900 leading-snug">
                        {sub.title}
                      </h3>

                      {sub.sessionTopic && (
                        <div className="text-xs text-slate-500 font-medium mt-1 flex items-center gap-1">
                          <Calendar className="w-3.5 h-3.5 text-teal-700 shrink-0" />
                          <span className="truncate">Mavzu: {sub.sessionTopic}</span>
                        </div>
                      )}

                      {sub.note && (
                        <p className="text-xs text-slate-600 italic bg-slate-50 p-2 rounded-xl mt-2 border border-slate-100 line-clamp-3">
                          «{sub.note}»
                        </p>
                      )}
                    </div>

                    {/* Footer Actions */}
                    <div className="pt-3 mt-3 border-t border-slate-100 flex items-center justify-between text-xs">
                      <span className="text-emerald-700 font-bold flex items-center gap-1 text-[11px]">
                        <CheckCircle2 className="w-3.5 h-3.5" />
                        <span>Fotodalil qabul qilingan</span>
                      </span>

                      <button
                        type="button"
                        onClick={() => handleDelete(sub.id)}
                        className="text-slate-400 hover:text-rose-600 p-1 rounded-lg hover:bg-rose-50 transition-colors cursor-pointer"
                        title="Fotodalilni o‘chirish"
                      >
                        <Trash2 className="w-4 h-4" />
                      </button>
                    </div>
                  </div>
                </div>
              ))
            )}
          </div>
        </>
      )}

      {/* Upload Attendance Photo Modal */}
      <Modal
        isOpen={isModalOpen}
        onClose={() => setIsModalOpen(false)}
        title="To‘garakda qatnashganlik fotodalilini yuklash"
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
              onClick={handleSubmit}
              disabled={isSubmitting || !photoFile}
              className="px-4 py-2 rounded-xl bg-teal-700 hover:bg-teal-800 text-white text-xs font-bold transition-all shadow-md cursor-pointer disabled:opacity-50"
            >
              {isSubmitting ? 'Yuklanmoqda...' : 'Fotodalilni saqlash'}
            </button>
          </>
        }
      >
        <form onSubmit={handleSubmit} className="space-y-4">
          {/* Club Selection */}
          <div>
            <label className="block text-xs font-bold text-slate-700 mb-1">
              Qaysi to‘garakda qatnashdingiz? *
            </label>
            <select
              value={selectedClubId}
              onChange={(e) => {
                setSelectedClubId(e.target.value);
                setSelectedSessionId('');
              }}
              className="w-full px-3.5 py-2.5 rounded-xl border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-teal-500/20 focus:border-teal-700 transition-colors bg-white font-semibold text-slate-800"
            >
              {allClubs.length === 0 ? (
                <option value="">Hozircha to‘garaklar mavjud emas</option>
              ) : (
                allClubs.map((c) => (
                  <option key={c.id} value={c.id}>
                    {c.name} {c.leaderName ? `(${c.leaderName})` : ''}
                  </option>
                ))
              )}
            </select>
          </div>

          {/* Session Selection (from scheduled sessions if available) */}
          {clubSessions.length > 0 && (
            <div>
              <label className="block text-xs font-bold text-slate-700 mb-1">
                Mashg‘ulot (Dars mavzusi va sanasi)
              </label>
              <select
                value={selectedSessionId}
                onChange={(e) => {
                  setSelectedSessionId(e.target.value);
                  const sess = clubSessions.find((s) => s.id === e.target.value);
                  if (sess) {
                    setSessionDate(sess.date);
                    setTitle(`${sess.date} — ${sess.topic}`);
                  }
                }}
                className="w-full px-3.5 py-2.5 rounded-xl border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-teal-500/20 focus:border-teal-700 transition-colors bg-white font-medium"
              >
                <option value="">Mashg‘ulot ro‘yxatdan tanlanmadi (erkin kiritish)</option>
                {clubSessions.map((s) => (
                  <option key={s.id} value={s.id}>
                    {fmtD(s.date)} — {s.topic}
                  </option>
                ))}
              </select>
            </div>
          )}

          {/* Attendance Date */}
          <div>
            <label className="block text-xs font-bold text-slate-700 mb-1">
              O‘tkazilgan kuni (Dars sanasi) *
            </label>
            <input
              type="date"
              required
              value={sessionDate}
              onChange={(e) => setSessionDate(e.target.value)}
              className="w-full px-3.5 py-2 rounded-xl border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-teal-500/20 focus:border-teal-700 transition-colors font-medium text-slate-800"
            />
          </div>

          {/* Title / Description of Proof */}
          <div>
            <label className="block text-xs font-bold text-slate-700 mb-1">
              Dars mavzusi yoki ishtirok tavsifi
            </label>
            <input
              type="text"
              value={title}
              onChange={(e) => setTitle(e.target.value)}
              placeholder="Masalan: Ingliz tili to‘garagida debat jarayonida ishtirok"
              className="w-full px-3.5 py-2 rounded-xl border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-teal-500/20 focus:border-teal-700 transition-colors"
            />
          </div>

          {/* Photo File (Required) */}
          <div>
            <label className="block text-xs font-bold text-slate-700 mb-1">
              Qatnashganlik fotodalili (Fotosurat) * <span className="text-rose-600 font-extrabold">(Majburiy)</span>
            </label>
            <input
              type="file"
              required
              accept="image/*"
              onChange={handlePhotoChange}
              className="w-full text-xs text-slate-500 file:mr-3 file:py-2 file:px-3 file:rounded-xl file:border-0 file:text-xs file:font-bold file:bg-teal-50 file:text-teal-800 hover:file:bg-teal-100 cursor-pointer"
            />
            {photoFile && (
              <div className="mt-2.5 p-2 rounded-xl border border-teal-200 bg-teal-50/50 flex items-center gap-3">
                <img
                  src={photoFile.data}
                  alt="preview"
                  className="w-16 h-16 rounded-lg object-cover border border-slate-200"
                />
                <div>
                  <div className="text-xs text-teal-900 font-extrabold">✓ Surat yuklandi</div>
                  <div className="text-[11px] text-slate-500 truncate max-w-[200px]">{photoFile.name}</div>
                </div>
              </div>
            )}
          </div>

          {/* Optional Note */}
          <div>
            <label className="block text-xs font-bold text-slate-700 mb-1">
              Izoh yoki taassurot (ixtiyoriy)
            </label>
            <textarea
              rows={2}
              value={note}
              onChange={(e) => setNote(e.target.value)}
              placeholder="Masalan: Darsda amaliy topshiriqni a'lo darajada bajardim..."
              className="w-full px-3.5 py-2 rounded-xl border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-teal-500/20 focus:border-teal-700 transition-colors"
            />
          </div>
        </form>
      </Modal>

      {/* Lightbox / High-Res Photo Modal */}
      {photoModal && (
        <div className="fixed inset-0 z-50 bg-slate-950/80 backdrop-blur-xs flex items-center justify-center p-4">
          <div className="bg-white rounded-3xl max-w-2xl w-full overflow-hidden shadow-2xl border border-slate-200 animate-in fade-in zoom-in-95">
            <div className="p-4 flex items-center justify-between border-b border-slate-100">
              <div>
                <h3 className="font-extrabold text-slate-900 text-sm">{photoModal.title}</h3>
                <p className="text-xs text-slate-500">{photoModal.subtitle}</p>
              </div>
              <button
                type="button"
                onClick={() => setPhotoModal(null)}
                className="w-8 h-8 rounded-xl hover:bg-slate-100 text-slate-400 hover:text-slate-600 flex items-center justify-center cursor-pointer"
              >
                <X className="w-5 h-5" />
              </button>
            </div>
            <div className="bg-black/90 flex items-center justify-center p-2 max-h-[70vh]">
              <img
                src={photoModal.url}
                alt="Fotodalil"
                className="max-h-[68vh] max-w-full object-contain rounded-lg"
              />
            </div>
            <div className="p-3 bg-slate-50 text-right">
              <button
                type="button"
                onClick={() => setPhotoModal(null)}
                className="px-4 py-1.5 rounded-xl text-xs font-bold text-slate-700 bg-white hover:bg-slate-100 border border-slate-200 cursor-pointer"
              >
                Yopish
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
};
