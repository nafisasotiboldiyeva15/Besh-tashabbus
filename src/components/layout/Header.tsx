import React, { useRef, useState, useEffect } from 'react';
import { Menu, LogOut, Download, Upload, Shield, User as UserIcon, GraduationCap, RefreshCw, Bell, CheckCheck, CheckCircle2, AlertTriangle, Info, X } from 'lucide-react';
import { User, AppNotification } from '../../types';
import { I18N, Language } from '../../lib/i18n';
import { InstituteLogo, TashabbusBadge } from '../InstituteLogo';
import { storage } from '../../lib/storage';

interface HeaderProps {
  user: User;
  lang: Language;
  onLanguageChange: (lang: Language) => void;
  onLogout: () => void;
  onToggleSidebar: () => void;
  onDataImported?: () => void;
  showToast: (msg: string, type?: 'ok' | 'err') => void;
}

export const Header: React.FC<HeaderProps> = ({
  user,
  lang,
  onLanguageChange,
  onLogout,
  onToggleSidebar,
  onDataImported,
  showToast,
}) => {
  const t = I18N[lang];
  const fileInputRef = useRef<HTMLInputElement>(null);
  const [isSyncing, setIsSyncing] = useState(false);
  const [isNotifOpen, setIsNotifOpen] = useState(false);
  const [notifications, setNotifications] = useState<AppNotification[]>(
    storage.getNotifications(user.id, user.role)
  );
  const notifRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    setNotifications(storage.getNotifications(user.id, user.role));
    const unsub = storage.subscribe(() => {
      setNotifications(storage.getNotifications(user.id, user.role));
    });
    return unsub;
  }, [user.id, user.role]);

  // Close notifications on outside click
  useEffect(() => {
    const handleClickOutside = (e: MouseEvent) => {
      if (notifRef.current && !notifRef.current.contains(e.target as Node)) {
        setIsNotifOpen(false);
      }
    };
    if (isNotifOpen) {
      document.addEventListener('mousedown', handleClickOutside);
    }
    return () => {
      document.removeEventListener('mousedown', handleClickOutside);
    };
  }, [isNotifOpen]);

  const unreadCount = notifications.filter((n) => !n.read).length;

  const handleMarkAllRead = () => {
    storage.markAllNotificationsAsRead(user.id, user.role);
    setNotifications(storage.getNotifications(user.id, user.role));
    showToast('Barcha xabarnomalar o‘qildi', 'ok');
  };

  const handleNotificationClick = (n: AppNotification) => {
    if (!n.read) {
      storage.markNotificationAsRead(n.id);
      setNotifications(storage.getNotifications(user.id, user.role));
    }
    setIsNotifOpen(false);
  };

  const handleManualSync = async () => {
    setIsSyncing(true);
    const ok = await storage.forceSync();
    setTimeout(() => {
      setIsSyncing(false);
      if (ok) {
        showToast('Server bilan muvaffaqiyatli sinxronlandi', 'ok');
      } else {
        showToast('Sinxronlash amalga oshmadi', 'err');
      }
    }, 400);
  };

  const handleExportBackup = () => {
    try {
      const db = storage.getDB();
      const blob = new Blob([JSON.stringify(db, null, 2)], { type: 'application/json' });
      const url = URL.createObjectURL(blob);
      const a = document.createElement('a');
      a.href = url;
      a.download = `5_tashabbus_zaxira_${new Date().toISOString().slice(0, 10)}.json`;
      a.click();
      URL.revokeObjectURL(url);
      showToast(t.backup.exported, 'ok');
    } catch {
      showToast('Eksport qilishda xatolik', 'err');
    }
  };

  const handleImportClick = () => {
    fileInputRef.current?.click();
  };

  const handleFileChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (!file) return;

    const reader = new FileReader();
    reader.onload = () => {
      try {
        const parsed = JSON.parse(reader.result as string);
        if (!parsed.users || !Array.isArray(parsed.users) || !parsed.clubs || !Array.isArray(parsed.clubs)) {
          showToast(t.backup.badFile, 'err');
          return;
        }

        if (window.confirm(t.backup.confirmImport)) {
          storage.setDB(parsed);
          showToast(t.backup.imported, 'ok');
          if (onDataImported) onDataImported();
        }
      } catch {
        showToast(t.backup.badFile, 'err');
      }
    };
    reader.readAsText(file);
    e.target.value = '';
  };

  const roleLabel = t.role[user.role] || user.role;
  const roleColor = {
    admin: 'bg-amber-100 text-amber-900 border-amber-300',
    leader: 'bg-blue-100 text-blue-900 border-blue-300',
    student: 'bg-emerald-100 text-emerald-900 border-emerald-300',
  }[user.role];

  // User initials (e.g., NS for Nafisa Sotiboldiyeva)
  const initials = user.fullName
    ? user.fullName
        .split(' ')
        .filter(Boolean)
        .slice(0, 2)
        .map((w) => w[0].toUpperCase())
        .join('')
    : 'U';

  return (
    <header className="sticky top-0 z-30 bg-white/95 backdrop-blur-md border-b border-slate-200 px-3 sm:px-6 py-2.5 flex items-center justify-between gap-3 shadow-2xs">
      <div className="flex items-center gap-3">
        {/* Mobile menu trigger */}
        <button
          type="button"
          onClick={onToggleSidebar}
          className="lg:hidden p-2 rounded-xl text-slate-600 hover:text-slate-900 hover:bg-slate-100 transition-colors"
          title="Menyu"
        >
          <Menu className="w-5 h-5" />
        </button>

        {/* Logo and App Title */}
        <div className="flex items-center gap-3">
          <InstituteLogo size={44} />
          <TashabbusBadge size="sm" />
          <div className="hidden sm:flex flex-col">
            <h1 className="text-sm font-extrabold text-slate-900 leading-tight">
              {t.app.title}
            </h1>
            <p className="text-[11px] font-medium text-slate-500 leading-tight line-clamp-1">
              {t.app.subtitle} • {t.app.institute}
            </p>
          </div>
        </div>
      </div>

      {/* Right Controls */}
      <div className="flex items-center gap-2 sm:gap-3">
        {/* Hidden File Input for Backup Import */}
        <input
          ref={fileInputRef}
          type="file"
          accept=".json,application/json"
          className="hidden"
          onChange={handleFileChange}
        />

        {/* Backup Buttons - Only visible to Admin */}
        {user.role === 'admin' && (
          <div className="hidden md:flex items-center gap-1.5 pl-1 pr-2 py-0.5 rounded-xl bg-slate-100/80 border border-slate-200/80">
            <button
              type="button"
              onClick={handleExportBackup}
              className="inline-flex items-center gap-1.5 px-2.5 py-1 rounded-lg bg-white hover:bg-slate-50 text-slate-700 text-xs font-bold transition-all shadow-2xs cursor-pointer border border-slate-200"
              title="Tizim ma'lumotlari zaxirasini yuklab olish (Admin)"
            >
              <Download className="w-3.5 h-3.5 text-blue-600" />
              <span>Zaxira</span>
            </button>

            <button
              type="button"
              onClick={handleImportClick}
              className="inline-flex items-center gap-1.5 px-2.5 py-1 rounded-lg bg-white hover:bg-slate-50 text-slate-700 text-xs font-bold transition-all shadow-2xs cursor-pointer border border-slate-200"
              title="Zaxiradan ma'lumotlarni tiklash (Admin)"
            >
              <Upload className="w-3.5 h-3.5 text-emerald-600" />
              <span>Tiklash</span>
            </button>
          </div>
        )}

        {/* Notifications Bell Dropdown */}
        <div className="relative" ref={notifRef}>
          <button
            type="button"
            onClick={() => setIsNotifOpen((v) => !v)}
            className="relative p-1.5 rounded-lg bg-slate-100 hover:bg-slate-200 text-slate-700 transition-colors border border-slate-200 cursor-pointer shadow-2xs"
            title="Xabarnomalar"
          >
            <Bell className="w-4 h-4 text-slate-700" />
            {unreadCount > 0 && (
              <span className="absolute -top-1 -right-1 px-1.5 py-0.2 rounded-full text-[10px] font-black bg-rose-600 text-white shadow-xs animate-bounce">
                {unreadCount}
              </span>
            )}
          </button>

          {/* Notifications Dropdown Panel */}
          {isNotifOpen && (
            <div className="absolute right-0 mt-2 w-80 sm:w-96 bg-white rounded-2xl border border-slate-200 shadow-2xl z-50 overflow-hidden animate-in fade-in-50 zoom-in-95 duration-150">
              <div className="px-4 py-3 bg-slate-50 border-b border-slate-100 flex items-center justify-between">
                <div className="flex items-center gap-2">
                  <Bell className="w-4 h-4 text-blue-600" />
                  <span className="text-xs font-black text-slate-900">Xabarnomalar</span>
                  {unreadCount > 0 && (
                    <span className="px-1.5 py-0.5 rounded-full text-[10px] font-bold bg-blue-100 text-blue-700">
                      {unreadCount} ta yangi
                    </span>
                  )}
                </div>
                {unreadCount > 0 && (
                  <button
                    type="button"
                    onClick={handleMarkAllRead}
                    className="inline-flex items-center gap-1 text-[11px] font-bold text-blue-600 hover:text-blue-800 cursor-pointer"
                  >
                    <CheckCheck className="w-3.5 h-3.5" />
                    <span>O‘qildi</span>
                  </button>
                )}
              </div>

              <div className="max-h-80 overflow-y-auto divide-y divide-slate-100">
                {notifications.length === 0 ? (
                  <div className="py-8 px-4 text-center">
                    <Bell className="w-8 h-8 text-slate-300 mx-auto mb-2 opacity-50" />
                    <p className="text-xs font-medium text-slate-500">Hozircha xabarnomalar yo‘q</p>
                  </div>
                ) : (
                  notifications.map((n) => (
                    <div
                      key={n.id}
                      onClick={() => handleNotificationClick(n)}
                      className={`p-3.5 transition-colors cursor-pointer hover:bg-slate-50 flex gap-3 ${
                        !n.read ? 'bg-blue-50/40' : 'bg-white'
                      }`}
                    >
                      <div className="shrink-0 mt-0.5">
                        {n.type === 'success' ? (
                          <div className="w-7 h-7 rounded-full bg-emerald-100 text-emerald-600 flex items-center justify-center">
                            <CheckCircle2 className="w-4 h-4" />
                          </div>
                        ) : n.type === 'warning' ? (
                          <div className="w-7 h-7 rounded-full bg-amber-100 text-amber-600 flex items-center justify-center">
                            <AlertTriangle className="w-4 h-4" />
                          </div>
                        ) : (
                          <div className="w-7 h-7 rounded-full bg-blue-100 text-blue-600 flex items-center justify-center">
                            <Info className="w-4 h-4" />
                          </div>
                        )}
                      </div>
                      <div className="flex-1 min-w-0">
                        <div className="flex items-center justify-between gap-1 mb-0.5">
                          <p className="text-xs font-extrabold text-slate-900 truncate">{n.title}</p>
                          {!n.read && (
                            <span className="w-2 h-2 rounded-full bg-blue-600 shrink-0"></span>
                          )}
                        </div>
                        <p className="text-xs text-slate-600 leading-relaxed line-clamp-3">
                          {n.message}
                        </p>
                        <span className="text-[10px] text-slate-400 mt-1.5 block">
                          {new Date(n.createdAt).toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' })}, {new Date(n.createdAt).toLocaleDateString()}
                        </span>
                      </div>
                    </div>
                  ))
                )}
              </div>
            </div>
          )}
        </div>

        {/* Real-time Cloud Sync button */}
        <button
          type="button"
          onClick={handleManualSync}
          disabled={isSyncing}
          className="inline-flex items-center gap-1.5 px-2.5 py-1 rounded-lg bg-slate-100 hover:bg-slate-200 text-slate-700 text-xs font-bold transition-all border border-slate-200 cursor-pointer shadow-2xs"
          title="Server bilan sinxronlash"
        >
          <RefreshCw className={`w-3.5 h-3.5 text-blue-600 ${isSyncing ? 'animate-spin' : ''}`} />
          <span className="hidden sm:inline">Sinxronlash</span>
        </button>

        {/* Language Switcher */}
        <div className="inline-flex rounded-lg border border-slate-200 p-0.5 bg-slate-100 text-xs font-bold">
          <button
            type="button"
            onClick={() => onLanguageChange('uz')}
            className={`px-2 py-1 rounded-md transition-all ${
              lang === 'uz' ? 'bg-white text-blue-700 shadow-2xs' : 'text-slate-500 hover:text-slate-800'
            }`}
          >
            UZ
          </button>
          <button
            type="button"
            onClick={() => onLanguageChange('ru')}
            className={`px-2 py-1 rounded-md transition-all ${
              lang === 'ru' ? 'bg-white text-blue-700 shadow-2xs' : 'text-slate-500 hover:text-slate-800'
            }`}
          >
            RU
          </button>
        </div>

        {/* User Info & Real Full Name Badge */}
        <div className="flex items-center gap-2 pl-2 border-l border-slate-200">
          {/* Avatar with Initials */}
          <div className="w-8 h-8 rounded-full bg-gradient-to-tr from-blue-700 to-indigo-600 text-white font-extrabold text-xs flex items-center justify-center shrink-0 shadow-2xs border border-white">
            {initials}
          </div>

          {/* User's Actual Name displayed prominently */}
          <div className="flex flex-col text-left">
            <span className="text-xs font-extrabold text-slate-900 leading-tight truncate max-w-[130px] sm:max-w-[190px]">
              {user.fullName}
            </span>
            <div className="flex items-center gap-1.5 mt-0.5">
              <span
                className={`inline-flex items-center gap-0.5 px-1.5 py-0.2 rounded-md text-[10px] font-bold border ${roleColor}`}
              >
                {user.role === 'admin' ? (
                  <Shield className="w-2.5 h-2.5" />
                ) : user.role === 'leader' ? (
                  <UserIcon className="w-2.5 h-2.5" />
                ) : (
                  <GraduationCap className="w-2.5 h-2.5" />
                )}
                <span>{roleLabel}</span>
              </span>
              <span className="hidden lg:inline text-[10px] text-slate-400 truncate max-w-[110px]">
                {user.groupName || user.faculty}
              </span>
            </div>
          </div>

          {/* Logout button */}
          <button
            type="button"
            onClick={onLogout}
            className="p-1.5 sm:px-2.5 sm:py-1.5 rounded-lg border border-slate-200 text-slate-600 hover:text-rose-600 hover:bg-rose-50 hover:border-rose-200 transition-colors flex items-center gap-1.5 text-xs font-semibold cursor-pointer ml-1"
            title={t.app.logout}
          >
            <LogOut className="w-4 h-4" />
            <span className="hidden md:inline">{t.app.logout}</span>
          </button>
        </div>
      </div>
    </header>
  );
};
