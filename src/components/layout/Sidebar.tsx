import React from 'react';
import {
  LayoutDashboard,
  Scroll,
  FileCheck,
  CalendarDays,
  Users,
  Paperclip,
  Image as ImageIcon,
  UserCog,
  Compass,
  Sparkles,
  BarChart3,
  Camera,
  X,
  Shield,
  User as UserIcon,
  GraduationCap
} from 'lucide-react';
import { Role, User } from '../../types';
import { I18N, Language } from '../../lib/i18n';

interface NavItem {
  key: string;
  labelKey: string;
  icon: React.ComponentType<{ className?: string }>;
  badge?: number;
}

interface SidebarProps {
  role: Role;
  currentUser: User;
  activeView: string;
  onSelectView: (view: string) => void;
  lang: Language;
  isOpen: boolean;
  onClose: () => void;
  pendingStatutesCount?: number;
  pendingMembershipsCount?: number;
}

export const Sidebar: React.FC<SidebarProps> = ({
  role,
  currentUser,
  activeView,
  onSelectView,
  lang,
  isOpen,
  onClose,
  pendingStatutesCount = 0,
  pendingMembershipsCount = 0,
}) => {
  const t = I18N[lang];

  const adminNav: NavItem[] = [
    { key: 'overview', labelKey: t.nav.overview, icon: LayoutDashboard },
    { key: 'schedule', labelKey: t.nav.schedule, icon: CalendarDays },
    { key: 'annual', labelKey: t.nav.annual, icon: BarChart3 },
    { key: 'statutes', labelKey: t.nav.statutes, icon: Scroll, badge: pendingStatutesCount },
    { key: 'memberships', labelKey: t.nav.memberships, icon: FileCheck },
    { key: 'clubs', labelKey: t.nav.clubs, icon: Users },
    { key: 'reports', labelKey: t.nav.reports, icon: Paperclip },
    { key: 'submissions', labelKey: t.nav.submissions, icon: ImageIcon },
    { key: 'users', labelKey: t.nav.users, icon: UserCog },
  ];

  const leaderNav: NavItem[] = [
    { key: 'myClubs', labelKey: t.nav.myClubs, icon: Users },
    { key: 'schedule', labelKey: t.nav.schedule, icon: CalendarDays },
    { key: 'annual', labelKey: t.nav.annual, icon: BarChart3 },
    { key: 'members', labelKey: t.nav.memberships, icon: FileCheck, badge: pendingMembershipsCount },
    { key: 'reports', labelKey: t.nav.reports, icon: Paperclip },
    { key: 'submissions', labelKey: t.nav.submissions, icon: ImageIcon },
  ];

  const studentNav: NavItem[] = [
    { key: 'browse', labelKey: t.nav.browse, icon: Compass },
    { key: 'myWork', labelKey: t.nav.myWork, icon: Camera },
    { key: 'myApps', labelKey: t.student.myApps, icon: FileCheck },
  ];

  const items = role === 'admin' ? adminNav : role === 'leader' ? leaderNav : studentNav;

  const initials = currentUser.fullName
    ? currentUser.fullName
        .split(' ')
        .filter(Boolean)
        .slice(0, 2)
        .map((w) => w[0].toUpperCase())
        .join('')
    : 'U';

  const roleLabel = t.role[currentUser.role] || currentUser.role;

  return (
    <>
      {/* Mobile Backdrop */}
      {isOpen && (
        <div
          className="fixed inset-0 bg-slate-900/50 backdrop-blur-xs z-40 lg:hidden"
          onClick={onClose}
        />
      )}

      {/* Sidebar Container */}
      <aside
        className={`fixed top-0 bottom-0 left-0 z-40 w-64 bg-white border-r border-slate-200 flex flex-col transition-transform duration-200 lg:static lg:translate-x-0 ${
          isOpen ? 'translate-x-0' : '-translate-x-full'
        }`}
      >
        {/* Mobile Header */}
        <div className="flex items-center justify-between p-4 border-b border-slate-100 lg:hidden">
          <span className="text-sm font-extrabold text-slate-800">
            {t.app.title}
          </span>
          <button
            type="button"
            onClick={onClose}
            className="p-1 rounded-lg text-slate-400 hover:text-slate-700 hover:bg-slate-100"
          >
            <X className="w-5 h-5" />
          </button>
        </div>

        {/* User Card inside Sidebar showing their Real Name */}
        <div className="p-3 border-b border-slate-100 bg-slate-50/60">
          <div className="flex items-center gap-2.5 p-2 rounded-xl bg-white border border-slate-200/80 shadow-2xs">
            <div className="w-9 h-9 rounded-full bg-gradient-to-tr from-blue-700 to-indigo-600 text-white font-extrabold text-xs flex items-center justify-center shrink-0 shadow-2xs">
              {initials}
            </div>
            <div className="flex-1 min-w-0">
              <h4 className="text-xs font-black text-slate-900 leading-tight truncate">
                {currentUser.fullName}
              </h4>
              <p className="text-[10px] font-bold text-blue-700 mt-0.5 truncate">
                {roleLabel}
              </p>
              <p className="text-[10px] text-slate-400 truncate">
                {currentUser.faculty || currentUser.groupName || currentUser.username}
              </p>
            </div>
          </div>
        </div>

        {/* Navigation links */}
        <nav className="p-3 space-y-1 overflow-y-auto flex-1">
          <div className="px-3 py-2 text-[10px] font-extrabold tracking-wider text-slate-400 uppercase">
            {roleLabel} bo'limlari
          </div>

          {items.map((item) => {
            const Icon = item.icon;
            const isActive = activeView === item.key;
            return (
              <button
                key={item.key}
                type="button"
                onClick={() => {
                  onSelectView(item.key);
                  onClose();
                }}
                className={`w-full flex items-center justify-between gap-3 px-3.5 py-2.5 rounded-xl text-sm font-semibold transition-all cursor-pointer ${
                  isActive
                    ? 'bg-blue-600 text-white shadow-sm'
                    : 'text-slate-600 hover:text-slate-950 hover:bg-slate-100/80'
                }`}
              >
                <div className="flex items-center gap-3 min-w-0">
                  <Icon className={`w-4 h-4 shrink-0 ${isActive ? 'text-white' : 'text-slate-400'}`} />
                  <span className="truncate">{item.labelKey}</span>
                </div>
                {item.badge !== undefined && item.badge > 0 && (
                  <span
                    className={`px-2 py-0.5 rounded-full text-xs font-black ${
                      isActive ? 'bg-white text-blue-700' : 'bg-rose-500 text-white'
                    }`}
                  >
                    {item.badge}
                  </span>
                )}
              </button>
            );
          })}
        </nav>

        {/* Bottom Institute Badge */}
        <div className="p-3 border-t border-slate-100 bg-slate-50/50">
          <div className="px-3 py-2 rounded-xl bg-white border border-slate-200/80 shadow-2xs">
            <p className="text-[11px] font-bold text-slate-700 leading-tight">
              NamDChTI • 5 Tashabbus
            </p>
            <p className="text-[10px] text-slate-400 mt-0.5 leading-tight">
              To'garaklar nazorati axborot tizimi
            </p>
          </div>
        </div>
      </aside>
    </>
  );
};
