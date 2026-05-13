'use client'

import { useState } from 'react'
import type { Pet } from '@/types'

interface Props {
  pets: Pet[]
  tutores: { id: string; nome: string }[]
}

const PORTE_LABEL: Record<string, string> = { pequeno: 'Pequeno', medio: 'Médio', grande: 'Grande' }
const SEXO_LABEL: Record<string, string> = { macho: 'Macho', femea: 'Fêmea' }

export default function PetsClient({ pets, tutores: tutoresInit }: Props) {
  const [busca, setBusca] = useState('')
  const [modalOpen, setModalOpen] = useState(false)
  const [detalhe, setDetalhe] = useState<Pet | null>(null)
  const [saving, setSaving] = useState(false)
  const [error, setError] = useState('')
  const [form, setForm] = useState({
    tutor_id: '', nome: '', raca: '', porte: 'medio', peso: '',
    sexo: 'macho', castrado: false, vacinas_ok: true,
    pelagem: '', nascimento: '', medicamento: '', observacoes: '',
  })

  // lista local de tutores — cresce quando um novo é criado inline
  const [tutores, setTutores] = useState(tutoresInit)

  // mini-form de novo tutor inline
  const [novoTutorOpen, setNovoTutorOpen] = useState(false)
  const [ntNome, setNtNome] = useState('')
  const [ntWpp, setNtWpp] = useState('')
  const [ntEndereco, setNtEndereco] = useState('')
  const [ntSaving, setNtSaving] = useState(false)
  const [ntError, setNtError] = useState('')

  // edição de pet
  const [editando, setEditando] = useState(false)
  const [editForm, setEditForm] = useState({
    nome: '', raca: '', porte: 'medio', peso: '',
    sexo: 'macho', castrado: false, vacinas_ok: true,
    pelagem: '', nascimento: '', medicamento: '', observacoes: '',
  })
  const [editSaving, setEditSaving] = useState(false)
  const [editError, setEditError] = useState('')

  const lista = pets.filter(p =>
    busca === '' ||
    p.nome.toLowerCase().includes(busca.toLowerCase()) ||
    p.raca.toLowerCase().includes(busca.toLowerCase()) ||
    p.tutor_nome?.toLowerCase().includes(busca.toLowerCase())
  )

  function set(k: string, v: unknown) { setForm(f => ({ ...f, [k]: v })) }
  function setE(k: string, v: unknown) { setEditForm(f => ({ ...f, [k]: v })) }

  function abrirNovoTutor() {
    setNtNome(''); setNtWpp(''); setNtEndereco(''); setNtError('')
    setNovoTutorOpen(true)
  }

  function fecharNovoTutor() {
    setNovoTutorOpen(false)
    setNtNome(''); setNtWpp(''); setNtEndereco(''); setNtError('')
  }

  function iniciarEdicao() {
    if (!detalhe) return
    setEditForm({
      nome: detalhe.nome,
      raca: detalhe.raca,
      porte: detalhe.porte ?? 'medio',
      peso: detalhe.peso ? String(detalhe.peso) : '',
      sexo: detalhe.sexo ?? 'macho',
      castrado: detalhe.castrado,
      vacinas_ok: detalhe.vacinas_ok,
      pelagem: detalhe.pelagem ?? '',
      nascimento: detalhe.nascimento ?? '',
      medicamento: detalhe.medicamento ?? '',
      observacoes: detalhe.observacoes ?? '',
    })
    setEditError('')
    setEditando(true)
  }

  async function salvarTutor() {
    if (!ntNome || !ntWpp) { setNtError('Nome e WhatsApp são obrigatórios'); return }
    setNtSaving(true)
    setNtError('')
    const res = await fetch('/api/tutores', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ nome: ntNome, whatsapp: ntWpp, endereco: ntEndereco }),
    })
    if (!res.ok) {
      const d = await res.json()
      setNtError(d.error ?? 'Erro ao criar tutor')
      setNtSaving(false)
      return
    }
    const novo: { id: string; nome: string } = await res.json()
    setTutores(prev => [...prev, { id: novo.id, nome: novo.nome }].sort((a, b) => a.nome.localeCompare(b.nome)))
    setForm(f => ({ ...f, tutor_id: novo.id }))
    fecharNovoTutor()
    setNtSaving(false)
  }

  async function salvarEdicao() {
    if (!detalhe) return
    if (!editForm.nome || !editForm.raca) { setEditError('Nome e raça são obrigatórios'); return }
    setEditSaving(true)
    setEditError('')
    const res = await fetch(`/api/pets/${detalhe.id}`, {
      method: 'PUT',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        ...editForm,
        peso: editForm.peso ? Number(editForm.peso) : null,
        nascimento: editForm.nascimento || null,
      }),
    })
    if (!res.ok) {
      const d = await res.json()
      setEditError(d.error ?? 'Erro ao salvar')
      setEditSaving(false)
      return
    }
    setEditSaving(false)
    setEditando(false)
    window.location.reload()
  }

  async function salvar() {
    if (!form.tutor_id || !form.nome || !form.raca) { setError('Preencha os campos obrigatórios'); return }
    setSaving(true)
    const res = await fetch('/api/pets', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        ...form,
        peso: form.peso ? Number(form.peso) : null,
        nascimento: form.nascimento || null,
      }),
    })
    if (!res.ok) { const d = await res.json(); setError(d.error ?? 'Erro'); setSaving(false); return }
    window.location.reload()
  }

  return (
    <>
      <div className="page-header">
        <div>
          <div className="page-title">Pets 🐶</div>
          <div className="page-subtitle">Cadastro de animais</div>
        </div>
        <div className="page-actions">
          <button className="btn btn-primary" onClick={() => setModalOpen(true)}>+ Novo Pet</button>
        </div>
      </div>

      <div style={{ marginBottom: 14 }}>
        <input
          type="text"
          className="form-control"
          placeholder="🔍 Buscar por nome, raça ou tutor..."
          style={{ maxWidth: 360 }}
          value={busca}
          onChange={e => setBusca(e.target.value)}
        />
      </div>

      {lista.length === 0 ? (
        <div className="empty-state"><div className="empty-icon">🐶</div><p>Nenhum pet cadastrado</p></div>
      ) : (
        lista.map(p => (
          <div key={p.id} className="pet-card">
            <div className="pet-avatar">🐾</div>
            <div className="pet-info">
              <div className="pet-nome">{p.nome}</div>
              <div className="pet-raca">
                {p.raca}
                {p.porte ? ` · ${PORTE_LABEL[p.porte] ?? p.porte}` : ''}
                {p.peso ? ` · ${p.peso}kg` : ''}
                {p.sexo ? ` · ${SEXO_LABEL[p.sexo] ?? p.sexo}` : ''}
                {` · ${p.castrado ? 'Castrado(a)' : 'Não castrado(a)'}`}
              </div>
              <div className="pet-raca">Tutor: {p.tutor_nome}</div>
              <div className="pet-badges">
                {p.medicamento && <span className="badge badge-med">💊 Medicamento</span>}
                {p.vacinas_ok ? <span className="badge badge-ok">✅ Vacinas em dia</span> : <span className="badge badge-erro">⚠️ Vacina pendente</span>}
                {p.sexo === 'femea' && !p.castrado && <span className="badge badge-cio">🌸 Fêmea não castrada</span>}
              </div>
            </div>
            <button className="btn btn-sm btn-ghost" onClick={() => { setDetalhe(p); setEditando(false) }}>Ver</button>
          </div>
        ))
      )}

      {/* Modal detalhe do pet */}
      {detalhe && !editando && (
        <div className="modal-overlay open">
          <div className="modal" style={{ maxWidth: 520 }}>
            <div className="modal-header">
              <div className="modal-title">🐾 {detalhe.nome}</div>
              <button className="modal-close" onClick={() => setDetalhe(null)}>✕</button>
            </div>
            <div style={{ display: 'grid', gap: 12, padding: '4px 0 16px' }}>
              <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 10 }}>
                <PetInfo label="Raça" value={detalhe.raca} />
                <PetInfo label="Tutor" value={detalhe.tutor_nome ?? '—'} />
                {detalhe.porte && <PetInfo label="Porte" value={PORTE_LABEL[detalhe.porte] ?? detalhe.porte} />}
                {detalhe.sexo && <PetInfo label="Sexo" value={SEXO_LABEL[detalhe.sexo] ?? detalhe.sexo} />}
                {detalhe.peso && <PetInfo label="Peso" value={`${detalhe.peso} kg`} />}
                {detalhe.nascimento && <PetInfo label="Nascimento" value={new Date(detalhe.nascimento).toLocaleDateString('pt-BR')} />}
                <PetInfo label="Castrado(a)" value={detalhe.castrado ? 'Sim' : 'Não'} />
                <PetInfo label="Vacinas" value={detalhe.vacinas_ok ? '✅ Em dia' : '⚠️ Pendente'} />
                {detalhe.pelagem && <PetInfo label="Pelagem" value={detalhe.pelagem} />}
              </div>
              {detalhe.medicamento && (
                <div style={{ background: 'rgba(245,158,11,0.1)', border: '1px solid rgba(245,158,11,0.3)', borderRadius: 8, padding: '10px 14px' }}>
                  <div style={{ fontSize: '0.75rem', color: '#f59e0b', marginBottom: 4 }}>💊 Medicamento</div>
                  <div style={{ fontWeight: 500 }}>{detalhe.medicamento}</div>
                </div>
              )}
              {detalhe.observacoes && (
                <div style={{ background: 'var(--grafite-600)', borderRadius: 8, padding: '10px 14px' }}>
                  <div style={{ fontSize: '0.75rem', color: 'var(--muted)', marginBottom: 4 }}>Observações</div>
                  <div style={{ fontSize: '0.9rem' }}>{detalhe.observacoes}</div>
                </div>
              )}
            </div>
            <div className="modal-footer">
              <button className="btn btn-ghost" onClick={() => setDetalhe(null)}>Fechar</button>
              <button className="btn btn-secondary" onClick={iniciarEdicao}>✏️ Editar</button>
            </div>
          </div>
        </div>
      )}

      {/* Modal edição de pet */}
      {detalhe && editando && (
        <div className="modal-overlay open">
          <div className="modal modal-lg">
            <div className="modal-header">
              <div className="modal-title">✏️ Editar {detalhe.nome}</div>
              <button className="modal-close" onClick={() => setEditando(false)}>✕</button>
            </div>
            {editError && <div className="alert alert-danger"><span>⚠️</span>{editError}</div>}
            <div className="form-row">
              <div className="form-group">
                <label className="form-label">Nome do pet *</label>
                <input type="text" className="form-control" value={editForm.nome} onChange={e => setE('nome', e.target.value)} />
              </div>
              <div className="form-group">
                <label className="form-label">Raça *</label>
                <input type="text" className="form-control" value={editForm.raca} onChange={e => setE('raca', e.target.value)} />
              </div>
            </div>
            <div className="form-row-3">
              <div className="form-group">
                <label className="form-label">Porte</label>
                <select className="form-control" value={editForm.porte} onChange={e => setE('porte', e.target.value)}>
                  <option value="pequeno">Pequeno</option>
                  <option value="medio">Médio</option>
                  <option value="grande">Grande</option>
                </select>
              </div>
              <div className="form-group">
                <label className="form-label">Peso (kg)</label>
                <input type="number" className="form-control" value={editForm.peso} onChange={e => setE('peso', e.target.value)} placeholder="0" />
              </div>
              <div className="form-group">
                <label className="form-label">Sexo</label>
                <select className="form-control" value={editForm.sexo} onChange={e => setE('sexo', e.target.value)}>
                  <option value="macho">Macho</option>
                  <option value="femea">Fêmea</option>
                </select>
              </div>
            </div>
            <div className="form-row">
              <div className="form-group">
                <label className="form-label">Castrado(a)</label>
                <select className="form-control" value={editForm.castrado ? 'sim' : 'nao'} onChange={e => setE('castrado', e.target.value === 'sim')}>
                  <option value="sim">Sim</option>
                  <option value="nao">Não</option>
                </select>
              </div>
              <div className="form-group">
                <label className="form-label">Vacinas em dia</label>
                <select className="form-control" value={editForm.vacinas_ok ? 'sim' : 'nao'} onChange={e => setE('vacinas_ok', e.target.value === 'sim')}>
                  <option value="sim">Sim</option>
                  <option value="nao">Não</option>
                </select>
              </div>
            </div>
            <div className="form-row">
              <div className="form-group">
                <label className="form-label">Pelagem</label>
                <input type="text" className="form-control" value={editForm.pelagem} onChange={e => setE('pelagem', e.target.value)} placeholder="Curta, longa, crespa..." />
              </div>
              <div className="form-group">
                <label className="form-label">Nascimento</label>
                <input type="date" className="form-control" value={editForm.nascimento} onChange={e => setE('nascimento', e.target.value)} />
              </div>
            </div>
            <div className="form-group">
              <label className="form-label">Medicamento</label>
              <input type="text" className="form-control" value={editForm.medicamento} onChange={e => setE('medicamento', e.target.value)} placeholder="Nome, dose e horário (ou deixe vazio)" />
            </div>
            <div className="form-group">
              <label className="form-label">Observações</label>
              <textarea className="form-control" value={editForm.observacoes} onChange={e => setE('observacoes', e.target.value)} rows={3} placeholder="Comportamento, restrições, alergias..." />
            </div>
            <div className="modal-footer">
              <button className="btn btn-ghost" onClick={() => setEditando(false)}>Cancelar</button>
              <button className="btn btn-primary" onClick={salvarEdicao} disabled={editSaving}>
                {editSaving ? 'Salvando...' : '💾 Salvar Alterações'}
              </button>
            </div>
          </div>
        </div>
      )}

      {/* Modal novo pet */}
      {modalOpen && (
        <div className="modal-overlay open">
          <div className="modal modal-lg">
            <div className="modal-header">
              <div className="modal-title">🐶 Novo Pet</div>
              <button className="modal-close" onClick={() => { setModalOpen(false); fecharNovoTutor() }}>✕</button>
            </div>
            {error && <div className="alert alert-danger"><span>⚠️</span>{error}</div>}

            {/* Campo tutor com link de cadastro */}
            <div className="form-group">
              <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', marginBottom: 6 }}>
                <label className="form-label" style={{ marginBottom: 0 }}>Tutor *</label>
                {!novoTutorOpen && (
                  <button
                    type="button"
                    className="btn btn-sm btn-ghost"
                    style={{ fontSize: 12, color: 'var(--caramelo)', padding: '2px 8px' }}
                    onClick={abrirNovoTutor}
                  >
                    + Cadastrar novo tutor
                  </button>
                )}
              </div>
              <select
                className="form-control"
                value={form.tutor_id}
                onChange={e => set('tutor_id', e.target.value)}
              >
                <option value="">Selecionar tutor...</option>
                {tutores.map(t => <option key={t.id} value={t.id}>{t.nome}</option>)}
              </select>
            </div>

            {/* Painel inline de novo tutor */}
            {novoTutorOpen && (
              <div style={{
                background: 'var(--grafite-600)',
                border: '1px solid var(--caramelo)',
                borderRadius: 8,
                padding: '14px 16px',
                marginBottom: 16,
              }}>
                <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', marginBottom: 12 }}>
                  <div style={{ fontWeight: 600, fontSize: '0.85rem', color: 'var(--caramelo)' }}>
                    👥 Novo Tutor
                  </div>
                  <button
                    type="button"
                    className="btn btn-sm btn-ghost"
                    style={{ padding: '2px 8px', fontSize: 12 }}
                    onClick={fecharNovoTutor}
                  >
                    ✕ Cancelar
                  </button>
                </div>

                {ntError && (
                  <div className="alert alert-danger" style={{ marginBottom: 10, padding: '6px 10px', fontSize: 13 }}>
                    <span>⚠️</span>{ntError}
                  </div>
                )}

                <div className="form-row">
                  <div className="form-group" style={{ marginBottom: 8 }}>
                    <label className="form-label" style={{ fontSize: 12 }}>Nome completo *</label>
                    <input
                      type="text"
                      className="form-control"
                      placeholder="Nome do tutor"
                      value={ntNome}
                      onChange={e => setNtNome(e.target.value)}
                      autoFocus
                    />
                  </div>
                  <div className="form-group" style={{ marginBottom: 8 }}>
                    <label className="form-label" style={{ fontSize: 12 }}>WhatsApp *</label>
                    <input
                      type="text"
                      className="form-control"
                      placeholder="(67) 99999-9999"
                      value={ntWpp}
                      onChange={e => setNtWpp(e.target.value)}
                    />
                  </div>
                </div>
                <div className="form-group" style={{ marginBottom: 10 }}>
                  <label className="form-label" style={{ fontSize: 12 }}>Endereço</label>
                  <input
                    type="text"
                    className="form-control"
                    placeholder="Rua, número, bairro (opcional)"
                    value={ntEndereco}
                    onChange={e => setNtEndereco(e.target.value)}
                  />
                </div>

                <button
                  type="button"
                  className="btn btn-primary btn-sm"
                  style={{ width: '100%', justifyContent: 'center' }}
                  onClick={salvarTutor}
                  disabled={ntSaving}
                >
                  {ntSaving ? 'Salvando...' : '💾 Criar tutor e selecionar'}
                </button>
              </div>
            )}

            <div className="form-row">
              <div className="form-group">
                <label className="form-label">Nome do pet *</label>
                <input type="text" className="form-control" value={form.nome} onChange={e => set('nome', e.target.value)} />
              </div>
              <div className="form-group">
                <label className="form-label">Raça *</label>
                <input type="text" className="form-control" value={form.raca} onChange={e => set('raca', e.target.value)} />
              </div>
            </div>
            <div className="form-row-3">
              <div className="form-group">
                <label className="form-label">Porte</label>
                <select className="form-control" value={form.porte} onChange={e => set('porte', e.target.value)}>
                  <option value="pequeno">Pequeno</option>
                  <option value="medio">Médio</option>
                  <option value="grande">Grande</option>
                </select>
              </div>
              <div className="form-group">
                <label className="form-label">Peso (kg)</label>
                <input type="number" className="form-control" value={form.peso} onChange={e => set('peso', e.target.value)} placeholder="0" />
              </div>
              <div className="form-group">
                <label className="form-label">Sexo</label>
                <select className="form-control" value={form.sexo} onChange={e => set('sexo', e.target.value)}>
                  <option value="macho">Macho</option>
                  <option value="femea">Fêmea</option>
                </select>
              </div>
            </div>
            <div className="form-row">
              <div className="form-group">
                <label className="form-label">Castrado(a)</label>
                <select className="form-control" value={form.castrado ? 'sim' : 'nao'} onChange={e => set('castrado', e.target.value === 'sim')}>
                  <option value="sim">Sim</option>
                  <option value="nao">Não</option>
                </select>
              </div>
              <div className="form-group">
                <label className="form-label">Vacinas em dia</label>
                <select className="form-control" value={form.vacinas_ok ? 'sim' : 'nao'} onChange={e => set('vacinas_ok', e.target.value === 'sim')}>
                  <option value="sim">Sim</option>
                  <option value="nao">Não</option>
                </select>
              </div>
            </div>
            <div className="form-group">
              <label className="form-label">Medicamento</label>
              <input type="text" className="form-control" value={form.medicamento} onChange={e => set('medicamento', e.target.value)} placeholder="Nome, dose e horário (ou deixe vazio)" />
            </div>
            <div className="form-group">
              <label className="form-label">Observações</label>
              <textarea className="form-control" value={form.observacoes} onChange={e => set('observacoes', e.target.value)} rows={3} placeholder="Comportamento, restrições, alergias..." />
            </div>
            <div className="modal-footer">
              <button className="btn btn-ghost" onClick={() => { setModalOpen(false); fecharNovoTutor() }}>Cancelar</button>
              <button className="btn btn-primary" onClick={salvar} disabled={saving}>{saving ? 'Salvando...' : '💾 Salvar Pet'}</button>
            </div>
          </div>
        </div>
      )}
    </>
  )
}

function PetInfo({ label, value }: { label: string; value: string }) {
  return (
    <div>
      <div style={{ fontSize: '0.75rem', color: 'var(--muted)', marginBottom: 2 }}>{label}</div>
      <div style={{ fontWeight: 500 }}>{value}</div>
    </div>
  )
}
