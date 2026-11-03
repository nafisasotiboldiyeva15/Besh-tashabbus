import React, { useState, useEffect } from 'react';
import { Language } from '../../lib/i18n';
import { storage } from '../../lib/storage';
import { Membership, User, Club } from '../../types';
import { ClubMembersTableView } from '../../components/members/ClubMembersTableView';

export const LeaderMembersView: React.FC<{
  user: User;
  lang: Language;
  showToast: (msg: string, type?: 'ok' | 'err') => void;
  onRefresh: () => void;
}> = ({ user, lang, showToast, onRefresh }) => {
  const [leaderClubs, setLeaderClubs] = useState<Club[]>(() => storage.getClubs(user.id));
  const [memberships, setMemberships] = useState<Membership[]>(() =>
    storage.getMemberships({ leaderId: user.id })
  );

  const refreshList = () => {
    const clubs = storage.getClubs(user.id);
    setLeaderClubs(clubs);
    setMemberships(storage.getMemberships({ leaderId: user.id }));
  };

  useEffect(() => {
    refreshList();
    const unsub = storage.subscribe(() => {
      refreshList();
    });
    return unsub;
  }, [user.id]);

  const handleRefresh = () => {
    refreshList();
    if (onRefresh) onRefresh();
  };

  return (
    <ClubMembersTableView
      currentUser={user}
      clubs={leaderClubs}
      memberships={memberships}
      lang={lang}
      showToast={showToast}
      onRefresh={handleRefresh}
      isLeaderView={true}
    />
  );
};
