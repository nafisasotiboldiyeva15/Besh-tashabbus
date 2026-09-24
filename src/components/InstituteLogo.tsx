import React from 'react';

interface LogoProps {
  className?: string;
  size?: number;
  showText?: boolean;
}

/**
 * Rasmiy Is'hoqxon Ibrat nomidagi Namangan davlat chet tillari instituti (NSIFL) logotipi.
 * To'liq vektor SVG ko'rinishida barcha ekranlarda tiniq va mukammal aks etadi.
 */
export const InstituteLogo: React.FC<LogoProps> = ({ className = '', size = 48, showText = false }) => {
  return (
    <div className={`inline-flex items-center gap-3 select-none ${className}`}>
      <svg
        width={size}
        height={size}
        viewBox="0 0 500 500"
        fill="none"
        xmlns="http://www.w3.org/2000/svg"
        xmlnsXlink="http://www.w3.org/1999/xlink"
        className="shrink-0 drop-shadow-xs"
        aria-label="Is'hoqxon Ibrat nomidagi Namangan davlat chet tillari instituti logotipi"
      >
        <defs>
          {/* Circular arch path for text from bottom-left up and over the top to bottom-right */}
          <path id="nsiflArchPath" d="M 134,407 A 187,187 0 1,1 366,407" fill="none" />
        </defs>

        {/* Clean White Circle Background */}
        <circle cx="250" cy="250" r="248" fill="#FFFFFF" />

        {/* Outer Concentric Teal Rings */}
        <circle cx="250" cy="250" r="242" fill="none" stroke="#00828A" strokeWidth="3.2" />
        <circle cx="250" cy="250" r="236" fill="none" stroke="#00828A" strokeWidth="1.8" />
        <circle cx="250" cy="250" r="231" fill="none" stroke="#00828A" strokeWidth="1" />

        {/* Inner Rings Enclosing the Center Emblem */}
        <circle cx="250" cy="250" r="172" fill="none" stroke="#00828A" strokeWidth="2.2" />
        <circle cx="250" cy="250" r="166" fill="none" stroke="#00828A" strokeWidth="1.2" />

        {/* Curved Institutional Text along Arc */}
        <text
          fill="#0B2038"
          fontFamily="'Times New Roman', 'Liberation Serif', Georgia, serif"
          fontWeight="900"
          fontSize="18.5"
          letterSpacing="0.8"
        >
          <textPath href="#nsiflArchPath" xlinkHref="#nsiflArchPath" startOffset="50%" textAnchor="middle">
            IS'HOQXON IBRAT NOMIDAGI NAMANGAN DAVLAT CHET TILLARI INSTITUTI
          </textPath>
        </text>

        {/* Bottom: Left Uzbek Flag Ribbon */}
        <g transform="translate(196, 436)">
          <path d="M-28,-8 Q-14,-14 0,-8 Q14,-2 28,-8 L28,-3 Q14,3 0,-3 Q-14,-9 -28,-3 Z" fill="#0099B5" />
          <path d="M-28,-3 Q-14,-9 0,-3 Q14,3 28,-3 L28,-2 Q14,4 0,-2 Q-14,-8 -28,-2 Z" fill="#CE1126" />
          <path d="M-28,-2 Q-14,-8 0,-2 Q14,4 28,-2 L28,2 Q14,8 0,2 Q-14,-4 -28,2 Z" fill="#FFFFFF" stroke="#CBD5E1" strokeWidth="0.3" />
          <path d="M-28,2 Q-14,-4 0,2 Q14,8 28,2 L28,3 Q14,9 0,3 Q-14,-3 -28,3 Z" fill="#CE1126" />
          <path d="M-28,3 Q-14,-3 0,3 Q14,9 28,3 L28,8 Q14,14 0,8 Q-14,2 -28,8 Z" fill="#1EB53A" />
        </g>

        {/* Year 2022 */}
        <text
          x="250"
          y="442"
          textAnchor="middle"
          fontFamily="'Times New Roman', Georgia, serif"
          fontWeight="900"
          fontSize="18"
          fill="#0B2038"
          letterSpacing="1"
        >
          2022
        </text>

        {/* Bottom: Right Uzbek Flag Ribbon */}
        <g transform="translate(304, 436)">
          <path d="M-28,-8 Q-14,-14 0,-8 Q14,-2 28,-8 L28,-3 Q14,3 0,-3 Q-14,-9 -28,-3 Z" fill="#0099B5" />
          <path d="M-28,-3 Q-14,-9 0,-3 Q14,3 28,-3 L28,-2 Q14,4 0,-2 Q-14,-8 -28,-2 Z" fill="#CE1126" />
          <path d="M-28,-2 Q-14,-8 0,-2 Q14,4 28,-2 L28,2 Q14,8 0,2 Q-14,-4 -28,2 Z" fill="#FFFFFF" stroke="#CBD5E1" strokeWidth="0.3" />
          <path d="M-28,2 Q-14,-4 0,2 Q14,8 28,2 L28,3 Q14,9 0,3 Q-14,-3 -28,3 Z" fill="#CE1126" />
          <path d="M-28,3 Q-14,-3 0,3 Q14,9 28,3 L28,8 Q14,14 0,8 Q-14,2 -28,8 Z" fill="#1EB53A" />
        </g>

        {/* ================= Central Temple Architecture ================= */}
        {/* Triangular Roof Pediment */}
        <polygon points="120,158 250,116 380,158" fill="#00828A" />

        {/* Architrave Beams under Roof */}
        <rect x="128" y="164" width="244" height="7" fill="#00828A" />
        <rect x="128" y="177" width="244" height="15" fill="#00828A" />

        {/* Big Bold N S I F L Letters */}
        <g fill="#00828A">
          {/* N */}
          <path d="M 131,202 L 150,202 L 168,290 L 168,202 L 184,202 L 184,328 L 165,328 L 147,240 L 147,328 L 131,328 Z" />

          {/* S */}
          <path d="M 233,230 L 217,230 C 217,220 212,216 203,216 C 195,216 190,220 190,227 C 190,236 197,241 210,248 C 227,256 235,267 235,284 C 235,309 220,330 195,330 C 172,330 159,313 158,292 L 174,292 C 175,306 182,315 195,315 C 205,315 218,309 218,289 C 218,279 211,273 199,266 C 182,258 173,248 173,230 C 173,210 188,200 205,200 C 224,200 233,213 233,230 Z" />

          {/* I */}
          <rect x="242" y="202" width="18" height="126" />

          {/* F */}
          <path d="M 270,202 L 312,202 L 312,218 L 288,218 L 288,255 L 309,255 L 309,271 L 288,271 L 288,328 L 270,328 Z" />

          {/* L */}
          <path d="M 324,202 L 342,202 L 342,312 L 369,312 L 369,328 L 324,328 Z" />
        </g>

        {/* Lower Base Steps (Stylobate) */}
        <rect x="128" y="342" width="244" height="10" fill="#00828A" />
        <rect x="128" y="358" width="244" height="15" fill="#00828A" />
      </svg>

      {showText && (
        <div className="flex flex-col text-left">
          <span className="text-sm font-extrabold text-slate-900 leading-tight">
            Is'hoqxon Ibrat nomidagi
          </span>
          <span className="text-xs font-bold text-teal-800 leading-tight">
            Namangan davlat chet tillari instituti
          </span>
          <span className="text-[11px] font-semibold text-slate-500 mt-0.5">
            5 muhim tashabbus • To'garaklar nazorati
          </span>
        </div>
      )}
    </div>
  );
};

export const TashabbusBadge: React.FC<{ size?: 'sm' | 'md' | 'lg' }> = ({ size = 'md' }) => {
  const dim = size === 'sm' ? 'w-8 h-8 text-sm' : size === 'lg' ? 'w-14 h-14 text-2xl' : 'w-10 h-10 text-lg';
  return (
    <div
      className={`${dim} rounded-xl bg-gradient-to-tr from-amber-500 via-teal-600 to-emerald-700 text-white font-black flex items-center justify-center shadow-xs shrink-0 border border-white/50 ring-1 ring-teal-500/20`}
      title="5 muhim tashabbus"
    >
      <span className="drop-shadow-xs font-black">5</span>
    </div>
  );
};
