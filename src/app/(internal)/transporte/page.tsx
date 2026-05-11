import { query } from '@/lib/db'
import { getSession } from '@/lib/auth'
import type { Agendamento } from '@/types'
import TransporteClient from './TransporteClient'

export default async function TransportePage() {
  const user = await getSession()
  const rows = await query<Agendamento>(`
    SELECT a.*, p.nome as pet_nome, t.nome as tutor_nome
    FROM agendamentos a
    JOIN pets p ON p.id = a.pet_id
    JOIN tutores t ON t.id = p.tutor_id
    WHERE a.servico = 'transporte'
    ORDER BY a.data_inicio DESC, a.hora ASC
    LIMIT 100
  `).catch(() => [])

  const pets = await query<{ id: string; nome: string; tutor_nome: string }>(`
    SELECT p.id, p.nome, t.nome as tutor_nome FROM pets p JOIN tutores t ON t.id = p.tutor_id ORDER BY p.nome
  `).catch(() => [])

  return <TransporteClient agendamentos={rows} pets={pets} podeAgendar={user?.role === 'gestor'} />
}
