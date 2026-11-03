import { DatabaseSchema, User, Club, ScheduleSlot, Session, Membership, Report, AnnualReport, Submission, AppNotification } from '../types';

export function liteHash(s: string): string {
  let h = 5381;
  const str = String(s);
  for (let i = 0; i < str.length; i++) {
    h = ((h << 5) + h) ^ str.charCodeAt(i);
  }
  return 'h' + (h >>> 0).toString(16);
}

export function generateSeedData(): DatabaseSchema {
  const adminPass = liteHash('admin123');
  const now = new Date();
  const createdAt = '2026-09-01T08:00:00.000Z';

  const users: User[] = [
    {
      id: 'u_admin_001',
      username: 'admin',
      password: adminPass,
      fullName: 'Hamidulla Abdualiyev',
      role: 'admin',
      faculty: 'Institut Maʼmuriyati',
      groupName: 'Yoshlar bilan ishlash bo‘limi',
      clubId: null,
      active: true,
      createdAt,
    },
    {
      id: 'u_leader_nafisa',
      username: 'nafisa',
      password: liteHash('nafisa123'),
      fullName: 'Nafisa Sotiboldiyeva',
      role: 'leader',
      faculty: 'Roman-german tillari fakulteti',
      groupName: 'Amaliy sanʼat va dizayn kafedrasi',
      clubId: null,
      active: true,
      createdAt,
    },
  ];

  const clubs: Club[] = [];
  const schedules: ScheduleSlot[] = [];
  const sessions: Session[] = [];
  const memberships: Membership[] = [];
  const reports: Report[] = [];
  const annualReports: AnnualReport[] = [];
  const submissions: Submission[] = [];

  const notifications: AppNotification[] = [
    {
      id: 'notif_01',
      userId: 'all',
      title: "Yangi o‘quv yili to‘garaklari ochildi!",
      message: "Is'hoqxon Ibrat nomidagi Namangan davlat chet tillari institutida 5 muhim tashabbus to‘garaklariga a’zo bo‘lish boshlandi.",
      type: 'info',
      read: false,
      createdAt,
    },
  ];

  return {
    users,
    clubs,
    sessions,
    schedules,
    memberships,
    reports,
    annualReports,
    submissions,
    files: [],
    tokens: {},
    notifications,
    _deletedClubIds: [],
    _deletedMembershipIds: [],
    _deletedUserIds: [],
    _serverUpdatedAt: now.toISOString(),
  };
}
