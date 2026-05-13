import { getSession } from '@/lib/auth'
import { query } from '@/lib/db'
import TutoresClient from './TutoresClient'

interface TutorRow {
  id: string
  nome: string
  whatsapp: string
  endereco?: string
  created_at: string
  total_pets: number
  status_financeiro: 'pago' | 'em_aberto' | 'atrasado'
}

export default async function TutoresPage() {
  const user = await getSession()

  const rows = await query(`
    SELECT
      t.*,
      COUNT(DISTINCT p.id) AS total_pets,
      CASE
        WHEN EXISTS (
          SELECT 1 FROM agendamentos a
          JOIN pets pt ON pt.id = a.pet_id
          WHERE pt.tutor_id = t.id
            AND a.status != 'cancelado'
            AND a.valor > 0
            AND COALESCE(
              (SELECT SUM(pg.valor) FROM pagamentos pg WHERE pg.agendamento_id = a.id), 0
            ) < a.valor
            AND (
              a.status = 'concluido'
              OR (a.data_vencimento IS NOT NULL AND a.data_vencimento < CURRENT_DATE)
            )
        ) THEN 'atrasado'
        WHEN EXISTS (
          SELECT 1 FROM agendamentos a
          JOIN pets pt ON pt.id = a.pet_id
          WHERE pt.tutor_id = t.id
            AND a.status != 'cancelado'
            AND a.valor > 0
            AND COALESCE(
              (SELECT SUM(pg.valor) FROM pagamentos pg WHERE pg.agendamento_id = a.id), 0
            ) < a.valor
        ) THEN 'em_aberto'
        ELSE 'pago'
      END AS status_financeiro
    FROM tutores t
    LEFT JOIN pets p ON p.tutor_id = t.id
    GROUP BY t.id
    ORDER BY t.nome
  `).catch(() => [])

  return <TutoresClient tutores={rows as TutorRow[]} perfil={user!.role} />
}
