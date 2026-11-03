import React, { useState } from 'react';
import { Users, FileCheck, CalendarCheck, AlertCircle, Award, BookOpen, Layers, ShieldAlert, Trash2, Sparkles, Send } from 'lucide-react';
import { I18N, Language, CATEGORIES } from '../../lib/i18n';
import { storage } from '../../lib/storage';

export const AdminOverviewView: React.FC<{
  lang: Language;
  onSelectView?: (view: string) => void;
}> = ({ lang, onSelectView }) => {
  const t = I18N[lang];
  const stats = storage.getAdminStats();
  const clubs = storage.getClubs();
  const rejectedClubs = clubs.filter((c) => c.statuteStatus === 'rejected');
  const telegramPostsCount = storage.getSessions().filter((s) => Boolean(s.telegramLink)).length;

  const statCards = [
    {
      title: t.admin.clubsTotal,
      value: stats.clubs,
      icon: Users,
      color: 'bg-blue-50 text-blue-700 border-blue-200',
      viewKey: 'clubs',
    },
    {
      title: t.admin.statutesPending,
      value: stats.statutesPending,
      icon: AlertCircle,
      color: 'bg-amber-50 text-amber-700 border-amber-200',
      viewKey: 'statutes',
    },
    {
      title: t.admin.membersPending,
      value: stats.membershipsPending,
      icon: FileCheck,
      color: 'bg-amber-50 text-amber-700 border-amber-200',
      viewKey: 'memberships',
    },
    {
      title: t.admin.sessionsHeld,
      value: stats.sessionsHeld,
      icon: CalendarCheck,
      color: 'bg-emerald-50 text-emerald-700 border-emerald-200',
      viewKey: 'schedule',
    },
    {
      title: t.admin.sessionsMissed,
      value: stats.sessionsMissed,
      icon: AlertCircle,
      color: stats.sessionsMissed > 0 ? 'bg-rose-50 text-rose-700 border-rose-200' : 'bg-slate-50 text-slate-700 border-slate-200',
      viewKey: 'schedule',
    },
    {
      title: t.admin.students,
      value: stats.students,
      icon: Users,
      color: 'bg-indigo-50 text-indigo-700 border-indigo-200',
      viewKey: 'memberships',
    },
    {
      title: 'Telegram havolalar',
      value: telegramPostsCount,
      icon: Send,
      color: 'bg-sky-50 text-sky-700 border-sky-200',
      viewKey: 'submissions',
    },
    {
      title: t.annual.title,
      value: stats.annualReports,
      icon: BookOpen,
      color: 'bg-indigo-50 text-indigo-700 border-indigo-200',
      viewKey: 'annual',
    },
  ];

  return (
    <div className="space-y-6">
      {/* Page Title */}
      <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
        <div>
          <h1 className="text-xl sm:text-2xl font-black text-slate-900 leading-tight">
            {t.admin.title}
          </h1>
          <p className="text-sm text-slate-500 mt-1">
            {t.admin.sub}
          </p>
        </div>
      </div>

      {/* Prominent Rejected Clubs Alert in Overview */}
      {rejectedClubs.length > 0 && (
        <div className="p-4 rounded-2xl bg-rose-50 border border-rose-300 text-rose-950 flex flex-col sm:flex-row items-start sm:items-center justify-between gap-3 shadow-xs">
          <div className="flex items-start gap-3">
            <div className="w-9 h-9 rounded-xl bg-rose-600 text-white flex items-center justify-center shrink-0 shadow-xs">
              <ShieldAlert className="w-5 h-5" />
            </div>
            <div>
              <p className="text-sm font-extrabold text-rose-900">
                Rad etilgan to‘garaklar mavjud ({rejectedClubs.length} ta)
              </p>
              <p className="text-xs text-rose-700 mt-0.5">
                Nizomi rad etilgan to‘garaklarni to‘g‘ridan-to‘g‘ri «To‘garak nizomlari» yoki «To‘garaklar» bo‘limidan o‘chirib tashlashingiz mumkin.
              </p>
            </div>
          </div>
          <div className="flex items-center gap-2 shrink-0">
            <button
              type="button"
              onClick={() => {
                if (window.confirm(`Rostdan ham barcha ${rejectedClubs.length} ta rad etilgan to‘garakni tizimdan o‘chirmoqchimisiz?`)) {
                  storage.deleteAllRejectedClubs('Hamidulla Abdualiyev (Bosh admin)');
                  if (onSelectView) onSelectView('overview');
                }
              }}
              className="px-3.5 py-2 rounded-xl bg-rose-600 hover:bg-rose-700 text-white text-xs font-black transition-all shadow-xs cursor-pointer flex items-center gap-1.5"
            >
              <Trash2 className="w-3.5 h-3.5" />
              <span>Barchasini o‘chirish ({rejectedClubs.length})</span>
            </button>
            {onSelectView && (
              <button
                type="button"
                onClick={() => onSelectView('statutes')}
                className="px-3 py-2 rounded-xl bg-white border border-rose-300 text-rose-800 text-xs font-bold transition-all shadow-xs cursor-pointer hover:bg-rose-100"
              >
                <span>Nizomlarda ko‘rish</span>
              </button>
            )}
          </div>
        </div>
      )}

      {/* KPI Cards Grid */}
      <div className="grid grid-cols-2 lg:grid-cols-4 gap-3.5 sm:gap-4">
        {statCards.map((card, idx) => {
          const Icon = card.icon;
          return (
            <div
              key={idx}
              onClick={() => {
                if (card.viewKey && onSelectView) {
                  onSelectView(card.viewKey);
                }
              }}
              className={`p-4 sm:p-5 rounded-2xl border shadow-xs transition-all ${card.color} ${
                card.viewKey && onSelectView
                  ? 'cursor-pointer hover:shadow-md hover:scale-[1.02] active:scale-98'
                  : ''
              }`}
            >
              <div className="flex items-center justify-between gap-2">
                <span className="text-xs sm:text-sm font-bold opacity-80 line-clamp-1">
                  {card.title}
                </span>
                <Icon className="w-4 h-4 shrink-0 opacity-70" />
              </div>
              <div className="text-2xl sm:text-3xl font-black mt-2">
                {card.value}
              </div>
            </div>
          );
        })}
      </div>

      {/* 5 Tashabbus Categories Table */}
      <div className="bg-white rounded-2xl border border-slate-200 overflow-hidden shadow-xs">
        <div className="px-5 py-4 border-b border-slate-100 flex items-center justify-between">
          <div className="flex items-center gap-2">
            <Layers className="w-4 h-4 text-blue-600" />
            <h3 className="text-base font-bold text-slate-900">
              {t.admin.byCategory}
            </h3>
          </div>
          <span className="text-xs text-slate-500 font-semibold">
            {CATEGORIES.length} ta yo'nalish
          </span>
        </div>

        <div className="overflow-x-auto">
          <table className="w-full text-left text-sm">
            <thead className="bg-slate-50/70 text-xs font-bold text-slate-500 uppercase border-b border-slate-100">
              <tr>
                <th className="px-5 py-3.5">№</th>
                <th className="px-5 py-3.5">{t.common.category}</th>
                <th className="px-5 py-3.5 text-right">{t.common.ball}</th>
                <th className="px-5 py-3.5 text-right">{t.common.club}</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-100">
              {CATEGORIES.map((cat, idx) => {
                const count = clubs.filter((c) => c.category === cat.id).length;
                const catName = lang === 'ru' ? cat.name_ru : cat.name_uz;
                return (
                  <tr key={cat.id} className="hover:bg-slate-50/50 transition-colors">
                    <td className="px-5 py-3.5 text-xs text-slate-400 font-bold">{idx + 1}</td>
                    <td className="px-5 py-3.5 font-bold text-slate-800">{catName}</td>
                    <td className="px-5 py-3.5 text-right">
                      <span className="inline-flex px-2 py-0.5 rounded-md bg-blue-50 text-blue-700 font-extrabold text-xs border border-blue-200/60">
                        {cat.ball} {t.common.ball}
                      </span>
                    </td>
                    <td className="px-5 py-3.5 text-right font-black text-slate-900">
                      {count}
                    </td>
                  </tr>
                );
              })}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
};
