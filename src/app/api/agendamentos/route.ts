import { NextRequest, NextResponse } from 'next/server'
import { query, queryOne } from '@/lib/db'
import { requireSession } from '@/lib/auth'
import { AgendamentoCreateSchema, parseBody } from '@/lib/validation'

export async function GET(req: NextRequest) {
  await requireSession()

  const { searchParams } = new URL(req.url)
  const page = Math.max(1, Number(searchParams.get('page') ?? '1'))
  const limit = Math.min(100, Math.max(1, Number(searchParams.get('limit') ?? '50')))
  const offset = (page - 1) * limit

  const [rows, countResult] = await Promise.all([
    query(`
      SELECT a.*, p.nome as pet_nome, t.nome as tutor_nome
      FROM agendamentos a
      JOIN pets p ON p.id = a.pet_id
      JOIN tutores t ON t.id = p.tutor_id
      WHERE a.deleted_at IS NULL
      ORDER BY a.data_inicio DESC
      LIMIT $1 OFFSET $2
    `, [limit, offset]),
    query(`SELECT COUNT(*) as total FROM agendamentos WHERE deleted_at IS NULL`),
  ])

  const total = Number((countResult[0] as { total: string }).total)
  return NextResponse.json({ rows, total, page, limit })
}

export async function POST(req: NextRequest) {
  try {
    await requireSession()

    const body = await req.json().catch(() => null)
    const parsed = parseBody(AgendamentoCreateSchema, body)
    if ('error' in parsed) {
      return NextResponse.json({ error: parsed.error }, { status: parsed.status })
    }

    const {
      servico, pet_id, data_inicio, data_fim, hora, plano_creche,
      taxi_pet, origem, destino, valor, data_vencimento, dias_semana, observacoes,
    } = parsed.data

    const banhoStatus = servico === 'banho' ? 'agendado' : null

    const row = await queryOne(
      `INSERT INTO agendamentos
        (servico, pet_id, data_inicio, data_fim, hora, plano_creche, taxi_pet,
         origem, destino, valor, data_vencimento, dias_semana, observacoes, banho_status)
       VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14)
       RETURNING *`,
      [
        servico, pet_id, data_inicio, data_fim ?? null, hora ?? null,
        plano_creche ?? null, taxi_pet ?? false, origem ?? null, destino ?? null,
        valor ?? null, data_vencimento ?? null, dias_semana ?? null,
        observacoes ?? null, banhoStatus,
      ]
    )

    return NextResponse.json(row, { status: 201 })
  } catch (err) {
    console.error('[POST /api/agendamentos]', err)
    const msg = err instanceof Error ? err.message : 'Erro interno'
    return NextResponse.json({ error: msg }, { status: 500 })
  }
}
