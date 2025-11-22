import { defineConfig } from 'vite'

export default defineConfig({
  server: {
    allowedHosts: [
      'admin.thethaogiaxuong.store',
      'thethaogiaxuong.store',
    ],
  },
})

