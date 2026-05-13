import { NextRequest, NextResponse } from 'next/server'
import { query, queryOne } from '@/lib/db'
import { requireSession } from '@/lib/auth'
import { TutorSchema, parseBody } from '@/lib/validation'

export async function GET() {
  await requireSession()
  const rows = await query(`
    SELECT t.*, COUNT(p.id) as total_pets
    FROM tutores t
    LEFT JOIN pets p ON p.tutor_id = t.id
    GROUP BY t.id
    ORDER BY t.nome
  `)
  return NextResponse.json(rows)
}

export async function POST(req: NextRequest) {
  await requireSession()

  const body = await req.json().catch(() => null)
  const parsed = parseBody(TutorSchema, body)
  if ('error' in parsed) {
    return NextResponse.json({ error: parsed.error }, { status: parsed.status })
  }

  const { nome, whatsapp, endereco } = parsed.data
  const row = await queryOne(
    `INSERT INTO tutores (nome, whatsapp, endereco) VALUES ($1,$2,$3) RETURNING *`,
    [nome, whatsapp, endereco ?? null]
  )
  return NextResponse.json(row, { status: 201 })
}
