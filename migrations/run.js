const { Pool } = require('pg')
const fs = require('fs')
const path = require('path')

async function run() {
  const pool = new Pool({
    connectionString: process.env.DATABASE_URL,
    ssl: process.env.NODE_ENV === 'production' ? { rejectUnauthorized: false } : false,
  })

  await pool.query(`
    CREATE TABLE IF NOT EXISTS _migrations (
      id      SERIAL PRIMARY KEY,
      name    VARCHAR(255) UNIQUE NOT NULL,
      run_at  TIMESTAMPTZ NOT NULL DEFAULT NOW()
    )
  `)

  const dir = path.join(__dirname)
  const files = fs.readdirSync(dir).filter(f => f.endsWith('.sql')).sort()

  for (const file of files) {
    const { rows } = await pool.query('SELECT id FROM _migrations WHERE name = $1', [file])
    if (rows.length > 0) { console.log(`  skip ${file}`); continue }
    const sql = fs.readFileSync(path.join(dir, file), 'utf8')
    await pool.query(sql)
    await pool.query('INSERT INTO _migrations (name) VALUES ($1)', [file])
    console.log(`  ✓ ${file}`)
  }

  await pool.end()
  console.log('Migrations concluídas.')
}

run().catch(e => { console.error(e); process.exit(1) })
