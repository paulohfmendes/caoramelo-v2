import pool from './db'

let migrationPromise: Promise<void> | null = null

export function ensureMigrations(): Promise<void> {
  if (!migrationPromise) {
    migrationPromise = runMigrations()
  }
  return migrationPromise
}

async function runMigrations(): Promise<void> {
  const client = await pool.connect()
  try {
    // Verificar se a coluna deleted_at já existe
    const { rows } = await client.query(`
      SELECT column_name FROM information_schema.columns
      WHERE table_name = 'agendamentos' AND column_name = 'deleted_at'
    `)

    if (rows.length > 0) return // Migração já foi aplicada

    console.log('[migrate] Aplicando migração 008_improvements...')

    await client.query('BEGIN')

    // 1. Colunas updated_at
    await client.query(`ALTER TABLE users             ADD COLUMN IF NOT EXISTS updated_at TIMESTAMPTZ`)
    await client.query(`ALTER TABLE tutores            ADD COLUMN IF NOT EXISTS updated_at TIMESTAMPTZ`)
    await client.query(`ALTER TABLE pets               ADD COLUMN IF NOT EXISTS updated_at TIMESTAMPTZ`)
    await client.query(`ALTER TABLE agendamentos       ADD COLUMN IF NOT EXISTS updated_at TIMESTAMPTZ`)
    await client.query(`ALTER TABLE pagamentos         ADD COLUMN IF NOT EXISTS updated_at TIMESTAMPTZ`)
    await client.query(`ALTER TABLE checklist_registros ADD COLUMN IF NOT EXISTS updated_at TIMESTAMPTZ`)

    // 2. Função e triggers de updated_at
    await client.query(`
      CREATE OR REPLACE FUNCTION set_updated_at()
      RETURNS TRIGGER LANGUAGE plpgsql AS $$
      BEGIN NEW.updated_at = NOW(); RETURN NEW; END; $$
    `)
    for (const tbl of ['users', 'tutores', 'pets', 'agendamentos', 'pagamentos']) {
      await client.query(`DROP TRIGGER IF EXISTS trg_${tbl}_updated_at ON ${tbl}`)
      await client.query(`
        CREATE TRIGGER trg_${tbl}_updated_at
          BEFORE UPDATE ON ${tbl}
          FOR EACH ROW EXECUTE FUNCTION set_updated_at()
      `)
    }
    await client.query(`DROP TRIGGER IF EXISTS trg_checklist_updated_at ON checklist_registros`)
    await client.query(`
      CREATE TRIGGER trg_checklist_updated_at
        BEFORE UPDATE ON checklist_registros
        FOR EACH ROW EXECUTE FUNCTION set_updated_at()
    `)

    // 3. Soft delete em agendamentos
    await client.query(`ALTER TABLE agendamentos ADD COLUMN IF NOT EXISTS deleted_at TIMESTAMPTZ`)
    await client.query(`
      CREATE INDEX IF NOT EXISTS idx_agendamentos_deleted
        ON agendamentos(deleted_at) WHERE deleted_at IS NULL
    `)

    // 4. Normalizar banho_status legados
    await client.query(`
      UPDATE agendamentos SET banho_status = 'em_atendimento'
      WHERE banho_status IN ('em_banho', 'em_tosa')
    `)
    await client.query(`
      UPDATE agendamentos SET banho_status = 'pronto'
      WHERE banho_status = 'retirado'
    `)

    // 5. Atualizar constraint
    await client.query(`ALTER TABLE agendamentos DROP CONSTRAINT IF EXISTS agendamentos_banho_status_check`)
    await client.query(`
      ALTER TABLE agendamentos ADD CONSTRAINT agendamentos_banho_status_check
        CHECK (banho_status IN ('agendado', 'chegou', 'em_atendimento', 'pronto'))
    `)

    await client.query('COMMIT')
    console.log('[migrate] Migração 008 aplicada com sucesso.')
  } catch (err) {
    await client.query('ROLLBACK').catch(() => {})
    console.error('[migrate] Erro ao aplicar migração:', err)
    migrationPromise = null // Permitir nova tentativa no próximo restart
  } finally {
    client.release()
  }
}
