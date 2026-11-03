import React, { useState, useEffect } from 'react';
import { User } from './types';
import { Language } from './lib/i18n';
import { storage } from './lib/storage';
import { Header } from './components/layout/Header';
import { Sidebar } from './components/layout/Sidebar';
import { AuthScreen } from './components/auth/AuthScreen';

// Common views
import { AnnualReportsView } from './views/common/AnnualReportsView';

// Admin views
import { AdminOverviewView } from './views/admin/AdminOverviewView';
import { AdminStatutesView } from './views/admin/AdminStatutesView';
import { AdminMembershipsView } from './views/admin/AdminMembershipsView';
import { AdminScheduleView } from './views/admin/AdminScheduleView';
import { AdminClubsView } from './views/admin/AdminClubsView';
import { AdminReportsView } from './views/admin/AdminReportsView';
import { AdminSubmissionsView } from './views/admin/AdminSubmissionsView';
import { AdminUsersView } from './views/admin/AdminUsersView';

// Leader views
import { LeaderClubsView } from './views/leader/LeaderClubsView';
import { LeaderScheduleView } from './views/leader/LeaderScheduleView';
import { LeaderMembersView } from './views/leader/LeaderMembersView';
import { LeaderReportsView } from './views/leader/LeaderReportsView';
import { LeaderSubmissionsView } from './views/leader/LeaderSubmissionsView';

// Student views
import { StudentBrowseView } from './views/student/StudentBrowseView';
import { StudentApplicationsView } from './views/student/StudentApplicationsView';

