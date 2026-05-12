import { NextRequest, NextResponse } from 'next/server'
import { queryOne } from '@/lib/db'
import { requireSession } from '@/lib/auth'

export async function PUT(req: NextRequest, { params }: { params: { id: string } }) {
  const user = await requireSession()
  if (user.role !== 'gestor') return NextResponse.json({ error: 'Sem permissão' }, { status: 403 })

  const { valor } = await req.json()
  if (valor === undefined || isNaN(Number(valor))) {
    return NextResponse.json({ error: 'Valor inválido' }, { status: 400 })
  }

  const row = await queryOne(
    `UPDATE tabela_servicos SET valor = $1 WHERE id = $2 RETURNING *`,
    [Number(valor), params.id]
  )
  if (!row) return NextResponse.json({ error: 'Serviço não encontrado' }, { status: 404 })
  return NextResponse.json(row)
}
