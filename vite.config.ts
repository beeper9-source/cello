import { defineConfig } from 'vite'

export default defineConfig({
  server: {
    port: 3001,
    open: true,
    host: '0.0.0.0'
  },
  root: '.',
  build: {
    outDir: 'dist',
    assetsDir: 'assets',
    rollupOptions: {
      input: {
        main: 'index.html'
      }
    }
  }
})
