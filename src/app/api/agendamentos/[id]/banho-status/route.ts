import { NextRequest, NextResponse } from 'next/server'
import { queryOne } from '@/lib/db'
import { requireSession } from '@/lib/auth'
import { BanhoStatusSchema, parseBody } from '@/lib/validation'

export async function PATCH(req: NextRequest, { params }: { params: { id: string } }) {
  await requireSession()

  const body = await req.json().catch(() => null)
  const parsed = parseBody(BanhoStatusSchema, body)
  if ('error' in parsed) {
    return NextResponse.json({ error: parsed.error }, { status: parsed.status })
  }

  const row = await queryOne(
    `UPDATE agendamentos SET banho_status = $1 WHERE id = $2 AND deleted_at IS NULL RETURNING *`,
    [parsed.data.banho_status, params.id]
  )
  if (!row) return NextResponse.json({ error: 'Não encontrado' }, { status: 404 })
  return NextResponse.json(row)
}
