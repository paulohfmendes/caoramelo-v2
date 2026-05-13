import { NextRequest, NextResponse } from 'next/server'
import bcrypt from 'bcryptjs'
import { queryOne, query } from '@/lib/db'
import { requireSession } from '@/lib/auth'
import { ChangePasswordSchema, parseBody } from '@/lib/validation'

export async function POST(req: NextRequest) {
  const user = await requireSession()

  const body = await req.json().catch(() => null)
  const parsed = parseBody(ChangePasswordSchema, body)
  if ('error' in parsed) {
    return NextResponse.json({ error: parsed.error }, { status: parsed.status })
  }

  const { role_alvo, senha_atual, nova_senha } = parsed.data

  // Gestor pode trocar senha de qualquer perfil sem precisar da senha atual
  if (role_alvo && role_alvo !== user.role) {
    if (user.role !== 'gestor') {
      return NextResponse.json({ error: 'Apenas o Gestor pode alterar senha de outros perfis' }, { status: 403 })
    }
    const hash = await bcrypt.hash(nova_senha, 12)
    await query(`UPDATE users SET password_hash = $1 WHERE role = $2`, [hash, role_alvo])
    return NextResponse.json({ ok: true })
  }

  // Trocar própria senha — exige senha atual
  if (!senha_atual) {
    return NextResponse.json({ error: 'Informe a senha atual' }, { status: 400 })
  }

  const row = await queryOne<{ password_hash: string }>(
    `SELECT password_hash FROM users WHERE role = $1 AND active = true`,
    [user.role]
  )
  if (!row || !(await bcrypt.compare(senha_atual, row.password_hash))) {
    return NextResponse.json({ error: 'Senha atual incorreta' }, { status: 401 })
  }

  const hash = await bcrypt.hash(nova_senha, 12)
  await query(`UPDATE users SET password_hash = $1 WHERE role = $2`, [hash, user.role])
  return NextResponse.json({ ok: true })
}
