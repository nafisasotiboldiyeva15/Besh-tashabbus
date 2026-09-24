import React, { useState } from 'react';
import { LogIn, UserPlus } from 'lucide-react';
import { I18N, Language } from '../../lib/i18n';
import { InstituteLogo, TashabbusBadge } from '../InstituteLogo';
import { storage } from '../../lib/storage';

interface AuthScreenProps {
  lang: Language;
  onLanguageChange: (lang: Language) => void;
  onSuccess: () => void;
  showToast: (msg: string, type?: 'ok' | 'err') => void;
}

export const AuthScreen: React.FC<AuthScreenProps> = ({
  lang,
  onLanguageChange,
  onSuccess,
  showToast,
}) => {
  const t = I18N[lang];
  const [tab, setTab] = useState<'login' | 'register'>('login');

  // Login form state
  const [loginUsername, setLoginUsername] = useState('');
  const [loginPassword, setLoginPassword] = useState('');
  const [loginError, setLoginError] = useState('');

  // Register form state
  const [regRole, setRegRole] = useState<'leader' | 'student'>('student');
  const [regFullName, setRegFullName] = useState('');
  const [regUsername, setRegUsername] = useState('');
  const [regFaculty, setRegFaculty] = useState('');
  const [regGroupName, setRegGroupName] = useState('');
  const [regPassword, setRegPassword] = useState('');
  const [regError, setRegError] = useState('');

  const handleLoginSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    setLoginError('');
    try {
      const { token } = storage.login(loginUsername, loginPassword);
      localStorage.setItem('auth_token', token);
      showToast(t.common.saved, 'ok');
      onSuccess();
    } catch (err: unknown) {
      const msg = err instanceof Error ? err.message : t.auth.loginErr;
      setLoginError(msg);
    }
  };

  const handleRegisterSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    setRegError('');
    try {
      storage.register({
        username: regUsername,
        password: regPassword,
        fullName: regFullName,
        role: regRole,
        faculty: regFaculty,
        groupName: regGroupName,
      });

      showToast(t.auth.registered, 'ok');
      setLoginUsername(regUsername);
      setLoginPassword('');
      setTab('login');
    } catch (err: unknown) {
      const msg = err instanceof Error ? err.message : 'Ro‘yxatdan o‘tishda xatolik';
      setRegError(msg);
    }
  };

  return (
    <div className="min-h-screen bg-radial-[at_top_right] from-blue-100/60 via-slate-100 to-slate-200 flex flex-col justify-center items-center p-4 sm:p-6">
      {/* Top right language switch */}
      <div className="w-full max-w-md flex justify-end mb-3">
        <div className="inline-flex rounded-xl border border-slate-200 p-0.5 bg-white shadow-2xs text-xs font-bold">
          <button
            type="button"
            onClick={() => onLanguageChange('uz')}
            className={`px-3 py-1 rounded-lg transition-all ${
              lang === 'uz' ? 'bg-blue-600 text-white shadow-xs' : 'text-slate-600 hover:text-slate-900'
            }`}
          >
            O‘zbekcha (UZ)
          </button>
          <button
            type="button"
            onClick={() => onLanguageChange('ru')}
            className={`px-3 py-1 rounded-lg transition-all ${
              lang === 'ru' ? 'bg-blue-600 text-white shadow-xs' : 'text-slate-600 hover:text-slate-900'
            }`}
          >
            Русский (RU)
          </button>
        </div>
      </div>

      <div className="w-full max-w-md bg-white rounded-3xl shadow-xl border border-slate-200/80 p-6 sm:p-8">
        {/* Branding */}
        <div className="flex flex-col items-center text-center mb-6">
          <div className="flex items-center justify-center gap-3 mb-3">
            <InstituteLogo size={70} />
            <TashabbusBadge size="md" />
          </div>
          <h2 className="text-lg sm:text-xl font-extrabold text-slate-900 leading-tight">
            {t.app.title}
          </h2>
          <p className="text-xs font-semibold text-sky-800 mt-1">
            {t.app.subtitle}
          </p>
          <p className="text-[11px] text-slate-500 mt-0.5 max-w-xs">
            {t.app.institute}
          </p>
        </div>

        {/* Tabs */}
        <div className="flex p-1 bg-slate-100 rounded-xl mb-6 text-sm font-bold">
          <button
            type="button"
            onClick={() => setTab('login')}
            className={`flex-1 py-2 rounded-lg transition-all flex items-center justify-center gap-1.5 ${
              tab === 'login'
                ? 'bg-white text-blue-700 shadow-xs'
                : 'text-slate-600 hover:text-slate-900'
            }`}
          >
            <LogIn className="w-4 h-4" />
            <span>{t.auth.loginTab}</span>
          </button>
          <button
            type="button"
            onClick={() => setTab('register')}
            className={`flex-1 py-2 rounded-lg transition-all flex items-center justify-center gap-1.5 ${
              tab === 'register'
                ? 'bg-white text-blue-700 shadow-xs'
                : 'text-slate-600 hover:text-slate-900'
            }`}
          >
            <UserPlus className="w-4 h-4" />
            <span>{t.auth.registerTab}</span>
          </button>
        </div>

        {/* Login Form */}
        {tab === 'login' ? (
          <form onSubmit={handleLoginSubmit} className="space-y-4">
            {loginError && (
              <div className="p-3 rounded-xl bg-rose-50 border border-rose-200 text-rose-700 text-xs font-semibold">
                {loginError}
              </div>
            )}

            <div>
              <label className="block text-xs font-bold text-slate-700 mb-1">
                {t.auth.username}
              </label>
              <input
                type="text"
                required
                value={loginUsername}
                onChange={(e) => setLoginUsername(e.target.value)}
                placeholder="admin"
                className="w-full px-3.5 py-2.5 rounded-xl border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600 transition-colors"
              />
            </div>

            <div>
              <label className="block text-xs font-bold text-slate-700 mb-1">
                {t.auth.password}
              </label>
              <input
                type="password"
                required
                value={loginPassword}
                onChange={(e) => setLoginPassword(e.target.value)}
                placeholder="••••••••"
                className="w-full px-3.5 py-2.5 rounded-xl border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600 transition-colors"
              />
            </div>

            <button
              type="submit"
              className="w-full py-3 bg-blue-600 hover:bg-blue-700 active:scale-98 text-white text-sm font-bold rounded-xl transition-all shadow-md shadow-blue-500/20 cursor-pointer"
            >
              {t.auth.loginBtn}
            </button>

            <div className="pt-2 text-center">
              <span className="text-xs text-slate-400">
                {t.auth.demoHint}
              </span>
            </div>
          </form>
        ) : (
          <form onSubmit={handleRegisterSubmit} className="space-y-3.5">
            {regError && (
              <div className="p-3 rounded-xl bg-rose-50 border border-rose-200 text-rose-700 text-xs font-semibold">
                {regError}
              </div>
            )}

            <div>
              <label className="block text-xs font-bold text-slate-700 mb-1">
                {t.auth.role}
              </label>
              <select
                value={regRole}
                onChange={(e) => setRegRole(e.target.value as 'leader' | 'student')}
                className="w-full px-3.5 py-2.5 rounded-xl border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600 transition-colors bg-white font-medium"
              >
                <option value="student">{t.role.student}</option>
                <option value="leader">{t.role.leader}</option>
              </select>
            </div>

            <div>
              <label className="block text-xs font-bold text-slate-700 mb-1">
                {t.auth.fullName}
              </label>
              <input
                type="text"
                required
                value={regFullName}
                onChange={(e) => setRegFullName(e.target.value)}
                placeholder="Masalan: Aliyev Vali"
                className="w-full px-3.5 py-2.5 rounded-xl border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600 transition-colors"
              />
            </div>

            <div>
              <label className="block text-xs font-bold text-slate-700 mb-1">
                {t.auth.username}
              </label>
              <input
                type="text"
                required
                value={regUsername}
                onChange={(e) => setRegUsername(e.target.value)}
                placeholder="login_nomi"
                className="w-full px-3.5 py-2.5 rounded-xl border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600 transition-colors"
              />
            </div>

            <div className="grid grid-cols-2 gap-2">
              <div>
                <label className="block text-xs font-bold text-slate-700 mb-1">
                  {t.auth.faculty}
                </label>
                <input
                  type="text"
                  value={regFaculty}
                  onChange={(e) => setRegFaculty(e.target.value)}
                  placeholder="Ingliz tili"
                  className="w-full px-3 py-2 rounded-xl border border-slate-200 text-xs focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600 transition-colors"
                />
              </div>
              <div>
                <label className="block text-xs font-bold text-slate-700 mb-1">
                  {t.auth.group}
                </label>
                <input
                  type="text"
                  value={regGroupName}
                  onChange={(e) => setRegGroupName(e.target.value)}
                  placeholder="201-guruh"
                  className="w-full px-3 py-2 rounded-xl border border-slate-200 text-xs focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600 transition-colors"
                />
              </div>
            </div>

            <div>
              <label className="block text-xs font-bold text-slate-700 mb-1">
                {t.auth.password}
              </label>
              <input
                type="password"
                required
                minLength={4}
                value={regPassword}
                onChange={(e) => setRegPassword(e.target.value)}
                placeholder="••••••••"
                className="w-full px-3.5 py-2.5 rounded-xl border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600 transition-colors"
              />
            </div>

            <button
              type="submit"
              className="w-full py-3 bg-blue-600 hover:bg-blue-700 active:scale-98 text-white text-sm font-bold rounded-xl transition-all shadow-md shadow-blue-500/20 cursor-pointer"
            >
              {t.auth.registerBtn}
            </button>
          </form>
        )}
      </div>
    </div>
  );
};
