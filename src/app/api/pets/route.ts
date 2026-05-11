import { NextRequest, NextResponse } from 'next/server'
import { query, queryOne } from '@/lib/db'
import { requireSession } from '@/lib/auth'

export async function GET() {
  await requireSession()
  const rows = await query(`SELECT p.*, t.nome as tutor_nome FROM pets p JOIN tutores t ON t.id = p.tutor_id ORDER BY p.nome`)
  return NextResponse.json(rows)
}

export async function POST(req: NextRequest) {
  await requireSession()
  const { tutor_id, nome, raca, porte, peso, sexo, castrado, vacinas_ok, medicamento, observacoes } = await req.json()
  if (!tutor_id || !nome || !raca) return NextResponse.json({ error: 'Campos obrigatórios ausentes' }, { status: 400 })
  const row = await queryOne(
    `INSERT INTO pets (tutor_id, nome, raca, porte, peso, sexo, castrado, vacinas_ok, medicamento, observacoes)
     VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10) RETURNING *`,
    [tutor_id, nome, raca, porte ?? 'medio', peso ?? null, sexo ?? 'macho', castrado ?? false, vacinas_ok ?? true, medicamento ?? null, observacoes ?? null]
  )
  return NextResponse.json(row, { status: 201 })
}
