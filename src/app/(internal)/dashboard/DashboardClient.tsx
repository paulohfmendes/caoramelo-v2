'use client'

import type { Perfil } from '@/types'

interface Inadimplente {
  id: string
  nome: string
  whatsapp: string
  valor_em_aberto: number
}

interface Props {
  perfil: Perfil
  stats: { hotel: number; creche: number; banho: number; alertas: number }
  inadimplentes: Inadimplente[]
}

export default function DashboardClient({ perfil, stats, inadimplentes }: Props) {
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

      {/* Clientes inadimplentes */}
      {inadimplentes.length > 0 && (
        <div style={{ marginBottom: 20 }}>
          <div style={{
            background: 'rgba(239,68,68,0.08)',
            border: '1px solid rgba(239,68,68,0.25)',
            borderRadius: 10,
            overflow: 'hidden',
          }}>
            <div style={{
              padding: '12px 18px',
              borderBottom: '1px solid rgba(239,68,68,0.2)',
              display: 'flex',
              alignItems: 'center',
              gap: 10,
              background: 'rgba(239,68,68,0.12)',
            }}>
              <span style={{ fontSize: '1.1rem' }}>⚠️</span>
              <span style={{ fontWeight: 700, color: 'var(--vermelho)', fontSize: '0.95rem' }}>
                Clientes com Pagamento em Atraso
              </span>
              <span style={{
                marginLeft: 'auto',
                background: 'var(--vermelho)',
                color: '#fff',
                borderRadius: 12,
                padding: '2px 10px',
                fontSize: 12,
                fontWeight: 700,
              }}>
                {inadimplentes.length}
              </span>
            </div>
            <div style={{ padding: '6px 0' }}>
              {inadimplentes.map(c => (
                <div key={c.id} style={{
                  display: 'flex',
                  alignItems: 'center',
                  padding: '10px 18px',
                  borderBottom: '1px solid rgba(239,68,68,0.1)',
                  gap: 14,
                }}>
                  <div style={{ flex: 1 }}>
                    <div style={{ fontWeight: 600, fontSize: '0.92rem' }}>{c.nome}</div>
                    <div style={{ fontSize: '0.78rem', color: 'var(--muted)', marginTop: 2 }}>
                      <a
                        href={`https://wa.me/55${c.whatsapp.replace(/\D/g, '')}`}
                        target="_blank"
                        rel="noreferrer"
                        style={{ color: 'var(--caramelo)' }}
                      >
                        📱 {c.whatsapp}
                      </a>
                    </div>
                  </div>
                  <div style={{ textAlign: 'right' }}>
                    <div style={{ fontWeight: 700, color: 'var(--vermelho)', fontSize: '0.95rem' }}>
                      R$ {Number(c.valor_em_aberto).toFixed(2).replace('.', ',')}
                    </div>
                    <div style={{ fontSize: '0.75rem', color: 'var(--muted)' }}>em aberto</div>
                  </div>
                  <a
                    href="/tutores"
                    className="btn btn-sm btn-ghost"
                    style={{ color: 'var(--vermelho)', borderColor: 'rgba(239,68,68,0.3)', whiteSpace: 'nowrap' }}
                  >
                    Ver tutor →
                  </a>
                </div>
              ))}
            </div>
          </div>
        </div>
      )}

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
          {inadimplentes.length > 0 && (
            <div className="alert alert-danger" style={{ marginTop: 8 }}>
              <span>💸</span>
              <div><strong>{inadimplentes.length}</strong> cliente{inadimplentes.length > 1 ? 's' : ''} com pagamento atrasado.</div>
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