export function App() {
  const [currentUser, setCurrentUser] = useState<User | null>(null);
  const [lang, setLang] = useState<Language>('uz');
  const [activeView, setActiveView] = useState<string>('overview');
  const [isSidebarOpen, setIsSidebarOpen] = useState(false);
  const [toast, setToast] = useState<{ message: string; type: 'ok' | 'err' } | null>(null);

  // Check saved token on mount
  useEffect(() => {
    try {
      const token = localStorage.getItem('auth_token');
      if (token) {
        const u = storage.getUserByToken(token);
        if (u) {
          setCurrentUser(u);
          setDefaultViewForRole(u.role);
          return;
        }
      }
      const savedUserId = localStorage.getItem('auth_user_id');
      if (savedUserId) {
        const u = storage.getUserById(savedUserId);
        if (u) {
          setCurrentUser(u);
          setDefaultViewForRole(u.role);
          return;
        }
      }
    } catch (e) {
      console.warn('Failed to restore token:', e);
    }
  }, []);

  // Real-time synchronization subscription across phones / devices
  useEffect(() => {
    const unsubscribe = storage.subscribe(() => {
      try {
        const token = localStorage.getItem('auth_token');
        if (token) {
          const u = storage.getUserByToken(token);
          if (u) {
            setCurrentUser((prev) => {
              if (
                !prev ||
                prev.id !== u.id ||
                prev.role !== u.role ||
                prev.fullName !== u.fullName ||
                prev.clubId !== u.clubId
              ) {
                return u;
              }
              return prev;
            });
          }
        } else {
          const savedUserId = localStorage.getItem('auth_user_id');
          if (savedUserId) {
            const u = storage.getUserById(savedUserId);
            if (u) {
              setCurrentUser((prev) => {
                if (
                  !prev ||
                  prev.id !== u.id ||
                  prev.role !== u.role ||
                  prev.fullName !== u.fullName ||
                  prev.clubId !== u.clubId
                ) {
                  return u;
                }
                return prev;
              });
            }
          }
        }
      } catch {}
    });
    return unsubscribe;
  }, []);

  const setDefaultViewForRole = (role: string) => {
    if (role === 'admin') setActiveView('overview');
    else if (role === 'leader') setActiveView('myClubs');
    else setActiveView('browse');
  };

  const showToast = (message: string, type: 'ok' | 'err' = 'ok') => {
    setToast({ message, type });
    setTimeout(() => {
      setToast(null);
    }, 3500);
  };

  const handleLoginSuccess = (user?: User) => {
    if (user) {
      try {
        localStorage.setItem('auth_user_id', user.id);
      } catch {}
      setCurrentUser(user);
      setDefaultViewForRole(user.role);
      return;
    }
    const token = localStorage.getItem('auth_token');
    if (token) {
      const u = storage.getUserByToken(token);
      if (u) {
        try {
          localStorage.setItem('auth_user_id', u.id);
        } catch {}
        setCurrentUser(u);
        setDefaultViewForRole(u.role);
      }
    }
  };

  const handleLogout = () => {
    const token = localStorage.getItem('auth_token');
    if (token) {
      storage.logout(token);
      localStorage.removeItem('auth_token');
    }
    try {
      localStorage.removeItem('auth_user_id');
    } catch {}
    setCurrentUser(null);
  };

  const handleTriggerRefresh = () => {
    storage.notifySubscribers();
  };

  if (!currentUser) {
    return (
      <AuthScreen
        lang={lang}
        onLanguageChange={setLang}
        onSuccess={handleLoginSuccess}
        showToast={showToast}
      />
    );
  }

  // Count pending items for badges safely
  let pendingStatutes = 0;
  let pendingMemberships = 0;
  try {
    pendingStatutes = storage
      .getClubs()
      .filter((c) => c.statuteStatus === 'pending' && c.statuteFileId).length;

    pendingMemberships =
      currentUser.role === 'leader'
        ? storage
            .getMemberships({ leaderId: currentUser.id })
            .filter((m) => m.status === 'pending').length
        : storage.getMemberships().filter((m) => m.status === 'pending').length;
  } catch (err) {
    console.warn('Failed to calculate badges:', err);
  }

  return (
    <div className="min-h-screen bg-slate-50 flex flex-col font-sans text-slate-800">
      {/* Toast Alert */}
      {toast && (
        <div className="fixed bottom-5 right-5 z-50 animate-in slide-in-from-bottom-3 duration-200">
          <div
            className={`px-4 py-3 rounded-2xl shadow-xl text-xs sm:text-sm font-bold border flex items-center gap-2 ${
              toast.type === 'ok'
                ? 'bg-emerald-600 text-white border-emerald-500'
                : 'bg-rose-600 text-white border-rose-500'
            }`}
          >
            <span>{toast.type === 'ok' ? '✓' : '⚠'}</span>
            <span>{toast.message}</span>
          </div>
        </div>
      )}

      {/* Global Header with prominent User's Real Name */}
      <Header
        user={currentUser}
        lang={lang}
        onLanguageChange={setLang}
        onLogout={handleLogout}
        onToggleSidebar={() => setIsSidebarOpen((v) => !v)}
        onDataImported={handleTriggerRefresh}
        showToast={showToast}
      />

      <div className="flex-1 flex overflow-hidden">
        {/* Sidebar */}
        <Sidebar
          role={currentUser.role}
          currentUser={currentUser}
          activeView={activeView}
          onSelectView={setActiveView}
          lang={lang}
          isOpen={isSidebarOpen}
          onClose={() => setIsSidebarOpen(false)}
          pendingStatutesCount={pendingStatutes}
          pendingMembershipsCount={pendingMemberships}
        />

        {/* Main Content Area */}
        <main className="flex-1 overflow-y-auto p-4 sm:p-6 lg:p-8">
          <div className="max-w-7xl mx-auto">
            {/* Common Annual Reports View (Restricted to Admin and Leader) */}
            {activeView === 'annual' && currentUser.role !== 'student' && (
              <AnnualReportsView
                user={currentUser}
                lang={lang}
                showToast={showToast}
                onRefresh={handleTriggerRefresh}
              />
            )}

            {/* Admin Views */}
            {currentUser.role === 'admin' && (
              <>
                {activeView === 'overview' && (
                  <AdminOverviewView
                    lang={lang}
                    onSelectView={setActiveView}
                  />
                )}
                {activeView === 'statutes' && (
                  <AdminStatutesView
                    lang={lang}
                    showToast={showToast}
                    onRefresh={handleTriggerRefresh}
                  />
                )}
                {activeView === 'memberships' && (
                  <AdminMembershipsView
                    user={currentUser}
                    lang={lang}
                    showToast={showToast}
                    onRefresh={handleTriggerRefresh}
                  />
                )}
                {activeView === 'schedule' && (
                  <AdminScheduleView
                    user={currentUser}
                    lang={lang}
                    showToast={showToast}
                    onRefresh={handleTriggerRefresh}
                  />
                )}
                {activeView === 'clubs' && (
                  <AdminClubsView
                    lang={lang}
                    showToast={showToast}
                    onRefresh={handleTriggerRefresh}
                  />
                )}
                {activeView === 'reports' && <AdminReportsView lang={lang} />}
                {activeView === 'submissions' && <AdminSubmissionsView lang={lang} />}
                {activeView === 'users' && (
                  <AdminUsersView lang={lang} showToast={showToast} />
                )}
              </>
            )}

            {/* Leader Views */}
            {currentUser.role === 'leader' && (
              <>
                {activeView === 'myClubs' && (
                  <LeaderClubsView
                    user={currentUser}
                    lang={lang}
                    showToast={showToast}
                    onRefresh={handleTriggerRefresh}
                  />
                )}
                {activeView === 'schedule' && (
                  <LeaderScheduleView
                    user={currentUser}
                    lang={lang}
                    showToast={showToast}
                    onRefresh={handleTriggerRefresh}
                  />
                )}
                {activeView === 'members' && (
                  <LeaderMembersView
                    user={currentUser}
                    lang={lang}
                    showToast={showToast}
                    onRefresh={handleTriggerRefresh}
                  />
                )}
                {activeView === 'reports' && (
                  <LeaderReportsView
                    user={currentUser}
                    lang={lang}
                    showToast={showToast}
                    onRefresh={handleTriggerRefresh}
                  />
                )}
                {activeView === 'submissions' && (
                  <LeaderSubmissionsView user={currentUser} lang={lang} />
                )}
              </>
            )}

            {/* Student Views */}
            {currentUser.role === 'student' && (
              <>
                {activeView === 'browse' && (
                  <StudentBrowseView
                    user={currentUser}
                    lang={lang}
                    showToast={showToast}
                    onRefresh={handleTriggerRefresh}
                    onSelectView={setActiveView}
                  />
                )}
                {activeView === 'myApps' && (
                  <StudentApplicationsView
                    user={currentUser}
                    lang={lang}
                    onSelectView={setActiveView}
                  />
                )}
              </>
            )}
          </div>
        </main>
      </div>
    </div>
  );
}

export default App;
