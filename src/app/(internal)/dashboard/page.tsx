import { getSession } from '@/lib/auth'
import { query } from '@/lib/db'
import DashboardClient from './DashboardClient'

interface Inadimplente {
  id: string
  nome: string
  whatsapp: string
  valor_em_aberto: number
}

export default async function DashboardPage() {
  const user = await getSession()

  const [hotel, creche, banho, alertas, inadimplentes] = await Promise.all([
    query(`SELECT COUNT(*) as total FROM agendamentos WHERE servico='hotel' AND status='ativo' AND DATE(data_inicio) <= CURRENT_DATE AND (data_fim IS NULL OR DATE(data_fim) >= CURRENT_DATE)`).catch(() => [{ total: 0 }]),
    query(`SELECT COUNT(*) as total FROM agendamentos WHERE servico='creche' AND status='ativo' AND DATE(data_inicio) <= CURRENT_DATE`).catch(() => [{ total: 0 }]),
    query(`SELECT COUNT(*) as total FROM agendamentos WHERE servico='banho' AND status IN ('agendado','ativo') AND DATE(data_inicio) = CURRENT_DATE`).catch(() => [{ total: 0 }]),
    query(`SELECT COUNT(*) as total FROM pets WHERE medicamento IS NOT NULL AND medicamento != ''`).catch(() => [{ total: 0 }]),
    query(`
      SELECT t.id, t.nome, t.whatsapp,
        COALESCE(SUM(a.valor) - SUM(COALESCE((SELECT SUM(pg.valor) FROM pagamentos pg WHERE pg.agendamento_id = a.id), 0)), 0) AS valor_em_aberto
      FROM tutores t
      JOIN pets p ON p.tutor_id = t.id
      JOIN agendamentos a ON a.pet_id = p.id
      WHERE a.status NOT IN ('cancelado')
        AND a.valor > 0
        AND COALESCE((SELECT SUM(pg.valor) FROM pagamentos pg WHERE pg.agendamento_id = a.id), 0) < a.valor
        AND (
          a.status = 'concluido'
          OR (a.data_vencimento IS NOT NULL AND a.data_vencimento < CURRENT_DATE)
        )
      GROUP BY t.id, t.nome, t.whatsapp
      ORDER BY valor_em_aberto DESC
      LIMIT 20
    `).catch(() => [] as Inadimplente[]),
  ])

  return (
    <DashboardClient
      perfil={user!.role}
      stats={{
        hotel: Number((hotel[0] as { total: number }).total),
        creche: Number((creche[0] as { total: number }).total),
        banho: Number((banho[0] as { total: number }).total),
        alertas: Number((alertas[0] as { total: number }).total),
      }}
      inadimplentes={inadimplentes as Inadimplente[]}
    />
  )
}
