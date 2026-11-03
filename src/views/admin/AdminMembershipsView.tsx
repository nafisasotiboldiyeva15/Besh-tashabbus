import React, { useState, useEffect } from 'react';
import { Language } from '../../lib/i18n';
import { storage } from '../../lib/storage';
import { Membership, User, Club } from '../../types';
import { ClubMembersTableView } from '../../components/members/ClubMembersTableView';

export const AdminMembershipsView: React.FC<{
  user?: User;
  lang: Language;
  showToast?: (msg: string, type?: 'ok' | 'err') => void;
  onRefresh?: () => void;
}> = ({ user, lang, showToast, onRefresh }) => {
  const [currentUser] = useState<User>(() => {
    if (user) return user;
    const uid = typeof window !== 'undefined' ? localStorage.getItem('auth_user_id') : null;
    const found = uid ? storage.getUserById(uid) : null;
    return (
      found || {
        id: 'u_admin_001',
        username: 'admin',
        fullName: 'Hamidulla Abdualiyev (Bosh admin)',
        role: 'admin',
        faculty: 'Institut Maʼmuriyati',
        groupName: 'Yoshlar bilan ishlash bo‘limi',
        clubId: null,
        active: true,
        createdAt: '2026-09-01T08:00:00.000Z',
      }
    );
  });

  const [clubs, setClubs] = useState<Club[]>(() => storage.getClubs());
  const [memberships, setMemberships] = useState<Membership[]>(() => storage.getMemberships());

  const refreshList = () => {
    setClubs([...storage.getClubs()]);
    setMemberships([...storage.getMemberships()]);
  };

  useEffect(() => {
    refreshList();
    const unsub = storage.subscribe(() => {
      refreshList();
    });
    return unsub;
  }, []);

  const handleRefresh = () => {
    refreshList();
    if (onRefresh) onRefresh();
  };

  return (
    <ClubMembersTableView
      currentUser={currentUser}
      clubs={clubs}
      memberships={memberships}
      lang={lang}
      showToast={showToast}
      onRefresh={handleRefresh}
      isLeaderView={false}
    />
  );
};
