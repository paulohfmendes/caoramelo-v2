'use client'

import { useState } from 'react'
import type { Agendamento, BanhoStatus } from '@/types'
import { banhoStatusLabel } from '@/lib/utils'
import ModalAgendamento from '@/components/ModalAgendamento'

interface Props {
  agendamentos: Agendamento[]
  pets: { id: string; nome: string; tutor_nome: string }[]
}

const COLUNAS: { key: BanhoStatus; label: string; colClass: string }[] = [
  { key: 'agendado',  label: 'Agendado',  colClass: 'col-agendado' },
  { key: 'chegou',    label: 'Chegou',    colClass: 'col-chegou' },
  { key: 'em_banho',  label: 'Em Banho',  colClass: 'col-banho' },
  { key: 'em_tosa',   label: 'Em Tosa',   colClass: 'col-tosa' },
  { key: 'pronto',    label: '✅ Pronto',  colClass: 'col-pronto' },
  { key: 'retirado',  label: 'Retirado',  colClass: 'col-retirado' },
]

export default function BanhoTosaClient({ agendamentos, pets }: Props) {
  const [items, setItems] = useState(agendamentos)
  const [modalOpen, setModalOpen] = useState(false)

  async function moverCard(id: string, novoStatus: BanhoStatus) {
    await fetch(`/api/agendamentos/${id}/banho-status`, {
      method: 'PATCH',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ banho_status: novoStatus }),
    })
    setItems(prev => prev.map(a => a.id === id ? { ...a, banho_status: novoStatus } : a))
  }

  return (
    <>
      <div className="page-header">
        <div>
          <div className="page-title">Banho e Tosa 🛁</div>
          <div className="page-subtitle">Quadro do dia</div>
        </div>
        <div className="page-actions">
          <button className="btn btn-primary" onClick={() => setModalOpen(true)}>+ Agendar</button>
        </div>
      </div>

      <div className="kanban">
        {COLUNAS.map(col => {
          const cards = items.filter(a => (a.banho_status ?? 'agendado') === col.key)
          return (
            <div key={col.key} className={`kanban-col ${col.colClass}`}>
              <div className="kanban-col-header">
                {col.label}
                <span className="kanban-col-count">{cards.length}</span>
              </div>
              {cards.map(a => (
                <div key={a.id} className="kanban-card">
                  <div className="kanban-card-nome">🐾 {a.pet_nome}</div>
                  <div className="kanban-card-info">{(a as unknown as { raca?: string }).raca} · {(a as unknown as { porte?: string }).porte}</div>
                  {a.hora && <div className="kanban-card-hora">⏰ {a.hora}</div>}
                  <div style={{ marginTop: 8, display: 'flex', gap: 4, flexWrap: 'wrap' }}>
                    {COLUNAS.filter(c => c.key !== col.key).map(c => (
                      <button
                        key={c.key}
                        className="btn btn-sm btn-ghost"
                        style={{ fontSize: 10, padding: '3px 7px' }}
                        onClick={() => moverCard(a.id, c.key)}
                      >
                        → {banhoStatusLabel(c.key)}
                      </button>
                    ))}
                  </div>
                </div>
              ))}
            </div>
          )
        })}
      </div>

      {modalOpen && (
        <ModalAgendamento pets={pets} onClose={() => setModalOpen(false)} onSaved={() => { setModalOpen(false); window.location.reload() }} />
      )}
    </>
  )
}
