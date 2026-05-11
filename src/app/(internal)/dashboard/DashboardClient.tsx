'use client'

import type { Perfil } from '@/types'

interface Props {
  perfil: Perfil
  stats: { hotel: number; creche: number; banho: number; alertas: number }
}

export default function DashboardClient({ perfil, stats }: Props) {
  const hoje = new Date().toLocaleDateString('pt-BR', { weekday: 'long', day: 'numeric', month: 'long', year: 'numeric' })

  return (
    <>
      <div className="page-header">
        <div>
          <div className="page-title">
            {perfil === 'monitor' ? 'Monitor 🔍' : perfil === 'gestor' ? 'Visão Geral 📊' : 'Bom dia! 👋'}
          </div>
          <div className="page-subtitle">{hoje}</div>
        </div>
        {perfil !== 'monitor' && (
          <div className="page-actions">
            <button className="btn btn-primary" onClick={() => window.location.href = '/agendamentos'}>
              + Novo Agendamento
            </button>
          </div>
        )}
      </div>

      <div className="grid-4" style={{ marginBottom: 20 }}>
        <div className="stat-card caramelo">
          <div className="stat-icon">🏨</div>
          <div className="stat-label">Hotel hoje</div>
          <div className="stat-value">{stats.hotel}</div>
          <div className="stat-desc">pets hospedados</div>
        </div>
        <div className="stat-card azul">
          <div className="stat-icon">🏫</div>
          <div className="stat-label">Creche hoje</div>
          <div className="stat-value">{stats.creche}</div>
          <div className="stat-desc">pets no day care</div>
        </div>
        <div className="stat-card amarelo">
          <div className="stat-icon">🛁</div>
          <div className="stat-label">Banho e Tosa</div>
          <div className="stat-value">{stats.banho}</div>
          <div className="stat-desc">agendados hoje</div>
        </div>
        <div className="stat-card verde">
          <div className="stat-icon">⚠️</div>
          <div className="stat-label">Alertas</div>
          <div className="stat-value">{stats.alertas}</div>
          <div className="stat-desc">pets com medicamento</div>
        </div>
      </div>

      <div className="grid-2">
        <div className="card">
          <div className="card-title"><span className="card-title-icon">📅</span> Acesso Rápido</div>
          <a href="/agendamentos" className="btn btn-secondary" style={{ width: '100%', marginBottom: 8, justifyContent: 'flex-start' }}>
            📅 Agendamentos
          </a>
          <a href="/banho-tosa" className="btn btn-secondary" style={{ width: '100%', marginBottom: 8, justifyContent: 'flex-start' }}>
            🛁 Banho e Tosa — Kanban
          </a>
          <a href="/transporte" className="btn btn-secondary" style={{ width: '100%', marginBottom: 8, justifyContent: 'flex-start' }}>
            🚗 Transporte
          </a>
          {perfil !== 'atendente' && (
            <a href="/monitor" className="btn btn-secondary" style={{ width: '100%', justifyContent: 'flex-start' }}>
              🔍 Monitor — Checklists
            </a>
          )}
        </div>

        <div className="card">
          <div className="card-title"><span className="card-title-icon">ℹ️</span> Status</div>
          <div className="alert alert-info">
            <span>🐾</span>
            <div>Sistema operacional. <strong>{stats.hotel + stats.creche}</strong> pets sob cuidado hoje.</div>
          </div>
          {stats.alertas > 0 && (
            <div className="alert alert-warning">
              <span>💊</span>
              <div><strong>{stats.alertas}</strong> {stats.alertas === 1 ? 'pet precisa' : 'pets precisam'} de medicamento. Verificar na aba Pets.</div>
            </div>
          )}
          {perfil === 'gestor' && (
            <a href="/financeiro" className="btn btn-secondary" style={{ width: '100%', marginTop: 12, justifyContent: 'flex-start' }}>
              💰 Ver Financeiro
            </a>
          )}
        </div>
      </div>
    </>
  )
}
