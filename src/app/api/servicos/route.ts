import { NextResponse } from 'next/server'
import { query } from '@/lib/db'
import { requireSession } from '@/lib/auth'

export async function GET() {
  await requireSession()
  const rows = await query(`SELECT * FROM tabela_servicos ORDER BY servico, chave`)
  return NextResponse.json(rows)
}
