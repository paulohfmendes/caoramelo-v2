import { NextRequest, NextResponse } from 'next/server'
import bcrypt from 'bcryptjs'
import { queryOne } from '@/lib/db'
import { signToken } from '@/lib/auth'
import { LoginSchema, parseBody } from '@/lib/validation'
import { checkRateLimit, resetRateLimit } from '@/lib/rate-limit'

function getIp(req: NextRequest): string {
  return req.headers.get('x-forwarded-for')?.split(',')[0].trim() ?? 'unknown'
}

export async function POST(req: NextRequest) {
  const ip = getIp(req)
  const rl = checkRateLimit(ip)

  if (!rl.allowed) {
    return NextResponse.json(
      { error: 'Muitas tentativas. Tente novamente em alguns minutos.' },
      { status: 429, headers: { 'Retry-After': String(rl.retryAfter) } }
    )
  }

  const body = await req.json().catch(() => null)
  const parsed = parseBody(LoginSchema, body)
  if ('error' in parsed) {
    return NextResponse.json({ error: parsed.error }, { status: parsed.status })
  }

  const { role, password } = parsed.data

  const user = await queryOne<{ id: string; name: string; role: string; password_hash: string }>(
    `SELECT id, name, role, password_hash FROM users WHERE role = $1 AND active = true`,
    [role]
  )

  if (!user || !(await bcrypt.compare(password, user.password_hash))) {
    return NextResponse.json({ error: 'Credenciais inválidas' }, { status: 401 })
  }

  resetRateLimit(ip)

  const token = await signToken({
    id: user.id,
    name: user.name,
    role: user.role as 'atendente' | 'monitor' | 'gestor',
  })

  const res = NextResponse.json({ ok: true })
  res.cookies.set('session', token, {
    httpOnly: true,
    secure: process.env.NODE_ENV === 'production',
    sameSite: 'lax',
    maxAge: 60 * 60 * 8,
    path: '/',
  })
  return res
}
