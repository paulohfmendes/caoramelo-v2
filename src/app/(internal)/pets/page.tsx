import { getSession } from '@/lib/auth'
import { query } from '@/lib/db'
import type { Pet } from '@/types'
import PetsClient from './PetsClient'

export default async function PetsPage() {
  const user = await getSession()

  const rows = await query<Pet>(`
    SELECT p.*, t.nome as tutor_nome
    FROM pets p
    JOIN tutores t ON t.id = p.tutor_id
    ORDER BY p.nome
  `).catch(() => [])

  const tutores = await query<{ id: string; nome: string }>(`SELECT id, nome FROM tutores ORDER BY nome`).catch(() => [])

  return <PetsClient pets={rows} tutores={tutores} perfil={user!.role} />
}
