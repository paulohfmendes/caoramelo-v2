import { NextRequest, NextResponse } from 'next/server'
import { query, queryOne } from '@/lib/db'
import { requireSession } from '@/lib/auth'

export async function GET() {
  await requireSession()
  const rows = await query(`
    SELECT pg.*, p.nome as pet_nome, t.nome as tutor_nome, a.servico
    FROM pagamentos pg
    JOIN agendamentos a ON a.id = pg.agendamento_id
    JOIN pets p ON p.id = a.pet_id
    JOIN tutores t ON t.id = p.tutor_id
    ORDER BY pg.data DESC LIMIT 100
  `)
  return NextResponse.json(rows)
}

export async function POST(req: NextRequest) {
  const user = await requireSession()
  if (user.role !== 'gestor') return NextResponse.json({ error: 'Acesso negado' }, { status: 403 })
  const { agendamento_id, valor, forma } = await req.json()
  if (!agendamento_id || !valor || !forma) return NextResponse.json({ error: 'Campos obrigatórios ausentes' }, { status: 400 })
  const row = await queryOne(
    `INSERT INTO pagamentos (agendamento_id, valor, forma) VALUES ($1,$2,$3) RETURNING *`,
    [agendamento_id, valor, forma]
  )
  return NextResponse.json(row, { status: 201 })
}
