import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

export default defineConfig({
  plugins: [react()],
  server: {
    port: 8000,
    open: false,
    host: '0.0.0.0',
    cors: true,
    strictPort: true,
    hmr: {
      host: 'app.sublimecyb.org',
      port: 8000,
    },
    headers: {
      'Access-Control-Allow-Origin': '*',
    },
  },
});
