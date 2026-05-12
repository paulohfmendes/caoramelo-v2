'use client'

import { useState } from 'react'
import type { Tutor, Pet } from '@/types'

interface TutorRow extends Tutor { total_pets: number }

interface TutorDetalhe extends Tutor { pets: Pet[] }

const PORTE_LABEL: Record<string, string> = { pequeno: 'Pequeno', medio: 'Médio', grande: 'Grande' }
const SEXO_LABEL: Record<string, string> = { macho: 'Macho', femea: 'Fêmea' }

export default function TutoresClient({ tutores }: { tutores: TutorRow[] }) {
  const [busca, setBusca] = useState('')

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

  const lista = tutores.filter(t =>
    busca === '' ||
    t.nome.toLowerCase().includes(busca.toLowerCase()) ||
    t.whatsapp.includes(busca)
  )

  async function verTutor(id: string) {
    setLoadingDetalhe(true)
    setDetalhe(null)
    const res = await fetch(`/api/tutores/${id}`)
    if (res.ok) setDetalhe(await res.json())
    setLoadingDetalhe(false)
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
                  <td>
                    <button className="btn btn-sm btn-ghost" onClick={() => verTutor(t.id)}>Ver</button>
                  </td>
                </tr>
              ))}
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
              <button className="modal-close" onClick={() => setDetalhe(null)}>✕</button>
            </div>

            {loadingDetalhe && <div style={{ padding: '24px', textAlign: 'center', color: 'var(--muted)' }}>Carregando...</div>}

            {detalhe && (
              <>
                <div style={{ padding: '0 0 16px' }}>
                  <div style={{ display: 'grid', gap: 6 }}>
                    <div><span style={{ color: 'var(--muted)', fontSize: '0.8rem' }}>WhatsApp</span><br />
                      <a href={`https://wa.me/55${detalhe.whatsapp.replace(/\D/g,'')}`} target="_blank" rel="noreferrer" style={{ color: 'var(--caramelo)' }}>{detalhe.whatsapp}</a>
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
                          {p.observacoes && (
                            <div style={{ marginTop: 6, fontSize: '0.8rem', color: 'var(--muted)', fontStyle: 'italic' }}>
                              {p.observacoes}
                            </div>
                          )}
                          {p.medicamento && (
                            <div style={{ marginTop: 4, fontSize: '0.8rem', color: '#f59e0b' }}>
                              💊 {p.medicamento}
                            </div>
                          )}
                        </div>
                      ))}
                    </div>
                  )}
                </div>

                <div className="modal-footer">
                  <button className="btn btn-ghost" onClick={() => setDetalhe(null)}>Fechar</button>
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
