'use client'

import { useState } from 'react'
import { useRouter } from 'next/navigation'
import type { Agendamento, Perfil } from '@/types'
import { formatCurrency, formatDate, servicoLabel } from '@/lib/utils'
import ModalAgendamento from '@/components/ModalAgendamento'

interface Props {
  agendamentos: Agendamento[]
  pets: { id: string; nome: string; tutor_nome: string; porte: string | null }[]
  perfil: Perfil
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
const DIAS_LABEL: Record<string, string> = { seg:'Seg', ter:'Ter', qua:'Qua', qui:'Qui', sex:'Sex', sab:'Sáb' }

export default function AgendamentosClient({ agendamentos, pets, perfil }: Props) {
  const router = useRouter()
  const [filtro, setFiltro] = useState('todos')
  const [busca, setBusca] = useState('')
  const [modalOpen, setModalOpen] = useState(false)
  const [detalhe, setDetalhe] = useState<Agendamento | null>(null)
  const [cancelando, setCancelando] = useState<string | null>(null)
  const [apagando, setApagando] = useState<string | null>(null)
  const [lista, setLista] = useState(agendamentos)

  // edição
  const [editando, setEditando] = useState(false)
  const [editForm, setEditForm] = useState({ valor: '', data_vencimento: '', status: '', observacoes: '' })
  const [salvandoEdit, setSalvandoEdit] = useState(false)
  const [editError, setEditError] = useState('')

  // pagamento
  const [pgForma, setPgForma] = useState<'pix' | 'dinheiro' | 'cartao'>('pix')
  const [pgValor, setPgValor] = useState('')
  const [salvandoPg, setSalvandoPg] = useState(false)
  const [pgError, setPgError] = useState('')
  const [pgSucesso, setPgSucesso] = useState(false)

  const filtrada = lista
    .filter(a => filtro === 'todos' || a.servico === filtro)
    .filter(a =>
      busca === '' ||
      a.pet_nome?.toLowerCase().includes(busca.toLowerCase()) ||
      a.tutor_nome?.toLowerCase().includes(busca.toLowerCase())
    )

  function abrirDetalhe(a: Agendamento) {
    setDetalhe(a)
    setEditando(false)
    setEditForm({
      valor: a.valor != null ? String(a.valor) : '',
      data_vencimento: a.data_vencimento ?? '',
      status: a.status,
      observacoes: a.observacoes ?? '',
    })
    setPgValor(a.valor != null ? String(a.valor) : '')
    setPgSucesso(false); setPgError('')
  }

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

  async function apagar(id: string) {
    if (!confirm('Apagar este agendamento definitivamente? Esta ação não pode ser desfeita.')) return
    setApagando(id)
    const res = await fetch(`/api/agendamentos/${id}`, { method: 'DELETE' })
    if (res.ok) {
      setLista(prev => prev.filter(a => a.id !== id))
      if (detalhe?.id === id) setDetalhe(null)
    }
    setApagando(null)
  }

  async function salvarEdicao() {
    if (!detalhe) return
    setSalvandoEdit(true); setEditError('')
    const res = await fetch(`/api/agendamentos/${detalhe.id}`, {
      method: 'PUT',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        valor: editForm.valor ? Number(editForm.valor) : null,
        data_vencimento: editForm.data_vencimento || null,
        status: editForm.status,
        observacoes: editForm.observacoes || null,
        dias_semana: detalhe.dias_semana ?? null,
      }),
    })
    if (!res.ok) {
      const d = await res.json().catch(() => ({}))
      setEditError(d.error ?? 'Erro ao salvar')
    } else {
      const updated: Agendamento = await res.json()
      setLista(prev => prev.map(a => a.id === updated.id ? { ...updated, pet_nome: a.pet_nome, tutor_nome: a.tutor_nome } : a))
      setDetalhe(prev => prev ? { ...prev, ...updated } : null)
      setEditando(false)
    }
    setSalvandoEdit(false)
  }

  async function registrarPagamento() {
    if (!detalhe || !pgValor) return
    setSalvandoPg(true); setPgError('')
    const res = await fetch('/api/pagamentos', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ agendamento_id: detalhe.id, valor: Number(pgValor), forma: pgForma }),
    })
    if (!res.ok) {
      const d = await res.json().catch(() => ({}))
      setPgError(d.error ?? 'Erro ao registrar pagamento')
    } else {
      setPgSucesso(true)
      setPgValor('')
    }
    setSalvandoPg(false)
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
          <input type="text" className="form-control" placeholder="🔍 Buscar por pet ou tutor..."
            style={{ maxWidth: 360 }} value={busca} onChange={e => setBusca(e.target.value)} />
        </div>

        {filtrada.length === 0 ? (
          <div className="empty-state"><div className="empty-icon">📅</div><p>Nenhum agendamento encontrado</p></div>
        ) : (
          <table className="table">
            <thead>
              <tr><th>Pet</th><th>Tutor</th><th>Serviço</th><th>Data / Período</th><th>Valor</th><th>Status</th><th></th></tr>
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
                    <button className="btn btn-sm btn-ghost" onClick={() => abrirDetalhe(a)}>Ver</button>
                    {a.status === 'agendado' && (
                      <button className="btn btn-sm btn-ghost" style={{ color: 'var(--vermelho)' }}
                        disabled={cancelando === a.id} onClick={() => cancelar(a.id)}>
                        {cancelando === a.id ? '...' : 'Cancelar'}
                      </button>
                    )}
                    {perfil === 'gestor' && (
                      <button className="btn btn-sm btn-ghost" style={{ color: 'var(--vermelho)' }}
                        disabled={apagando === a.id} onClick={() => apagar(a.id)}
                        title="Apagar registro definitivamente">
                        {apagando === a.id ? '...' : '🗑️'}
                      </button>
                    )}
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        )}
      </div>

      {/* Modal detalhe / edição */}
      {detalhe && (
        <div className="modal-overlay open">
          <div className="modal" style={{ maxWidth: 560 }}>
            <div className="modal-header">
              <div className="modal-title">📅 {servicoLabel(detalhe.servico)} — {detalhe.pet_nome}</div>
              <button className="modal-close" onClick={() => setDetalhe(null)}>✕</button>
            </div>

            {!editando ? (
              <>
                <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 10, marginBottom: 16 }}>
                  <Info label="Pet" value={`🐾 ${detalhe.pet_nome}`} />
                  <Info label="Tutor" value={detalhe.tutor_nome ?? '—'} />
                  <Info label="Status">
                    <span className={`dot ${statusDot[detalhe.status]}`} style={{ marginRight: 5 }} />
                    {detalhe.status.charAt(0).toUpperCase() + detalhe.status.slice(1)}
                  </Info>
                  <Info label="Valor" value={detalhe.valor ? formatCurrency(detalhe.valor) : '—'} />
                  {detalhe.data_fim
                    ? <Info label="Período" value={`${formatDate(detalhe.data_inicio)} → ${formatDate(detalhe.data_fim)}`} />
                    : <Info label="Data" value={`${formatDate(detalhe.data_inicio)}${detalhe.hora ? ` · ${detalhe.hora}` : ''}`} />
                  }
                  {detalhe.data_vencimento && <Info label="Vencimento" value={formatDate(detalhe.data_vencimento)} />}
                  {detalhe.plano_creche && <Info label="Plano" value={PLANO_LABEL[detalhe.plano_creche] ?? detalhe.plano_creche} />}
                  {detalhe.dias_semana && (
                    <Info label="Dias">
                      <div style={{ display: 'flex', gap: 4, flexWrap: 'wrap' }}>
                        {detalhe.dias_semana.split(',').map(d => (
                          <span key={d} style={{ padding: '2px 8px', borderRadius: 12, fontSize: 11, fontWeight: 600, background: 'rgba(196,130,66,0.15)', color: 'var(--caramelo)' }}>
                            {DIAS_LABEL[d] ?? d}
                          </span>
                        ))}
                      </div>
                    </Info>
                  )}
                  {detalhe.taxi_pet && <Info label="Táxi Pet" value="Sim" />}
                  {detalhe.origem && <Info label="Origem" value={detalhe.origem} />}
                  {detalhe.destino && <Info label="Destino" value={detalhe.destino} />}
                  {detalhe.observacoes && <Info label="Observações" value={detalhe.observacoes} />}
                </div>

                {/* Registro de pagamento */}
                {detalhe.status !== 'cancelado' && (
                  <div style={{ borderTop: '1px solid var(--border)', paddingTop: 14, marginBottom: 8 }}>
                    <div style={{ fontWeight: 600, fontSize: '0.82rem', color: 'var(--caramelo)', textTransform: 'uppercase', letterSpacing: '0.04em', marginBottom: 10 }}>
                      💰 Registrar Pagamento
                    </div>
                    {pgSucesso && (
                      <div className="alert alert-success" style={{ marginBottom: 8, padding: '6px 10px', fontSize: 13 }}>
                        <span>✅</span> Pagamento registrado com sucesso!
                      </div>
                    )}
                    {pgError && (
                      <div className="alert alert-danger" style={{ marginBottom: 8, padding: '6px 10px', fontSize: 13 }}>
                        <span>⚠️</span>{pgError}
                      </div>
                    )}
                    <div style={{ display: 'flex', gap: 8, alignItems: 'flex-end', flexWrap: 'wrap' }}>
                      <div style={{ flex: 1, minWidth: 120 }}>
                        <div style={{ fontSize: 11, color: 'var(--muted)', marginBottom: 4 }}>Valor (R$)</div>
                        <input type="number" className="form-control" placeholder="0,00"
                          value={pgValor} onChange={e => setPgValor(e.target.value)} />
                      </div>
                      <div>
                        <div style={{ fontSize: 11, color: 'var(--muted)', marginBottom: 4 }}>Forma</div>
                        <div style={{ display: 'flex', gap: 6 }}>
                          {(['pix', 'dinheiro', 'cartao'] as const).map(f => (
                            <button key={f} className={`pagamento-btn${pgForma === f ? ' active' : ''}`}
                              onClick={() => setPgForma(f)}>
                              {f === 'pix' ? '🔵 PIX' : f === 'dinheiro' ? '💵 Dinheiro' : '💳 Cartão'}
                            </button>
                          ))}
                        </div>
                      </div>
                      <button className="btn btn-primary btn-sm" style={{ height: 38 }}
                        onClick={registrarPagamento} disabled={salvandoPg || !pgValor}>
                        {salvandoPg ? '...' : '💾 Registrar'}
                      </button>
                    </div>
                  </div>
                )}

                <div className="modal-footer">
                  {perfil === 'gestor' && (
                    <button className="btn btn-ghost" style={{ color: 'var(--vermelho)' }}
                      disabled={apagando === detalhe.id} onClick={() => apagar(detalhe.id)}
                      title="Apagar registro definitivamente">
                      {apagando === detalhe.id ? 'Apagando...' : '🗑️ Apagar'}
                    </button>
                  )}
                  {detalhe.status === 'agendado' && (
                    <button className="btn btn-ghost" style={{ color: 'var(--vermelho)' }}
                      disabled={cancelando === detalhe.id} onClick={() => cancelar(detalhe.id)}>
                      {cancelando === detalhe.id ? 'Cancelando...' : '✕ Cancelar'}
                    </button>
                  )}
                  <button className="btn btn-ghost" onClick={() => setEditando(true)}>✏️ Editar</button>
                  <button className="btn btn-ghost" onClick={() => setDetalhe(null)}>Fechar</button>
                </div>
              </>
            ) : (
              <>
                {editError && <div className="alert alert-danger" style={{ marginBottom: 10 }}><span>⚠️</span>{editError}</div>}
                <div className="form-row">
                  <div className="form-group">
                    <label className="form-label">Valor (R$)</label>
                    <input type="number" className="form-control" value={editForm.valor}
                      onChange={e => setEditForm(f => ({ ...f, valor: e.target.value }))} />
                  </div>
                  <div className="form-group">
                    <label className="form-label">Vencimento</label>
                    <input type="date" className="form-control" value={editForm.data_vencimento}
                      onChange={e => setEditForm(f => ({ ...f, data_vencimento: e.target.value }))} />
                  </div>
                </div>
                <div className="form-group">
                  <label className="form-label">Status</label>
                  <select className="form-control" value={editForm.status}
                    onChange={e => setEditForm(f => ({ ...f, status: e.target.value }))}>
                    <option value="agendado">Agendado</option>
                    <option value="ativo">Ativo</option>
                    <option value="concluido">Concluído</option>
                    <option value="cancelado">Cancelado</option>
                  </select>
                </div>
                <div className="form-group">
                  <label className="form-label">Observações</label>
                  <textarea className="form-control" rows={3} value={editForm.observacoes}
                    onChange={e => setEditForm(f => ({ ...f, observacoes: e.target.value }))} />
                </div>
                <div className="modal-footer">
                  <button className="btn btn-ghost" onClick={() => setEditando(false)}>Cancelar</button>
                  <button className="btn btn-primary" onClick={salvarEdicao} disabled={salvandoEdit}>
                    {salvandoEdit ? 'Salvando...' : '💾 Salvar'}
                  </button>
                </div>
              </>
            )}
          </div>
        </div>
      )}

      {modalOpen && (
        <ModalAgendamento pets={pets} onClose={() => setModalOpen(false)}
          onSaved={() => { setModalOpen(false); router.refresh() }} />
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
