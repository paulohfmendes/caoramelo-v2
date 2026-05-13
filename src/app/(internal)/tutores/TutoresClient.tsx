'use client'

import { useState } from 'react'
import { useRouter } from 'next/navigation'
import type { Tutor, Pet, Perfil } from '@/types'

interface TutorRow extends Tutor {
  total_pets: number
  status_financeiro: 'pago' | 'em_aberto' | 'atrasado'
}

interface TutorDetalhe extends Tutor { pets: Pet[] }

const PORTE_LABEL: Record<string, string> = { pequeno: 'Pequeno', medio: 'Médio', grande: 'Grande' }
const SEXO_LABEL: Record<string, string> = { macho: 'Macho', femea: 'Fêmea' }

const STATUS_FIN: Record<string, { label: string; bg: string; color: string }> = {
  pago:      { label: '✅ Pago',      bg: 'rgba(16,185,129,0.15)', color: 'var(--verde)' },
  em_aberto: { label: '🕐 Em Aberto', bg: 'rgba(245,158,11,0.15)', color: '#f59e0b' },
  atrasado:  { label: '⚠️ Atrasado',  bg: 'rgba(239,68,68,0.15)',  color: 'var(--vermelho)' },
}

export default function TutoresClient({ tutores, perfil }: { tutores: TutorRow[]; perfil: Perfil }) {
  const router = useRouter()
  const [busca, setBusca] = useState('')
  const [filtroFin, setFiltroFin] = useState('todos')

  // modal novo tutor
  const [modalOpen, setModalOpen] = useState(false)
  const [nome, setNome] = useState('')
  const [whatsapp, setWhatsapp] = useState('')
  const [endereco, setEndereco] = useState('')
  const [saving, setSaving] = useState(false)
  const [error, setError] = useState('')

  // modal detalhe
  const [detalhe, setDetalhe] = useState<TutorDetalhe | null>(null)
  const [loadingDetalhe, setLoadingDetalhe] = useState(false)

  // edição
  const [editando, setEditando] = useState(false)
  const [editForm, setEditForm] = useState({ nome: '', whatsapp: '', endereco: '' })
  const [editSaving, setEditSaving] = useState(false)
  const [editError, setEditError] = useState('')
  const [apagando, setApagando] = useState(false)

  const lista = tutores.filter(t => {
    const matchBusca = busca === '' ||
      t.nome.toLowerCase().includes(busca.toLowerCase()) ||
      t.whatsapp.includes(busca)
    const matchFin = filtroFin === 'todos' || t.status_financeiro === filtroFin
    return matchBusca && matchFin
  })

  const counts = {
    atrasado:  tutores.filter(t => t.status_financeiro === 'atrasado').length,
    em_aberto: tutores.filter(t => t.status_financeiro === 'em_aberto').length,
  }

  async function verTutor(id: string) {
    setLoadingDetalhe(true)
    setDetalhe(null)
    setEditando(false)
    const res = await fetch(`/api/tutores/${id}`)
    if (res.ok) setDetalhe(await res.json())
    setLoadingDetalhe(false)
  }

  function iniciarEdicao() {
    if (!detalhe) return
    setEditForm({ nome: detalhe.nome, whatsapp: detalhe.whatsapp, endereco: detalhe.endereco ?? '' })
    setEditError('')
    setEditando(true)
  }

  async function salvarEdicao() {
    if (!detalhe) return
    if (!editForm.nome || !editForm.whatsapp) { setEditError('Nome e WhatsApp são obrigatórios'); return }
    setEditSaving(true)
    setEditError('')
    const res = await fetch(`/api/tutores/${detalhe.id}`, {
      method: 'PUT',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(editForm),
    })
    if (!res.ok) {
      const d = await res.json()
      setEditError(d.error ?? 'Erro ao salvar')
      setEditSaving(false)
      return
    }
    setEditSaving(false)
    setEditando(false)
    router.refresh()
  }

  async function apagarTutor() {
    if (!detalhe) return
    if (!confirm(`Apagar tutor "${detalhe.nome}" e todos os seus pets e agendamentos? Esta ação não pode ser desfeita.`)) return
    setApagando(true)
    const res = await fetch(`/api/tutores/${detalhe.id}`, { method: 'DELETE' })
    if (res.ok) {
      setDetalhe(null)
      router.refresh()
    }
    setApagando(false)
  }

  async function salvar() {
    if (!nome || !whatsapp) { setError('Nome e WhatsApp são obrigatórios'); return }
    setSaving(true)
    const res = await fetch('/api/tutores', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ nome, whatsapp, endereco }),
    })
    if (!res.ok) { const d = await res.json(); setError(d.error ?? 'Erro'); setSaving(false); return }
    router.refresh()
  }

  return (
    <>
      <div className="page-header">
        <div>
          <div className="page-title">Tutores 👥</div>
          <div className="page-subtitle">Cadastro de clientes</div>
        </div>
        <div className="page-actions">
          <button className="btn btn-primary" onClick={() => setModalOpen(true)}>+ Novo Tutor</button>
        </div>
      </div>

      {counts.atrasado > 0 && (
        <div style={{ marginBottom: 12, background: 'rgba(239,68,68,0.1)', border: '1px solid rgba(239,68,68,0.3)', borderRadius: 8, padding: '10px 14px', display: 'flex', alignItems: 'center', gap: 10 }}>
          <span>⚠️</span>
          <span><strong>{counts.atrasado} tutor{counts.atrasado > 1 ? 'es' : ''}</strong> com pagamento atrasado</span>
          <button className="btn btn-sm btn-ghost" style={{ marginLeft: 'auto', color: 'var(--vermelho)' }} onClick={() => setFiltroFin('atrasado')}>
            Filtrar
          </button>
        </div>
      )}

      <div className="card">
        <div style={{ display: 'flex', gap: 10, marginBottom: 14, flexWrap: 'wrap', alignItems: 'center' }}>
          <input
            type="text"
            className="form-control"
            placeholder="🔍 Buscar por nome ou WhatsApp..."
            style={{ maxWidth: 300, flex: 1 }}
            value={busca}
            onChange={e => setBusca(e.target.value)}
          />
          <div style={{ display: 'flex', gap: 6 }}>
            {(['todos', 'pago', 'em_aberto', 'atrasado'] as const).map(f => (
              <button
                key={f}
                className={`btn btn-sm ${filtroFin === f ? 'btn-primary' : 'btn-ghost'}`}
                onClick={() => setFiltroFin(f === filtroFin ? 'todos' : f)}
              >
                {f === 'todos' ? 'Todos' : STATUS_FIN[f].label}
              </button>
            ))}
          </div>
        </div>

        {lista.length === 0 ? (
          <div className="empty-state"><div className="empty-icon">👥</div><p>Nenhum tutor encontrado</p></div>
        ) : (
          <table className="table">
            <thead>
              <tr><th>Nome</th><th>WhatsApp</th><th>Pets</th><th>Status Financeiro</th><th></th></tr>
            </thead>
            <tbody>
              {lista.map(t => {
                const sf = STATUS_FIN[t.status_financeiro]
                return (
                  <tr key={t.id}>
                    <td className="td-nome">{t.nome}</td>
                    <td>
                      <a href={`https://wa.me/55${t.whatsapp.replace(/\D/g, '')}`} target="_blank" rel="noreferrer" style={{ color: 'var(--caramelo)' }}>
                        {t.whatsapp}
                      </a>
                    </td>
                    <td><span className="chip">🐾 {t.total_pets} pet(s)</span></td>
                    <td>
                      <span style={{ display: 'inline-block', padding: '3px 10px', borderRadius: 20, fontSize: 12, fontWeight: 600, background: sf.bg, color: sf.color }}>
                        {sf.label}
                      </span>
                    </td>
                    <td style={{ display: 'flex', gap: 6, justifyContent: 'flex-end' }}>
                      <button className="btn btn-sm btn-ghost" onClick={() => verTutor(t.id)}>Ver</button>
                      {perfil === 'gestor' && (
                        <button className="btn btn-sm btn-ghost" style={{ color: 'var(--vermelho)' }}
                          title="Apagar tutor definitivamente"
                          onClick={async () => {
                            if (!confirm(`Apagar tutor "${t.nome}" e todos os seus pets e agendamentos?`)) return
                            await fetch(`/api/tutores/${t.id}`, { method: 'DELETE' })
                            router.refresh()
                          }}>
                          🗑️
                        </button>
                      )}
                    </td>
                  </tr>
                )
              })}
            </tbody>
          </table>
        )}
      </div>

      {/* Modal detalhe do tutor */}
      {(loadingDetalhe || detalhe) && (
        <div className="modal-overlay open">
          <div className="modal" style={{ maxWidth: 560 }}>
            <div className="modal-header">
              <div className="modal-title">👤 {detalhe?.nome ?? '...'}</div>
              <button className="modal-close" onClick={() => { setDetalhe(null); setEditando(false) }}>✕</button>
            </div>

            {loadingDetalhe && <div style={{ padding: '24px', textAlign: 'center', color: 'var(--muted)' }}>Carregando...</div>}

            {detalhe && !editando && (
              <>
                <div style={{ padding: '0 0 16px' }}>
                  <div style={{ display: 'grid', gap: 6 }}>
                    <div>
                      <span style={{ color: 'var(--muted)', fontSize: '0.8rem' }}>WhatsApp</span><br />
                      <a href={`https://wa.me/55${detalhe.whatsapp.replace(/\D/g, '')}`} target="_blank" rel="noreferrer" style={{ color: 'var(--caramelo)' }}>{detalhe.whatsapp}</a>
                    </div>
                    {detalhe.endereco && (
                      <div><span style={{ color: 'var(--muted)', fontSize: '0.8rem' }}>Endereço</span><br />{detalhe.endereco}</div>
                    )}
                  </div>
                </div>

                <div style={{ borderTop: '1px solid var(--border)', paddingTop: 16 }}>
                  <div style={{ fontWeight: 600, marginBottom: 10, fontSize: '0.85rem', textTransform: 'uppercase', letterSpacing: '0.05em', color: 'var(--caramelo)' }}>
                    🐾 Pets ({detalhe.pets.length})
                  </div>
                  {detalhe.pets.length === 0 ? (
                    <p style={{ color: 'var(--muted)', fontSize: '0.85rem' }}>Nenhum pet cadastrado.</p>
                  ) : (
                    <div style={{ display: 'grid', gap: 10 }}>
                      {detalhe.pets.map(p => (
                        <div key={p.id} style={{ background: 'var(--surface)', borderRadius: 8, padding: '10px 14px' }}>
                          <div style={{ fontWeight: 700, marginBottom: 4 }}>
                            {p.nome}
                            <span style={{ fontWeight: 400, color: 'var(--muted)', marginLeft: 8, fontSize: '0.85rem' }}>{p.raca}</span>
                          </div>
                          <div style={{ display: 'flex', flexWrap: 'wrap', gap: '6px 16px', fontSize: '0.82rem', color: 'var(--muted)' }}>
                            {p.porte && <span>Porte: <b style={{ color: 'var(--text)' }}>{PORTE_LABEL[p.porte] ?? p.porte}</b></span>}
                            {p.sexo && <span>Sexo: <b style={{ color: 'var(--text)' }}>{SEXO_LABEL[p.sexo] ?? p.sexo}</b></span>}
                            <span>Castrado: <b style={{ color: 'var(--text)' }}>{p.castrado ? 'Sim' : 'Não'}</b></span>
                            <span>Vacinas: <b style={{ color: 'var(--text)' }}>{p.vacinas_ok ? 'OK' : 'Pendente'}</b></span>
                            {p.nascimento && <span>Nascimento: <b style={{ color: 'var(--text)' }}>{new Date(p.nascimento).toLocaleDateString('pt-BR')}</b></span>}
                            {p.peso && <span>Peso: <b style={{ color: 'var(--text)' }}>{p.peso} kg</b></span>}
                            {p.pelagem && <span>Pelagem: <b style={{ color: 'var(--text)' }}>{p.pelagem}</b></span>}
                          </div>
                          {p.observacoes && <div style={{ marginTop: 6, fontSize: '0.8rem', color: 'var(--muted)', fontStyle: 'italic' }}>{p.observacoes}</div>}
                          {p.medicamento && <div style={{ marginTop: 4, fontSize: '0.8rem', color: '#f59e0b' }}>💊 {p.medicamento}</div>}
                        </div>
                      ))}
                    </div>
                  )}
                </div>

                <div className="modal-footer">
                  {perfil === 'gestor' && (
                    <button className="btn btn-ghost" style={{ color: 'var(--vermelho)' }}
                      disabled={apagando} onClick={apagarTutor}>
                      {apagando ? 'Apagando...' : '🗑️ Apagar'}
                    </button>
                  )}
                  <button className="btn btn-ghost" onClick={() => { setDetalhe(null); setEditando(false) }}>Fechar</button>
                  <button className="btn btn-secondary" onClick={iniciarEdicao}>✏️ Editar</button>
                </div>
              </>
            )}

            {detalhe && editando && (
              <>
                {editError && <div className="alert alert-danger" style={{ marginBottom: 14 }}><span>⚠️</span>{editError}</div>}
                <div className="form-group">
                  <label className="form-label">Nome completo *</label>
                  <input type="text" className="form-control" value={editForm.nome} onChange={e => setEditForm(f => ({ ...f, nome: e.target.value }))} />
                </div>
                <div className="form-group">
                  <label className="form-label">WhatsApp *</label>
                  <input type="text" className="form-control" value={editForm.whatsapp} onChange={e => setEditForm(f => ({ ...f, whatsapp: e.target.value }))} />
                </div>
                <div className="form-group">
                  <label className="form-label">Endereço</label>
                  <input type="text" className="form-control" value={editForm.endereco} onChange={e => setEditForm(f => ({ ...f, endereco: e.target.value }))} placeholder="Rua, número, bairro" />
                </div>
                <div className="modal-footer">
                  <button className="btn btn-ghost" onClick={() => setEditando(false)}>Cancelar</button>
                  <button className="btn btn-primary" onClick={salvarEdicao} disabled={editSaving}>
                    {editSaving ? 'Salvando...' : '💾 Salvar'}
                  </button>
                </div>
              </>
            )}
          </div>
        </div>
      )}

      {/* Modal novo tutor */}
      {modalOpen && (
        <div className="modal-overlay open">
          <div className="modal">
            <div className="modal-header">
              <div className="modal-title">👥 Novo Tutor</div>
              <button className="modal-close" onClick={() => setModalOpen(false)}>✕</button>
            </div>
            {error && <div className="alert alert-danger"><span>⚠️</span>{error}</div>}
            <div className="form-group">
              <label className="form-label">Nome completo *</label>
              <input type="text" className="form-control" value={nome} onChange={e => setNome(e.target.value)} placeholder="Nome do tutor" />
            </div>
            <div className="form-group">
              <label className="form-label">WhatsApp *</label>
              <input type="text" className="form-control" value={whatsapp} onChange={e => setWhatsapp(e.target.value)} placeholder="(67) 99999-9999" />
            </div>
            <div className="form-group">
              <label className="form-label">Endereço</label>
              <input type="text" className="form-control" value={endereco} onChange={e => setEndereco(e.target.value)} placeholder="Rua, número, bairro" />
            </div>
            <div className="modal-footer">
              <button className="btn btn-ghost" onClick={() => setModalOpen(false)}>Cancelar</button>
              <button className="btn btn-primary" onClick={salvar} disabled={saving}>{saving ? 'Salvando...' : '💾 Salvar'}</button>
            </div>
          </div>
        </div>
      )}
    </>
  )
}
