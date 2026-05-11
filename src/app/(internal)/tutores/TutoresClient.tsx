'use client'

import { useState } from 'react'
import type { Tutor } from '@/types'

interface TutorRow extends Tutor { total_pets: number }

export default function TutoresClient({ tutores }: { tutores: TutorRow[] }) {
  const [busca, setBusca] = useState('')
  const [modalOpen, setModalOpen] = useState(false)
  const [nome, setNome] = useState('')
  const [whatsapp, setWhatsapp] = useState('')
  const [endereco, setEndereco] = useState('')
  const [saving, setSaving] = useState(false)
  const [error, setError] = useState('')

  const lista = tutores.filter(t =>
    busca === '' ||
    t.nome.toLowerCase().includes(busca.toLowerCase()) ||
    t.whatsapp.includes(busca)
  )

  async function salvar() {
    if (!nome || !whatsapp) { setError('Nome e WhatsApp são obrigatórios'); return }
    setSaving(true)
    const res = await fetch('/api/tutores', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ nome, whatsapp, endereco }),
    })
    if (!res.ok) { const d = await res.json(); setError(d.error ?? 'Erro'); setSaving(false); return }
    window.location.reload()
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

      <div className="card">
        <div style={{ marginBottom: 14 }}>
          <input
            type="text"
            className="form-control"
            placeholder="🔍 Buscar por nome ou WhatsApp..."
            style={{ maxWidth: 360 }}
            value={busca}
            onChange={e => setBusca(e.target.value)}
          />
        </div>

        {lista.length === 0 ? (
          <div className="empty-state"><div className="empty-icon">👥</div><p>Nenhum tutor cadastrado</p></div>
        ) : (
          <table className="table">
            <thead><tr><th>Nome</th><th>WhatsApp</th><th>Endereço</th><th>Pets</th><th></th></tr></thead>
            <tbody>
              {lista.map(t => (
                <tr key={t.id}>
                  <td className="td-nome">{t.nome}</td>
                  <td><a href={`https://wa.me/55${t.whatsapp.replace(/\D/g,'')}`} target="_blank" rel="noreferrer" style={{ color: 'var(--caramelo)' }}>{t.whatsapp}</a></td>
                  <td>{t.endereco ?? '—'}</td>
                  <td><span className="chip">🐾 {t.total_pets} pet(s)</span></td>
                  <td><button className="btn btn-sm btn-ghost">Ver</button></td>
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
