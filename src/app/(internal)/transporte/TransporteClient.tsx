'use client'

import { useState } from 'react'
import type { Agendamento } from '@/types'
import { formatDate, formatCurrency } from '@/lib/utils'
import ModalAgendamento from '@/components/ModalAgendamento'

interface Props {
  agendamentos: Agendamento[]
  pets: { id: string; nome: string; tutor_nome: string; porte: string | null }[]
  podeAgendar: boolean
}

const statusDot: Record<string, string> = {
  ativo: 'dot-verde', agendado: 'dot-amarelo', concluido: 'dot-azul', cancelado: 'dot-vermelho',
}

export default function TransporteClient({ agendamentos, pets, podeAgendar }: Props) {
  const [modalOpen, setModalOpen] = useState(false)
  const [busca, setBusca] = useState('')
  const [detalhe, setDetalhe] = useState<Agendamento | null>(null)
  const [cancelando, setCancelando] = useState<string | null>(null)
  const [lista, setLista] = useState(agendamentos)

  const filtrada = lista.filter(a =>
    busca === '' ||
    a.pet_nome?.toLowerCase().includes(busca.toLowerCase()) ||
    a.tutor_nome?.toLowerCase().includes(busca.toLowerCase()) ||
    a.origem?.toLowerCase().includes(busca.toLowerCase()) ||
    a.destino?.toLowerCase().includes(busca.toLowerCase())
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
          <div className="page-title">Transporte 🚗</div>
          <div className="page-subtitle">Agenda de transporte de pets</div>
        </div>
        {podeAgendar && (
          <div className="page-actions">
            <button className="btn btn-primary" onClick={() => setModalOpen(true)}>+ Agendar Transporte</button>
          </div>
        )}
      </div>

      {!podeAgendar && (
        <div className="alert alert-info" style={{ marginBottom: 20 }}>
          <span>ℹ️</span>
          <div>Visualização disponível para todos os perfis. Apenas o <strong>Gestor</strong> pode criar novos agendamentos de transporte.</div>
        </div>
      )}

      <div className="card">
        <div style={{ marginBottom: 14 }}>
          <input
            type="text"
            className="form-control"
            placeholder="🔍 Buscar por pet, tutor ou endereço..."
            style={{ maxWidth: 400 }}
            value={busca}
            onChange={e => setBusca(e.target.value)}
          />
        </div>

        {filtrada.length === 0 ? (
          <div className="empty-state">
            <div className="empty-icon">🚗</div>
            <p>Nenhum transporte agendado</p>
          </div>
        ) : (
          <table className="table">
            <thead>
              <tr>
                <th>Pet</th><th>Tutor</th><th>Data / Hora</th>
                <th>Origem</th><th>Destino</th><th>Valor</th><th>Status</th><th></th>
              </tr>
            </thead>
            <tbody>
              {filtrada.map(a => (
                <tr key={a.id}>
                  <td className="td-nome">🐾 {a.pet_nome}</td>
                  <td>{a.tutor_nome}</td>
                  <td>{formatDate(a.data_inicio)}{a.hora ? ` · ${a.hora}` : ''}</td>
                  <td style={{ fontSize: 12 }}>{a.origem ?? '—'}</td>
                  <td style={{ fontSize: 12 }}>{a.destino ?? '—'}</td>
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

      {/* Modal detalhe do transporte */}
      {detalhe && (
        <div className="modal-overlay open">
          <div className="modal" style={{ maxWidth: 480 }}>
            <div className="modal-header">
              <div className="modal-title">🚗 Transporte — {detalhe.pet_nome}</div>
              <button className="modal-close" onClick={() => setDetalhe(null)}>✕</button>
            </div>

            <div style={{ display: 'grid', gap: 10, padding: '4px 0 16px' }}>
              <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 10 }}>
                <TInfo label="Pet" value={`🐾 ${detalhe.pet_nome}`} />
                <TInfo label="Tutor" value={detalhe.tutor_nome ?? '—'} />
                <TInfo label="Data" value={formatDate(detalhe.data_inicio)} />
                <TInfo label="Hora" value={detalhe.hora ?? '—'} />
                <TInfo label="Valor" value={detalhe.valor ? formatCurrency(detalhe.valor) : '—'} />
                <TInfo label="Status">
                  <span className={`dot ${statusDot[detalhe.status]}`} style={{ marginRight: 5 }} />
                  {detalhe.status.charAt(0).toUpperCase() + detalhe.status.slice(1)}
                </TInfo>
              </div>
              {detalhe.origem && <TInfo label="Origem" value={detalhe.origem} />}
              {detalhe.destino && <TInfo label="Destino" value={detalhe.destino} />}
              {detalhe.observacoes && <TInfo label="Observações" value={detalhe.observacoes} />}
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

      {modalOpen && podeAgendar && (
        <ModalAgendamento
          pets={pets}
          onClose={() => setModalOpen(false)}
          onSaved={() => { setModalOpen(false); window.location.reload() }}
        />
      )}
    </>
  )
}

function TInfo({ label, value, children }: { label: string; value?: string; children?: React.ReactNode }) {
  return (
    <div>
      <div style={{ fontSize: '0.75rem', color: 'var(--muted)', marginBottom: 2 }}>{label}</div>
      <div style={{ fontWeight: 500 }}>{children ?? value ?? '—'}</div>
    </div>
  )
}
