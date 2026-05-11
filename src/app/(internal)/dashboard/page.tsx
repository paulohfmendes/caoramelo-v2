import { getSession } from '@/lib/auth'
import { query } from '@/lib/db'
import DashboardClient from './DashboardClient'

export default async function DashboardPage() {
  const user = await getSession()

  const [hotel, creche, banho, alertas] = await Promise.all([
    query(`SELECT COUNT(*) as total FROM agendamentos WHERE servico='hotel' AND status='ativo' AND DATE(data_inicio) <= CURRENT_DATE AND (data_fim IS NULL OR DATE(data_fim) >= CURRENT_DATE)`).catch(() => [{ total: 0 }]),
    query(`SELECT COUNT(*) as total FROM agendamentos WHERE servico='creche' AND status='ativo' AND DATE(data_inicio) <= CURRENT_DATE`).catch(() => [{ total: 0 }]),
    query(`SELECT COUNT(*) as total FROM agendamentos WHERE servico='banho' AND status IN ('agendado','ativo') AND DATE(data_inicio) = CURRENT_DATE`).catch(() => [{ total: 0 }]),
    query(`SELECT COUNT(*) as total FROM pets WHERE medicamento IS NOT NULL AND medicamento != ''`).catch(() => [{ total: 0 }]),
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
    />
  )
}
