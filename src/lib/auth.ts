import { SignJWT, jwtVerify } from 'jose'
import { cookies } from 'next/headers'
import type { User } from '@/types'

const secret = new TextEncoder().encode(
  process.env.JWT_SECRET ?? 'fallback-secret-32-chars-minimum!!'
)

export async function signToken(user: User): Promise<string> {
  return new SignJWT({ id: user.id, name: user.name, role: user.role })
    .setProtectedHeader({ alg: 'HS256' })
    .setExpirationTime('8h')
    .sign(secret)
}

export async function verifyToken(token: string): Promise<User | null> {
  try {
    const { payload } = await jwtVerify(token, secret)
    return payload as unknown as User
  } catch {
    return null
  }
}

export async function getSession(): Promise<User | null> {
  const token = cookies().get('session')?.value
  if (!token) return null
  return verifyToken(token)
}

export async function requireSession(): Promise<User> {
  const user = await getSession()
  if (!user) throw new Error('Não autenticado')
  return user
}
