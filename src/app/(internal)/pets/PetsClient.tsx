'use client'

import { useState } from 'react'
import type { Pet } from '@/types'

interface Props {
  pets: Pet[]
  tutores: { id: string; nome: string }[]
}

export default function PetsClient({ pets, tutores }: Props) {
  const [busca, setBusca] = useState('')
  const [modalOpen, setModalOpen] = useState(false)
  const [saving, setSaving] = useState(false)
  const [error, setError] = useState('')
  const [form, setForm] = useState({
    tutor_id: '', nome: '', raca: '', porte: 'medio', peso: '',
    sexo: 'macho', castrado: false, vacinas_ok: true,
    medicamento: '', observacoes: '',
  })

  const lista = pets.filter(p =>
    busca === '' ||
    p.nome.toLowerCase().includes(busca.toLowerCase()) ||
    p.raca.toLowerCase().includes(busca.toLowerCase()) ||
    p.tutor_nome?.toLowerCase().includes(busca.toLowerCase())
  )

  function set(k: string, v: unknown) { setForm(f => ({ ...f, [k]: v })) }

  async function salvar() {
    if (!form.tutor_id || !form.nome || !form.raca) { setError('Preencha os campos obrigatórios'); return }
    setSaving(true)
    const res = await fetch('/api/pets', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ ...form, peso: form.peso ? Number(form.peso) : null }),
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
              <div className="pet-raca">{p.raca} · {p.porte} · {p.peso ? `${p.peso}kg · ` : ''}{p.sexo === 'macho' ? 'Macho' : 'Fêmea'} · {p.castrado ? 'Castrado(a)' : 'Não castrado(a)'}</div>
              <div className="pet-raca">Tutor: {p.tutor_nome}</div>
              <div className="pet-badges">
                {p.medicamento && <span className="badge badge-med">💊 Medicamento</span>}
                {p.vacinas_ok ? <span className="badge badge-ok">✅ Vacinas em dia</span> : <span className="badge badge-erro">⚠️ Vacina pendente</span>}
                {p.sexo === 'femea' && !p.castrado && <span className="badge badge-cio">🌸 Fêmea não castrada</span>}
              </div>
            </div>
            <button className="btn btn-sm btn-ghost">Ver</button>
          </div>
        ))
      )}

      {modalOpen && (
        <div className="modal-overlay open">
          <div className="modal modal-lg">
            <div className="modal-header">
              <div className="modal-title">🐶 Novo Pet</div>
              <button className="modal-close" onClick={() => setModalOpen(false)}>✕</button>
            </div>
            {error && <div className="alert alert-danger"><span>⚠️</span>{error}</div>}

            <div className="form-group">
              <label className="form-label">Tutor *</label>
              <select className="form-control" value={form.tutor_id} onChange={e => set('tutor_id', e.target.value)}>
                <option value="">Selecionar tutor...</option>
                {tutores.map(t => <option key={t.id} value={t.id}>{t.nome}</option>)}
              </select>
            </div>
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
              <button className="btn btn-ghost" onClick={() => setModalOpen(false)}>Cancelar</button>
              <button className="btn btn-primary" onClick={salvar} disabled={saving}>{saving ? 'Salvando...' : '💾 Salvar'}</button>
            </div>
          </div>
        </div>
      )}
    </>
  )
}
