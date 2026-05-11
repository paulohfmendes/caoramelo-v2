'use client'

import { useState } from 'react'
import type { Agendamento } from '@/types'
import { formatCurrency, formatDate, servicoLabel } from '@/lib/utils'
import ModalAgendamento from '@/components/ModalAgendamento'

interface Props {
  agendamentos: Agendamento[]
  pets: { id: string; nome: string; tutor_nome: string }[]
}

const servicoBadge: Record<string, string> = {
  hotel: 'badge-hotel', creche: 'badge-creche', banho: 'badge-banho', transporte: 'badge-transporte',
}

const statusDot: Record<string, string> = {
  ativo: 'dot-verde', agendado: 'dot-amarelo', concluido: 'dot-azul', cancelado: 'dot-vermelho',
}

export default function AgendamentosClient({ agendamentos, pets }: Props) {
  const [filtro, setFiltro] = useState('todos')
  const [busca, setBusca] = useState('')
  const [modalOpen, setModalOpen] = useState(false)

  const lista = agendamentos
    .filter(a => filtro === 'todos' || a.servico === filtro)
    .filter(a =>
      busca === '' ||
      a.pet_nome?.toLowerCase().includes(busca.toLowerCase()) ||
      a.tutor_nome?.toLowerCase().includes(busca.toLowerCase())
    )

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

        {lista.length === 0 ? (
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
              {lista.map(a => (
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
                  <td><button className="btn btn-sm btn-ghost">Ver</button></td>
                </tr>
              ))}
            </tbody>
          </table>
        )}
      </div>

      {modalOpen && (
        <ModalAgendamento pets={pets} onClose={() => setModalOpen(false)} onSaved={() => { setModalOpen(false); window.location.reload() }} />
      )}
    </>
  )
}
