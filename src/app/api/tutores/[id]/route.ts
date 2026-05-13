import { NextRequest, NextResponse } from 'next/server'
import { query, queryOne } from '@/lib/db'
import { requireSession } from '@/lib/auth'
import { TutorUpdateSchema, parseBody } from '@/lib/validation'

export async function DELETE(_req: NextRequest, { params }: { params: { id: string } }) {
  try {
    const user = await requireSession()
    if (user.role !== 'gestor') return NextResponse.json({ error: 'Sem permissão' }, { status: 403 })
    // cascata: pagamentos → agendamentos → pets → tutor (FKs com CASCADE, mas feito explicitamente para clareza)
    await query(`
      DELETE FROM pagamentos WHERE agendamento_id IN (
        SELECT a.id FROM agendamentos a JOIN pets p ON p.id = a.pet_id WHERE p.tutor_id = $1
      )
    `, [params.id])
    await query(`DELETE FROM agendamentos WHERE pet_id IN (SELECT id FROM pets WHERE tutor_id = $1)`, [params.id])
    await query(`DELETE FROM pets WHERE tutor_id = $1`, [params.id])
    const row = await queryOne(`DELETE FROM tutores WHERE id = $1 RETURNING id`, [params.id])
    if (!row) return NextResponse.json({ error: 'Tutor não encontrado' }, { status: 404 })
    return NextResponse.json({ ok: true })
  } catch (err) {
    const msg = err instanceof Error ? err.message : 'Erro interno'
    return NextResponse.json({ error: msg }, { status: 500 })
  }
}

export async function GET(_req: NextRequest, { params }: { params: { id: string } }) {
  await requireSession()
  const tutor = await queryOne(`SELECT * FROM tutores WHERE id = $1`, [params.id])
  if (!tutor) return NextResponse.json({ error: 'Tutor não encontrado' }, { status: 404 })
  const pets = await query(`SELECT * FROM pets WHERE tutor_id = $1 ORDER BY nome`, [params.id])
  return NextResponse.json({ ...tutor, pets })
}

export async function PUT(req: NextRequest, { params }: { params: { id: string } }) {
  await requireSession()

  const body = await req.json().catch(() => null)
  const parsed = parseBody(TutorUpdateSchema, body)
  if ('error' in parsed) {
    return NextResponse.json({ error: parsed.error }, { status: parsed.status })
  }

  const { nome, whatsapp, endereco } = parsed.data
  const row = await queryOne(
    `UPDATE tutores SET nome=$1, whatsapp=$2, endereco=$3 WHERE id=$4 RETURNING *`,
    [nome, whatsapp, endereco ?? null, params.id]
  )
  if (!row) return NextResponse.json({ error: 'Tutor não encontrado' }, { status: 404 })
  return NextResponse.json(row)
}
