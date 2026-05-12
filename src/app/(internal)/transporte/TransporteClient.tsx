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

  const lista = agendamentos.filter(a =>
    busca === '' ||
    a.pet_nome?.toLowerCase().includes(busca.toLowerCase()) ||
    a.tutor_nome?.toLowerCase().includes(busca.toLowerCase()) ||
    a.origem?.toLowerCase().includes(busca.toLowerCase()) ||
    a.destino?.toLowerCase().includes(busca.toLowerCase())
  )

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

        {lista.length === 0 ? (
          <div className="empty-state">
            <div className="empty-icon">🚗</div>
            <p>Nenhum transporte agendado</p>
          </div>
        ) : (
          <table className="table">
            <thead>
              <tr>
                <th>Pet</th><th>Tutor</th><th>Data / Hora</th>
                <th>Origem</th><th>Destino</th><th>Valor</th><th>Status</th>
              </tr>
            </thead>
            <tbody>
              {lista.map(a => (
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
                </tr>
              ))}
            </tbody>
          </table>
        )}
      </div>

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
