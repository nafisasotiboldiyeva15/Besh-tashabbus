import html2canvas from 'html2canvas';
import { jsPDF } from 'jspdf';
import { ScheduleSlot, Session, User, Club, Report, AnnualReport, Membership } from '../types';
import { CATEGORIES, I18N, Language } from './i18n';
import { fmtD, weekdayOf, ymd } from './storage';

export async function downloadSchedulePDF(
  kind: 'admin' | 'leader',
  slots: ScheduleSlot[],
  sessions: Session[],
  currentUser: User,
  lang: Language = 'uz'
): Promise<void> {
  const t = I18N[lang];
  const isL = kind === 'leader';
  const now = new Date();

  // Create printable container
  const container = document.createElement('div');
  container.style.position = 'fixed';
  container.style.left = '-12000px';
  container.style.top = '0';
  container.style.width = '1120px';
  container.style.backgroundColor = '#ffffff';
  container.style.fontFamily = 'Arial, sans-serif';
  container.style.color = '#111827';
  container.style.padding = '32px 36px';
  container.style.boxSizing = 'border-box';

  const cellStyle = 'border: 1px solid #94a3b8; padding: 7px 9px; font-size: 12px; vertical-align: top;';
  const headerStyle = `${cellStyle} background: #1e3a8a; color: #ffffff; font-weight: 700; text-align: left;`;

  let html = `
    <div style="text-align: center; margin-bottom: 20px;">
      <div style="font-size: 13px; font-weight: 600; color: #475569; text-transform: uppercase; letter-spacing: 0.5px;">
        ${t.app.institute}
      </div>
      <div style="font-size: 12px; color: #0284c7; font-weight: 700; margin-top: 3px;">
        5 MUHIM TASHABBUS DOIRASIDAGI TO‘GARAKLAR
      </div>
      <div style="font-size: 20px; font-weight: 900; margin-top: 8px; color: #0f172a; letter-spacing: 0.5px;">
        ${isL ? t.sch.pdfTitleLeader : t.sch.pdfTitleAll}
      </div>
      <div style="font-size: 12px; color: #334155; margin-top: 6px;">
        ${isL ? `${t.sch.signLeader}: <b>${currentUser.fullName}</b> ${currentUser.faculty ? `(${currentUser.faculty})` : ''} · ` : ''}
        ${t.sch.generatedAt}: <b>${fmtD(ymd(now))}</b>
      </div>
    </div>
  `;

  // Weekly Slots Table
  const cols = isL
    ? ['№', t.sch.weekday, t.common.club, t.common.category, t.common.time, t.sch.room, t.sch.period]
    : ['№', t.sch.weekday, t.common.club, t.common.category, t.common.leader, t.common.time, t.sch.room, t.sch.period];

  html += `
    <table style="width: 100%; border-collapse: collapse; margin-bottom: 16px;">
      <thead>
        <tr>
          ${cols.map((c) => `<th style="${headerStyle}">${c}</th>`).join('')}
        </tr>
      </thead>
      <tbody>
  `;

  if (slots.length === 0) {
    html += `<tr><td colspan="${cols.length}" style="${cellStyle} text-align: center; color: #64748b;">${t.sch.noSlots}</td></tr>`;
  } else {
    let n = 0;
    for (let day = 1; day <= 7; day++) {
      const daySlots = slots.filter((s) => s.weekday === day);
      if (daySlots.length === 0) continue;

      const dayName = t.sch.days[day - 1];
      html += `
        <tr>
          <td colspan="${cols.length}" style="${cellStyle} background: #eff6ff; font-weight: 800; color: #1e40af; text-transform: uppercase; font-size: 11.5px;">
            ${dayName}
          </td>
        </tr>
      `;

      daySlots.forEach((slot) => {
        n++;
        const cat = CATEGORIES.find((c) => c.id === slot.category);
        const catTitle = lang === 'ru' ? cat?.name_ru : cat?.name_uz;

        html += `
          <tr>
            <td style="${cellStyle} width: 34px; text-align: center;">${n}</td>
            <td style="${cellStyle} white-space: nowrap;">${dayName}</td>
            <td style="${cellStyle} font-weight: 700; color: #0f172a;">${slot.clubName || '—'}</td>
            <td style="${cellStyle}">${catTitle || slot.category || '—'}</td>
            ${isL ? '' : `<td style="${cellStyle}">${slot.leaderName || '—'}</td>`}
            <td style="${cellStyle} white-space: nowrap; font-weight: 700; color: #1e3a8a;">
              ${slot.timeStart}${slot.timeEnd ? ` – ${slot.timeEnd}` : ''}
            </td>
            <td style="${cellStyle}">${slot.room}</td>
            <td style="${cellStyle} white-space: nowrap; font-size: 11px;">
              ${fmtD(slot.startDate)} — ${fmtD(slot.endDate)}
            </td>
          </tr>
        `;
      });
    }
  }

  html += `</tbody></table>`;

  // Leader: Dated Calendar Sessions
  if (isL && sessions.length > 0) {
    html += `
      <div style="font-size: 14px; font-weight: 800; margin: 24px 0 10px; text-align: center; color: #0f172a;">
        ${t.sch.calendarTitle}
      </div>
      <table style="width: 100%; border-collapse: collapse; margin-bottom: 16px;">
        <thead>
          <tr>
            <th style="${headerStyle} width: 34px;">№</th>
            <th style="${headerStyle} width: 85px;">${t.common.date}</th>
            <th style="${headerStyle} width: 95px;">${t.sch.weekday}</th>
            <th style="${headerStyle}">${t.common.topic}</th>
            <th style="${headerStyle} width: 100px;">${t.common.time}</th>
            <th style="${headerStyle} width: 140px;">${t.sch.room}</th>
            <th style="${headerStyle} width: 95px;">${t.common.status}</th>
          </tr>
        </thead>
        <tbody>
    `;

    const statusMap = {
      planned: t.common.planned,
      held: t.common.held,
      missed: t.common.missed,
    };

    sessions.forEach((ses, idx) => {
      const dayName = t.sch.days[weekdayOf(ses.date) - 1] || '—';
      html += `
        <tr>
          <td style="${cellStyle} text-align: center;">${idx + 1}</td>
          <td style="${cellStyle} white-space: nowrap;">${fmtD(ses.date)}</td>
          <td style="${cellStyle}">${dayName}</td>
          <td style="${cellStyle} font-weight: 600;">${ses.topic}</td>
          <td style="${cellStyle} white-space: nowrap;">${ses.time}${ses.timeEnd ? ` – ${ses.timeEnd}` : ''}</td>
          <td style="${cellStyle}">${ses.location}</td>
          <td style="${cellStyle} font-weight: 700; color: ${ses.status === 'held' ? '#15803d' : ses.status === 'missed' ? '#b91c1c' : '#1d4ed8'};">
            ${statusMap[ses.status] || ses.status}
          </td>
        </tr>
      `;
    });

    html += `</tbody></table>`;
  }

  // Signature lines
  html += `
    <div style="display: flex; justify-content: space-between; align-items: flex-end; margin-top: 36px; font-size: 13px; color: #1e293b;">
      <div>
        <span>${isL ? t.sch.signLeader : t.sch.responsible}: </span>
        <span style="display: inline-block; width: 180px; border-bottom: 1px solid #334155; margin: 0 8px;"></span>
        <b>${isL ? currentUser.fullName : 'Institut Maʼmuriyati'}</b>
      </div>
      <div>
        <span>${t.common.date}: </span>
        <span style="font-weight: 700;">${fmtD(ymd(now))}</span>
      </div>
    </div>
  `;

  container.innerHTML = html;
  document.body.appendChild(container);

  try {
    const canvas = await html2canvas(container, {
      scale: 2,
      backgroundColor: '#ffffff',
      useCORS: true,
      windowWidth: 1200,
    });

    const pdf = new jsPDF({
      orientation: 'landscape',
      unit: 'mm',
      format: 'a4',
    });

    const margin = 8;
    const imgWidth = 297 - margin * 2;
    const imgHeight = (canvas.height * imgWidth) / canvas.width;

    const pageHeight = 210 - margin * 2;
    let heightLeft = imgHeight;
    let position = margin;

    pdf.addImage(canvas.toDataURL('image/jpeg', 0.95), 'JPEG', margin, position, imgWidth, imgHeight);
    heightLeft -= pageHeight;

    while (heightLeft > 0) {
      position = heightLeft - imgHeight + margin;
      pdf.addPage();
      pdf.addImage(canvas.toDataURL('image/jpeg', 0.95), 'JPEG', margin, position, imgWidth, imgHeight);
      heightLeft -= pageHeight;
    }

    const safeName = currentUser.fullName.replace(/[^\w\d]/g, '_');
    const fileName = isL
      ? `Togarak_grafigi_${safeName}_${ymd(now)}.pdf`
      : `Togaraklar_umumiy_grafigi_${ymd(now)}.pdf`;

    pdf.save(fileName);
  } catch (err) {
    console.error('PDF export error:', err);
    // Fallback: window.print
    const printWindow = window.open('', '_blank');
    if (printWindow) {
      printWindow.document.write(`
        <!DOCTYPE html>
        <html>
          <head>
            <meta charset="utf-8">
            <title>${isL ? t.sch.pdfTitleLeader : t.sch.pdfTitleAll}</title>
            <style>
              @page { size: A4 landscape; margin: 8mm; }
              body { margin: 0; }
            </style>
          </head>
          <body>
            ${container.innerHTML}
          </body>
        </html>
      `);
      printWindow.document.close();
      printWindow.focus();
      setTimeout(() => printWindow.print(), 500);
    }
  } finally {
    container.remove();
  }
}

