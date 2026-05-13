import { NextRequest, NextResponse } from 'next/server'
import { query, queryOne } from '@/lib/db'
import { requireSession } from '@/lib/auth'
import { AgendamentoPatchSchema, AgendamentoUpdateSchema, parseBody } from '@/lib/validation'

// PATCH — atualiza somente o status (cancelar, etc.)
export async function PATCH(req: NextRequest, { params }: { params: { id: string } }) {
  try {
    await requireSession()

    const body = await req.json().catch(() => null)
    const parsed = parseBody(AgendamentoPatchSchema, body)
    if ('error' in parsed) {
      return NextResponse.json({ error: parsed.error }, { status: parsed.status })
    }

    const row = await queryOne(
      `UPDATE agendamentos SET status = $1 WHERE id = $2 AND deleted_at IS NULL RETURNING *`,
      [parsed.data.status, params.id]
    )
    if (!row) return NextResponse.json({ error: 'Agendamento não encontrado' }, { status: 404 })
    return NextResponse.json(row)
  } catch (err) {
    const msg = err instanceof Error ? err.message : 'Erro interno'
    return NextResponse.json({ error: msg }, { status: 500 })
  }
}

// PUT — edição completa dos campos editáveis
export async function PUT(req: NextRequest, { params }: { params: { id: string } }) {
  try {
    await requireSession()

    const body = await req.json().catch(() => null)
    const parsed = parseBody(AgendamentoUpdateSchema, body)
    if ('error' in parsed) {
      return NextResponse.json({ error: parsed.error }, { status: parsed.status })
    }

    const { valor, data_vencimento, status, observacoes, dias_semana } = parsed.data

    const row = await queryOne(
      `UPDATE agendamentos
       SET valor = $1, data_vencimento = $2, status = $3,
           observacoes = $4, dias_semana = $5
       WHERE id = $6 AND deleted_at IS NULL RETURNING *`,
      [
        valor != null ? Number(valor) : null,
        data_vencimento ?? null,
        status,
        observacoes ?? null,
        dias_semana ?? null,
        params.id,
      ]
    )
    if (!row) return NextResponse.json({ error: 'Agendamento não encontrado' }, { status: 404 })
    return NextResponse.json(row)
  } catch (err) {
    const msg = err instanceof Error ? err.message : 'Erro interno'
    return NextResponse.json({ error: msg }, { status: 500 })
  }
}

// DELETE — soft delete (somente gestor)
export async function DELETE(_req: NextRequest, { params }: { params: { id: string } }) {
  try {
    const user = await requireSession()
    if (user.role !== 'gestor') {
      return NextResponse.json({ error: 'Sem permissão' }, { status: 403 })
    }
    const row = await queryOne(
      `UPDATE agendamentos SET deleted_at = NOW() WHERE id = $1 AND deleted_at IS NULL RETURNING id`,
      [params.id]
    )
    if (!row) return NextResponse.json({ error: 'Agendamento não encontrado' }, { status: 404 })
    return NextResponse.json({ ok: true })
  } catch (err) {
    const msg = err instanceof Error ? err.message : 'Erro interno'
    return NextResponse.json({ error: msg }, { status: 500 })
  }
}

// GET — retorna agendamento com pagamentos
export async function GET(_req: NextRequest, { params }: { params: { id: string } }) {
  await requireSession()
  const ag = await queryOne(
    `SELECT a.*, p.nome as pet_nome, t.nome as tutor_nome
     FROM agendamentos a
     JOIN pets p ON p.id = a.pet_id
     JOIN tutores t ON t.id = p.tutor_id
     WHERE a.id = $1 AND a.deleted_at IS NULL`,
    [params.id]
  )
  if (!ag) return NextResponse.json({ error: 'Não encontrado' }, { status: 404 })
  const pagamentos = await query(
    `SELECT * FROM pagamentos WHERE agendamento_id = $1 ORDER BY data`,
    [params.id]
  )
  return NextResponse.json({ ...ag, pagamentos })
}
