import { getSession } from '@/lib/auth'
import { redirect } from 'next/navigation'

export const dynamic = 'force-dynamic'
import { query } from '@/lib/db'
import type { Pagamento } from '@/types'
import FinanceiroClient from './FinanceiroClient'

export default async function FinanceiroPage() {
  const user = await getSession()
  if (!user || user.role !== 'gestor') redirect('/dashboard')

  const [pagamentos, stats] = await Promise.all([
    query<Pagamento>(`
      SELECT pg.*, p.nome as pet_nome, t.nome as tutor_nome, a.servico
      FROM pagamentos pg
      JOIN agendamentos a ON a.id = pg.agendamento_id
      JOIN pets p ON p.id = a.pet_id
      JOIN tutores t ON t.id = p.tutor_id
      ORDER BY pg.data DESC LIMIT 50
    `).catch(() => []),
    query<{ hoje: number; semana: number; mes: number }>(`
      SELECT
        COALESCE(SUM(CASE WHEN DATE(data) = CURRENT_DATE THEN valor END), 0) as hoje,
        COALESCE(SUM(CASE WHEN data >= CURRENT_DATE - INTERVAL '7 days' THEN valor END), 0) as semana,
        COALESCE(SUM(CASE WHEN DATE_TRUNC('month', data) = DATE_TRUNC('month', CURRENT_DATE) THEN valor END), 0) as mes
      FROM pagamentos
    `).catch(() => [{ hoje: 0, semana: 0, mes: 0 }]),
  ])

  return <FinanceiroClient pagamentos={pagamentos} stats={stats[0] ?? { hoje: 0, semana: 0, mes: 0 }} />
}
