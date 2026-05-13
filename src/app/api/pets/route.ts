import { NextRequest, NextResponse } from 'next/server'
import { query, queryOne } from '@/lib/db'
import { requireSession } from '@/lib/auth'
import { PetSchema, parseBody } from '@/lib/validation'

export async function GET() {
  await requireSession()
  const rows = await query(`
    SELECT p.*, t.nome as tutor_nome
    FROM pets p
    JOIN tutores t ON t.id = p.tutor_id
    ORDER BY p.nome
  `)
  return NextResponse.json(rows)
}

export async function POST(req: NextRequest) {
  await requireSession()

  const body = await req.json().catch(() => null)
  const parsed = parseBody(PetSchema, body)
  if ('error' in parsed) {
    return NextResponse.json({ error: parsed.error }, { status: parsed.status })
  }

  const { tutor_id, nome, raca, porte, peso, sexo, castrado, vacinas_ok, nascimento, pelagem, medicamento, observacoes } = parsed.data
  const row = await queryOne(
    `INSERT INTO pets
      (tutor_id, nome, raca, porte, peso, sexo, castrado, vacinas_ok, nascimento, pelagem, medicamento, observacoes)
     VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12) RETURNING *`,
    [
      tutor_id, nome, raca, porte ?? null, peso ?? null,
      sexo ?? null, castrado ?? false, vacinas_ok ?? true,
      nascimento ?? null, pelagem ?? null, medicamento ?? null, observacoes ?? null,
    ]
  )
  return NextResponse.json(row, { status: 201 })
}
