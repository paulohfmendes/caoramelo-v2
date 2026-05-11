import { query } from '@/lib/db'
import type { Tutor } from '@/types'
import TutoresClient from './TutoresClient'

export default async function TutoresPage() {
  const rows = await query<Tutor & { total_pets: number }>(`
    SELECT t.*, COUNT(p.id) as total_pets
    FROM tutores t
    LEFT JOIN pets p ON p.tutor_id = t.id
    GROUP BY t.id
    ORDER BY t.nome
  `).catch(() => [])

  return <TutoresClient tutores={rows} />
}
