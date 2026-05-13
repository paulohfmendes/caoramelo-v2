import { NextRequest, NextResponse } from 'next/server'
import { query, queryOne } from '@/lib/db'
import { requireSession } from '@/lib/auth'
import { PagamentoSchema, parseBody } from '@/lib/validation'

export async function GET(req: NextRequest) {
  await requireSession()

  const { searchParams } = new URL(req.url)
  const page = Math.max(1, Number(searchParams.get('page') ?? '1'))
  const limit = Math.min(100, Math.max(1, Number(searchParams.get('limit') ?? '50')))
  const offset = (page - 1) * limit

  const [rows, countResult] = await Promise.all([
    query(`
      SELECT pg.*, p.nome as pet_nome, t.nome as tutor_nome, a.servico
      FROM pagamentos pg
      JOIN agendamentos a ON a.id = pg.agendamento_id
      JOIN pets p ON p.id = a.pet_id
      JOIN tutores t ON t.id = p.tutor_id
      ORDER BY pg.data DESC
      LIMIT $1 OFFSET $2
    `, [limit, offset]),
    query(`SELECT COUNT(*) as total FROM pagamentos`),
  ])

  const total = Number((countResult[0] as { total: string }).total)
  return NextResponse.json({ rows, total, page, limit })
}

export async function POST(req: NextRequest) {
  const user = await requireSession()
  if (user.role !== 'gestor') {
    return NextResponse.json({ error: 'Acesso negado' }, { status: 403 })
  }

  const body = await req.json().catch(() => null)
  const parsed = parseBody(PagamentoSchema, body)
  if ('error' in parsed) {
    return NextResponse.json({ error: parsed.error }, { status: parsed.status })
  }

  const { agendamento_id, valor, forma } = parsed.data
  const row = await queryOne(
    `INSERT INTO pagamentos (agendamento_id, valor, forma) VALUES ($1,$2,$3) RETURNING *`,
    [agendamento_id, valor, forma]
  )
  return NextResponse.json(row, { status: 201 })
}
