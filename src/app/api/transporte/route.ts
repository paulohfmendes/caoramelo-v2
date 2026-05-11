import { NextRequest, NextResponse } from 'next/server'
import { query, queryOne } from '@/lib/db'
import { requireSession } from '@/lib/auth'

export async function GET() {
  await requireSession()
  const rows = await query(`
    SELECT a.*, p.nome as pet_nome, t.nome as tutor_nome
    FROM agendamentos a
    JOIN pets p ON p.id = a.pet_id
    JOIN tutores t ON t.id = p.tutor_id
    WHERE a.servico = 'transporte'
    ORDER BY a.data_inicio DESC, a.hora ASC
  `)
  return NextResponse.json(rows)
}

export async function POST(req: NextRequest) {
  const user = await requireSession()
  if (user.role !== 'gestor') return NextResponse.json({ error: 'Apenas o Gestor pode agendar transportes' }, { status: 403 })
  const { pet_id, data_inicio, hora, origem, destino, valor, observacoes } = await req.json()
  if (!pet_id || !data_inicio) return NextResponse.json({ error: 'Campos obrigatórios ausentes' }, { status: 400 })
  const row = await queryOne(
    `INSERT INTO agendamentos (servico, pet_id, data_inicio, hora, origem, destino, valor, observacoes)
     VALUES ('transporte',$1,$2,$3,$4,$5,$6,$7) RETURNING *`,
    [pet_id, data_inicio, hora ?? null, origem ?? null, destino ?? null, valor ?? null, observacoes ?? null]
  )
  return NextResponse.json(row, { status: 201 })
}
