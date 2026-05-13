'use client'

import Link from 'next/link'
import type { Perfil } from '@/types'

interface Inadimplente {
  id: string
  nome: string
  whatsapp: string
  valor_em_aberto: number
}

interface ContaReceber {
  id: string
  servico: string
  data_inicio: string
  data_vencimento: string | null
  valor: number
  pago: number
  saldo: number
  pet_nome: string
  tutor_nome: string
  whatsapp: string
  status: string
}

interface Props {
  perfil: Perfil
  stats: { hotel: number; creche: number; banho: number; alertas: number }
  inadimplentes: Inadimplente[]
  contasReceber: ContaReceber[]
}

const SERVICO_LABEL: Record<string, string> = {
  hotel: '🏨 Hotel',
  creche: '🏫 Creche',
  banho: '🛁 Banho',
  transporte: '🚗 Transporte',
}

function fmt(v: number) {
  return Number(v).toFixed(2).replace('.', ',')
}

function fmtDate(s: string | null) {
  if (!s) return '—'
  return new Date(s).toLocaleDateString('pt-BR')
}

export default function DashboardClient({ perfil, stats, inadimplentes, contasReceber }: Props) {
  const hoje = new Date().toLocaleDateString('pt-BR', { weekday: 'long', day: 'numeric', month: 'long', year: 'numeric' })
  const totalReceber = contasReceber.reduce((s, c) => s + Number(c.saldo), 0)
  const totalVencido = contasReceber
    .filter(c => c.data_vencimento && new Date(c.data_vencimento) < new Date(new Date().toDateString()))
    .reduce((s, c) => s + Number(c.saldo), 0)

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
            <Link href="/agendamentos" className="btn btn-primary">
              + Novo Agendamento
            </Link>
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

      {/* Contas a Receber */}
      {contasReceber.length > 0 && (
        <div style={{ marginBottom: 20 }}>
          <div style={{
            background: 'var(--surface)',
            border: '1px solid var(--border)',
            borderRadius: 10,
            overflow: 'hidden',
          }}>
            <div style={{
              padding: '14px 20px',
              borderBottom: '1px solid var(--border)',
              display: 'flex',
              alignItems: 'center',
              gap: 12,
              flexWrap: 'wrap',
            }}>
              <span style={{ fontSize: '1.1rem' }}>💵</span>
              <span style={{ fontWeight: 700, fontSize: '0.95rem' }}>Contas a Receber</span>
              <span style={{
                background: 'rgba(196,130,66,0.15)',
                color: 'var(--caramelo)',
                borderRadius: 12,
                padding: '2px 10px',
                fontSize: 12,
                fontWeight: 700,
              }}>
                {contasReceber.length} pendente{contasReceber.length > 1 ? 's' : ''}
              </span>
              <div style={{ marginLeft: 'auto', display: 'flex', gap: 20, alignItems: 'center', flexWrap: 'wrap' }}>
                {totalVencido > 0 && (
                  <div style={{ textAlign: 'right' }}>
                    <div style={{ fontSize: '0.75rem', color: 'var(--vermelho)' }}>Vencido</div>
                    <div style={{ fontWeight: 700, color: 'var(--vermelho)', fontSize: '0.95rem' }}>
                      R$ {fmt(totalVencido)}
                    </div>
                  </div>
                )}
                <div style={{ textAlign: 'right' }}>
                  <div style={{ fontSize: '0.75rem', color: 'var(--muted)' }}>Total a receber</div>
                  <div style={{ fontWeight: 700, color: 'var(--caramelo)', fontSize: '1.05rem' }}>
                    R$ {fmt(totalReceber)}
                  </div>
                </div>
              </div>
            </div>

            <div style={{ overflowX: 'auto' }}>
              <table className="table" style={{ margin: 0 }}>
                <thead>
                  <tr>
                    <th>Tutor / Pet</th>
                    <th>Serviço</th>
                    <th>Vencimento</th>
                    <th style={{ textAlign: 'right' }}>Valor</th>
                    <th style={{ textAlign: 'right' }}>Pago</th>
                    <th style={{ textAlign: 'right' }}>Saldo</th>
                    <th></th>
                  </tr>
                </thead>
                <tbody>
                  {contasReceber.map(c => {
                    const vencido = c.data_vencimento
                      ? new Date(c.data_vencimento) < new Date(new Date().toDateString())
                      : false
                    return (
                      <tr key={c.id}>
                        <td>
                          <div style={{ fontWeight: 600, fontSize: '0.9rem' }}>{c.tutor_nome}</div>
                          <div style={{ fontSize: '0.78rem', color: 'var(--muted)' }}>🐾 {c.pet_nome}</div>
                        </td>
                        <td>
                          <span style={{ fontSize: '0.85rem' }}>{SERVICO_LABEL[c.servico] ?? c.servico}</span>
                          <div style={{ fontSize: '0.75rem', color: 'var(--muted)' }}>
                            início {fmtDate(c.data_inicio)}
                          </div>
                        </td>
                        <td>
                          <span style={{
                            fontWeight: 600,
                            fontSize: '0.85rem',
                            color: vencido ? 'var(--vermelho)' : 'var(--text)',
                          }}>
                            {vencido && '⚠️ '}
                            {fmtDate(c.data_vencimento)}
                          </span>
                        </td>
                        <td style={{ textAlign: 'right', fontWeight: 500 }}>
                          R$ {fmt(c.valor)}
                        </td>
                        <td style={{ textAlign: 'right', color: 'var(--verde)', fontWeight: 500 }}>
                          {Number(c.pago) > 0 ? `R$ ${fmt(c.pago)}` : '—'}
                        </td>
                        <td style={{ textAlign: 'right' }}>
                          <span style={{
                            fontWeight: 700,
                            color: vencido ? 'var(--vermelho)' : 'var(--caramelo)',
                          }}>
                            R$ {fmt(c.saldo)}
                          </span>
                        </td>
                        <td>
                          <a
                            href={`https://wa.me/55${c.whatsapp.replace(/\D/g, '')}`}
                            target="_blank"
                            rel="noreferrer"
                            className="btn btn-sm btn-ghost"
                            style={{ color: 'var(--caramelo)', whiteSpace: 'nowrap' }}
                            title="Cobrar via WhatsApp"
                          >
                            📱 Cobrar
                          </a>
                        </td>
                      </tr>
                    )
                  })}
                </tbody>
              </table>
            </div>
          </div>
        </div>
      )}

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
                      R$ {fmt(c.valor_em_aberto)}
                    </div>
                    <div style={{ fontSize: '0.75rem', color: 'var(--muted)' }}>em aberto</div>
                  </div>
                  <Link
                    href="/tutores"
                    className="btn btn-sm btn-ghost"
                    style={{ color: 'var(--vermelho)', borderColor: 'rgba(239,68,68,0.3)', whiteSpace: 'nowrap' }}
                  >
                    Ver tutor →
                  </Link>
                </div>
              ))}
            </div>
          </div>
        </div>
      )}

      <div className="grid-2">
        <div className="card">
          <div className="card-title"><span className="card-title-icon">📅</span> Acesso Rápido</div>
          <Link href="/agendamentos" className="btn btn-secondary" style={{ width: '100%', marginBottom: 8, justifyContent: 'flex-start' }}>
            📅 Agendamentos
          </Link>
          <Link href="/banho-tosa" className="btn btn-secondary" style={{ width: '100%', marginBottom: 8, justifyContent: 'flex-start' }}>
            🛁 Banho e Tosa — Kanban
          </Link>
          <Link href="/transporte" className="btn btn-secondary" style={{ width: '100%', marginBottom: 8, justifyContent: 'flex-start' }}>
            🚗 Transporte
          </Link>
          {perfil !== 'atendente' && (
            <Link href="/monitor" className="btn btn-secondary" style={{ width: '100%', justifyContent: 'flex-start' }}>
              🔍 Monitor — Checklists
            </Link>
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
          {contasReceber.length > 0 && (
            <div className="alert" style={{ marginTop: 8, background: 'rgba(196,130,66,0.1)', border: '1px solid rgba(196,130,66,0.3)', borderRadius: 8, padding: '10px 14px', display: 'flex', gap: 8 }}>
              <span>💵</span>
              <div>
                <strong>{contasReceber.length}</strong> pagamento{contasReceber.length > 1 ? 's' : ''} pendente{contasReceber.length > 1 ? 's' : ''} — total{' '}
                <strong style={{ color: 'var(--caramelo)' }}>R$ {fmt(totalReceber)}</strong>
              </div>
            </div>
          )}
          {inadimplentes.length > 0 && (
            <div className="alert alert-danger" style={{ marginTop: 8 }}>
              <span>💸</span>
              <div><strong>{inadimplentes.length}</strong> cliente{inadimplentes.length > 1 ? 's' : ''} com pagamento atrasado.</div>
            </div>
          )}
          {perfil === 'gestor' && (
            <Link href="/financeiro" className="btn btn-secondary" style={{ width: '100%', marginTop: 12, justifyContent: 'flex-start' }}>
              💰 Ver Financeiro
            </Link>
          )}
        </div>
      </div>
    </>
  )
}
