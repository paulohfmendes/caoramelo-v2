import { query } from '@/lib/db'
import type { Agendamento } from '@/types'
import BanhoTosaClient from './BanhoTosaClient'

export default async function BanhoTosaPage() {
  const rows = await query<Agendamento & { raca?: string; porte?: string; whatsapp?: string }>(`
    SELECT a.*, p.nome as pet_nome, p.porte, p.raca,
           t.nome as tutor_nome, t.whatsapp
    FROM agendamentos a
    JOIN pets p ON p.id = a.pet_id
    JOIN tutores t ON t.id = p.tutor_id
    WHERE a.servico = 'banho' AND DATE(a.data_inicio) = CURRENT_DATE
    ORDER BY a.hora ASC NULLS LAST
  `).catch(() => [])

  const pets = await query<{ id: string; nome: string; tutor_nome: string; porte: string | null }>(`
    SELECT p.id, p.nome, p.porte, t.nome as tutor_nome FROM pets p JOIN tutores t ON t.id = p.tutor_id ORDER BY p.nome
  `).catch(() => [])

  return <BanhoTosaClient agendamentos={rows} pets={pets} />
}
