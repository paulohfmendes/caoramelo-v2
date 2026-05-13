import { getSession } from '@/lib/auth'
import { query } from '@/lib/db'
import type { Agendamento } from '@/types'
import AgendamentosClient from './AgendamentosClient'

export default async function AgendamentosPage() {
  const user = await getSession()

  const rows = await query<Agendamento>(`
    SELECT a.*, p.nome as pet_nome, t.nome as tutor_nome
    FROM agendamentos a
    JOIN pets p ON p.id = a.pet_id
    JOIN tutores t ON t.id = p.tutor_id
    WHERE a.deleted_at IS NULL
    ORDER BY a.data_inicio DESC
    LIMIT 100
  `).catch(() => [])

  const pets = await query<{ id: string; nome: string; tutor_nome: string; porte: string | null }>(`
    SELECT p.id, p.nome, p.porte, t.nome as tutor_nome FROM pets p JOIN tutores t ON t.id = p.tutor_id ORDER BY p.nome
  `).catch(() => [])

  return <AgendamentosClient agendamentos={rows} pets={pets} perfil={user!.role} />
}
