export default function RelatoriosPage() {
  return (
    <>
      <div className="page-header">
        <div>
          <div className="page-title">Relatórios 📈</div>
          <div className="page-subtitle">Acesso restrito ao Gestor</div>
        </div>
      </div>

      <div className="grid-2">
        <a href="/agendamentos" className="card" style={{ cursor: 'pointer', textDecoration: 'none' }}>
          <div className="card-title">📅 Agenda do Dia</div>
          <p style={{ fontSize: 13, color: 'var(--grafite-200)' }}>Todos os agendamentos por serviço para hoje</p>
        </a>
        <a href="/banho-tosa" className="card" style={{ cursor: 'pointer', textDecoration: 'none' }}>
          <div className="card-title">🛁 Banho e Tosa</div>
          <p style={{ fontSize: 13, color: 'var(--grafite-200)' }}>Quadro Kanban do dia</p>
        </a>
        <a href="/financeiro" className="card" style={{ cursor: 'pointer', textDecoration: 'none' }}>
          <div className="card-title">💰 Financeiro Geral</div>
          <p style={{ fontSize: 13, color: 'var(--grafite-200)' }}>Receita por dia, semana e mês</p>
        </a>
        <a href="/transporte" className="card" style={{ cursor: 'pointer', textDecoration: 'none' }}>
          <div className="card-title">🚗 Transportes</div>
          <p style={{ fontSize: 13, color: 'var(--grafite-200)' }}>Agenda completa de transporte de pets</p>
        </a>
      </div>
    </>
  )
}
