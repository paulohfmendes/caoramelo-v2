import { NextRequest, NextResponse } from 'next/server'
import { queryOne } from '@/lib/db'
import { requireSession } from '@/lib/auth'

export async function PUT(req: NextRequest, { params }: { params: { id: string } }) {
  try {
    await requireSession()
    const { nome, raca, porte, peso, sexo, castrado, vacinas_ok, pelagem, medicamento, observacoes, nascimento } = await req.json()
    if (!nome || !raca) return NextResponse.json({ error: 'Nome e raça são obrigatórios' }, { status: 400 })

    const row = await queryOne(
      `UPDATE pets SET
        nome=$1, raca=$2, porte=$3, peso=$4, sexo=$5,
        castrado=$6, vacinas_ok=$7, pelagem=$8,
        medicamento=$9, observacoes=$10, nascimento=$11
       WHERE id=$12 RETURNING *`,
      [nome, raca, porte || null, peso ? Number(peso) : null, sexo || null,
       castrado ?? false, vacinas_ok ?? true, pelagem || null,
       medicamento || null, observacoes || null, nascimento || null, params.id]
    )
    if (!row) return NextResponse.json({ error: 'Pet não encontrado' }, { status: 404 })
    return NextResponse.json(row)
  } catch (err) {
    const msg = err instanceof Error ? err.message : 'Erro interno'
    return NextResponse.json({ error: msg }, { status: 500 })
  }
}
