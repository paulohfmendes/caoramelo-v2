import { NextRequest, NextResponse } from 'next/server'
import { queryOne } from '@/lib/db'
import { requireSession } from '@/lib/auth'

export async function PATCH(req: NextRequest, { params }: { params: { id: string } }) {
  await requireSession()
  const { banho_status } = await req.json()
  const row = await queryOne(
    `UPDATE agendamentos SET banho_status = $1 WHERE id = $2 RETURNING *`,
    [banho_status, params.id]
  )
  if (!row) return NextResponse.json({ error: 'Não encontrado' }, { status: 404 })
  return NextResponse.json(row)
}
