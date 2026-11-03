import React, { useState, useMemo } from 'react';
import {
  Users,
  Plus,
  Trash2,
  Edit3,
  Search,
  Filter,
  GraduationCap,
  Download,
  Printer,
  UserCheck,
  Building2,
  Phone,
  Calendar,
  AlertTriangle,
  X,
  Check,
  Sparkles,
  FileText,
  Loader2,
} from 'lucide-react';
import { I18N, Language } from '../../lib/i18n';
import { storage, fmtD } from '../../lib/storage';
import { downloadMembersPDF } from '../../lib/pdf';
import { Membership, Club, User } from '../../types';
import { Modal } from '../common/Modal';

interface ClubMembersTableViewProps {
  currentUser: User;
  clubs: Club[];
  memberships: Membership[];
  lang: Language;
  showToast?: (msg: string, type?: 'ok' | 'err') => void;
  onRefresh?: () => void;
  initialClubId?: string;
  isLeaderView?: boolean;
}

export const ClubMembersTableView: React.FC<ClubMembersTableViewProps> = ({
  currentUser,
  clubs,
  memberships,
  lang,
  showToast,
  onRefresh,
  initialClubId = '',
  isLeaderView = false,
}) => {
  const t = I18N[lang];
  const [selectedClubId, setSelectedClubId] = useState<string>(initialClubId);
  const [searchQuery, setSearchQuery] = useState<string>('');
  const [selectedGroup, setSelectedGroup] = useState<string>('');

  // Add Member Modal State
  const [isAddOpen, setIsAddOpen] = useState(false);
  const [addClubId, setAddClubId] = useState<string>(initialClubId || clubs[0]?.id || '');
  const [addStudentName, setAddStudentName] = useState('');
  const [addGroupName, setAddGroupName] = useState('');
  const [addTutorName, setAddTutorName] = useState('');
  const [addFaculty, setAddFaculty] = useState(currentUser.faculty || 'Ingliz tili fakulteti');
  const [addPhone, setAddPhone] = useState('');
  const [addNote, setAddNote] = useState('');

  // Edit Member Modal State
  const [isEditOpen, setIsEditOpen] = useState(false);
  const [editMembershipId, setEditMembershipId] = useState<string>('');
  const [editClubId, setEditClubId] = useState<string>('');
  const [editStudentName, setEditStudentName] = useState('');
  const [editGroupName, setEditGroupName] = useState('');
  const [editTutorName, setEditTutorName] = useState('');
  const [editFaculty, setEditFaculty] = useState('');
  const [editPhone, setEditPhone] = useState('');
  const [editNote, setEditNote] = useState('');

  // Delete Confirmation Modal State
  const [isDeleteOpen, setIsDeleteOpen] = useState(false);
  const [memberToDelete, setMemberToDelete] = useState<Membership | null>(null);
  const [isDeleting, setIsDeleting] = useState(false);
  const [locallyDeletedIds, setLocallyDeletedIds] = useState<Set<string>>(() => new Set());

  // PDF Exporting state
  const [isExportingPDF, setIsExportingPDF] = useState(false);

  // Unique list of groups for quick filter
  const groupOptions = useMemo(() => {
    const set = new Set<string>();
    memberships.forEach((m) => {
      if (m.studentGroup && m.studentGroup !== '—') set.add(m.studentGroup);
    });
    return Array.from(set).sort();
  }, [memberships]);

  // Filtered members
  const filteredMembers = useMemo(() => {
    return memberships.filter((m) => {
      if (locallyDeletedIds.has(m.id)) return false;
      if (selectedClubId && m.clubId !== selectedClubId) return false;
      if (selectedGroup && m.studentGroup !== selectedGroup) return false;

      if (searchQuery.trim()) {
        const q = searchQuery.toLowerCase().trim();
        const nameMatch = (m.studentName || '').toLowerCase().includes(q);
        const groupMatch = (m.studentGroup || '').toLowerCase().includes(q);
        const tutorMatch = (m.tutorName || '').toLowerCase().includes(q);
        const clubMatch = (m.clubName || '').toLowerCase().includes(q);
        const facultyMatch = (m.studentFaculty || '').toLowerCase().includes(q);
        const phoneMatch = (m.phoneOrTelegram || '').toLowerCase().includes(q);
        if (!nameMatch && !groupMatch && !tutorMatch && !clubMatch && !facultyMatch && !phoneMatch) {
          return false;
        }
      }

      return true;
    });
  }, [memberships, selectedClubId, selectedGroup, searchQuery]);

  // Statistics
  const totalCount = memberships.length;
  const filteredCount = filteredMembers.length;
  const uniqueGroupsCount = useMemo(() => {
    const s = new Set(filteredMembers.map((m) => m.studentGroup).filter(Boolean));
    return s.size;
  }, [filteredMembers]);
  const uniqueTutorsCount = useMemo(() => {
    const s = new Set(filteredMembers.map((m) => m.tutorName).filter(Boolean));
    return s.size;
  }, [filteredMembers]);

  // Add Handler
  const handleOpenAdd = () => {
    if (clubs.length === 0) {
      if (showToast) showToast('Aʼzo qo‘shishdan oldin kamida bitta to‘garak mavjud bo‘lishi kerak', 'err');
      return;
    }
    setAddClubId(selectedClubId || clubs[0]?.id || '');
    setAddStudentName('');
    setAddGroupName('');
    setAddTutorName('');
    setAddFaculty(currentUser.faculty || 'Ingliz tili fakulteti');
    setAddPhone('');
    setAddNote('');
    setIsAddOpen(true);
  };

  const handleSaveAdd = (e: React.FormEvent) => {
    e.preventDefault();
    if (!addStudentName.trim()) {
      if (showToast) showToast('Talabaning ism-familiyasi kiritilishi shart', 'err');
      return;
    }
    if (!addGroupName.trim()) {
      if (showToast) showToast('Talabaning guruhi kiritilishi shart', 'err');
      return;
    }
    if (!addTutorName.trim()) {
      if (showToast) showToast('Tutorining ism-familiyasi kiritilishi shart', 'err');
      return;
    }
    if (!addClubId) {
      if (showToast) showToast('Iltimos, to‘garakni tanlang', 'err');
      return;
    }

    try {
      storage.addMembershipManually({
        clubId: addClubId,
        studentName: addStudentName.trim(),
        studentGroup: addGroupName.trim(),
        tutorName: addTutorName.trim(),
        studentFaculty: addFaculty.trim(),
        phoneOrTelegram: addPhone.trim(),
        note: addNote.trim(),
        status: 'approved',
      });

      if (showToast) showToast(`«${addStudentName.trim()}» to‘garak a’zolari ro‘yxatiga muvaffaqiyatli qo‘shildi!`, 'ok');
      setIsAddOpen(false);
      if (onRefresh) onRefresh();
    } catch (err: unknown) {
      const msg = err instanceof Error ? err.message : 'Xatolik yuz berdi';
      if (showToast) showToast(msg, 'err');
    }
  };

  // Edit Handler
  const handleOpenEdit = (m: Membership) => {
    setEditMembershipId(m.id);
    setEditClubId(m.clubId);
    setEditStudentName(m.studentName || '');
    setEditGroupName(m.studentGroup || '');
    setEditTutorName(m.tutorName || '');
    setEditFaculty(m.studentFaculty || '');
    setEditPhone(m.phoneOrTelegram || '');
    setEditNote(m.note || '');
    setIsEditOpen(true);
  };

  const handleSaveEdit = (e: React.FormEvent) => {
    e.preventDefault();
    if (!editStudentName.trim()) {
      if (showToast) showToast('Talabaning ism-familiyasi kiritilishi shart', 'err');
      return;
    }
    if (!editGroupName.trim()) {
      if (showToast) showToast('Talabaning guruhi kiritilishi shart', 'err');
      return;
    }
    if (!editTutorName.trim()) {
      if (showToast) showToast('Tutorining ism-familiyasi kiritilishi shart', 'err');
      return;
    }

    try {
      storage.updateMembership(editMembershipId, {
        clubId: editClubId,
        studentName: editStudentName.trim(),
        studentGroup: editGroupName.trim(),
        tutorName: editTutorName.trim(),
        studentFaculty: editFaculty.trim(),
        phoneOrTelegram: editPhone.trim(),
        note: editNote.trim(),
      });

      if (showToast) showToast('A’zo ma’lumotlari muvaffaqiyatli yangilandi!', 'ok');
      setIsEditOpen(false);
      if (onRefresh) onRefresh();
    } catch (err: unknown) {
      const msg = err instanceof Error ? err.message : 'Xatolik yuz berdi';
      if (showToast) showToast(msg, 'err');
    }
  };

  // Delete Handler
  const handleOpenDelete = (m: Membership) => {
    setMemberToDelete(m);
    setIsDeleteOpen(true);
  };

  const handleConfirmDelete = async () => {
    if (!memberToDelete || isDeleting) return;
    setIsDeleting(true);
    const idToDelete = memberToDelete.id;
    const name = memberToDelete.studentName || 'A’zo';
    try {
      // Instantly track in component state
      setLocallyDeletedIds((prev) => new Set(prev).add(idToDelete));

      const success = await storage.deleteMembership(idToDelete);
      if (!success) {
        setLocallyDeletedIds((prev) => {
          const next = new Set(prev);
          next.delete(idToDelete);
          return next;
        });
        if (showToast) showToast('O‘chirish amalga oshmadi. Qayta urinib ko‘ring.', 'err');
        return;
      }

      setIsDeleteOpen(false);
      setMemberToDelete(null);
      if (showToast) showToast(`«${name}» to‘garak a’zolari ro‘yxatidan butunlay o‘chirildi!`, 'ok');
      if (onRefresh) onRefresh();
    } catch (err: unknown) {
      setLocallyDeletedIds((prev) => {
        const next = new Set(prev);
        next.delete(idToDelete);
        return next;
      });
      const msg = err instanceof Error ? err.message : 'O‘chirishda xatolik yuz berdi';
      if (showToast) showToast(msg, 'err');
    } finally {
      setIsDeleting(false);
    }
  };

  // Export to CSV
  const handleExportCSV = () => {
    if (filteredMembers.length === 0) {
      if (showToast) showToast('Eksport qilish uchun ma’lumotlar mavjud emas', 'err');
      return;
    }

    const headers = ['#', 'F.I.SH. (Talaba)', 'Guruhi', 'Tutori (F.I.SH.)', 'To‘garak', 'Fakulteti', 'Telefon/Telegram', 'Qo‘shilgan sana'];
    const rows = filteredMembers.map((m, idx) => [
      idx + 1,
      `"${(m.studentName || '').replace(/"/g, '""')}"`,
      `"${(m.studentGroup || '').replace(/"/g, '""')}"`,
      `"${(m.tutorName || '').replace(/"/g, '""')}"`,
      `"${(m.clubName || '').replace(/"/g, '""')}"`,
      `"${(m.studentFaculty || '').replace(/"/g, '""')}"`,
      `"${(m.phoneOrTelegram || '').replace(/"/g, '""')}"`,
      fmtD(m.createdAt),
    ]);

    const csvContent = '\uFEFF' + [headers.join(','), ...rows.map((r) => r.join(','))].join('\n');
    const blob = new Blob([csvContent], { type: 'text/csv;charset=utf-8;' });
    const url = URL.createObjectURL(blob);
    const link = document.createElement('a');
    link.setAttribute('href', url);
    link.setAttribute('download', `Togarak_Azolari_${new Date().toISOString().slice(0, 10)}.csv`);
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
    URL.revokeObjectURL(url);

    if (showToast) showToast('To‘garak a’zolari ro‘yxati CSV (Excel) formatida yuklab olindi!', 'ok');
  };

  // Export to PDF
  const handleExportPDF = async () => {
    if (filteredMembers.length === 0) {
      if (showToast) showToast('PDF yaratish uchun ro‘yxatda a’zolar mavjud emas', 'err');
      return;
    }

    try {
      setIsExportingPDF(true);
      if (showToast) showToast('To‘garak a’zolari ro‘yxati PDF hujjati shakllantirilmoqda, iltimos kuting...', 'ok');

      const currentClub = clubs.find((c) => c.id === selectedClubId);
      await downloadMembersPDF(filteredMembers, {
        clubName: currentClub ? currentClub.name : undefined,
        leaderName: currentClub ? currentClub.leaderName : currentUser.role === 'leader' ? currentUser.fullName : undefined,
        faculty: currentClub?.faculty || currentUser.faculty || undefined,
        filterGroup: selectedGroup || undefined,
        searchQuery: searchQuery || undefined,
        lang,
      });

      if (showToast) showToast('To‘garak a’zolari ro‘yxati PDF formatida muvaffaqiyatli yuklab olindi!', 'ok');
    } catch (err: unknown) {
      console.error('PDF export failed:', err);
      if (showToast) showToast('PDF hujjat yaratishda xatolik yuz berdi. Iltimos qaytadan urinib ko‘ring.', 'err');
    } finally {
      setIsExportingPDF(false);
    }
  };

  // Print
  const handlePrint = () => {
    window.print();
  };

  return (
    <div className="space-y-6">
      {/* Top Banner & Main Actions */}
      <div className="flex flex-col md:flex-row md:items-center justify-between gap-4">
        <div>
          <div className="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-blue-100 text-blue-800 text-xs font-bold mb-2">
            <Users className="w-3.5 h-3.5" />
            <span>5 muhim tashabbus to‘garaklari nazorati</span>
          </div>
          <h1 className="text-2xl sm:text-3xl font-black text-slate-900 tracking-tight flex items-center gap-3">
            <span>To‘garak a’zolari jadvali</span>
          </h1>
          <p className="text-sm text-slate-500 mt-1 max-w-2xl">
            To‘garak rahbari tomonidan kiritilgan barcha a’zolar, ularning o‘quv guruhi va biriktirilgan tutorlari ro‘yxati. Ushbu ma’lumotlar real vaqt rejimida bosh administrator va to‘garak rahbarida aks etadi.
          </p>
        </div>

        {/* Action Buttons */}
        <div className="flex flex-wrap items-center gap-2">
          {/* PDF Download Button */}
          <button
            type="button"
            onClick={handleExportPDF}
            disabled={isExportingPDF}
            className="inline-flex items-center gap-2 px-3.5 py-2.5 rounded-xl border border-red-200 bg-red-50 hover:bg-red-100 text-red-700 text-xs font-extrabold transition-all shadow-2xs cursor-pointer disabled:opacity-60 disabled:cursor-not-allowed"
            title="To‘garak a’zolari ro‘yxatini rasmiy PDF formatida yuklab olish"
          >
            {isExportingPDF ? (
              <Loader2 className="w-4 h-4 text-red-600 animate-spin" />
            ) : (
              <FileText className="w-4 h-4 text-red-600" />
            )}
            <span>{isExportingPDF ? 'PDF yaratilmoqda...' : 'PDF yuklab olish'}</span>
          </button>

          {/* Excel / CSV Button */}
          <button
            type="button"
            onClick={handleExportCSV}
            className="inline-flex items-center gap-1.5 px-3.5 py-2.5 rounded-xl border border-slate-200 bg-white hover:bg-slate-50 text-slate-700 text-xs font-bold transition-all shadow-2xs cursor-pointer"
            title="Excel formatida yuklab olish"
          >
            <Download className="w-3.5 h-3.5 text-emerald-600" />
            <span>Excel (CSV)</span>
          </button>

          <button
            type="button"
            onClick={handlePrint}
            className="inline-flex items-center gap-1.5 px-3.5 py-2.5 rounded-xl border border-slate-200 bg-white hover:bg-slate-50 text-slate-700 text-xs font-bold transition-all shadow-2xs cursor-pointer"
            title="Chop etish"
          >
            <Printer className="w-3.5 h-3.5 text-slate-600" />
            <span>Chop etish</span>
          </button>

          <button
            type="button"
            onClick={handleOpenAdd}
            className="inline-flex items-center gap-2 px-4 py-2.5 rounded-xl bg-gradient-to-r from-blue-600 to-indigo-600 hover:from-blue-700 hover:to-indigo-700 text-white text-xs font-extrabold transition-all shadow-md shadow-blue-500/20 active:scale-98 cursor-pointer"
          >
            <Plus className="w-4 h-4" />
            <span>+ Yangi a’zo qo‘shish</span>
          </button>
        </div>
      </div>

      {/* Top Statistics Badges */}
      <div className="grid grid-cols-2 sm:grid-cols-4 gap-3 sm:gap-4">
        <div className="p-4 rounded-2xl bg-white border border-slate-200/80 shadow-2xs">
          <div className="flex items-center justify-between text-slate-500 mb-1">
            <span className="text-xs font-bold uppercase tracking-wider">Jami a’zolar</span>
            <Users className="w-4 h-4 text-blue-600" />
          </div>
          <div className="text-2xl font-black text-slate-900">{totalCount}</div>
          <p className="text-[11px] text-slate-400 mt-0.5">Ro‘yxatga olingan talabalar</p>
        </div>

        <div className="p-4 rounded-2xl bg-white border border-slate-200/80 shadow-2xs">
          <div className="flex items-center justify-between text-slate-500 mb-1">
            <span className="text-xs font-bold uppercase tracking-wider">Guruhlar soni</span>
            <Building2 className="w-4 h-4 text-indigo-600" />
          </div>
          <div className="text-2xl font-black text-indigo-700">{uniqueGroupsCount}</div>
          <p className="text-[11px] text-slate-400 mt-0.5">Qamrab olingan akademik guruh</p>
        </div>

        <div className="p-4 rounded-2xl bg-white border border-slate-200/80 shadow-2xs">
          <div className="flex items-center justify-between text-slate-500 mb-1">
            <span className="text-xs font-bold uppercase tracking-wider">Tutorlar</span>
            <GraduationCap className="w-4 h-4 text-purple-600" />
          </div>
          <div className="text-2xl font-black text-purple-700">{uniqueTutorsCount}</div>
          <p className="text-[11px] text-slate-400 mt-0.5">Biriktirilgan mas’ul tutorlar</p>
        </div>

        <div className="p-4 rounded-2xl bg-white border border-slate-200/80 shadow-2xs">
          <div className="flex items-center justify-between text-slate-500 mb-1">
            <span className="text-xs font-bold uppercase tracking-wider">To‘garaklar</span>
            <Sparkles className="w-4 h-4 text-amber-500" />
          </div>
          <div className="text-2xl font-black text-slate-900">{clubs.length}</div>
          <p className="text-[11px] text-slate-400 mt-0.5">Faoliyat yuritayotgan to‘garaklar</p>
        </div>
      </div>

      {/* Filter and Search Bar */}
      <div className="p-4 rounded-2xl bg-white border border-slate-200/80 shadow-xs flex flex-col md:flex-row items-stretch md:items-center justify-between gap-3">
        {/* Search */}
        <div className="relative flex-1">
          <Search className="w-4 h-4 text-slate-400 absolute left-3.5 top-1/2 -translate-y-1/2" />
          <input
            type="text"
            value={searchQuery}
            onChange={(e) => setSearchQuery(e.target.value)}
            placeholder="Ism-familiya, guruh, tutor yoki to‘garak nomi bo‘yicha qidirish..."
            className="w-full pl-9 pr-8 py-2 rounded-xl border border-slate-200 text-xs font-semibold text-slate-800 placeholder-slate-400 focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-500 transition-colors"
          />
          {searchQuery && (
            <button
              type="button"
              onClick={() => setSearchQuery('')}
              className="absolute right-2.5 top-1/2 -translate-y-1/2 text-slate-400 hover:text-slate-600"
            >
              <X className="w-3.5 h-3.5" />
            </button>
          )}
        </div>

        {/* Filters */}
        <div className="flex flex-wrap items-center gap-2">
          {/* Club Filter */}
          <div className="inline-flex items-center gap-1.5 px-3 py-1.5 rounded-xl border border-slate-200 bg-slate-50 text-xs font-semibold text-slate-700">
            <Filter className="w-3.5 h-3.5 text-slate-400" />
            <select
              value={selectedClubId}
              onChange={(e) => setSelectedClubId(e.target.value)}
              className="bg-transparent focus:outline-none font-bold text-slate-800 cursor-pointer"
            >
              <option value="">Barcha to‘garaklar ({clubs.length})</option>
              {clubs.map((c) => (
                <option key={c.id} value={c.id}>
                  {c.name}
                </option>
              ))}
            </select>
          </div>

          {/* Group Filter */}
          {groupOptions.length > 0 && (
            <div className="inline-flex items-center gap-1.5 px-3 py-1.5 rounded-xl border border-slate-200 bg-slate-50 text-xs font-semibold text-slate-700">
              <Building2 className="w-3.5 h-3.5 text-slate-400" />
              <select
                value={selectedGroup}
                onChange={(e) => setSelectedGroup(e.target.value)}
                className="bg-transparent focus:outline-none font-bold text-slate-800 cursor-pointer"
              >
                <option value="">Barcha guruhlar ({groupOptions.length})</option>
                {groupOptions.map((g) => (
                  <option key={g} value={g}>
                    {g}
                  </option>
                ))}
              </select>
            </div>
          )}

          {(selectedClubId || selectedGroup || searchQuery) && (
            <button
              type="button"
              onClick={() => {
                setSelectedClubId('');
                setSelectedGroup('');
                setSearchQuery('');
              }}
              className="px-2.5 py-1.5 rounded-xl border border-rose-200 bg-rose-50 text-rose-700 text-xs font-bold hover:bg-rose-100 transition-colors"
            >
              Tozalash
            </button>
          )}
        </div>
      </div>

      {/* Main Table */}
      <div className="bg-white rounded-2xl border border-slate-200 overflow-hidden shadow-xs">
        <div className="px-5 py-3.5 bg-slate-50/70 border-b border-slate-100 flex items-center justify-between text-xs text-slate-500 font-bold">
          <div className="flex items-center gap-3">
            <span>
              Jami topilgan: <strong className="text-slate-900">{filteredCount}</strong> ta a’zo
            </span>
            {filteredCount > 0 && (
              <button
                type="button"
                onClick={handleExportPDF}
                disabled={isExportingPDF}
                className="hidden sm:inline-flex items-center gap-1 px-2.5 py-1 rounded-lg bg-red-100/70 hover:bg-red-200/70 text-red-700 text-[11px] font-bold transition-colors cursor-pointer disabled:opacity-50"
                title="Ro‘yxatni PDF formatida yuklab olish"
              >
                <FileText className="w-3 h-3 text-red-600" />
                <span>PDF ({filteredCount})</span>
              </button>
            )}
          </div>
          {isLeaderView && (
            <span className="text-blue-600 font-semibold">
              To‘garak rahbari boshqaruvi
            </span>
          )}
        </div>

        <div className="overflow-x-auto">
          <table className="w-full text-left text-sm">
            <thead className="bg-slate-50 text-[11px] font-extrabold text-slate-500 uppercase tracking-wider border-b border-slate-200">
              <tr>
                <th className="px-4 py-3.5 w-12 text-center">#</th>
                <th className="px-5 py-3.5 min-w-[200px]">F.I.SH. (To‘garak a’zosi)</th>
                <th className="px-4 py-3.5 min-w-[130px]">Guruhi</th>
                <th className="px-4 py-3.5 min-w-[190px]">Tutori (F.I.SH.)</th>
                <th className="px-4 py-3.5 min-w-[160px]">To‘garak nomi</th>
                <th className="px-4 py-3.5 min-w-[150px]">Fakulteti</th>
                <th className="px-4 py-3.5 min-w-[130px]">Aloqa (Tel/TG)</th>
                <th className="px-4 py-3.5 min-w-[100px]">Qo‘shilgan</th>
                <th className="px-4 py-3.5 text-right w-24">Amallar</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-100">
              {filteredMembers.length === 0 ? (
                <tr>
                  <td colSpan={9} className="px-5 py-12 text-center">
                    <div className="max-w-sm mx-auto flex flex-col items-center">
                      <div className="w-12 h-12 rounded-2xl bg-slate-100 flex items-center justify-center text-slate-400 mb-3">
                        <Users className="w-6 h-6" />
                      </div>
                      <h4 className="text-sm font-bold text-slate-700">Hozircha to‘garak a’zolari mavjud emas</h4>
                      <p className="text-xs text-slate-500 mt-1 mb-4">
                        To‘garak a’zolarini qo‘shish uchun yuqoridagi tugmadan foydalaning.
                      </p>
                      <button
                        type="button"
                        onClick={handleOpenAdd}
                        className="inline-flex items-center gap-1.5 px-4 py-2 rounded-xl bg-blue-600 text-white text-xs font-bold shadow-xs hover:bg-blue-700"
                      >
                        <Plus className="w-3.5 h-3.5" />
                        <span>Birinchi a’zoni qo‘shish</span>
                      </button>
                    </div>
                  </td>
                </tr>
              ) : (
                filteredMembers.map((m, index) => {
                  return (
                    <tr key={m.id} className="hover:bg-slate-50/70 transition-colors">
                      {/* # */}
                      <td className="px-4 py-3.5 text-center font-bold text-slate-400 text-xs">
                        {index + 1}
                      </td>

                      {/* F.I.SH. (Talaba) */}
                      <td className="px-5 py-3.5">
                        <div className="flex items-center gap-2.5">
                          <div className="w-8 h-8 rounded-full bg-blue-50 border border-blue-200 text-blue-700 font-bold text-xs flex items-center justify-center shrink-0">
                            {m.studentName ? m.studentName.charAt(0).toUpperCase() : 'A'}
                          </div>
                          <div>
                            <div className="font-extrabold text-slate-900 leading-tight">
                              {m.studentName || 'Ismsiz a’zo'}
                            </div>
                            {m.note && (
                              <div className="text-[11px] text-slate-500 mt-0.5 italic line-clamp-1">
                                {m.note}
                              </div>
                            )}
                          </div>
                        </div>
                      </td>

                      {/* Guruhi */}
                      <td className="px-4 py-3.5">
                        <span className="inline-flex items-center gap-1 px-2.5 py-1 rounded-lg bg-indigo-50 border border-indigo-200/80 text-indigo-700 text-xs font-extrabold">
                          <Building2 className="w-3 h-3 text-indigo-500 shrink-0" />
                          <span>{m.studentGroup || '—'}</span>
                        </span>
                      </td>

                      {/* Tutori (F.I.SH.) */}
                      <td className="px-4 py-3.5">
                        <div className="flex items-center gap-1.5 text-xs font-bold text-slate-800">
                          <GraduationCap className="w-3.5 h-3.5 text-purple-600 shrink-0" />
                          <span>{m.tutorName || '—'}</span>
                        </div>
                      </td>

                      {/* To‘garak nomi */}
                      <td className="px-4 py-3.5">
                        <span className="inline-flex items-center px-2.5 py-1 rounded-lg bg-slate-100 text-slate-800 text-xs font-bold">
                          {m.clubName || 'To‘garak'}
                        </span>
                      </td>

                      {/* Fakulteti */}
                      <td className="px-4 py-3.5 text-xs text-slate-600 font-medium">
                        {m.studentFaculty || '—'}
                      </td>

                      {/* Aloqa */}
                      <td className="px-4 py-3.5 text-xs">
                        {m.phoneOrTelegram ? (
                          <span className="inline-flex items-center gap-1 text-blue-700 font-semibold">
                            <Phone className="w-3 h-3 text-blue-500" />
                            <span>{m.phoneOrTelegram}</span>
                          </span>
                        ) : (
                          <span className="text-slate-400">—</span>
                        )}
                      </td>

                      {/* Qo‘shilgan sana */}
                      <td className="px-4 py-3.5 text-xs text-slate-500 font-semibold whitespace-nowrap">
                        {fmtD(m.createdAt)}
                      </td>

                      {/* Amallar */}
                      <td className="px-4 py-3.5 text-right whitespace-nowrap">
                        <div className="flex items-center justify-end gap-1">
                          <button
                            type="button"
                            onClick={() => handleOpenEdit(m)}
                            className="p-1.5 rounded-lg text-slate-500 hover:text-blue-600 hover:bg-blue-50 transition-colors cursor-pointer"
                            title="Tahrirlash"
                          >
                            <Edit3 className="w-4 h-4" />
                          </button>
                          <button
                            type="button"
                            onClick={() => handleOpenDelete(m)}
                            className="p-1.5 rounded-lg text-slate-400 hover:text-rose-600 hover:bg-rose-50 transition-colors cursor-pointer"
                            title="O‘chirish"
                          >
                            <Trash2 className="w-4 h-4" />
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

      {/* Add Member Modal */}
      <Modal
        isOpen={isAddOpen}
        onClose={() => setIsAddOpen(false)}
        title="Yangi to‘garak a’zosini qo‘shish"
      >
        <form onSubmit={handleSaveAdd} className="space-y-4">
          <div>
            <label className="block text-xs font-bold text-slate-700 mb-1">
              To‘garakni tanlang <span className="text-rose-500">*</span>
            </label>
            <select
              value={addClubId}
              onChange={(e) => setAddClubId(e.target.value)}
              required
              className="w-full px-3.5 py-2.5 rounded-xl border border-slate-200 text-sm font-semibold text-slate-800 bg-white focus:outline-none focus:ring-2 focus:ring-blue-500/20"
            >
              {clubs.map((c) => (
                <option key={c.id} value={c.id}>
                  {c.name} ({c.faculty})
                </option>
              ))}
            </select>
          </div>

          <div>
            <label className="block text-xs font-bold text-slate-700 mb-1">
              Talabaning F.I.SH. (Ism, familiya va sharifi) <span className="text-rose-500">*</span>
            </label>
            <input
              type="text"
              required
              value={addStudentName}
              onChange={(e) => setAddStudentName(e.target.value)}
              placeholder="Masalan: Azizov Jamshid Erkin o‘g‘li"
              className="w-full px-3.5 py-2.5 rounded-xl border border-slate-200 text-sm font-medium focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-500"
            />
          </div>

          <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
            <div>
              <label className="block text-xs font-bold text-slate-700 mb-1">
                Guruhi <span className="text-rose-500">*</span>
              </label>
              <input
                type="text"
                required
                value={addGroupName}
                onChange={(e) => setAddGroupName(e.target.value)}
                placeholder="Masalan: 21-04-guruh"
                className="w-full px-3.5 py-2.5 rounded-xl border border-slate-200 text-sm font-medium focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-500"
              />
            </div>

            <div>
              <label className="block text-xs font-bold text-slate-700 mb-1">
                Tutorining F.I.SH. <span className="text-rose-500">*</span>
              </label>
              <input
                type="text"
                required
                value={addTutorName}
                onChange={(e) => setAddTutorName(e.target.value)}
                placeholder="Masalan: Karimov Olimjon B."
                className="w-full px-3.5 py-2.5 rounded-xl border border-slate-200 text-sm font-medium focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-500"
              />
            </div>
          </div>

          <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
            <div>
              <label className="block text-xs font-bold text-slate-700 mb-1">
                Fakulteti
              </label>
              <input
                type="text"
                value={addFaculty}
                onChange={(e) => setAddFaculty(e.target.value)}
                placeholder="Masalan: Ingliz tili fakulteti"
                className="w-full px-3.5 py-2.5 rounded-xl border border-slate-200 text-sm font-medium focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-500"
              />
            </div>

            <div>
              <label className="block text-xs font-bold text-slate-700 mb-1">
                Telefon raqami yoki Telegram
              </label>
              <input
                type="text"
                value={addPhone}
                onChange={(e) => setAddPhone(e.target.value)}
                placeholder="+998 90 123 45 67 yoki @username"
                className="w-full px-3.5 py-2.5 rounded-xl border border-slate-200 text-sm font-medium focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-500"
              />
            </div>
          </div>

          <div>
            <label className="block text-xs font-bold text-slate-700 mb-1">
              Qo‘shimcha izoh (ixtiyoriy)
            </label>
            <textarea
              rows={2}
              value={addNote}
              onChange={(e) => setAddNote(e.target.value)}
              placeholder="Qo‘shimcha ma’lumot yoki tavsif..."
              className="w-full px-3.5 py-2 rounded-xl border border-slate-200 text-sm font-medium focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-500"
            />
          </div>

          <div className="flex justify-end gap-2 pt-2 border-t border-slate-100">
            <button
              type="button"
              onClick={() => setIsAddOpen(false)}
              className="px-4 py-2.5 rounded-xl border border-slate-200 text-xs font-bold text-slate-600 hover:bg-slate-50 transition-colors"
            >
              Bekor qilish
            </button>
            <button
              type="submit"
              className="px-5 py-2.5 rounded-xl bg-blue-600 hover:bg-blue-700 text-white text-xs font-bold transition-all shadow-sm cursor-pointer"
            >
              A’zoni saqlash
            </button>
          </div>
        </form>
      </Modal>

      {/* Edit Member Modal */}
      <Modal
        isOpen={isEditOpen}
        onClose={() => setIsEditOpen(false)}
        title="To‘garak a’zosi ma’lumotlarini tahrirlash"
      >
        <form onSubmit={handleSaveEdit} className="space-y-4">
          <div>
            <label className="block text-xs font-bold text-slate-700 mb-1">
              To‘garak
            </label>
            <select
              value={editClubId}
              onChange={(e) => setEditClubId(e.target.value)}
              required
              className="w-full px-3.5 py-2.5 rounded-xl border border-slate-200 text-sm font-semibold text-slate-800 bg-white focus:outline-none focus:ring-2 focus:ring-blue-500/20"
            >
              {clubs.map((c) => (
                <option key={c.id} value={c.id}>
                  {c.name} ({c.faculty})
                </option>
              ))}
            </select>
          </div>

          <div>
            <label className="block text-xs font-bold text-slate-700 mb-1">
              Talabaning F.I.SH. <span className="text-rose-500">*</span>
            </label>
            <input
              type="text"
              required
              value={editStudentName}
              onChange={(e) => setEditStudentName(e.target.value)}
              className="w-full px-3.5 py-2.5 rounded-xl border border-slate-200 text-sm font-medium focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-500"
            />
          </div>

          <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
            <div>
              <label className="block text-xs font-bold text-slate-700 mb-1">
                Guruhi <span className="text-rose-500">*</span>
              </label>
              <input
                type="text"
                required
                value={editGroupName}
                onChange={(e) => setEditGroupName(e.target.value)}
                className="w-full px-3.5 py-2.5 rounded-xl border border-slate-200 text-sm font-medium focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-500"
              />
            </div>

            <div>
              <label className="block text-xs font-bold text-slate-700 mb-1">
                Tutorining F.I.SH. <span className="text-rose-500">*</span>
              </label>
              <input
                type="text"
                required
                value={editTutorName}
                onChange={(e) => setEditTutorName(e.target.value)}
                className="w-full px-3.5 py-2.5 rounded-xl border border-slate-200 text-sm font-medium focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-500"
              />
            </div>
          </div>

          <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
            <div>
              <label className="block text-xs font-bold text-slate-700 mb-1">
                Fakulteti
              </label>
              <input
                type="text"
                value={editFaculty}
                onChange={(e) => setEditFaculty(e.target.value)}
                className="w-full px-3.5 py-2.5 rounded-xl border border-slate-200 text-sm font-medium focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-500"
              />
            </div>

            <div>
              <label className="block text-xs font-bold text-slate-700 mb-1">
                Telefon / Telegram
              </label>
              <input
                type="text"
                value={editPhone}
                onChange={(e) => setEditPhone(e.target.value)}
                className="w-full px-3.5 py-2.5 rounded-xl border border-slate-200 text-sm font-medium focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-500"
              />
            </div>
          </div>

          <div>
            <label className="block text-xs font-bold text-slate-700 mb-1">
              Izoh
            </label>
            <textarea
              rows={2}
              value={editNote}
              onChange={(e) => setEditNote(e.target.value)}
              className="w-full px-3.5 py-2 rounded-xl border border-slate-200 text-sm font-medium focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-500"
            />
          </div>

          <div className="flex justify-end gap-2 pt-2 border-t border-slate-100">
            <button
              type="button"
              onClick={() => setIsEditOpen(false)}
              className="px-4 py-2.5 rounded-xl border border-slate-200 text-xs font-bold text-slate-600 hover:bg-slate-50 transition-colors"
            >
              Bekor qilish
            </button>
            <button
              type="submit"
              className="px-5 py-2.5 rounded-xl bg-blue-600 hover:bg-blue-700 text-white text-xs font-bold transition-all shadow-sm cursor-pointer"
            >
              O‘zgarishlarni saqlash
            </button>
          </div>
        </form>
      </Modal>

      {/* Delete Confirmation Modal */}
      <Modal
        isOpen={isDeleteOpen}
        onClose={() => setIsDeleteOpen(false)}
        title="A’zoni ro‘yxatdan butunlay o‘chirish"
      >
        <div className="space-y-4">
          <div className="p-4 rounded-2xl bg-rose-50 border border-rose-200 flex items-start gap-3">
            <div className="w-9 h-9 rounded-xl bg-rose-600 text-white flex items-center justify-center shrink-0">
              <AlertTriangle className="w-5 h-5" />
            </div>
            <div>
              <h4 className="text-sm font-extrabold text-rose-900">
                Ushbu to‘garak a’zosini o‘chirishni tasdiqlaysizmi?
              </h4>
              <p className="text-xs text-rose-700 mt-1 leading-relaxed">
                A’zo ma’lumotlari ma’lumotlar bazasidan butunlay o‘chiriladi va sahifani yangilaganda (refresh) yoki qayta sinxronlaganda aslo qaytib kelmaydi.
              </p>
            </div>
          </div>

          {memberToDelete && (
            <div className="p-4 rounded-xl bg-slate-50 border border-slate-200 text-xs space-y-2">
              <div className="flex justify-between">
                <span className="text-slate-500 font-semibold">F.I.SH.:</span>
                <span className="font-extrabold text-slate-900">{memberToDelete.studentName}</span>
              </div>
              <div className="flex justify-between">
                <span className="text-slate-500 font-semibold">Guruhi:</span>
                <span className="font-bold text-indigo-700">{memberToDelete.studentGroup || '—'}</span>
              </div>
              <div className="flex justify-between">
                <span className="text-slate-500 font-semibold">Tutori:</span>
                <span className="font-bold text-purple-700">{memberToDelete.tutorName || '—'}</span>
              </div>
              <div className="flex justify-between">
                <span className="text-slate-500 font-semibold">To‘garak:</span>
                <span className="font-bold text-slate-800">{memberToDelete.clubName}</span>
              </div>
            </div>
          )}

          <div className="flex justify-end gap-2 pt-2 border-t border-slate-100">
            <button
              type="button"
              disabled={isDeleting}
              onClick={() => setIsDeleteOpen(false)}
              className="px-4 py-2.5 rounded-xl border border-slate-200 text-xs font-bold text-slate-600 hover:bg-slate-50 transition-colors disabled:opacity-50"
            >
              Bekor qilish
            </button>
            <button
              type="button"
              disabled={isDeleting}
              onClick={handleConfirmDelete}
              className="px-5 py-2.5 rounded-xl bg-rose-600 hover:bg-rose-700 disabled:opacity-50 text-white text-xs font-extrabold transition-all shadow-sm shadow-rose-500/20 cursor-pointer flex items-center gap-1.5"
            >
              {isDeleting ? (
                <>
                  <Loader2 className="w-3.5 h-3.5 animate-spin" />
                  <span>O‘chirilmoqda...</span>
                </>
              ) : (
                <span>Ha, butunlay o‘chirilsin</span>
              )}
            </button>
          </div>
        </div>
      </Modal>
    </div>
  );
};
