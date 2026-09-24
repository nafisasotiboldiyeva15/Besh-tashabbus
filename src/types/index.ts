export type Role = 'admin' | 'leader' | 'student';

export interface User {
  id: string;
  username: string;
  password?: string;
  fullName: string;
  role: Role;
  faculty: string;
  groupName: string;
  clubId: string | null;
  active: boolean;
  createdAt: string;
}

export interface Category {
  id: string;
  name_uz: string;
  name_ru: string;
  ball: number;
}

export interface FileItem {
  id: string;
  name: string;
  mime: string;
  size: number;
  data: string; // base64 / data-url
  owner: string | null;
  createdAt: string;
}

export interface FileMeta {
  id: string;
  name: string;
  mime: string;
  size: number;
  url: string;
  createdAt: string;
}

export interface Club {
  id: string;
  name: string;
  category: string;
  description: string;
  faculty: string;
  leaderId: string;
  leaderName?: string;
  categoryName_uz?: string;
  categoryName_ru?: string;
  categoryBall?: number;
  statuteFileId: string | null;
  statuteFile?: FileMeta | null;
  statuteStatus: 'pending' | 'approved' | 'rejected';
  adminComment: string;
  statuteReviewedAt?: string;
  // Room and schedule details
  room?: string;
  startDate?: string;
  endDate?: string;
  weekdays?: number[];
  timeStart?: string;
  timeEnd?: string;
  // Stats
  memberCount?: number;
  sessionCount?: number;
  heldSessionCount?: number;
  photoCount?: number;
  createdAt: string;
}

export interface ScheduleSlot {
  id: string;
  clubId: string;
  clubName?: string;
  category?: string;
  leaderName?: string;
  weekday: number; // 1 = Dushanba ... 7 = Yakshanba
  timeStart: string;
  timeEnd: string;
  room: string;
  startDate: string;
  endDate: string;
  sessionCount?: number;
  createdAt: string;
}

export interface Session {
  id: string;
  clubId: string;
  clubName?: string;
  slotId?: string | null;
  topic: string;
  rawTopic?: string;
  date: string; // YYYY-MM-DD
  time: string;
  timeEnd?: string;
  location: string;
  status: 'planned' | 'held' | 'missed';
  heldNote: string;
  // Photo evidence of held session
  photoFileId?: string | null;
  photoFile?: FileMeta | null;
  attendeeCount?: number;
  conductorName?: string; // Teacher or student who conducted the session
  heldDate?: string;
  reportCount?: number;
  submissionCount?: number;
  createdAt: string;
}

export interface Membership {
  id: string;
  clubId: string;
  clubName?: string;
  studentId: string;
  studentName?: string;
  studentGroup?: string;
  studentFaculty?: string;
  applicationFileId: string | null;
  applicationFile?: FileMeta | null;
  note: string;
  status: 'pending' | 'approved' | 'rejected';
  adminComment: string;
  createdAt: string;
}

export interface Report {
  id: string;
  clubId: string;
  clubName?: string;
  sessionId: string | null;
  sessionTopic?: string;
  leaderId: string;
  title: string;
  pdfFileId: string | null;
  pdfFile?: FileMeta | null;
  socialLink: string;
  note: string;
  createdAt: string;
}

export interface AnnualReport {
  id: string;
  clubId: string;
  clubName: string;
  category: string;
  leaderId: string;
  leaderName: string;
  academicYear: string; // "2025/2026"
  totalPlanned: number;
  totalHeld: number;
  completionRate: number; // percentage
  totalMembers: number;
  totalPhotos: number;
  summary: string;
  achievements: string;
  pdfFileId: string | null;
  pdfFile?: FileMeta | null;
  status: 'pending' | 'approved';
  adminComment: string;
  createdAt: string;
}

export interface Submission {
  id: string;
  clubId: string;
  clubName?: string;
  sessionId: string | null;
  sessionTopic?: string;
  studentId: string;
  studentName?: string;
  studentGroup?: string;
  title: string;
  pdfFileId: string | null;
  pdfFile?: FileMeta | null;
  photoFileId: string | null;
  photoFile?: FileMeta | null;
  note: string;
  createdAt: string;
}

export interface AppNotification {
  id: string;
  userId: string; // recipient user id, or 'all', 'students', 'leaders'
  targetRole?: 'admin' | 'leader' | 'student';
  title: string;
  message: string;
  type: 'success' | 'warning' | 'info' | 'error';
  linkTab?: string;
  clubId?: string;
  read: boolean;
  createdAt: string;
}

export interface DatabaseSchema {
  users: User[];
  clubs: Club[];
  sessions: Session[];
  schedules: ScheduleSlot[];
  memberships: Membership[];
  reports: Report[];
  annualReports: AnnualReport[];
  submissions: Submission[];
  files: FileItem[];
  tokens: Record<string, string>;
  notifications?: AppNotification[];
  _serverUpdatedAt?: string;
  _deletedClubIds?: string[];
  _deletedSubmissionIds?: string[];
}
