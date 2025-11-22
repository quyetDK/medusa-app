import { defineConfig, mergeConfig } from 'vite'

export default (config) => {
  return mergeConfig(config, defineConfig({
    server: {
      allowedHosts: true, // Allow all hosts in development
    },
  }))
}

