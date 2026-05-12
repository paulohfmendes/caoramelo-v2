import { NextRequest, NextResponse } from 'next/server'
import bcrypt from 'bcryptjs'
import { queryOne, query } from '@/lib/db'
import { requireSession } from '@/lib/auth'

export async function POST(req: NextRequest) {
  const user = await requireSession()
  const { role_alvo, senha_atual, nova_senha } = await req.json()

  if (!nova_senha || nova_senha.length < 4) {
    return NextResponse.json({ error: 'Nova senha deve ter ao menos 4 caracteres' }, { status: 400 })
  }

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
