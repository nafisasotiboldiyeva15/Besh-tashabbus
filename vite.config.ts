import tailwindcss from '@tailwindcss/vite';
import react from '@vitejs/plugin-react';
import path from 'path';
import fs from 'fs';
import {defineConfig} from 'vite';

function supabaseSyncPlugin() {
  return {
    name: 'supabase-sync-plugin',
    configureServer(server: any) {
      server.middlewares.use('/api/save-supabase-config', (req: any, res: any) => {
        if (req.method === 'POST') {
          let body = '';
          req.on('data', (chunk: any) => { body += chunk; });
          req.on('end', () => {
            try {
              const data = JSON.parse(body || '{}');
              const url = (data.url || '').trim().replace(/\/+$/, '');
              const anonKey = (data.anonKey || '').trim();

              if (url && anonKey && !url.includes('placeholder') && !url.includes('your-project-id')) {
                // 1. Update .env file
                const envPath = path.resolve(process.cwd(), '.env');
                let envContent = '';
                if (fs.existsSync(envPath)) {
                  envContent = fs.readFileSync(envPath, 'utf8');
                }

                if (envContent.includes('VITE_SUPABASE_URL=')) {
                  envContent = envContent.replace(/VITE_SUPABASE_URL=.*/g, `VITE_SUPABASE_URL="${url}"`);
                } else {
                  envContent += `\nVITE_SUPABASE_URL="${url}"\n`;
                }

                if (envContent.includes('VITE_SUPABASE_ANON_KEY=')) {
                  envContent = envContent.replace(/VITE_SUPABASE_ANON_KEY=.*/g, `VITE_SUPABASE_ANON_KEY="${anonKey}"`);
                } else {
                  envContent += `VITE_SUPABASE_ANON_KEY="${anonKey}"\n`;
                }

                fs.writeFileSync(envPath, envContent.trim() + '\n', 'utf8');

                // 2. Also update src/lib/supabaseConfig.ts so it's compiled into the bundle statically
                const configPath = path.resolve(process.cwd(), 'src/lib/supabaseConfig.ts');
                const configContent = `// UniBridge Global Supabase Configuration
// Ushbu fayl va atrof-muhit o'zgaruvchilari (VITE_SUPABASE_URL, VITE_SUPABASE_ANON_KEY)
// barcha o'qituvchi va talabalar, barcha qurilmalar va brauzerlar uchun yagona Supabase
// backendiga avtomatik va doimiy ulanishini kafolatlaydi.

export const SAVED_SUPABASE_URL: string = "${url}";
export const SAVED_SUPABASE_ANON_KEY: string = "${anonKey}";
`;
                fs.writeFileSync(configPath, configContent, 'utf8');

                res.setHeader('Content-Type', 'application/json');
                res.end(JSON.stringify({ success: true, url, saved: true }));
                return;
              }
              res.setHeader('Content-Type', 'application/json');
              res.end(JSON.stringify({ success: false, message: 'Invalid values' }));
            } catch (err: any) {
              res.statusCode = 500;
              res.setHeader('Content-Type', 'application/json');
              res.end(JSON.stringify({ error: err?.message || String(err) }));
            }
          });
        } else {
          res.statusCode = 405;
          res.end('Method Not Allowed');
        }
      });
    },
  };
}

export default defineConfig(() => {
  return {
    plugins: [react(), tailwindcss(), supabaseSyncPlugin()],
    resolve: {
      alias: {
        '@': path.resolve('.'),
      },
    },
    server: {
      hmr: process.env.DISABLE_HMR !== 'true',
      watch: process.env.DISABLE_HMR === 'true' ? null : {},
    },
  };
});
