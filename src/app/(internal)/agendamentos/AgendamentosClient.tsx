'use client'

import { useState } from 'react'
import type { Agendamento } from '@/types'
import { formatCurrency, formatDate, servicoLabel } from '@/lib/utils'
import ModalAgendamento from '@/components/ModalAgendamento'

interface Props {
  agendamentos: Agendamento[]
  pets: { id: string; nome: string; tutor_nome: string; porte: string | null }[]
}

const servicoBadge: Record<string, string> = {
  hotel: 'badge-hotel', creche: 'badge-creche', banho: 'badge-banho', transporte: 'badge-transporte',
}

const statusDot: Record<string, string> = {
  ativo: 'dot-verde', agendado: 'dot-amarelo', concluido: 'dot-azul', cancelado: 'dot-vermelho',
}

const PLANO_LABEL: Record<string, string> = {
  avulso: 'Day Use / Avulso', '1x': '1x por semana', '2x': '2x por semana',
  '3x': '3x por semana', '4x': '4x por semana', '5x': '5x por semana',
}

export default function AgendamentosClient({ agendamentos, pets }: Props) {
  const [filtro, setFiltro] = useState('todos')
  const [busca, setBusca] = useState('')
  const [modalOpen, setModalOpen] = useState(false)
  const [detalhe, setDetalhe] = useState<Agendamento | null>(null)
  const [cancelando, setCancelando] = useState<string | null>(null)
  const [lista, setLista] = useState(agendamentos)

  const filtrada = lista
    .filter(a => filtro === 'todos' || a.servico === filtro)
    .filter(a =>
      busca === '' ||
      a.pet_nome?.toLowerCase().includes(busca.toLowerCase()) ||
      a.tutor_nome?.toLowerCase().includes(busca.toLowerCase())
    )

  async function cancelar(id: string) {
    if (!confirm('Deseja cancelar este agendamento?')) return
    setCancelando(id)
    const res = await fetch(`/api/agendamentos/${id}`, {
      method: 'PATCH',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ status: 'cancelado' }),
    })
    if (res.ok) {
      setLista(prev => prev.map(a => a.id === id ? { ...a, status: 'cancelado' as const } : a))
      if (detalhe?.id === id) setDetalhe(prev => prev ? { ...prev, status: 'cancelado' as const } : null)
    }
    setCancelando(null)
  }

  return (
    <>
      <div className="page-header">
        <div>
          <div className="page-title">Agendamentos</div>
          <div className="page-subtitle">Creche · Hotel · Banho e Tosa · Transporte</div>
        </div>
        <div className="page-actions">
          <button className="btn btn-primary" onClick={() => setModalOpen(true)}>+ Novo Agendamento</button>
        </div>
      </div>

      <div className="tabs">
        {['todos', 'hotel', 'creche', 'banho', 'transporte'].map(f => (
          <button key={f} className={`tab ${filtro === f ? 'active' : ''}`} onClick={() => setFiltro(f)}>
            {f === 'todos' ? 'Todos' : servicoLabel(f)}
          </button>
        ))}
      </div>

      <div className="card">
        <div style={{ marginBottom: 14 }}>
          <input
            type="text"
            className="form-control"
            placeholder="🔍 Buscar por pet ou tutor..."
            style={{ maxWidth: 360 }}
            value={busca}
            onChange={e => setBusca(e.target.value)}
          />
        </div>

        {filtrada.length === 0 ? (
          <div className="empty-state">
            <div className="empty-icon">📅</div>
            <p>Nenhum agendamento encontrado</p>
          </div>
        ) : (
          <table className="table">
            <thead>
              <tr>
                <th>Pet</th><th>Tutor</th><th>Serviço</th>
                <th>Data / Período</th><th>Valor</th><th>Status</th><th></th>
              </tr>
            </thead>
            <tbody>
              {filtrada.map(a => (
                <tr key={a.id}>
                  <td className="td-nome">🐾 {a.pet_nome}</td>
                  <td>{a.tutor_nome}</td>
                  <td><span className={`badge ${servicoBadge[a.servico]}`}>{servicoLabel(a.servico)}</span></td>
                  <td>
                    {a.data_fim
                      ? `${formatDate(a.data_inicio)} → ${formatDate(a.data_fim)}`
                      : `${formatDate(a.data_inicio)}${a.hora ? ` · ${a.hora}` : ''}`}
                  </td>
                  <td>{a.valor ? formatCurrency(a.valor) : '—'}</td>
                  <td>
                    <span className={`dot ${statusDot[a.status]}`} style={{ marginRight: 5 }} />
                    {a.status.charAt(0).toUpperCase() + a.status.slice(1)}
                  </td>
                  <td style={{ display: 'flex', gap: 6, justifyContent: 'flex-end' }}>
                    <button className="btn btn-sm btn-ghost" onClick={() => setDetalhe(a)}>Ver</button>
                    {a.status === 'agendado' && (
                      <button
                        className="btn btn-sm btn-ghost"
                        style={{ color: 'var(--vermelho)' }}
                        disabled={cancelando === a.id}
                        onClick={() => cancelar(a.id)}
                      >
                        {cancelando === a.id ? '...' : 'Cancelar'}
                      </button>
                    )}
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        )}
      </div>

      {/* Modal detalhe do agendamento */}
      {detalhe && (
        <div className="modal-overlay open">
          <div className="modal" style={{ maxWidth: 520 }}>
            <div className="modal-header">
              <div className="modal-title">📅 {servicoLabel(detalhe.servico)} — {detalhe.pet_nome}</div>
              <button className="modal-close" onClick={() => setDetalhe(null)}>✕</button>
            </div>

            <div style={{ display: 'grid', gap: 10, padding: '4px 0 16px' }}>
              <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 10 }}>
                <Info label="Pet" value={`🐾 ${detalhe.pet_nome}`} />
                <Info label="Tutor" value={detalhe.tutor_nome ?? '—'} />
                <Info label="Status">
                  <span className={`dot ${statusDot[detalhe.status]}`} style={{ marginRight: 5 }} />
                  {detalhe.status.charAt(0).toUpperCase() + detalhe.status.slice(1)}
                </Info>
                <Info label="Valor" value={detalhe.valor ? formatCurrency(detalhe.valor) : '—'} />
              </div>

              {(detalhe.data_fim) ? (
                <Info label="Período" value={`${formatDate(detalhe.data_inicio)} → ${formatDate(detalhe.data_fim)}`} />
              ) : (
                <Info label="Data" value={`${formatDate(detalhe.data_inicio)}${detalhe.hora ? ` · ${detalhe.hora}` : ''}`} />
              )}

              {detalhe.plano_creche && (
                <Info label="Plano" value={PLANO_LABEL[detalhe.plano_creche] ?? detalhe.plano_creche} />
              )}
              {detalhe.taxi_pet && <Info label="Táxi Pet" value="Sim" />}
              {detalhe.origem && <Info label="Origem" value={detalhe.origem} />}
              {detalhe.destino && <Info label="Destino" value={detalhe.destino} />}
              {detalhe.observacoes && <Info label="Observações" value={detalhe.observacoes} />}
            </div>

            <div className="modal-footer">
              {detalhe.status === 'agendado' && (
                <button
                  className="btn btn-ghost"
                  style={{ color: 'var(--vermelho)' }}
                  disabled={cancelando === detalhe.id}
                  onClick={() => cancelar(detalhe.id)}
                >
                  {cancelando === detalhe.id ? 'Cancelando...' : '✕ Cancelar agendamento'}
                </button>
              )}
              <button className="btn btn-ghost" onClick={() => setDetalhe(null)}>Fechar</button>
            </div>
          </div>
        </div>
      )}

      {modalOpen && (
        <ModalAgendamento pets={pets} onClose={() => setModalOpen(false)} onSaved={() => { setModalOpen(false); window.location.reload() }} />
      )}
    </>
  )
}

function Info({ label, value, children }: { label: string; value?: string; children?: React.ReactNode }) {
  return (
    <div>
      <div style={{ fontSize: '0.75rem', color: 'var(--muted)', marginBottom: 2 }}>{label}</div>
      <div style={{ fontWeight: 500 }}>{children ?? value ?? '—'}</div>
    </div>
  )
}
