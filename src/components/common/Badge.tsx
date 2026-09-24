import React from 'react';
import { I18N, Language } from '../../lib/i18n';

interface StatusBadgeProps {
  status: 'pending' | 'approved' | 'rejected' | 'planned' | 'held' | 'missed' | string;
  lang?: Language;
  className?: string;
}

export const StatusBadge: React.FC<StatusBadgeProps> = ({ status, lang = 'uz', className = '' }) => {
  const t = I18N[lang].common;

  switch (status) {
    case 'approved':
    case 'held':
      return (
        <span className={`inline-flex items-center gap-1 px-2.5 py-0.5 rounded-full text-xs font-bold bg-emerald-50 text-emerald-700 border border-emerald-200/80 ${className}`}>
          <span className="w-1.5 h-1.5 rounded-full bg-emerald-500"></span>
          <span>{status === 'held' ? t.held : t.approved}</span>
        </span>
      );
    case 'pending':
      return (
        <span className={`inline-flex items-center gap-1 px-2.5 py-0.5 rounded-full text-xs font-bold bg-amber-50 text-amber-700 border border-amber-200/80 ${className}`}>
          <span className="w-1.5 h-1.5 rounded-full bg-amber-500 animate-pulse"></span>
          <span>{t.pending}</span>
        </span>
      );
    case 'rejected':
    case 'missed':
      return (
        <span className={`inline-flex items-center gap-1 px-2.5 py-0.5 rounded-full text-xs font-bold bg-rose-50 text-rose-700 border border-rose-200/80 ${className}`}>
          <span className="w-1.5 h-1.5 rounded-full bg-rose-500"></span>
          <span>{status === 'missed' ? t.missed : t.rejected}</span>
        </span>
      );
    case 'planned':
      return (
        <span className={`inline-flex items-center gap-1 px-2.5 py-0.5 rounded-full text-xs font-bold bg-sky-50 text-sky-700 border border-sky-200/80 ${className}`}>
          <span className="w-1.5 h-1.5 rounded-full bg-sky-500"></span>
          <span>{t.planned}</span>
        </span>
      );
    default:
      return (
        <span className={`inline-flex items-center px-2 py-0.5 rounded-md text-xs font-medium bg-slate-100 text-slate-600 ${className}`}>
          {status || '—'}
        </span>
      );
  }
};

export const CategoryTag: React.FC<{ categoryId: string; lang?: Language; ball?: number }> = ({
  categoryId,
  lang = 'uz',
  ball,
}) => {
  const t = I18N[lang];
  return (
    <span className="inline-flex items-center gap-1.5 px-2.5 py-0.5 rounded-lg text-xs font-bold bg-blue-50 text-blue-700 border border-blue-200/70">
      <span>{categoryId}</span>
      {ball !== undefined && (
        <span className="px-1.5 py-0.2 bg-blue-200/60 rounded text-[10px] text-blue-900 font-extrabold">
          {ball} {t.common.ball}
        </span>
      )}
    </span>
  );
};
