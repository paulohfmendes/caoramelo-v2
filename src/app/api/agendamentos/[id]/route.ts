import { NextRequest, NextResponse } from 'next/server'
import { queryOne } from '@/lib/db'
import { requireSession } from '@/lib/auth'

const STATUS_VALIDOS = ['agendado', 'ativo', 'concluido', 'cancelado']

export async function PATCH(req: NextRequest, { params }: { params: { id: string } }) {
  try {
    await requireSession()
    const { status } = await req.json()
    if (!STATUS_VALIDOS.includes(status)) {
      return NextResponse.json({ error: 'Status inválido' }, { status: 400 })
    }
    const row = await queryOne(
      `UPDATE agendamentos SET status = $1 WHERE id = $2 RETURNING *`,
      [status, params.id]
    )
    if (!row) return NextResponse.json({ error: 'Agendamento não encontrado' }, { status: 404 })
    return NextResponse.json(row)
  } catch (err) {
    const msg = err instanceof Error ? err.message : 'Erro interno'
    return NextResponse.json({ error: msg }, { status: 500 })
  }
}
