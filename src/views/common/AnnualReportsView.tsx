import React, { useState } from 'react';
import { BarChart3, Download, Plus, FileText, CheckCircle2, Clock, Users, Calendar, Image as ImageIcon, Award, Shield } from 'lucide-react';
import { I18N, Language, CATEGORIES } from '../../lib/i18n';
import { storage, fmtD, ymd } from '../../lib/storage';
import { StatusBadge, CategoryTag } from '../../components/common/Badge';
import { Modal } from '../../components/common/Modal';
import { User, AnnualReport, Club } from '../../types';
import jsPDF from 'jspdf';
import html2canvas from 'html2canvas';

export const AnnualReportsView: React.FC<{
  user: User;
  lang: Language;
  showToast: (msg: string, type?: 'ok' | 'err') => void;
  onRefresh: () => void;
}> = ({ user, lang, showToast, onRefresh }) => {
  const t = I18N[lang];
  const allClubs = storage.getClubs(user.role === 'leader' ? user.id : undefined);
  const [reports, setReports] = useState<AnnualReport[]>(storage.getAnnualReports());
  const [selectedClubId, setSelectedClubId] = useState<string>(allClubs[0]?.id || '');

  // Submit modal
  const [isSubmitOpen, setIsSubmitOpen] = useState(false);
  const [academicYear, setAcademicYear] = useState('2025/2026');
  const [summary, setSummary] = useState('');
  const [achievements, setAchievements] = useState('');
  const [pdfFile, setPdfFile] = useState<{ name: string; mime: string; data: string } | null>(null);
  const [isExporting, setIsExporting] = useState(false);

  const refreshList = () => {
    setReports(storage.getAnnualReports());
    onRefresh();
  };

  const handleFileChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (!file) return;
    if (file.size > 10 * 1024 * 1024) {
      showToast('Fayl hajmi 10 MB dan oshmasligi kerak', 'err');
      return;
    }
    const reader = new FileReader();
    reader.onload = () => {
      setPdfFile({
        name: file.name,
        mime: file.type || 'application/pdf',
        data: reader.result as string,
      });
    };
    reader.readAsDataURL(file);
  };

  const handleSubmitAnnual = (e: React.FormEvent) => {
    e.preventDefault();
    if (!selectedClubId || !summary.trim()) {
      showToast(t.common.required, 'err');
      return;
    }

    try {
      storage.saveAnnualReport({
        clubId: selectedClubId,
        leaderId: user.id,
        academicYear,
        summary,
        achievements,
        pdfFile: pdfFile || undefined,
      });

      showToast(t.common.saved, 'ok');
      setIsSubmitOpen(false);
      setSummary('');
      setAchievements('');
      setPdfFile(null);
      refreshList();
    } catch (err: unknown) {
      const msg = err instanceof Error ? err.message : 'Xatolik';
      showToast(msg, 'err');
    }
  };

  const handleApprove = (id: string) => {
    try {
      storage.reviewAnnualReport(id, 'approved', 'Tasdiqlandi');
      showToast(t.common.saved, 'ok');
      refreshList();
    } catch {
      showToast('Xatolik', 'err');
    }
  };

  // Export Annual PDF
  const handleExportAnnualPDF = async () => {
    setIsExporting(true);
    showToast(t.sch.pdfPreparing, 'ok');

    const container = document.createElement('div');
    container.style.position = 'fixed';
    container.style.left = '-12000px';
    container.style.top = '0';
    container.style.width = '1120px';
    container.style.backgroundColor = '#ffffff';
    container.style.fontFamily = 'Arial, sans-serif';
    container.style.color = '#0f172a';
    container.style.padding = '36px 40px';
    container.style.boxSizing = 'border-box';

    const cellStyle = 'border: 1px solid #cbd5e1; padding: 8px 10px; font-size: 11.5px; vertical-align: top;';
    const headerStyle = `${cellStyle} background: #0f2b5c; color: #ffffff; font-weight: 700; text-align: left;`;

    const now = new Date();
    const clubsList = storage.getClubs();

    let html = `
      <div style="text-align: center; margin-bottom: 24px;">
        <div style="font-size: 13px; font-weight: 700; color: #475569; text-transform: uppercase; letter-spacing: 0.5px;">
          ${t.app.institute}
        </div>
        <div style="font-size: 12px; color: #d97706; font-weight: 800; margin-top: 4px; letter-spacing: 0.5px;">
          5 MUHIM TASHABBUS DOIRASIDAGI TO‘GARAKLAR FAOLIYATI
        </div>
        <div style="font-size: 20px; font-weight: 900; margin-top: 8px; color: #0f172a;">
          TO‘GARAKLARNING YILLIK HISOBOTI VA MONITORING NATIJALARI
        </div>
        <div style="font-size: 12px; color: #64748b; margin-top: 6px;">
          O‘quv yili: <b>${academicYear}</b> · Hujjat shakllantirilgan sana: <b>${fmtD(ymd(now))}</b>
        </div>
      </div>

      <table style="width: 100%; border-collapse: collapse; margin-bottom: 24px;">
        <thead>
          <tr>
            <th style="${headerStyle} width: 30px; text-align: center;">№</th>
            <th style="${headerStyle}">To‘garak nomi</th>
            <th style="${headerStyle}">Yo‘nalish (5 tashabbus)</th>
            <th style="${headerStyle}">Mas'ul rahbar (F.I.SH.)</th>
            <th style="${headerStyle}; text-align: center;">Xona</th>
            <th style="${headerStyle}; text-align: center;">Reja</th>
            <th style="${headerStyle}; text-align: center;">O‘tildi</th>
            <th style="${headerStyle}; text-align: center;">Bajarilish</th>
            <th style="${headerStyle}; text-align: center;">A'zolar</th>
            <th style="${headerStyle}; text-align: center;">Rasmlar</th>
          </tr>
        </thead>
        <tbody>
    `;

    if (clubsList.length === 0) {
      html += `<tr><td colspan="10" style="${cellStyle} text-align: center; color: #94a3b8;">To'garaklar mavjud emas</td></tr>`;
    } else {
      clubsList.forEach((c, idx) => {
        const planned = c.sessionCount || 0;
        const held = c.heldSessionCount || 0;
        const pct = planned > 0 ? Math.round((held / planned) * 100) : 0;
        const cat = CATEGORIES.find((x) => x.id === c.category);
        const catName = lang === 'ru' ? cat?.name_ru : cat?.name_uz;

        html += `
          <tr>
            <td style="${cellStyle} text-align: center;">${idx + 1}</td>
            <td style="${cellStyle} font-weight: 700; color: #0f172a;">${c.name}</td>
            <td style="${cellStyle}">${catName || c.category}</td>
            <td style="${cellStyle}">${c.leaderName}</td>
            <td style="${cellStyle} text-align: center;">${c.room || '—'}</td>
            <td style="${cellStyle} text-align: center;">${planned}</td>
            <td style="${cellStyle} text-align: center; font-weight: 700; color: #15803d;">${held}</td>
            <td style="${cellStyle} text-align: center; font-weight: 700; color: #0284c7;">${pct}%</td>
            <td style="${cellStyle} text-align: center;">${c.memberCount || 0} nafar</td>
            <td style="${cellStyle} text-align: center;">${c.photoCount || 0} ta</td>
          </tr>
        `;
      });
    }

    html += `
        </tbody>
      </table>

      <div style="display: flex; justify-content: space-between; align-items: flex-end; margin-top: 40px; font-size: 13px; color: #1e293b;">
        <div>
          <span>Yoshlar bilan ishlash bo‘yicha prorektor: </span>
          <span style="display: inline-block; width: 170px; border-bottom: 1px solid #334155; margin: 0 8px;"></span>
          <b>(imzo)</b>
        </div>
        <div>
          <span>To‘garaklar koordinatori: </span>
          <span style="display: inline-block; width: 170px; border-bottom: 1px solid #334155; margin: 0 8px;"></span>
          <b>(imzo)</b>
        </div>
      </div>
    `;

    container.innerHTML = html;
    document.body.appendChild(container);

    try {
      const canvas = await html2canvas(container, {
        scale: 2,
        backgroundColor: '#ffffff',
        useCORS: true,
        windowWidth: 1200,
      });

      const pdf = new jsPDF({
        orientation: 'landscape',
        unit: 'mm',
        format: 'a4',
      });

      const margin = 8;
      const imgWidth = 297 - margin * 2;
      const imgHeight = (canvas.height * imgWidth) / canvas.width;

      pdf.addImage(canvas.toDataURL('image/jpeg', 0.95), 'JPEG', margin, margin, imgWidth, imgHeight);
      pdf.save(`Yillik_hisobot_NamDChTI_${academicYear.replace('/', '_')}.pdf`);
      showToast(t.common.saved, 'ok');
    } catch {
      showToast('PDF yaratishda xatolik', 'err');
    } finally {
      container.remove();
      setIsExporting(false);
    }
  };

  // Summary stats
  const totalClubs = allClubs.length;
  const totalPlanned = allClubs.reduce((acc, c) => acc + (c.sessionCount || 0), 0);
  const totalHeld = allClubs.reduce((acc, c) => acc + (c.heldSessionCount || 0), 0);
  const totalPhotos = allClubs.reduce((acc, c) => acc + (c.photoCount || 0), 0);
  const totalMembers = allClubs.reduce((acc, c) => acc + (c.memberCount || 0), 0);
  const totalRate = totalPlanned > 0 ? Math.round((totalHeld / totalPlanned) * 100) : 0;

  return (
    <div className="space-y-6">
      {/* Top Header */}
      <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
        <div>
          <h1 className="text-xl sm:text-2xl font-black text-slate-900 leading-tight flex items-center gap-2.5">
            <BarChart3 className="w-6 h-6 text-blue-600 shrink-0" />
            <span>{t.annual.title}</span>
          </h1>
          <p className="text-xs sm:text-sm text-slate-500 mt-1 max-w-2xl">
            {t.annual.sub}
          </p>
        </div>

        <div className="flex items-center gap-2">
          <button
            type="button"
            disabled={isExporting}
            onClick={handleExportAnnualPDF}
            className="px-3.5 py-2.5 rounded-xl border border-slate-200 bg-white hover:bg-slate-50 text-slate-700 text-xs sm:text-sm font-bold transition-all flex items-center gap-1.5 shadow-2xs cursor-pointer"
          >
            <Download className="w-4 h-4 text-blue-600" />
            <span>{t.annual.downloadPdf}</span>
          </button>

          {(user.role === 'leader' || user.role === 'admin') && allClubs.length > 0 && (
            <button
              type="button"
              onClick={() => setIsSubmitOpen(true)}
              className="px-4 py-2.5 rounded-xl bg-blue-600 hover:bg-blue-700 active:scale-98 text-white text-xs sm:text-sm font-bold transition-all flex items-center gap-1.5 shadow-md shadow-blue-600/20 cursor-pointer"
            >
              <Plus className="w-4 h-4" />
              <span>{t.annual.submitNew}</span>
            </button>
          )}
        </div>
      </div>

      {/* KPI Cards */}
      <div className="grid grid-cols-2 lg:grid-cols-5 gap-3.5">
        <div className="bg-white p-4 rounded-2xl border border-slate-200 shadow-2xs">
          <div className="flex items-center justify-between text-slate-400 mb-2">
            <span className="text-xs font-bold text-slate-600">{t.sch.total}</span>
            <Users className="w-4 h-4 text-blue-600" />
          </div>
          <div className="text-2xl font-black text-slate-900">{totalClubs}</div>
          <div className="text-[11px] text-slate-400 mt-1">NamDChTI to'garaklari</div>
        </div>

        <div className="bg-white p-4 rounded-2xl border border-slate-200 shadow-2xs">
          <div className="flex items-center justify-between text-slate-400 mb-2">
            <span className="text-xs font-bold text-slate-600">{t.annual.plannedSessions}</span>
            <Calendar className="w-4 h-4 text-slate-500" />
          </div>
          <div className="text-2xl font-black text-slate-900">{totalPlanned}</div>
          <div className="text-[11px] text-slate-400 mt-1">Yillik rejadagi darslar</div>
        </div>

        <div className="bg-white p-4 rounded-2xl border border-slate-200 shadow-2xs">
          <div className="flex items-center justify-between text-slate-400 mb-2">
            <span className="text-xs font-bold text-slate-600">{t.annual.heldSessions}</span>
            <CheckCircle2 className="w-4 h-4 text-emerald-600" />
          </div>
          <div className="text-2xl font-black text-emerald-600">{totalHeld}</div>
          <div className="text-[11px] text-emerald-700/80 font-semibold mt-1">Bajarilish: {totalRate}%</div>
        </div>

        <div className="bg-white p-4 rounded-2xl border border-slate-200 shadow-2xs">
          <div className="flex items-center justify-between text-slate-400 mb-2">
            <span className="text-xs font-bold text-slate-600">{t.annual.photosCount}</span>
            <ImageIcon className="w-4 h-4 text-amber-500" />
          </div>
          <div className="text-2xl font-black text-amber-600">{totalPhotos}</div>
          <div className="text-[11px] text-slate-400 mt-1">Dars fotodalillari</div>
        </div>

        <div className="bg-white p-4 rounded-2xl border border-slate-200 shadow-2xs col-span-2 lg:col-span-1">
          <div className="flex items-center justify-between text-slate-400 mb-2">
            <span className="text-xs font-bold text-slate-600">{t.annual.membersCount}</span>
            <Award className="w-4 h-4 text-indigo-600" />
          </div>
          <div className="text-2xl font-black text-indigo-600">{totalMembers}</div>
          <div className="text-[11px] text-slate-400 mt-1">A'zo talabalar</div>
        </div>
      </div>

      {/* Annual Passport Cards for each Club */}
      <div className="space-y-4">
        <h3 className="text-base font-extrabold text-slate-900">
          {t.annual.passport} ({allClubs.length} ta to'garak)
        </h3>

        {allClubs.length === 0 ? (
          <div className="bg-white rounded-2xl border border-slate-200 p-8 text-center text-slate-400">
            <p className="text-sm font-bold text-slate-700">Hozircha to'garaklar mavjud emas.</p>
            <p className="text-xs text-slate-400 mt-1">Yangi to'garak qo'shilgach, uning yillik monitoringi bu yerda aks etadi.</p>
          </div>
        ) : (
          <div className="grid grid-cols-1 lg:grid-cols-2 gap-4">
            {allClubs.map((club) => {
              const planned = club.sessionCount || 0;
              const held = club.heldSessionCount || 0;
              const rate = planned > 0 ? Math.round((held / planned) * 100) : 0;
              const clubReports = reports.filter((r) => r.clubId === club.id);

              return (
                <div
                  key={club.id}
                  className="bg-white rounded-2xl border border-slate-200 p-5 shadow-xs flex flex-col justify-between"
                >
                  <div>
                    <div className="flex items-start justify-between gap-3 mb-2">
                      <h4 className="text-base font-black text-slate-900 leading-snug">
                        {club.name}
                      </h4>
                      <StatusBadge status={club.statuteStatus} lang={lang} />
                    </div>

                    <div className="mb-3">
                      <CategoryTag categoryId={club.categoryName_uz || club.category} lang={lang} ball={club.categoryBall} />
                    </div>

                    <div className="grid grid-cols-2 gap-2 p-3 rounded-xl bg-slate-50 border border-slate-100 text-xs mb-4">
                      <div>
                        <span className="text-slate-400 block">{t.common.leader}:</span>
                        <span className="font-extrabold text-slate-800">{club.leaderName}</span>
                      </div>
                      <div>
                        <span className="text-slate-400 block">{t.common.place}:</span>
                        <span className="font-bold text-blue-700">{club.room || 'Belgilanmagan'}</span>
                      </div>
                      <div>
                        <span className="text-slate-400 block">{t.common.faculty}:</span>
                        <span className="font-semibold text-slate-700">{club.faculty || 'NamDChTI'}</span>
                      </div>
                      <div>
                        <span className="text-slate-400 block">{t.common.members}:</span>
                        <span className="font-extrabold text-emerald-700">{club.memberCount || 0} nafar</span>
                      </div>
                    </div>

                    {/* Progress Bar of Completion */}
                    <div className="space-y-1.5 mb-4">
                      <div className="flex items-center justify-between text-xs">
                        <span className="font-bold text-slate-700">{t.annual.completionRate}</span>
                        <span className="font-black text-blue-700">{held} / {planned} dars ({rate}%)</span>
                      </div>
                      <div className="w-full h-2.5 bg-slate-100 rounded-full overflow-hidden">
                        <div
                          className="h-full bg-gradient-to-r from-blue-600 to-emerald-500 rounded-full transition-all"
                          style={{ width: `${Math.min(rate, 100)}%` }}
                        />
                      </div>
                    </div>

                    {/* Annual Reports submitted */}
                    {clubReports.length > 0 ? (
                      <div className="border-t border-slate-100 pt-3 space-y-2">
                        <span className="text-[11px] font-extrabold text-slate-500 uppercase tracking-wider block">
                          Topshirilgan yillik hisobotlar:
                        </span>
                        {clubReports.map((rep) => (
                          <div
                            key={rep.id}
                            className="p-3 rounded-xl bg-blue-50/70 border border-blue-100 text-xs space-y-1.5"
                          >
                            <div className="flex items-center justify-between font-bold text-blue-900">
                              <span>O‘quv yili: {rep.academicYear}</span>
                              <span className="text-[10px] text-slate-500 font-semibold">{fmtD(rep.createdAt.slice(0, 10))}</span>
                            </div>
                            <p className="text-slate-700 leading-relaxed text-[11px]">
                              {rep.summary}
                            </p>
                            {rep.achievements && (
                              <div className="text-[11px] text-emerald-800 font-semibold">
                                🏆 Yutuqlar: {rep.achievements}
                              </div>
                            )}
                            <div className="flex items-center justify-between pt-1">
                              {rep.pdfFile ? (
                                <a
                                  href={rep.pdfFile.url}
                                  target="_blank"
                                  rel="noopener noreferrer"
                                  download={rep.pdfFile.name}
                                  className="inline-flex items-center gap-1 font-bold text-blue-700 hover:text-blue-900 text-xs"
                                >
                                  <FileText className="w-3.5 h-3.5" />
                                  <span>Yillik hisobot (PDF)</span>
                                </a>
                              ) : (
                                <span className="text-[11px] text-slate-400 italic">PDF biriktirilmagan</span>
                              )}

                              {user.role === 'admin' && rep.status === 'pending' && (
                                <button
                                  type="button"
                                  onClick={() => handleApprove(rep.id)}
                                  className="px-2.5 py-1 bg-emerald-600 hover:bg-emerald-700 text-white font-bold rounded-lg text-[10px] cursor-pointer"
                                >
                                  Tasdiqlash
                                </button>
                              )}
                            </div>
                          </div>
                        ))}
                      </div>
                    ) : (
                      <p className="text-[11px] text-slate-400 italic border-t border-slate-100 pt-2">
                        {t.annual.noAnnual}
                      </p>
                    )}
                  </div>

                  <div className="pt-3 mt-3 border-t border-slate-100 flex items-center justify-between text-xs text-slate-500">
                    <span className="flex items-center gap-1 font-semibold">
                      <ImageIcon className="w-3.5 h-3.5 text-amber-500" />
                      <span>{club.photoCount || 0} ta fotodalil</span>
                    </span>
                    {club.statuteFile && (
                      <a
                        href={club.statuteFile.url}
                        target="_blank"
                        rel="noopener noreferrer"
                        className="font-bold text-blue-700 hover:text-blue-900"
                      >
                        Nizom (PDF)
                      </a>
                    )}
                  </div>
                </div>
              );
            })}
          </div>
        )}
      </div>

      {/* Submit Annual Report Modal */}
      <Modal
        isOpen={isSubmitOpen}
        onClose={() => setIsSubmitOpen(false)}
        title={t.annual.submitNew}
        footer={
          <>
            <button
              type="button"
              onClick={() => setIsSubmitOpen(false)}
              className="px-4 py-2 rounded-xl border border-slate-200 text-slate-700 text-xs font-bold hover:bg-slate-50 transition-colors"
            >
              {t.common.cancel}
            </button>
            <button
              type="button"
              onClick={handleSubmitAnnual}
              className="px-4 py-2 rounded-xl bg-blue-600 hover:bg-blue-700 text-white text-xs font-bold transition-all shadow-md cursor-pointer"
            >
              {t.common.save}
            </button>
          </>
        }
      >
        <form onSubmit={handleSubmitAnnual} className="space-y-3.5">
          <div>
            <label className="block text-xs font-bold text-slate-700 mb-1">
              {t.common.club} *
            </label>
            <select
              value={selectedClubId}
              onChange={(e) => setSelectedClubId(e.target.value)}
              className="w-full px-3.5 py-2.5 rounded-xl border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600 transition-colors bg-white font-medium"
            >
              {allClubs.map((c) => (
                <option key={c.id} value={c.id}>
                  {c.name} ({c.leaderName})
                </option>
              ))}
            </select>
          </div>

          <div>
            <label className="block text-xs font-bold text-slate-700 mb-1">
              {t.annual.academicYear} *
            </label>
            <input
              type="text"
              required
              value={academicYear}
              onChange={(e) => setAcademicYear(e.target.value)}
              placeholder="2025/2026"
              className="w-full px-3.5 py-2.5 rounded-xl border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600 transition-colors"
            />
          </div>

          <div>
            <label className="block text-xs font-bold text-slate-700 mb-1">
              {t.annual.summary} *
            </label>
            <textarea
              rows={4}
              required
              value={summary}
              onChange={(e) => setSummary(e.target.value)}
              placeholder="To'garakning yillik faoliyati tahlili, o'tilgan darslar mazmuni va talabalar faolligi..."
              className="w-full px-3.5 py-2.5 rounded-xl border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600 transition-colors"
            />
          </div>

          <div>
            <label className="block text-xs font-bold text-slate-700 mb-1">
              {t.annual.achievements}
            </label>
            <input
              type="text"
              value={achievements}
              onChange={(e) => setAchievements(e.target.value)}
              placeholder="Masalan: Tanlov g'oliblari, sertifikatlar, ko'rgazmalar..."
              className="w-full px-3.5 py-2.5 rounded-xl border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600 transition-colors"
            />
          </div>

          <div>
            <label className="block text-xs font-bold text-slate-700 mb-1">
              {t.annual.annualPdf} (PDF)
            </label>
            <input
              type="file"
              accept=".pdf,application/pdf"
              onChange={handleFileChange}
              className="w-full text-xs text-slate-500 file:mr-3 file:py-2 file:px-3 file:rounded-xl file:border-0 file:text-xs file:font-bold file:bg-blue-50 file:text-blue-700 hover:file:bg-blue-100 cursor-pointer"
            />
            {pdfFile && (
              <span className="text-xs text-emerald-600 font-bold block mt-1">
                ✓ {pdfFile.name} tanlandi
              </span>
            )}
          </div>
        </form>
      </Modal>
    </div>
  );
};
