'use client'

import { useState } from 'react'
import type { Pagamento } from '@/types'
import { formatCurrency, formatDate, servicoLabel } from '@/lib/utils'

interface Props {
  pagamentos: Pagamento[]
  stats: { hoje: number; semana: number; mes: number }
}

export default function FinanceiroClient({ pagamentos, stats }: Props) {
  const [modalOpen, setModalOpen] = useState(false)
  const [agId, setAgId] = useState('')
  const [valor, setValor] = useState('')
  const [forma, setForma] = useState<'pix' | 'dinheiro' | 'cartao'>('pix')
  const [saving, setSaving] = useState(false)

  async function registrar() {
    if (!agId || !valor) return
    setSaving(true)
    await fetch('/api/pagamentos', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ agendamento_id: agId, valor: Number(valor), forma }),
    })
    setSaving(false)
    setModalOpen(false)
    window.location.reload()
  }

  return (
    <>
      <div className="page-header">
        <div>
          <div className="page-title">Financeiro 💰</div>
          <div className="page-subtitle">Pagamentos e receitas</div>
        </div>
        <div className="page-actions">
          <button className="btn btn-primary" onClick={() => setModalOpen(true)}>+ Registrar Pagamento</button>
        </div>
      </div>

      <div className="grid-3" style={{ marginBottom: 20 }}>
        <div className="stat-card caramelo">
          <div className="stat-icon">💰</div>
          <div className="stat-label">Receita Hoje</div>
          <div className="stat-value" style={{ fontSize: 24 }}>{formatCurrency(Number(stats.hoje))}</div>
          <div className="stat-desc">pagamentos do dia</div>
        </div>
        <div className="stat-card azul">
          <div className="stat-icon">📅</div>
          <div className="stat-label">Receita Semana</div>
          <div className="stat-value" style={{ fontSize: 24 }}>{formatCurrency(Number(stats.semana))}</div>
          <div className="stat-desc">últimos 7 dias</div>
        </div>
        <div className="stat-card verde">
          <div className="stat-icon">📆</div>
          <div className="stat-label">Receita Mês</div>
          <div className="stat-value" style={{ fontSize: 24 }}>{formatCurrency(Number(stats.mes))}</div>
          <div className="stat-desc">mês atual</div>
        </div>
      </div>

      <div className="card">
        <div className="card-title"><span className="card-title-icon">💰</span> Últimos Pagamentos</div>
        {pagamentos.length === 0 ? (
          <div className="empty-state"><div className="empty-icon">💰</div><p>Nenhum pagamento registrado</p></div>
        ) : (
          <table className="table">
            <thead><tr><th>Pet</th><th>Tutor</th><th>Serviço</th><th>Forma</th><th>Valor</th><th>Data</th></tr></thead>
            <tbody>
              {pagamentos.map(p => (
                <tr key={p.id}>
                  <td className="td-nome">🐾 {p.pet_nome}</td>
                  <td>{p.tutor_nome}</td>
                  <td>{servicoLabel(p.servico)}</td>
                  <td style={{ textTransform: 'capitalize' }}>{p.forma}</td>
                  <td style={{ color: 'var(--verde)', fontWeight: 600 }}>{formatCurrency(Number(p.valor))}</td>
                  <td>{formatDate(p.data)}</td>
                </tr>
              ))}
            </tbody>
          </table>
        )}
      </div>

      {modalOpen && (
        <div className="modal-overlay open">
          <div className="modal">
            <div className="modal-header">
              <div className="modal-title">💰 Registrar Pagamento</div>
              <button className="modal-close" onClick={() => setModalOpen(false)}>✕</button>
            </div>
            <div className="form-group">
              <label className="form-label">ID do Agendamento *</label>
              <input type="text" className="form-control" value={agId} onChange={e => setAgId(e.target.value)} placeholder="UUID do agendamento" />
            </div>
            <div className="form-group">
              <label className="form-label">Valor (R$) *</label>
              <input type="number" className="form-control" value={valor} onChange={e => setValor(e.target.value)} placeholder="0,00" />
            </div>
            <div className="form-group">
              <label className="form-label">Forma de pagamento</label>
              <div style={{ display: 'flex', gap: 8, marginTop: 4 }}>
                {(['pix', 'dinheiro', 'cartao'] as const).map(f => (
                  <button key={f} className={`pagamento-btn ${forma === f ? 'active' : ''}`} onClick={() => setForma(f)}>
                    {f === 'pix' ? '🔵 PIX' : f === 'dinheiro' ? '💵 Dinheiro' : '💳 Cartão'}
                  </button>
                ))}
              </div>
            </div>
            <div className="modal-footer">
              <button className="btn btn-ghost" onClick={() => setModalOpen(false)}>Cancelar</button>
              <button className="btn btn-primary" onClick={registrar} disabled={saving}>{saving ? 'Salvando...' : '💾 Registrar'}</button>
            </div>
          </div>
        </div>
      )}
    </>
  )
}