/**
 * Alohida to'garak hisobotini (O'tkazilgan darslar, PDF hisobotlar, OAV havolalari va fotosuratlar)
 * toza, chiroyli va rasmiy PDF formatida yuklab olish.
 */
export async function downloadClubReportPDF(
  club: Club,
  reports: Report[],
  sessions: Session[],
  annualReport: AnnualReport | null,
  lang: Language = 'uz'
): Promise<void> {
  const t = I18N[lang];
  const now = new Date();
  const heldSessions = sessions.filter((s) => s.status === 'held');

  const container = document.createElement('div');
  container.style.position = 'fixed';
  container.style.left = '-12000px';
  container.style.top = '0';
  container.style.width = '1000px';
  container.style.backgroundColor = '#ffffff';
  container.style.fontFamily = 'Arial, sans-serif';
  container.style.color = '#111827';
  container.style.padding = '32px 36px';
  container.style.boxSizing = 'border-box';

  const cellStyle = 'border: 1px solid #94a3b8; padding: 7px 9px; font-size: 11px; vertical-align: top;';
  const headerStyle = `${cellStyle} background: #00828a; color: #ffffff; font-weight: 700; text-align: left;`;

  const catObj = CATEGORIES.find((item) => item.id === club.category);
  const catName = catObj ? (lang === 'uz' ? catObj.name_uz : catObj.name_ru) : club.category;

  let html = `
    <div style="text-align: center; margin-bottom: 24px;">
      <div style="font-size: 13px; font-weight: 700; color: #475569; text-transform: uppercase;">
        ${t.app.institute}
      </div>
      <div style="font-size: 11px; color: #00828a; font-weight: 800; margin-top: 4px;">
        5 MUHIM TASHABBUS DOIRASIDAGI TO‘GARAKLAR HISOBOTI
      </div>
      <div style="font-size: 20px; font-weight: 900; margin-top: 10px; color: #0f172a;">
        «${club.name.toUpperCase()}» TO‘GARAGI HISOBOTI
      </div>
      <div style="font-size: 12px; color: #475569; margin-top: 6px;">
        Tashabbus yo‘nalishi: <b>${catName}</b> · 
        To‘garak rahbari: <b>${club.leaderName || 'Rahbar'}</b> (${club.faculty || 'Institut'})
      </div>
      <div style="font-size: 11px; color: #64748b; margin-top: 4px;">
        Shakllantirilgan sana: <b>${fmtD(ymd(now))}</b> · Auditoriya: <b>${club.room || '—'}</b> · Mashg'ulot soati: <b>${club.timeStart && club.timeEnd ? `${club.timeStart} - ${club.timeEnd}` : '—'}</b>
      </div>
    </div>

    <!-- Summary Box -->
    <div style="display: flex; gap: 12px; margin-bottom: 20px;">
      <div style="flex: 1; border: 1px solid #cbd5e1; border-radius: 8px; padding: 10px; background: #f8fafc; text-align: center;">
        <div style="font-size: 10px; color: #64748b; font-weight: 700; text-transform: uppercase;">A'zolar</div>
        <div style="font-size: 18px; font-weight: 900; color: #0f172a; margin-top: 2px;">${club.memberCount || 0} nafar</div>
      </div>
      <div style="flex: 1; border: 1px solid #cbd5e1; border-radius: 8px; padding: 10px; background: #f8fafc; text-align: center;">
        <div style="font-size: 10px; color: #64748b; font-weight: 700; text-transform: uppercase;">Rejadagi darslar</div>
        <div style="font-size: 18px; font-weight: 900; color: #0284c7; margin-top: 2px;">${sessions.length} ta</div>
      </div>
      <div style="flex: 1; border: 1px solid #cbd5e1; border-radius: 8px; padding: 10px; background: #f8fafc; text-align: center;">
        <div style="font-size: 10px; color: #64748b; font-weight: 700; text-transform: uppercase;">O‘tkazilgan darslar</div>
        <div style="font-size: 18px; font-weight: 900; color: #16a34a; margin-top: 2px;">${heldSessions.length} ta</div>
      </div>
      <div style="flex: 1; border: 1px solid #cbd5e1; border-radius: 8px; padding: 10px; background: #f8fafc; text-align: center;">
        <div style="font-size: 10px; color: #64748b; font-weight: 700; text-transform: uppercase;">Rasmiy hisobotlar</div>
        <div style="font-size: 18px; font-weight: 900; color: #d97706; margin-top: 2px;">${reports.length} ta</div>
      </div>
    </div>
  `;

  // 1. Held Sessions Section
  html += `
    <div style="margin-bottom: 20px;">
      <div style="font-size: 13px; font-weight: 800; color: #0f172a; margin-bottom: 8px; text-transform: uppercase; border-bottom: 2px solid #00828a; padding-bottom: 4px;">
        1. O‘tkazilgan mashg‘ulotlar va davomat monitoringi (${heldSessions.length} ta dars o‘tilgan)
      </div>
      <table style="width: 100%; border-collapse: collapse;">
        <thead>
          <tr>
            <th style="${headerStyle}; width: 35px; text-align: center;">№</th>
            <th style="${headerStyle}; width: 85px;">Sana</th>
            <th style="${headerStyle};">Mavzu</th>
            <th style="${headerStyle}; width: 70px; text-align: center;">Qatnashuvchilar</th>
            <th style="${headerStyle}; width: 110px; text-align: center;">Telegram havola</th>
            <th style="${headerStyle};">Rahbar izohi</th>
          </tr>
        </thead>
        <tbody>
  `;

  if (heldSessions.length === 0) {
    html += `<tr><td colspan="6" style="${cellStyle}; text-align: center; color: #94a3b8; padding: 14px;">Mashg‘ulotlar hali o‘tkazilmagan.</td></tr>`;
  } else {
    heldSessions.forEach((s, idx) => {
      const hasTelegram = Boolean(s.telegramLink);
      html += `
        <tr style="background: ${idx % 2 === 0 ? '#ffffff' : '#f8fafc'};">
          <td style="${cellStyle}; text-align: center; font-weight: 700;">${idx + 1}</td>
          <td style="${cellStyle}; font-weight: 600;">${fmtD(s.date)}</td>
          <td style="${cellStyle}; font-weight: 700; color: #0f172a;">${s.topic || '—'}</td>
          <td style="${cellStyle}; text-align: center; font-weight: 700; color: #16a34a;">${s.attendeeCount || 0} nafar</td>
          <td style="${cellStyle}; text-align: center; font-weight: 700; color: #0284c7;">${hasTelegram ? `✓ Telegram post` : '—'}</td>
          <td style="${cellStyle}; color: #475569;">${s.heldNote || '—'}</td>
        </tr>
      `;
    });
  }
  html += `</tbody></table></div>`;

  // 2. Official PDF & Social reports
  html += `
    <div style="margin-bottom: 20px;">
      <div style="font-size: 13px; font-weight: 800; color: #0f172a; margin-bottom: 8px; text-transform: uppercase; border-bottom: 2px solid #00828a; padding-bottom: 4px;">
        2. Yuklangan rasmiy hisobotlar va OAV yoritilishi (${reports.length} ta hisobot)
      </div>
      <table style="width: 100%; border-collapse: collapse;">
        <thead>
          <tr>
            <th style="${headerStyle}; width: 35px; text-align: center;">№</th>
            <th style="${headerStyle};">Hisobot nomi</th>
            <th style="${headerStyle};">Tegishli mavzu</th>
            <th style="${headerStyle}; width: 100px;">PDF fayl</th>
            <th style="${headerStyle}; width: 150px;">OAV / Ijtimoiy havola</th>
            <th style="${headerStyle}; width: 85px; text-align: right;">Sana</th>
          </tr>
        </thead>
        <tbody>
  `;

  if (reports.length === 0) {
    html += `<tr><td colspan="6" style="${cellStyle}; text-align: center; color: #94a3b8; padding: 14px;">Rasmiy PDF hisobotlar hali yuklanmagan.</td></tr>`;
  } else {
    reports.forEach((r, idx) => {
      html += `
        <tr style="background: ${idx % 2 === 0 ? '#ffffff' : '#f8fafc'};">
          <td style="${cellStyle}; text-align: center; font-weight: 700;">${idx + 1}</td>
          <td style="${cellStyle}; font-weight: 700; color: #0f172a;">${r.title}</td>
          <td style="${cellStyle}; color: #475569;">${r.sessionTopic || 'Umumiy'}</td>
          <td style="${cellStyle}; font-weight: 600; color: #0284c7;">${r.pdfFile ? `✓ ${r.pdfFile.name}` : '—'}</td>
          <td style="${cellStyle}; font-size: 10px; color: #2563eb; word-break: break-all;">${r.socialLink || '—'}</td>
          <td style="${cellStyle}; text-align: right; color: #64748b;">${r.createdAt.slice(0, 10)}</td>
        </tr>
      `;
    });
  }
  html += `</tbody></table></div>`;

  // Signatures
  html += `
    <div style="display: flex; justify-content: space-between; margin-top: 36px; padding-top: 16px; border-top: 1px dashed #cbd5e1; font-size: 12px;">
      <div>
        <div>To‘garak rahbari:</div>
        <div style="margin-top: 24px; font-weight: 700;">_________________ / ${club.leaderName}</div>
      </div>
      <div style="text-align: right;">
        <div>Institut Bosh Administratori:</div>
        <div style="margin-top: 24px; font-weight: 700;">_________________ / Hamidulla Abdualiyev</div>
      </div>
    </div>
  `;

  container.innerHTML = html;
  document.body.appendChild(container);

  try {
    const canvas = await html2canvas(container, {
      scale: 2,
      useCORS: true,
      backgroundColor: '#ffffff',
      windowWidth: 1050,
    });

    const pdf = new jsPDF({
      orientation: 'portrait',
      unit: 'mm',
      format: 'a4',
    });

    const margin = 8;
    const imgWidth = 210 - margin * 2;
    const imgHeight = (canvas.height * imgWidth) / canvas.width;
    const pageHeight = 297 - margin * 2;

    let heightLeft = imgHeight;
    let position = margin;

    pdf.addImage(canvas.toDataURL('image/jpeg', 0.95), 'JPEG', margin, position, imgWidth, imgHeight);
    heightLeft -= pageHeight;

    while (heightLeft > 0) {
      position = heightLeft - imgHeight + margin;
      pdf.addPage();
      pdf.addImage(canvas.toDataURL('image/jpeg', 0.95), 'JPEG', margin, position, imgWidth, imgHeight);
      heightLeft -= pageHeight;
    }

    const safeClubName = club.name.replace(/[^\w\d]/g, '_');
    pdf.save(`Togarak_hisoboti_${safeClubName}_${ymd(now)}.pdf`);
  } catch (err) {
    console.error('PDF export error:', err);
  } finally {
    container.remove();
  }
}

