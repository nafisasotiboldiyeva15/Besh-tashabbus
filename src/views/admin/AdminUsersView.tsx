import React, { useState, useEffect } from 'react';
import { UserCog, Shield, User, GraduationCap, CheckCircle, Ban, KeyRound, X, Plus, Sparkles, UserPlus, Trash2, AlertTriangle } from 'lucide-react';
import { I18N, Language } from '../../lib/i18n';
import { storage } from '../../lib/storage';
import { User as UserType, Role } from '../../types';
import { Modal } from '../../components/common/Modal';

export const AdminUsersView: React.FC<{
  lang: Language;
  showToast: (msg: string, type?: 'ok' | 'err') => void;
}> = ({ lang, showToast }) => {
  const t = I18N[lang];
  const [users, setUsers] = useState<UserType[]>(storage.getUsers());
  const [passwordModalUser, setPasswordModalUser] = useState<UserType | null>(null);
  const [newPassword, setNewPassword] = useState('');
  const [newUsername, setNewUsername] = useState('');

  // Delete modal state
  const [userToDelete, setUserToDelete] = useState<UserType | null>(null);
  const [isDeleteModalOpen, setIsDeleteModalOpen] = useState(false);

  // Create user modal state
  const [isCreateOpen, setIsCreateOpen] = useState(false);
  const [createRole, setCreateRole] = useState<Role>('leader');
  const [createFullName, setCreateFullName] = useState('');
  const [createUsername, setCreateUsername] = useState('');
  const [createPassword, setCreatePassword] = useState('');
  const [createFaculty, setCreateFaculty] = useState('');
  const [createGroup, setCreateGroup] = useState('');

  const refreshList = () => {
    setUsers([...storage.getUsers()]);
  };

  useEffect(() => {
    const unsub = storage.subscribe(() => {
      setUsers([...storage.getUsers()]);
    });
    return unsub;
  }, []);

  const handleOpenDelete = (u: UserType) => {
    if (u.role === 'admin') {
      showToast('Asosiy administrator hisobini o‘chirib bo‘lmaydi', 'err');
      return;
    }
    setUserToDelete(u);
    setIsDeleteModalOpen(true);
  };

  const handleConfirmDelete = () => {
    if (!userToDelete) return;
    try {
      const name = userToDelete.fullName;
      storage.deleteUser(userToDelete.id);
      setIsDeleteModalOpen(false);
      setUserToDelete(null);
      refreshList();
      showToast(`«${name}» foydalanuvchisi tizimdan butunlay o‘chirildi!`, 'ok');
    } catch (err: unknown) {
      const msg = err instanceof Error ? err.message : 'O‘chirishda xatolik yuz berdi';
      showToast(msg, 'err');
    }
  };

  const handleToggleActive = (targetUser: UserType) => {
    if (targetUser.role === 'admin') {
      showToast('Administratorni bloklash mumkin emas', 'err');
      return;
    }
    try {
      storage.toggleUserActive(targetUser.id, !targetUser.active);
      refreshList();
      showToast(t.common.saved, 'ok');
    } catch (err: unknown) {
      const msg = err instanceof Error ? err.message : 'Xatolik';
      showToast(msg, 'err');
    }
  };

  const handleOpenPasswordModal = (u: UserType) => {
    setPasswordModalUser(u);
    setNewUsername(u.username);
    setNewPassword('');
  };

  const handleSavePassword = (e: React.FormEvent) => {
    e.preventDefault();
    if (!passwordModalUser) return;
    try {
      if (newPassword && newPassword.length < 4) {
        showToast('Parol kamida 4 ta belgidan iborat bo‘lishi kerak', 'err');
        return;
      }
      storage.updateUserCredentials(
        passwordModalUser.id,
        newUsername.trim() || undefined,
        newPassword.trim() || undefined
      );
      refreshList();
      showToast('Login va parol muvaffaqiyatli yangilandi!', 'ok');
      setPasswordModalUser(null);
    } catch (err: unknown) {
      const msg = err instanceof Error ? err.message : 'Xatolik yuz berdi';
      showToast(msg, 'err');
    }
  };

  const handleCreateUserSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    if (!createFullName.trim() || !createUsername.trim() || !createPassword.trim()) {
      showToast('Barcha majburiy maydonlarni to‘ldiring', 'err');
      return;
    }
    if (createPassword.trim().length < 4) {
      showToast('Parol kamida 4 ta belgidan iborat bo‘lishi kerak', 'err');
      return;
    }

    try {
      storage.createUserByAdmin({
        fullName: createFullName.trim(),
        username: createUsername.trim(),
        password: createPassword.trim(),
        role: createRole,
        faculty: createFaculty.trim(),
        groupName: createGroup.trim(),
      });

      showToast(`«${createFullName.trim()}» tizimga muvaffaqiyatli qo‘shildi!`, 'ok');
      setIsCreateOpen(false);
      setCreateFullName('');
      setCreateUsername('');
      setCreatePassword('');
      setCreateFaculty('');
      setCreateGroup('');
      refreshList();
    } catch (err: unknown) {
      const msg = err instanceof Error ? err.message : 'Foydalanuvchi qo‘shishda xatolik';
      showToast(msg, 'err');
    }
  };

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
        <div>
          <h1 className="text-xl sm:text-2xl font-black text-slate-900 leading-tight">
            {t.admin.usersTitle}
          </h1>
          <p className="text-sm text-slate-500 mt-1">
            Institut to‘garak rahbarlari, talabalar va maʼmurlar hisoblari nazorati
          </p>
        </div>

        <div className="flex flex-wrap items-center gap-2.5">
          <button
            type="button"
            onClick={() => setIsCreateOpen(true)}
            className="px-4 py-2 rounded-xl bg-blue-600 hover:bg-blue-700 text-white text-xs sm:text-sm font-bold transition-all shadow-md shadow-blue-600/20 flex items-center gap-2 cursor-pointer active:scale-98"
          >
            <UserPlus className="w-4 h-4" />
            <span>Yangi foydalanuvchi qo‘shish</span>
          </button>
        </div>
      </div>

      {/* Users Table */}
      <div className="bg-white rounded-2xl border border-slate-200 overflow-hidden shadow-xs">
        <div className="overflow-x-auto">
          <table className="w-full text-left text-sm">
            <thead className="bg-slate-50/70 text-xs font-bold text-slate-500 uppercase border-b border-slate-100">
              <tr>
                <th className="px-5 py-3.5">{t.auth.fullName}</th>
                <th className="px-5 py-3.5">{t.auth.role}</th>
                <th className="px-5 py-3.5">{t.common.faculty} / {t.common.group}</th>
                <th className="px-5 py-3.5">{t.common.status}</th>
                <th className="px-5 py-3.5 text-right">{t.common.actions}</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-100">
              {users.map((u) => {
                const roleChip = {
                  admin: 'bg-amber-100 text-amber-900 border-amber-200',
                  leader: 'bg-blue-100 text-blue-900 border-blue-200',
                  student: 'bg-emerald-100 text-emerald-900 border-emerald-200',
                }[u.role];

                return (
                  <tr key={u.id} className="hover:bg-slate-50/50 transition-colors">
                    <td className="px-5 py-3.5">
                      <div className="font-bold text-slate-900">{u.fullName}</div>
                      <div className="text-xs text-slate-400">@{u.username}</div>
                    </td>
                    <td className="px-5 py-3.5">
                      <span className={`inline-flex items-center gap-1 px-2.5 py-0.5 rounded-full text-xs font-bold border ${roleChip}`}>
                        {u.role === 'admin' ? (
                          <Shield className="w-3 h-3" />
                        ) : u.role === 'leader' ? (
                          <User className="w-3 h-3" />
                        ) : (
                          <GraduationCap className="w-3 h-3" />
                        )}
                        <span>{t.role[u.role]}</span>
                      </span>
                    </td>
                    <td className="px-5 py-3.5 text-slate-600">
                      {[u.faculty, u.groupName].filter(Boolean).join(' · ') || '—'}
                    </td>
                    <td className="px-5 py-3.5">
                      {u.active ? (
                        <span className="inline-flex items-center gap-1 px-2.5 py-0.5 rounded-full text-xs font-bold bg-emerald-50 text-emerald-700 border border-emerald-200">
                          <CheckCircle className="w-3 h-3 text-emerald-500" />
                          <span>{t.admin.active}</span>
                        </span>
                      ) : (
                        <span className="inline-flex items-center gap-1 px-2.5 py-0.5 rounded-full text-xs font-bold bg-rose-50 text-rose-700 border border-rose-200">
                          <Ban className="w-3 h-3 text-rose-500" />
                          <span>{t.admin.blocked}</span>
                        </span>
                      )}
                    </td>
                    <td className="px-5 py-3.5 text-right">
                      <div className="inline-flex items-center gap-2 justify-end">
                        <button
                          type="button"
                          onClick={() => handleOpenPasswordModal(u)}
                          className="inline-flex items-center gap-1 px-2.5 py-1.5 rounded-lg text-xs font-bold text-slate-700 bg-slate-100 hover:bg-slate-200 border border-slate-200 transition-all cursor-pointer"
                          title="Login va parolni o‘zgartirish"
                        >
                          <KeyRound className="w-3.5 h-3.5 text-slate-500" />
                          <span>Parol</span>
                        </button>

                        {u.role !== 'admin' && (
                          <>
                            <button
                              type="button"
                              onClick={() => handleToggleActive(u)}
                              className={`px-2.5 py-1.5 rounded-lg text-xs font-bold border transition-all cursor-pointer ${
                                u.active
                                  ? 'text-amber-700 bg-amber-50 border-amber-200 hover:bg-amber-100'
                                  : 'text-emerald-700 bg-emerald-50 border-emerald-200 hover:bg-emerald-100'
                              }`}
                            >
                              {u.active ? t.admin.block : t.admin.unblock}
                            </button>

                            <button
                              type="button"
                              onClick={() => handleOpenDelete(u)}
                              className="inline-flex items-center gap-1 px-2 py-1.5 rounded-lg text-xs font-bold text-rose-600 hover:text-rose-700 bg-rose-50 hover:bg-rose-100 border border-rose-200 transition-all cursor-pointer"
                              title="Foydalanuvchini butunlay o‘chirish"
                            >
                              <Trash2 className="w-3.5 h-3.5" />
                              <span className="hidden sm:inline">O‘chirish</span>
                            </button>
                          </>
                        )}
                      </div>
                    </td>
                  </tr>
                );
              })}
            </tbody>
          </table>
        </div>
      </div>

      {/* Change Password Modal */}
      {passwordModalUser && (
        <Modal
          isOpen={!!passwordModalUser}
          onClose={() => setPasswordModalUser(null)}
          title={`Login / Parol yangilash: ${passwordModalUser.fullName}`}
          footer={
            <>
              <button
                type="button"
                onClick={() => setPasswordModalUser(null)}
                className="px-4 py-2 rounded-xl border border-slate-200 text-slate-700 text-xs font-bold hover:bg-slate-50 transition-colors cursor-pointer"
              >
                {t.common.cancel}
              </button>
              <button
                type="button"
                onClick={handleSavePassword}
                className="px-5 py-2 rounded-xl bg-blue-600 hover:bg-blue-700 text-white text-xs font-bold transition-all shadow-md cursor-pointer"
              >
                {t.common.save}
              </button>
            </>
          }
        >
          <form onSubmit={handleSavePassword} className="space-y-4">
            <div>
              <label className="block text-xs font-bold text-slate-700 mb-1">
                Foydalanuvchi logini
              </label>
              <input
                type="text"
                required
                value={newUsername}
                onChange={(e) => setNewUsername(e.target.value)}
                className="w-full px-3.5 py-2 rounded-xl border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600"
              />
            </div>
            <div>
              <label className="block text-xs font-bold text-slate-700 mb-1">
                Yangi parol (kamida 4 ta belgi)
              </label>
              <input
                type="password"
                placeholder="Yangi parol..."
                value={newPassword}
                onChange={(e) => setNewPassword(e.target.value)}
                className="w-full px-3.5 py-2 rounded-xl border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600"
              />
            </div>
          </form>
        </Modal>
      )}

      {/* Create User Modal */}
      <Modal
        isOpen={isCreateOpen}
        onClose={() => setIsCreateOpen(false)}
        title="Yangi foydalanuvchi / rahbar qo‘shish"
        footer={
          <>
            <button
              type="button"
              onClick={() => setIsCreateOpen(false)}
              className="px-4 py-2 rounded-xl border border-slate-200 text-slate-700 text-xs font-bold hover:bg-slate-50 transition-colors cursor-pointer"
            >
              {t.common.cancel}
            </button>
            <button
              type="button"
              onClick={handleCreateUserSubmit}
              className="px-5 py-2 rounded-xl bg-blue-600 hover:bg-blue-700 text-white text-xs font-bold transition-all shadow-md cursor-pointer flex items-center gap-1.5"
            >
              <UserPlus className="w-3.5 h-3.5" />
              <span>Foydalanuvchini saqlash</span>
            </button>
          </>
        }
      >
        <form onSubmit={handleCreateUserSubmit} className="space-y-4">
          <div>
            <label className="block text-xs font-bold text-slate-700 mb-1">
              Foydalanuvchi roli *
            </label>
            <select
              value={createRole}
              onChange={(e) => setCreateRole(e.target.value as Role)}
              className="w-full px-3.5 py-2 rounded-xl border border-slate-200 text-xs font-semibold focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600 bg-white"
            >
              <option value="leader">To‘garak rahbari (O‘qituvchi / Murabbiy)</option>
              <option value="admin">Administrator</option>
            </select>
          </div>

          <div>
            <label className="block text-xs font-bold text-slate-700 mb-1">
              Ism, Familiya (F.I.Sh.) *
            </label>
            <input
              type="text"
              required
              value={createFullName}
              onChange={(e) => setCreateFullName(e.target.value)}
              placeholder="Masalan: Sotiboldiyeva Nafisa"
              className="w-full px-3.5 py-2 rounded-xl border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600"
            />
          </div>

          <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
            <div>
              <label className="block text-xs font-bold text-slate-700 mb-1">
                Login nomi *
              </label>
              <input
                type="text"
                required
                value={createUsername}
                onChange={(e) => setCreateUsername(e.target.value)}
                placeholder="masalan: nafisa"
                className="w-full px-3 py-2 rounded-xl border border-slate-200 text-xs focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600"
              />
            </div>
            <div>
              <label className="block text-xs font-bold text-slate-700 mb-1">
                Parol (kamida 4 ta belgi) *
              </label>
              <input
                type="password"
                required
                minLength={4}
                value={createPassword}
                onChange={(e) => setCreatePassword(e.target.value)}
                placeholder="••••••••"
                className="w-full px-3 py-2 rounded-xl border border-slate-200 text-xs focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600"
              />
            </div>
          </div>

          <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
            <div>
              <label className="block text-xs font-bold text-slate-700 mb-1">
                Fakultet
              </label>
              <input
                type="text"
                value={createFaculty}
                onChange={(e) => setCreateFaculty(e.target.value)}
                placeholder="Roman-german tillari"
                className="w-full px-3 py-2 rounded-xl border border-slate-200 text-xs focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600"
              />
            </div>
            <div>
              <label className="block text-xs font-bold text-slate-700 mb-1">
                {createRole === 'leader' ? 'Kafedra / Bo‘lim' : 'Guruh'}
              </label>
              <input
                type="text"
                value={createGroup}
                onChange={(e) => setCreateGroup(e.target.value)}
                placeholder={createRole === 'leader' ? 'Amaliy sanʼat kafedrasi' : '201-guruh'}
                className="w-full px-3 py-2 rounded-xl border border-slate-200 text-xs focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-600"
              />
            </div>
          </div>
        </form>
      </Modal>

      {/* Delete User Modal */}
      {userToDelete && (
        <Modal
          isOpen={isDeleteModalOpen}
          onClose={() => {
            setIsDeleteModalOpen(false);
            setUserToDelete(null);
          }}
          title="Foydalanuvchini tizimdan o‘chirish"
          footer={
            <>
              <button
                type="button"
                onClick={() => {
                  setIsDeleteModalOpen(false);
                  setUserToDelete(null);
                }}
                className="px-4 py-2 rounded-xl border border-slate-200 text-slate-700 text-xs font-bold hover:bg-slate-50 transition-colors cursor-pointer"
              >
                {t.common.cancel}
              </button>
              <button
                type="button"
                onClick={handleConfirmDelete}
                className="px-4 py-2 rounded-xl bg-rose-600 hover:bg-rose-700 text-white text-xs font-bold transition-all shadow-md shadow-rose-600/20 cursor-pointer flex items-center gap-1.5"
              >
                <Trash2 className="w-3.5 h-3.5" />
                <span>Ha, butunlay o‘chirilsin</span>
              </button>
            </>
          }
        >
          <div className="space-y-4">
            <div className="flex items-start gap-3 p-3.5 bg-rose-50 border border-rose-200 rounded-xl text-rose-900 text-sm">
              <AlertTriangle className="w-5 h-5 text-rose-600 shrink-0 mt-0.5" />
              <div>
                <div className="font-bold">Ushbu foydalanuvchini o‘chirib tashlashni tasdiqlaysizmi?</div>
                <div className="text-xs text-rose-700 mt-1">
                  Ushbu amal qaytarib bo‘lmaydi. Foydalanuvchining barcha hisobi, sessiyalari va arizalari tizimdan butunlay olib tashlanadi.
                </div>
              </div>
            </div>

            <div className="p-3.5 bg-slate-50 rounded-xl border border-slate-200 space-y-2 text-xs">
              <div className="flex justify-between">
                <span className="text-slate-500">F.I.SH:</span>
                <span className="font-bold text-slate-800">{userToDelete.fullName}</span>
              </div>
              <div className="flex justify-between">
                <span className="text-slate-500">Login nomi:</span>
                <span className="font-mono font-bold text-slate-800">@{userToDelete.username}</span>
              </div>
              <div className="flex justify-between">
                <span className="text-slate-500">Tizimdagi roli:</span>
                <span className="font-bold text-slate-800">{t.role[userToDelete.role]}</span>
              </div>
              {userToDelete.faculty && (
                <div className="flex justify-between">
                  <span className="text-slate-500">Fakultet:</span>
                  <span className="font-semibold text-slate-700">{userToDelete.faculty}</span>
                </div>
              )}
              {userToDelete.groupName && (
                <div className="flex justify-between">
                  <span className="text-slate-500">{userToDelete.role === 'leader' ? 'Kafedra:' : 'Guruh:'}</span>
                  <span className="font-semibold text-slate-700">{userToDelete.groupName}</span>
                </div>
              )}
            </div>
          </div>
        </Modal>
      )}
    </div>
  );
};
