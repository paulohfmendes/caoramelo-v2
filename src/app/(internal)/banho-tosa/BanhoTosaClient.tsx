'use client'

import { useState } from 'react'
import { useRouter } from 'next/navigation'
import type { Agendamento, BanhoStatus } from '@/types'
import ModalAgendamento from '@/components/ModalAgendamento'

interface BanhoCard extends Agendamento {
  raca?: string
  porte?: string
  whatsapp?: string
}

interface Props {
  agendamentos: BanhoCard[]
  pets: { id: string; nome: string; tutor_nome: string; porte: string | null }[]
}

const COLUNAS: { key: BanhoStatus; label: string; cor: string }[] = [
  { key: 'agendado',       label: '📅 Agendado',       cor: 'var(--grafite-600)' },
  { key: 'chegou',         label: '🚪 Chegou',          cor: 'rgba(59,130,246,0.15)' },
  { key: 'em_atendimento', label: '✂️ Em Atendimento',  cor: 'rgba(245,158,11,0.15)' },
  { key: 'pronto',         label: '✅ Pronto',           cor: 'rgba(16,185,129,0.15)' },
]

const PORTE_LABEL: Record<string, string> = { pequeno: 'Pequeno', medio: 'Médio', grande: 'Grande' }

function wppLink(whatsapp: string, petNome: string, tutorNome: string) {
  const numero = whatsapp.replace(/\D/g, '')
  const msg = encodeURIComponent(
    `Olá ${tutorNome}! 🐾 O *${petNome}* já está pronto para retirada! Pode vir buscá-lo. 🛁✅\n\n_Equipe Cãoramelo_`
  )
  return `https://wa.me/55${numero}?text=${msg}`
}

export default function BanhoTosaClient({ agendamentos, pets }: Props) {
  const router = useRouter()
  const [items, setItems] = useState(agendamentos)
  const [modalOpen, setModalOpen] = useState(false)
  const [movendo, setMovendo] = useState<string | null>(null)

  async function moverCard(id: string, novoStatus: BanhoStatus) {
    setMovendo(id)
    await fetch(`/api/agendamentos/${id}/banho-status`, {
      method: 'PATCH',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ banho_status: novoStatus }),
    })
    setItems(prev => prev.map(a => a.id === id ? { ...a, banho_status: novoStatus } : a))
    setMovendo(null)
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
            <div key={col.key} className="kanban-col" style={{ background: col.cor }}>
              <div className="kanban-col-header">
                {col.label}
                <span className="kanban-col-count">{cards.length}</span>
              </div>

              {cards.length === 0 && (
                <div style={{ textAlign: 'center', color: 'var(--muted)', fontSize: '0.8rem', padding: '16px 0', opacity: 0.6 }}>
                  Nenhum pet
                </div>
              )}

              {cards.map(a => (
                <div key={a.id} className="kanban-card">
                  <div className="kanban-card-nome">🐾 {a.pet_nome}</div>
                  {(a.raca || a.porte) && (
                    <div className="kanban-card-info">
                      {a.raca}{a.raca && a.porte ? ' · ' : ''}{a.porte ? PORTE_LABEL[a.porte] ?? a.porte : ''}
                    </div>
                  )}
                  {a.hora && (
                    <div className="kanban-card-hora">⏰ {a.hora.slice(0, 5)}</div>
                  )}

                  {/* Botão de aviso WhatsApp — só na coluna Pronto */}
                  {col.key === 'pronto' && a.whatsapp && (
                    <a
                      href={wppLink(a.whatsapp, a.pet_nome ?? 'Pet', a.tutor_nome ?? 'Tutor')}
                      target="_blank"
                      rel="noreferrer"
                      className="btn btn-sm"
                      style={{
                        marginTop: 8,
                        width: '100%',
                        justifyContent: 'center',
                        background: 'rgba(37,211,102,0.15)',
                        border: '1px solid rgba(37,211,102,0.4)',
                        color: '#25d366',
                        fontWeight: 600,
                        fontSize: 12,
                      }}
                    >
                      📱 Avisar tutor no WhatsApp
                    </a>
                  )}

                  {/* Botões de mover para outras etapas */}
                  <div style={{ marginTop: 8, display: 'flex', gap: 4, flexWrap: 'wrap' }}>
                    {COLUNAS.filter(c => c.key !== col.key).map(c => (
                      <button
                        key={c.key}
                        className="btn btn-sm btn-ghost"
                        style={{ fontSize: 10, padding: '3px 7px' }}
                        disabled={movendo === a.id}
                        onClick={() => moverCard(a.id, c.key)}
                      >
                        → {c.label.replace(/^[^\s]+\s/, '')}
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
        <ModalAgendamento
          pets={pets}
          onClose={() => setModalOpen(false)}
          onSaved={() => { setModalOpen(false); router.refresh() }}
        />
      )}
    </>
  )
}
