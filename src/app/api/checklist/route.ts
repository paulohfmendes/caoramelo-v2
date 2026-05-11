import { NextRequest, NextResponse } from 'next/server'
import { query, queryOne } from '@/lib/db'
import { requireSession } from '@/lib/auth'

export async function GET() {
  await requireSession()
  const rows = await query(`SELECT * FROM checklist_registros ORDER BY created_at DESC LIMIT 50`)
  return NextResponse.json(rows)
}

export async function POST(req: NextRequest) {
  const user = await requireSession()
  const { tipo, itens, intercorrencias, data } = await req.json()
  const row = await queryOne(
    `INSERT INTO checklist_registros (tipo, itens, intercorrencias, data, created_by)
     VALUES ($1,$2,$3,$4,$5) RETURNING *`,
    [tipo, JSON.stringify(itens ?? {}), intercorrencias ?? null, data, user.id]
  )
  return NextResponse.json(row, { status: 201 })
}