/**
 * Downloads the club members list as a formatted, official PDF document.
 */
export async function downloadMembersPDF(
  members: Membership[],
  options?: {
    clubName?: string;
    leaderName?: string;
    faculty?: string;
    filterGroup?: string;
    searchQuery?: string;
    lang?: Language;
  }
): Promise<void> {
  const lang = options?.lang || 'uz';
  const t = I18N[lang];
  const now = new Date();

  // Printable container setup for A4 Landscape
  const container = document.createElement('div');
  container.style.position = 'fixed';
  container.style.left = '-12000px';
  container.style.top = '0';
  container.style.width = '1180px';
  container.style.backgroundColor = '#ffffff';
  container.style.fontFamily = 'Arial, sans-serif';
  container.style.color = '#0f172a';
  container.style.padding = '32px 36px';
  container.style.boxSizing = 'border-box';

  const cellStyle = 'border: 1px solid #cbd5e1; padding: 7px 9px; font-size: 11.5px; vertical-align: middle;';
  const headerStyle = `${cellStyle} background: #1e3a8a; color: #ffffff; font-weight: 700; text-align: left; font-size: 12px;`;

  // Compute unique groups and tutors
  const uniqueGroups = new Set<string>();
  const uniqueTutors = new Set<string>();
  members.forEach((m) => {
    if (m.studentGroup && m.studentGroup !== '—') uniqueGroups.add(m.studentGroup);
    if (m.tutorName && m.tutorName !== '—') uniqueTutors.add(m.tutorName);
  });

  const clubTitle = options?.clubName ? `«${options.clubName}» TO‘GARAGI` : 'BARCHA TO‘GARAKLAR';

  let html = `
    <!-- Institution Header -->
    <div style="text-align: center; margin-bottom: 22px; border-bottom: 2px solid #1e3a8a; padding-bottom: 14px;">
      <div style="font-size: 12px; font-weight: 700; color: #475569; text-transform: uppercase; letter-spacing: 0.5px;">
        O‘zbekiston Respublikasi Oliy ta’lim, fan va innovatsiyalar vazirligi
      </div>
      <div style="font-size: 14px; font-weight: 800; color: #1e3a8a; margin-top: 2px; text-transform: uppercase; letter-spacing: 0.5px;">
        ${t.app.institute}
      </div>
      <div style="font-size: 11.5px; font-weight: 700; color: #0284c7; margin-top: 2px;">
        5 MUHIM TASHABBUS DOIRASIDAGI TALABALAR TO‘GARAKLARI FAOLIYATI
      </div>
      <div style="font-size: 19px; font-weight: 900; margin-top: 10px; color: #0f172a; letter-spacing: 0.5px;">
        ${clubTitle} A’ZOLARI REESTRI (RO‘YXATI)
      </div>
      <div style="display: flex; justify-content: center; gap: 20px; font-size: 11.5px; color: #334155; margin-top: 8px;">
        ${options?.leaderName ? `<span>To‘garak rahbari: <b>${options.leaderName}</b></span>` : ''}
        ${options?.faculty ? `<span>Fakultet: <b>${options.faculty}</b></span>` : ''}
        ${options?.filterGroup ? `<span>Guruh: <b>${options.filterGroup}</b></span>` : ''}
        <span>Shakllantirilgan sana: <b>${fmtD(ymd(now))}</b></span>
      </div>
    </div>

    <!-- Statistics Strip -->
    <div style="display: flex; justify-content: space-between; align-items: center; background: #f1f5f9; border: 1px solid #e2e8f0; border-radius: 8px; padding: 10px 16px; margin-bottom: 18px;">
      <div style="font-size: 12px; color: #1e293b;">
        Jami ro‘yxatga olingan to‘garak a’zolari: <b style="color: #1e3a8a; font-size: 13px;">${members.length} nafar</b>
      </div>
      <div style="font-size: 12px; color: #1e293b;">
        Qamrab olingan akademik guruhlar: <b style="color: #4338ca; font-size: 13px;">${uniqueGroups.size} ta</b>
      </div>
      <div style="font-size: 12px; color: #1e293b;">
        Biriktirilgan mas’ul tutorlar: <b style="color: #7c3aed; font-size: 13px;">${uniqueTutors.size} nafar</b>
      </div>
    </div>

    <!-- Main Table -->
    <table style="width: 100%; border-collapse: collapse; margin-bottom: 24px;">
      <thead>
        <tr>
          <th style="${headerStyle} width: 34px; text-align: center;">№</th>
          <th style="${headerStyle} width: 220px;">F.I.SH. (Talaba)</th>
          <th style="${headerStyle} width: 90px; text-align: center;">Guruhi</th>
          <th style="${headerStyle} width: 200px;">Biriktirilgan tutor (F.I.SH.)</th>
          <th style="${headerStyle} width: 170px;">To‘garak nomi</th>
          <th style="${headerStyle} width: 140px;">Fakulteti</th>
          <th style="${headerStyle} width: 120px;">Telefon / Aloqa</th>
          <th style="${headerStyle} width: 90px; text-align: center;">Sana</th>
        </tr>
      </thead>
      <tbody>
  `;

  if (members.length === 0) {
    html += `
      <tr>
        <td colspan="8" style="${cellStyle} text-align: center; color: #64748b; padding: 24px; font-size: 13px;">
          To‘garak a’zolari mavjud emas yoki tanlangan filtrlar bo‘yicha topilmadi.
        </td>
      </tr>
    `;
  } else {
    members.forEach((m, idx) => {
      const bg = idx % 2 === 0 ? '#ffffff' : '#f8fafc';
      html += `
        <tr style="background: ${bg};">
          <td style="${cellStyle} text-align: center; font-weight: 700; color: #64748b;">${idx + 1}</td>
          <td style="${cellStyle} font-weight: 700; color: #0f172a;">${m.studentName || '—'}</td>
          <td style="${cellStyle} text-align: center; font-weight: 600; color: #1e40af;">${m.studentGroup || '—'}</td>
          <td style="${cellStyle} color: #334155;">${m.tutorName || '—'}</td>
          <td style="${cellStyle} font-weight: 600; color: #0369a1;">${m.clubName || '—'}</td>
          <td style="${cellStyle} color: #475569; font-size: 11px;">${m.studentFaculty || '—'}</td>
          <td style="${cellStyle} color: #0284c7; font-size: 11px;">${m.phoneOrTelegram || '—'}</td>
          <td style="${cellStyle} text-align: center; color: #64748b; font-size: 10.5px;">${fmtD(m.createdAt)}</td>
        </tr>
      `;
    });
  }

  html += `
      </tbody>
    </table>

    <!-- Official Signatures Block -->
    <div style="display: flex; justify-content: space-between; align-items: flex-start; margin-top: 32px; padding-top: 18px; border-top: 1.5px dashed #cbd5e1; font-size: 12px; color: #1e293b;">
      <div style="width: 32%;">
        <div style="font-weight: 600;">To‘garak rahbari:</div>
        <div style="margin-top: 28px; border-bottom: 1px solid #475569; padding-bottom: 4px; font-weight: 700;">
          ${options?.leaderName ? options.leaderName : '___________________________'}
        </div>
        <div style="font-size: 10.5px; color: #64748b; margin-top: 2px;">(imzo va F.I.SH.)</div>
      </div>

      <div style="width: 32%; text-align: center;">
        <div style="font-weight: 600;">Yoshlar bilan ishlash bo‘limi:</div>
        <div style="margin-top: 28px; border-bottom: 1px solid #475569; padding-bottom: 4px; font-weight: 700;">
          Hamidulla Abdualiyev
        </div>
        <div style="font-size: 10.5px; color: #64748b; margin-top: 2px;">(Bosh mas’ul xodim)</div>
      </div>

      <div style="width: 28%; text-align: right;">
        <div style="font-weight: 600;">Tasdiq / Muhr o‘rni:</div>
        <div style="margin-top: 28px; font-weight: 700; color: #64748b;">
          M.O‘.
        </div>
        <div style="font-size: 10.5px; color: #64748b; margin-top: 2px;">Sana: ${fmtD(ymd(now))}</div>
      </div>
    </div>
  `;

  container.innerHTML = html;
  document.body.appendChild(container);

  try {
    const canvas = await html2canvas(container, {
      scale: 2,
      useCORS: true,
      backgroundColor: '#ffffff',
      windowWidth: 1180,
    });

    const pdf = new jsPDF({
      orientation: 'landscape',
      unit: 'mm',
      format: 'a4',
    });

    const margin = 8;
    const imgWidth = 297 - margin * 2;
    const imgHeight = (canvas.height * imgWidth) / canvas.width;
    const pageHeight = 210 - margin * 2;

    let heightLeft = imgHeight;
    let position = margin;

    pdf.addImage(canvas.toDataURL('image/jpeg', 0.96), 'JPEG', margin, position, imgWidth, imgHeight);
    heightLeft -= pageHeight;

    while (heightLeft > 0) {
      position = heightLeft - imgHeight + margin;
      pdf.addPage();
      pdf.addImage(canvas.toDataURL('image/jpeg', 0.96), 'JPEG', margin, position, imgWidth, imgHeight);
      heightLeft -= pageHeight;
    }

    const safeClub = (options?.clubName || 'Barcha_togaraklar')
      .replace(/[^\w\d\u0400-\u04FF]/g, '_')
      .slice(0, 40);
    pdf.save(`Togarak_Azolari_${safeClub}_${ymd(now)}.pdf`);
  } catch (err) {
    console.error('Members PDF export error:', err);
    throw err;
  } finally {
    container.remove();
  }
}

