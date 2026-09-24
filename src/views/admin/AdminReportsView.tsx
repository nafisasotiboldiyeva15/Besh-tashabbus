import React, { useState, useMemo } from 'react';
import {
  FileText,
  ExternalLink,
  Calendar,
  Users,
  Camera,
  Download,
  Search,
  CheckCircle2,
  X,
  Layers,
  Sparkles,
  Building2,
  Clock,
  MapPin,
  ChevronDown,
  ChevronUp,
} from 'lucide-react';
import { I18N, Language, CATEGORIES } from '../../lib/i18n';
import { storage, fmtD } from '../../lib/storage';
import { downloadClubReportPDF } from '../../lib/pdf';
import { Club, Report, Session, AnnualReport } from '../../types';

export const AdminReportsView: React.FC<{ lang: Language }> = ({ lang }) => {
  const t = I18N[lang];
  const [selectedClubId, setSelectedClubId] = useState<string>('all');
  const [searchQuery, setSearchQuery] = useState('');
  const [activeTabByClub, setActiveTabByClub] = useState<Record<string, 'all' | 'held' | 'official'>>({});
  const [photoModal, setPhotoModal] = useState<{ url: string; title: string; subtitle: string } | null>(null);
  const [downloadingClubId, setDownloadingClubId] = useState<string | null>(null);

  // Load live data from storage
  const clubs = storage.getClubs();
  const allReports = storage.getReports();
  const allSessions = storage.getSessions();
  const allAnnualReports = storage.getAnnualReports();

  // Filter clubs based on search
  const filteredClubs = useMemo(() => {
    let list = clubs;
    if (selectedClubId !== 'all') {
      list = list.filter((c) => c.id === selectedClubId);
    }
    if (searchQuery.trim()) {
      const q = searchQuery.toLowerCase();
      list = list.filter(
        (c) =>
          c.name.toLowerCase().includes(q) ||
          (c.leaderName && c.leaderName.toLowerCase().includes(q)) ||
          (c.faculty && c.faculty.toLowerCase().includes(q))
      );
    }
    return list;
  }, [clubs, selectedClubId, searchQuery]);

  // Overall Statistics
  const totalHeldSessions = allSessions.filter((s) => s.status === 'held').length;
  const totalPhotosCount = allSessions.filter((s) => Boolean(s.photoFile)).length;
  const totalReportsCount = allReports.length;

  const handleDownloadClubPDF = async (club: Club) => {
    setDownloadingClubId(club.id);
    try {
      const clubReports = allReports.filter((r) => r.clubId === club.id);
      const clubSessions = allSessions.filter((s) => s.clubId === club.id);
      const clubAnnual = allAnnualReports.find((a) => a.clubId === club.id) || null;
      await downloadClubReportPDF(club, clubReports, clubSessions, clubAnnual, lang);
    } catch (err) {
      console.error('PDF error:', err);
    } finally {
      setDownloadingClubId(null);
    }
  };

  const getCategoryName = (catId: string) => {
    const c = CATEGORIES.find((item) => item.id === catId);
    return c ? (lang === 'uz' ? c.name_uz : c.name_ru) : catId;
  };

  return (
    <div className="space-y-6">
      {/* Page Header */}
      <div className="flex flex-col md:flex-row md:items-center justify-between gap-4">
        <div>
          <h1 className="text-xl sm:text-2xl font-black text-slate-900 leading-tight flex items-center gap-2.5">
            <span className="p-2 rounded-xl bg-teal-50 text-teal-700 border border-teal-200">
              <Layers className="w-6 h-6" />
            </span>
            <span>To‘garaklar hisobotlari nazorati</span>
          </h1>
          <p className="text-sm text-slate-500 mt-1">
            Har bir yaratilgan to‘garak bo‘yicha alohida-alohida o‘tkazilgan darslar, fotodalillar va rasmiy hisobotlar monitoringi.
          </p>
        </div>

        {/* Global summary badge */}
        <div className="flex items-center gap-2 self-start md:self-auto text-xs font-bold text-slate-600 bg-white px-3.5 py-2 rounded-xl border border-slate-200 shadow-2xs">
          <span className="w-2.5 h-2.5 rounded-full bg-teal-500 animate-pulse" />
          <span>Jami {clubs.length} ta to‘garak faoliyati</span>
        </div>
      </div>

      {/* KPI Cards */}
      <div className="grid grid-cols-2 lg:grid-cols-4 gap-3 sm:gap-4">
        <div className="bg-white p-4 sm:p-5 rounded-2xl border border-slate-200 shadow-xs flex items-center gap-3 sm:gap-4">
          <div className="w-12 h-12 rounded-xl bg-teal-50 text-teal-700 flex items-center justify-center shrink-0">
            <Building2 className="w-6 h-6" />
          </div>
          <div>
            <div className="text-xs font-semibold text-slate-500">Yaratilgan to‘garaklar</div>
            <div className="text-xl sm:text-2xl font-black text-slate-900 mt-0.5">{clubs.length} ta</div>
          </div>
        </div>

        <div className="bg-white p-4 sm:p-5 rounded-2xl border border-slate-200 shadow-xs flex items-center gap-3 sm:gap-4">
          <div className="w-12 h-12 rounded-xl bg-emerald-50 text-emerald-700 flex items-center justify-center shrink-0">
            <CheckCircle2 className="w-6 h-6" />
          </div>
          <div>
            <div className="text-xs font-semibold text-slate-500">O‘tkazilgan darslar</div>
            <div className="text-xl sm:text-2xl font-black text-slate-900 mt-0.5">{totalHeldSessions} ta</div>
          </div>
        </div>

        <div className="bg-white p-4 sm:p-5 rounded-2xl border border-slate-200 shadow-xs flex items-center gap-3 sm:gap-4">
          <div className="w-12 h-12 rounded-xl bg-blue-50 text-blue-700 flex items-center justify-center shrink-0">
            <Camera className="w-6 h-6" />
          </div>
          <div>
            <div className="text-xs font-semibold text-slate-500">Yuklangan fotodalillar</div>
            <div className="text-xl sm:text-2xl font-black text-slate-900 mt-0.5">{totalPhotosCount} ta</div>
          </div>
        </div>

        <div className="bg-white p-4 sm:p-5 rounded-2xl border border-slate-200 shadow-xs flex items-center gap-3 sm:gap-4">
          <div className="w-12 h-12 rounded-xl bg-amber-50 text-amber-700 flex items-center justify-center shrink-0">
            <FileText className="w-6 h-6" />
          </div>
          <div>
            <div className="text-xs font-semibold text-slate-500">Rasmiy hisobotlar</div>
            <div className="text-xl sm:text-2xl font-black text-slate-900 mt-0.5">{totalReportsCount} ta</div>
          </div>
        </div>
      </div>

      {/* Filter and Club Selector Bar */}
      <div className="bg-white p-4 rounded-2xl border border-slate-200 shadow-xs space-y-3">
        <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-3">
          <div className="relative flex-1 max-w-md">
            <Search className="w-4 h-4 absolute left-3.5 top-1/2 -translate-y-1/2 text-slate-400" />
            <input
              type="text"
              placeholder="To‘garak nomi yoki rahbari bo‘yicha qidirish..."
              value={searchQuery}
              onChange={(e) => setSearchQuery(e.target.value)}
              className="w-full pl-9 pr-4 py-2 text-xs sm:text-sm rounded-xl border border-slate-200 focus:outline-none focus:ring-2 focus:ring-teal-500/20 focus:border-teal-600 transition-colors"
            />
            {searchQuery && (
              <button
                type="button"
                onClick={() => setSearchQuery('')}
                className="absolute right-3 top-1/2 -translate-y-1/2 text-slate-400 hover:text-slate-600"
              >
                <X className="w-3.5 h-3.5" />
              </button>
            )}
          </div>

          <div className="text-xs font-bold text-slate-500">
            Ko‘rsatilmoqda: <span className="text-slate-900 font-extrabold">{filteredClubs.length}</span> / {clubs.length} ta to‘garak
          </div>
        </div>

        {/* Club Quick Tabs */}
        {clubs.length > 0 && (
          <div className="pt-2 border-t border-slate-100 flex items-center gap-2 overflow-x-auto pb-1 scrollbar-thin">
            <button
              type="button"
              onClick={() => setSelectedClubId('all')}
              className={`px-3.5 py-1.5 rounded-xl text-xs font-bold whitespace-nowrap transition-all cursor-pointer ${
                selectedClubId === 'all'
                  ? 'bg-teal-700 text-white shadow-xs'
                  : 'bg-slate-100 text-slate-700 hover:bg-slate-200'
              }`}
            >
              Barcha to‘garaklar ({clubs.length})
            </button>
            {clubs.map((c) => {
              const count = allReports.filter((r) => r.clubId === c.id).length;
              const isSelected = selectedClubId === c.id;
              return (
                <button
                  key={c.id}
                  type="button"
                  onClick={() => setSelectedClubId(c.id)}
                  className={`inline-flex items-center gap-1.5 px-3 py-1.5 rounded-xl text-xs font-bold whitespace-nowrap transition-all cursor-pointer ${
                    isSelected
                      ? 'bg-teal-700 text-white shadow-xs'
                      : 'bg-slate-100 text-slate-700 hover:bg-slate-200'
                  }`}
                  title={`${c.name} (${c.leaderName || ''})`}
                >
                  <span className="truncate max-w-[180px]">{c.name}</span>
                  {count > 0 && (
                    <span
                      className={`text-[10px] px-1.5 py-0.2 rounded-full font-black ${
                        isSelected ? 'bg-white text-teal-800' : 'bg-teal-100 text-teal-800'
                      }`}
                    >
                      {count}
                    </span>
                  )}
                </button>
              );
            })}
          </div>
        )}
      </div>

      {/* Main Content: Reports by Club (Alohida-alohida to'garak nomlari bilan) */}
      {clubs.length === 0 ? (
        <div className="bg-white rounded-3xl border border-dashed border-slate-300 p-12 text-center max-w-2xl mx-auto shadow-xs">
          <div className="w-16 h-16 rounded-2xl bg-teal-50 text-teal-700 flex items-center justify-center mx-auto mb-4">
            <Layers className="w-8 h-8" />
          </div>
          <h3 className="text-lg font-extrabold text-slate-900 mb-1.5">
            Hozircha to‘garaklar yaratilmagan
          </h3>
          <p className="text-sm text-slate-500 leading-relaxed max-w-md mx-auto">
            To‘garak rahbarlari o‘z to‘garaklarini ro‘yxatdan o‘tkazib, mashg‘ulotlar o‘tkazgach va hisobot yuklagach, har bir to‘garakning hisoboti ushbu sahifada to‘garak nomlari bilan alohida-alohida avtomatik shakllanadi.
          </p>
        </div>
      ) : filteredClubs.length === 0 ? (
        <div className="bg-white rounded-2xl border border-slate-200 p-8 text-center text-slate-500 shadow-xs">
          «{searchQuery}» so‘rovi bo‘yicha to‘garak topilmadi.
        </div>
      ) : (
        <div className="space-y-8">
          {filteredClubs.map((club, clubIdx) => {
            const clubReports = allReports.filter((r) => r.clubId === club.id);
            const clubSessions = allSessions.filter((s) => s.clubId === club.id);
            const heldSessions = clubSessions.filter((s) => s.status === 'held');
            const clubPhotosCount = heldSessions.filter((s) => Boolean(s.photoFile)).length;
            const annualRep = allAnnualReports.find((a) => a.clubId === club.id);
            const currentTab = activeTabByClub[club.id] || 'all';

            return (
              <div
                key={club.id}
                className="bg-white rounded-3xl border border-slate-200 shadow-xs overflow-hidden transition-all hover:border-teal-300"
              >
                {/* Club Header Section */}
                <div className="p-5 sm:p-6 bg-gradient-to-r from-slate-50/90 via-teal-50/30 to-white border-b border-slate-200">
                  <div className="flex flex-col lg:flex-row lg:items-center justify-between gap-4">
                    <div className="space-y-2">
                      <div className="flex flex-wrap items-center gap-2">
                        <span className="px-2.5 py-0.5 rounded-lg text-xs font-black bg-teal-800 text-white">
                          #{clubIdx + 1}
                        </span>
                        <span className="px-2.5 py-0.5 rounded-lg text-xs font-extrabold bg-teal-100 text-teal-900 border border-teal-200">
                          {getCategoryName(club.category)}
                        </span>
                        {club.room && (
                          <span className="inline-flex items-center gap-1 px-2.5 py-0.5 rounded-lg text-xs font-semibold bg-white text-slate-700 border border-slate-200">
                            <MapPin className="w-3 h-3 text-slate-400" />
                            <span>Xona: {club.room}</span>
                          </span>
                        )}
                        {club.timeStart && club.timeEnd && (
                          <span className="inline-flex items-center gap-1 px-2.5 py-0.5 rounded-lg text-xs font-semibold bg-white text-slate-700 border border-slate-200">
                            <Clock className="w-3 h-3 text-slate-400" />
                            <span>{club.timeStart} - {club.timeEnd}</span>
                          </span>
                        )}
                      </div>

                      <h2 className="text-xl sm:text-2xl font-black text-slate-900 tracking-tight">
                        «{club.name}» to‘garagi hisoboti
                      </h2>

                      <div className="flex flex-wrap items-center gap-x-4 gap-y-1 text-xs text-slate-600">
                        <div>
                          To‘garak rahbari:{' '}
                          <b className="text-slate-900 font-extrabold">{club.leaderName || 'Rahbar'}</b>
                          {club.faculty ? ` (${club.faculty})` : ''}
                        </div>
                        {club.description && (
                          <div className="text-slate-500 italic max-w-xl truncate">
                            «{club.description}»
                          </div>
                        )}
                      </div>
                    </div>

                    {/* Action: Download Club PDF Report */}
                    <div className="flex items-center gap-2 self-start lg:self-auto shrink-0">
                      <button
                        type="button"
                        onClick={() => handleDownloadClubPDF(club)}
                        disabled={downloadingClubId === club.id}
                        className="inline-flex items-center gap-2 px-4 py-2.5 rounded-xl bg-teal-700 hover:bg-teal-800 active:scale-98 text-white text-xs sm:text-sm font-bold transition-all shadow-md shadow-teal-700/20 cursor-pointer disabled:opacity-50"
                        title="Ushbu to‘garak hisobotini PDF yuklab olish"
                      >
                        <Download className="w-4 h-4" />
                        <span>
                          {downloadingClubId === club.id
                            ? 'Yuklanmoqda...'
                            : 'Hisobotni PDF yuklash'}
                        </span>
                      </button>
                    </div>
                  </div>

                  {/* Club Quick Stats Strip */}
                  <div className="grid grid-cols-2 sm:grid-cols-4 gap-2 sm:gap-3 mt-4 pt-4 border-t border-slate-200/80">
                    <div className="bg-white/80 p-2.5 rounded-xl border border-slate-200/80 text-center">
                      <div className="text-[11px] font-semibold text-slate-500">To‘garak a'zolari</div>
                      <div className="text-base font-black text-slate-900 mt-0.5">
                        {club.memberCount || 0} nafar
                      </div>
                    </div>
                    <div className="bg-white/80 p-2.5 rounded-xl border border-slate-200/80 text-center">
                      <div className="text-[11px] font-semibold text-slate-500">Darslar ijrosi</div>
                      <div className="text-base font-black text-teal-800 mt-0.5">
                        {heldSessions.length} / {clubSessions.length || 0} ta
                      </div>
                    </div>
                    <div className="bg-white/80 p-2.5 rounded-xl border border-slate-200/80 text-center">
                      <div className="text-[11px] font-semibold text-slate-500">Fotodalillar</div>
                      <div className="text-base font-black text-blue-700 mt-0.5">
                        {clubPhotosCount} ta fotosurat
                      </div>
                    </div>
                    <div className="bg-white/80 p-2.5 rounded-xl border border-slate-200/80 text-center">
                      <div className="text-[11px] font-semibold text-slate-500">Rasmiy hisobotlar</div>
                      <div className="text-base font-black text-amber-700 mt-0.5">
                        {clubReports.length} ta PDF/OAV
                      </div>
                    </div>
                  </div>
                </div>

                {/* Sub-tabs for the Club */}
                <div className="px-5 pt-3 border-b border-slate-100 flex items-center gap-2 bg-slate-50/50">
                  <button
                    type="button"
                    onClick={() =>
                      setActiveTabByClub((prev) => ({ ...prev, [club.id]: 'all' }))
                    }
                    className={`px-3 py-2 text-xs font-bold border-b-2 transition-all cursor-pointer ${
                      currentTab === 'all'
                        ? 'border-teal-700 text-teal-900'
                        : 'border-transparent text-slate-500 hover:text-slate-800'
                    }`}
                  >
                    Barcha hisobotlar ({heldSessions.length + clubReports.length})
                  </button>
                  <button
                    type="button"
                    onClick={() =>
                      setActiveTabByClub((prev) => ({ ...prev, [club.id]: 'held' }))
                    }
                    className={`px-3 py-2 text-xs font-bold border-b-2 transition-all cursor-pointer ${
                      currentTab === 'held'
                        ? 'border-teal-700 text-teal-900'
                        : 'border-transparent text-slate-500 hover:text-slate-800'
                    }`}
                  >
                    O‘tkazilgan darslar va fotodalillar ({heldSessions.length})
                  </button>
                  <button
                    type="button"
                    onClick={() =>
                      setActiveTabByClub((prev) => ({ ...prev, [club.id]: 'official' }))
                    }
                    className={`px-3 py-2 text-xs font-bold border-b-2 transition-all cursor-pointer ${
                      currentTab === 'official'
                        ? 'border-teal-700 text-teal-900'
                        : 'border-transparent text-slate-500 hover:text-slate-800'
                    }`}
                  >
                    Rasmiy PDF va OAV hisobotlari ({clubReports.length})
                  </button>
                </div>

                {/* Club Content Body */}
                <div className="p-5 sm:p-6 space-y-6">
                  {/* Section 1: Held Sessions with Photo Evidence */}
                  {(currentTab === 'all' || currentTab === 'held') && (
                    <div className="space-y-3">
                      <div className="flex items-center justify-between">
                        <h4 className="text-xs font-black uppercase tracking-wider text-slate-700 flex items-center gap-2">
                          <Camera className="w-4 h-4 text-teal-700" />
                          <span>1. O‘tkazilgan mashg‘ulotlar monitoringi va fotodalillari</span>
                        </h4>
                        <span className="text-xs font-bold text-slate-500">
                          {heldSessions.length} ta dars o‘tilgan
                        </span>
                      </div>

                      {heldSessions.length === 0 ? (
                        <div className="p-4 rounded-2xl bg-slate-50 border border-slate-200 text-center text-xs text-slate-400">
                          To‘garak bo‘yicha hali o‘tkazilgan darslar va fotodalillar yuklanmagan.
                        </div>
                      ) : (
                        <div className="grid grid-cols-1 md:grid-cols-2 gap-3.5">
                          {heldSessions.map((session) => (
                            <div
                              key={session.id}
                              className="p-4 rounded-2xl border border-slate-200 bg-white hover:border-teal-200 hover:shadow-xs transition-all space-y-2.5"
                            >
                              <div className="flex items-start justify-between gap-2">
                                <div>
                                  <div className="text-xs font-bold text-teal-800 flex items-center gap-1.5">
                                    <Calendar className="w-3.5 h-3.5" />
                                    <span>{fmtD(session.date)}</span>
                                    {session.location && (
                                      <span className="text-slate-400 font-normal">
                                        · {session.location}
                                      </span>
                                    )}
                                  </div>
                                  <div className="font-extrabold text-slate-900 text-sm mt-0.5">
                                    {session.topic || 'Mavzu kiritilmagan'}
                                  </div>
                                </div>
                                <span className="inline-flex items-center gap-1 px-2.5 py-0.5 rounded-full text-xs font-extrabold bg-emerald-100 text-emerald-900">
                                  <CheckCircle2 className="w-3 h-3 text-emerald-600" />
                                  <span>{session.attendeeCount || 0} nafar</span>
                                </span>
                              </div>

                              {session.heldNote && (
                                <p className="text-xs text-slate-600 bg-slate-50 p-2.5 rounded-xl border border-slate-100 leading-relaxed">
                                  «{session.heldNote}»
                                </p>
                              )}

                              {/* Photo Evidence */}
                              {session.photoFile && (
                                <div>
                                  <div className="text-[11px] font-bold text-slate-500 mb-1.5 flex items-center gap-1">
                                    <Camera className="w-3 h-3 text-blue-600" />
                                    <span>Fotodalil:</span>
                                  </div>
                                  <button
                                    type="button"
                                    onClick={() =>
                                      setPhotoModal({
                                        url: session.photoFile!.url,
                                        title: session.topic || club.name,
                                        subtitle: `${fmtD(session.date)} · ${session.photoFile!.name}`,
                                      })
                                    }
                                    className="relative group w-20 h-20 rounded-xl overflow-hidden border border-slate-200 hover:ring-2 hover:ring-teal-500 transition-all cursor-pointer shrink-0"
                                  >
                                    <img
                                      src={session.photoFile.url}
                                      alt="Dalil"
                                      className="w-full h-full object-cover group-hover:scale-110 transition-transform duration-200"
                                    />
                                    <div className="absolute inset-0 bg-black/20 group-hover:bg-transparent transition-colors" />
                                  </button>
                                </div>
                              )}
                            </div>
                          ))}
                        </div>
                      )}
                    </div>
                  )}

                  {/* Section 2: Official Reports (PDF and Social Media Links) */}
                  {(currentTab === 'all' || currentTab === 'official') && (
                    <div className="space-y-3">
                      <div className="flex items-center justify-between">
                        <h4 className="text-xs font-black uppercase tracking-wider text-slate-700 flex items-center gap-2">
                          <FileText className="w-4 h-4 text-amber-700" />
                          <span>2. Rasmiy hisobotlar, PDF hujjatlar va OAV e'lonlari</span>
                        </h4>
                        <span className="text-xs font-bold text-slate-500">
                          {clubReports.length} ta hisobot
                        </span>
                      </div>

                      {clubReports.length === 0 ? (
                        <div className="p-4 rounded-2xl bg-slate-50 border border-slate-200 text-center text-xs text-slate-400">
                          Ushbu to‘garak bo‘yicha hali rasmiy hisobot yoki PDF fayl yuklanmagan.
                        </div>
                      ) : (
                        <div className="overflow-x-auto rounded-2xl border border-slate-200">
                          <table className="w-full text-left text-sm">
                            <thead className="bg-slate-50 text-xs font-bold text-slate-500 uppercase border-b border-slate-200">
                              <tr>
                                <th className="px-4 py-3">Hisobot nomi</th>
                                <th className="px-4 py-3">Tegishli mavzu</th>
                                <th className="px-4 py-3">PDF Fayl</th>
                                <th className="px-4 py-3">OAV / Ijtimoiy tarmoq</th>
                                <th className="px-4 py-3 text-right">Sana</th>
                              </tr>
                            </thead>
                            <tbody className="divide-y divide-slate-100">
                              {clubReports.map((r) => (
                                <tr key={r.id} className="hover:bg-slate-50/60 transition-colors">
                                  <td className="px-4 py-3 font-bold text-slate-900">
                                    {r.title}
                                    {r.note && (
                                      <div className="text-xs text-slate-500 font-normal mt-0.5">
                                        {r.note}
                                      </div>
                                    )}
                                  </td>
                                  <td className="px-4 py-3 text-xs text-slate-600">
                                    {r.sessionTopic || 'Umumiy hisobot'}
                                  </td>
                                  <td className="px-4 py-3">
                                    {r.pdfFile ? (
                                      <a
                                        href={r.pdfFile.url}
                                        target="_blank"
                                        rel="noopener noreferrer"
                                        download={r.pdfFile.name}
                                        className="inline-flex items-center gap-1.5 px-3 py-1 rounded-lg text-xs font-bold text-blue-700 bg-blue-50 hover:bg-blue-100 border border-blue-200 transition-colors"
                                      >
                                        <FileText className="w-3.5 h-3.5" />
                                        <span>PDF ({r.pdfFile.name})</span>
                                      </a>
                                    ) : (
                                      <span className="text-xs text-slate-400">—</span>
                                    )}
                                  </td>
                                  <td className="px-4 py-3">
                                    {r.socialLink ? (
                                      <a
                                        href={r.socialLink}
                                        target="_blank"
                                        rel="noopener noreferrer"
                                        className="inline-flex items-center gap-1 text-xs font-bold text-sky-600 hover:text-sky-800 underline truncate max-w-xs"
                                      >
                                        <span className="truncate">{r.socialLink}</span>
                                        <ExternalLink className="w-3.5 h-3.5 shrink-0" />
                                      </a>
                                    ) : (
                                      <span className="text-xs text-slate-400">—</span>
                                    )}
                                  </td>
                                  <td className="px-4 py-3 text-right text-xs text-slate-400 whitespace-nowrap">
                                    {r.createdAt.slice(0, 10)}
                                  </td>
                                </tr>
                              ))}
                            </tbody>
                          </table>
                        </div>
                      )}
                    </div>
                  )}

                  {/* Section 3: Annual Report Summary (if submitted) */}
                  {annualRep && (
                    <div className="p-4 rounded-2xl bg-amber-50/60 border border-amber-200 text-xs text-amber-900 space-y-1.5">
                      <div className="flex items-center justify-between font-extrabold text-amber-950">
                        <span>Yillik yakuniy hisobot ({annualRep.academicYear})</span>
                        <span className="px-2 py-0.5 rounded-full text-[11px] bg-amber-200 text-amber-900">
                          {annualRep.status === 'approved' ? 'Tasdiqlangan' : 'Topshirilgan'}
                        </span>
                      </div>
                      <div className="text-amber-800">
                        Rejadagi darslar: <b>{annualRep.totalPlanned}</b> ta · O‘tkazilgan: <b>{annualRep.totalHeld}</b> ta ({annualRep.completionRate}%) · A'zolar: <b>{annualRep.totalMembers}</b> nafar
                      </div>
                      {annualRep.summary && (
                        <p className="italic text-amber-900/80 mt-1">«{annualRep.summary}»</p>
                      )}
                    </div>
                  )}
                </div>
              </div>
            );
          })}
        </div>
      )}

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
