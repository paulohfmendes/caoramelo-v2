import { getSession } from '@/lib/auth'
import { redirect } from 'next/navigation'
import Link from 'next/link'

export const dynamic = 'force-dynamic'

export default async function RelatoriosPage() {
  const user = await getSession()
  if (!user || user.role !== 'gestor') redirect('/dashboard')

  return (
    <>
      <div className="page-header">
        <div>
          <div className="page-title">Relatórios 📈</div>
          <div className="page-subtitle">Acesso restrito ao Gestor</div>
        </div>
      </div>

      <div className="grid-2">
        <Link href="/agendamentos" className="card" style={{ cursor: 'pointer', textDecoration: 'none' }}>
          <div className="card-title">📅 Agenda do Dia</div>
          <p style={{ fontSize: 13, color: 'var(--grafite-200)' }}>Todos os agendamentos por serviço para hoje</p>
        </Link>
        <Link href="/banho-tosa" className="card" style={{ cursor: 'pointer', textDecoration: 'none' }}>
          <div className="card-title">🛁 Banho e Tosa</div>
          <p style={{ fontSize: 13, color: 'var(--grafite-200)' }}>Quadro Kanban do dia</p>
        </Link>
        <Link href="/financeiro" className="card" style={{ cursor: 'pointer', textDecoration: 'none' }}>
          <div className="card-title">💰 Financeiro Geral</div>
          <p style={{ fontSize: 13, color: 'var(--grafite-200)' }}>Receita por dia, semana e mês</p>
        </Link>
        <Link href="/transporte" className="card" style={{ cursor: 'pointer', textDecoration: 'none' }}>
          <div className="card-title">🚗 Transportes</div>
          <p style={{ fontSize: 13, color: 'var(--grafite-200)' }}>Agenda completa de transporte de pets</p>
        </Link>
      </div>
    </>
  )
}
