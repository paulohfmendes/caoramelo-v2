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
    ORDER BY a.data_inicio DESC LIMIT 200
  `)
  return NextResponse.json(rows)
}

export async function POST(req: NextRequest) {
  try {
    await requireSession()
    const body = await req.json()
    const { servico, pet_id, data_inicio, data_fim, hora, plano_creche, taxi_pet, origem, destino, valor, observacoes } = body

    if (!servico || !pet_id || !data_inicio) {
      return NextResponse.json({ error: 'Campos obrigatórios ausentes' }, { status: 400 })
    }

    const banhoStatus = servico === 'banho' ? 'agendado' : null

    const row = await queryOne(
      `INSERT INTO agendamentos (servico, pet_id, data_inicio, data_fim, hora, plano_creche, taxi_pet, origem, destino, valor, observacoes, banho_status)
       VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12)
       RETURNING *`,
      [servico, pet_id, data_inicio, data_fim || null, hora || null, plano_creche || null, taxi_pet ?? false, origem || null, destino || null, valor || null, observacoes || null, banhoStatus]
    )

    return NextResponse.json(row, { status: 201 })
  } catch (err) {
    console.error('[POST /api/agendamentos]', err)
    const msg = err instanceof Error ? err.message : 'Erro interno'
    return NextResponse.json({ error: msg }, { status: 500 })
  }
}
