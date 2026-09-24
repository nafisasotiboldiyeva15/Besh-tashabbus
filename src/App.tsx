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
import { StudentWorkView } from './views/student/StudentWorkView';

export function App() {
  const [currentUser, setCurrentUser] = useState<User | null>(null);
  const [lang, setLang] = useState<Language>('uz');
  const [activeView, setActiveView] = useState<string>('overview');
  const [isSidebarOpen, setIsSidebarOpen] = useState(false);
  const [toast, setToast] = useState<{ message: string; type: 'ok' | 'err' } | null>(null);
  const [refreshTick, setRefreshTick] = useState(0);

  // Check saved token on mount
  useEffect(() => {
    const token = localStorage.getItem('auth_token');
    if (token) {
      const u = storage.getUserByToken(token);
      if (u) {
        setCurrentUser(u);
        setDefaultViewForRole(u.role);
      } else {
        localStorage.removeItem('auth_token');
      }
    }
  }, []);

  // Real-time synchronization subscription across phones / devices
  useEffect(() => {
    const unsubscribe = storage.subscribe(() => {
      setRefreshTick((t) => t + 1);
      const token = localStorage.getItem('auth_token');
      if (token) {
        const u = storage.getUserByToken(token);
        if (u) setCurrentUser(u);
      }
    });
    return unsubscribe;
  }, []);

  const setDefaultViewForRole = (role: 'admin' | 'leader' | 'student') => {
    if (role === 'admin') setActiveView('overview');
    else if (role === 'leader') setActiveView('myClubs');
    else if (role === 'student') setActiveView('browse');
  };

  // Ensure schedule and annual views are strictly restricted to admin and leader
  useEffect(() => {
    if (currentUser?.role === 'student' && (activeView === 'schedule' || activeView === 'annual')) {
      setActiveView('browse');
    }
  }, [currentUser, activeView]);

  const showToast = (message: string, type: 'ok' | 'err' = 'ok') => {
    setToast({ message, type });
    setTimeout(() => {
      setToast(null);
    }, 3500);
  };

  const handleLoginSuccess = () => {
    const token = localStorage.getItem('auth_token');
    if (token) {
      const u = storage.getUserByToken(token);
      if (u) {
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
    setCurrentUser(null);
  };

  const handleTriggerRefresh = () => {
    setRefreshTick((v) => v + 1);
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

  // Count pending items for badges
  const pendingStatutes = storage
    .getClubs()
    .filter((c) => c.statuteStatus === 'pending' && c.statuteFileId).length;

  const pendingMemberships =
    currentUser.role === 'leader'
      ? storage
          .getMemberships({ leaderId: currentUser.id })
          .filter((m) => m.status === 'pending').length
      : storage.getMemberships().filter((m) => m.status === 'pending').length;

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
                key={refreshTick}
              />
            )}

            {/* Admin Views */}
            {currentUser.role === 'admin' && (
              <>
                {activeView === 'overview' && (
                  <AdminOverviewView
                    lang={lang}
                    onSelectView={setActiveView}
                    key={refreshTick}
                  />
                )}
                {activeView === 'statutes' && (
                  <AdminStatutesView
                    lang={lang}
                    showToast={showToast}
                    onRefresh={handleTriggerRefresh}
                    key={refreshTick}
                  />
                )}
                {activeView === 'memberships' && (
                  <AdminMembershipsView
                    lang={lang}
                    showToast={showToast}
                    onRefresh={handleTriggerRefresh}
                    key={refreshTick}
                  />
                )}
                {activeView === 'schedule' && (
                  <AdminScheduleView
                    user={currentUser}
                    lang={lang}
                    showToast={showToast}
                    onRefresh={handleTriggerRefresh}
                    key={refreshTick}
                  />
                )}
                {activeView === 'clubs' && (
                  <AdminClubsView
                    lang={lang}
                    showToast={showToast}
                    onRefresh={handleTriggerRefresh}
                    key={refreshTick}
                  />
                )}
                {activeView === 'reports' && <AdminReportsView lang={lang} key={refreshTick} />}
                {activeView === 'submissions' && <AdminSubmissionsView lang={lang} key={refreshTick} />}
                {activeView === 'users' && (
                  <AdminUsersView lang={lang} showToast={showToast} key={refreshTick} />
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
                    key={refreshTick}
                  />
                )}
                {activeView === 'schedule' && (
                  <LeaderScheduleView
                    user={currentUser}
                    lang={lang}
                    showToast={showToast}
                    onRefresh={handleTriggerRefresh}
                    key={refreshTick}
                  />
                )}
                {activeView === 'members' && (
                  <LeaderMembersView
                    user={currentUser}
                    lang={lang}
                    showToast={showToast}
                    onRefresh={handleTriggerRefresh}
                    key={refreshTick}
                  />
                )}
                {activeView === 'reports' && (
                  <LeaderReportsView
                    user={currentUser}
                    lang={lang}
                    showToast={showToast}
                    onRefresh={handleTriggerRefresh}
                    key={refreshTick}
                  />
                )}
                {activeView === 'submissions' && (
                  <LeaderSubmissionsView user={currentUser} lang={lang} key={refreshTick} />
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
                    key={refreshTick}
                  />
                )}
                {activeView === 'myApps' && (
                  <StudentApplicationsView
                    user={currentUser}
                    lang={lang}
                    onSelectView={setActiveView}
                    key={refreshTick}
                  />
                )}
                {activeView === 'myWork' && (
                  <StudentWorkView
                    user={currentUser}
                    lang={lang}
                    showToast={showToast}
                    onRefresh={handleTriggerRefresh}
                    onSelectView={setActiveView}
                    key={refreshTick}
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
