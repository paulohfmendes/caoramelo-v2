import { NextRequest, NextResponse } from 'next/server'
import { query, queryOne } from '@/lib/db'
import { requireSession } from '@/lib/auth'

export async function GET(_req: NextRequest, { params }: { params: { id: string } }) {
  await requireSession()
  const tutor = await queryOne(`SELECT * FROM tutores WHERE id = $1`, [params.id])
  if (!tutor) return NextResponse.json({ error: 'Tutor não encontrado' }, { status: 404 })
  const pets = await query(`SELECT * FROM pets WHERE tutor_id = $1 ORDER BY nome`, [params.id])
  return NextResponse.json({ ...tutor, pets })
}

export async function PUT(req: NextRequest, { params }: { params: { id: string } }) {
  await requireSession()
  const { nome, whatsapp, endereco } = await req.json()
  if (!nome || !whatsapp) return NextResponse.json({ error: 'Nome e WhatsApp são obrigatórios' }, { status: 400 })
  const row = await queryOne(
    `UPDATE tutores SET nome=$1, whatsapp=$2, endereco=$3 WHERE id=$4 RETURNING *`,
    [nome, whatsapp, endereco ?? null, params.id]
  )
  if (!row) return NextResponse.json({ error: 'Tutor não encontrado' }, { status: 404 })
  return NextResponse.json(row)
}
