export async function register() {
  if (process.env.NEXT_RUNTIME === 'nodejs') {
    const { ensureMigrations } = await import('./lib/migrate-on-start')
    await ensureMigrations()
  }
}
