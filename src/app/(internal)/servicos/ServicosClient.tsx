'use client'

import { useState } from 'react'

interface TabelaServico {
  id: string
  chave: string
  servico: string
  nome: string
  valor: number
  ativo: boolean
}

const SERVICO_LABEL: Record<string, string> = {
  creche: '🏫 Creche',
  hotel: '🏨 Hotel',
  banho: '🛁 Banho e Tosa',
  transporte: '🚗 Transporte',
}

export default function ServicosClient({ servicos: inicial, isGestor }: { servicos: TabelaServico[]; isGestor: boolean }) {
  const [servicos, setServicos] = useState(inicial)
  const [editando, setEditando] = useState<Record<string, string>>({})
  const [saving, setSaving] = useState<string | null>(null)
  const [apagando, setApagando] = useState<string | null>(null)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')

  const grupos = ['creche', 'hotel', 'banho', 'transporte']

  function onChange(id: string, val: string) {
    setEditando(prev => ({ ...prev, [id]: val }))
  }

  async function salvar(s: TabelaServico) {
    const novoValor = editando[s.id]
    if (novoValor === undefined) return
    setSaving(s.id)
    setError('')
    setSuccess('')
    const res = await fetch(`/api/servicos/${s.id}`, {
      method: 'PUT',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ valor: parseFloat(novoValor) }),
    })
    if (!res.ok) {
      const d = await res.json().catch(() => ({}))
      setError(d.error ?? 'Erro ao salvar')
    } else {
      const updated: TabelaServico = await res.json()
      setServicos(prev => prev.map(x => x.id === updated.id ? updated : x))
      const { [s.id]: _, ...rest } = editando
      setEditando(rest)
      setSuccess(`"${updated.nome}" atualizado para R$ ${Number(updated.valor).toFixed(2).replace('.', ',')}`)
      setTimeout(() => setSuccess(''), 3000)
    }
    setSaving(null)
  }

  function valorDisplay(s: TabelaServico) {
    return editando[s.id] !== undefined ? editando[s.id] : String(s.valor)
  }

  async function apagarServico(s: TabelaServico) {
    if (!confirm(`Apagar "${s.nome}" da tabela de serviços? Esta ação não pode ser desfeita.`)) return
    setApagando(s.id)
    setError('')
    const res = await fetch(`/api/servicos/${s.id}`, { method: 'DELETE' })
    if (res.ok) {
      setServicos(prev => prev.filter(x => x.id !== s.id))
      setSuccess(`"${s.nome}" removido da tabela.`)
      setTimeout(() => setSuccess(''), 3000)
    } else {
      const d = await res.json().catch(() => ({}))
      setError(d.error ?? 'Erro ao apagar')
    }
    setApagando(null)
  }

  return (
    <>
      <div className="page-header">
        <div>
          <div className="page-title">Tabela de Serviços 💰</div>
          <div className="page-subtitle">Preços base usados no agendamento</div>
        </div>
      </div>

      {error && <div className="alert alert-danger" style={{ marginBottom: 14 }}><span>⚠️</span>{error}</div>}
      {success && <div className="alert alert-success" style={{ marginBottom: 14 }}><span>✅</span>{success}</div>}

      {!isGestor && (
        <div className="alert" style={{ marginBottom: 14, background: 'var(--grafite-600)', color: 'var(--muted)', borderRadius: 8, padding: '10px 14px', fontSize: 13 }}>
          Somente gestores podem alterar os preços.
        </div>
      )}

      {grupos.map(grupo => {
        const itens = servicos.filter(s => s.servico === grupo)
        if (!itens.length) return null
        return (
          <div className="card" key={grupo} style={{ marginBottom: 16 }}>
            <div style={{ fontWeight: 700, fontSize: '0.9rem', color: 'var(--caramelo)', marginBottom: 14, textTransform: 'uppercase', letterSpacing: '0.05em' }}>
              {SERVICO_LABEL[grupo] ?? grupo}
            </div>
            <table className="table">
              <thead>
                <tr>
                  <th>Serviço</th>
                  <th style={{ width: 160 }}>Valor (R$)</th>
                  {isGestor && <th style={{ width: 110 }}></th>}
                </tr>
              </thead>
              <tbody>
                {itens.map(s => {
                  const dirty = editando[s.id] !== undefined && editando[s.id] !== String(s.valor)
                  return (
                    <tr key={s.id}>
                      <td>
                        <div style={{ fontWeight: 500 }}>{s.nome}</div>
                        <div style={{ fontSize: '0.75rem', color: 'var(--muted)' }}>{s.chave}</div>
                      </td>
                      <td>
                        {isGestor ? (
                          <input
                            type="number"
                            className="form-control"
                            style={{ width: 130 }}
                            step="0.01"
                            min="0"
                            value={valorDisplay(s)}
                            onChange={e => onChange(s.id, e.target.value)}
                          />
                        ) : (
                          <span style={{ fontWeight: 600 }}>R$ {Number(s.valor).toFixed(2).replace('.', ',')}</span>
                        )}
                      </td>
                      {isGestor && (
                        <td style={{ display: 'flex', gap: 6, justifyContent: 'flex-end' }}>
                          {dirty && (
                            <button
                              className="btn btn-sm btn-primary"
                              onClick={() => salvar(s)}
                              disabled={saving === s.id}
                            >
                              {saving === s.id ? '...' : '💾'}
                            </button>
                          )}
                          <button
                            className="btn btn-sm btn-ghost"
                            style={{ color: 'var(--vermelho)' }}
                            title="Apagar este serviço"
                            onClick={() => apagarServico(s)}
                            disabled={apagando === s.id}
                          >
                            {apagando === s.id ? '...' : '🗑️'}
                          </button>
                        </td>
                      )}
                    </tr>
                  )
                })}
              </tbody>
            </table>
          </div>
        )
      })}

      <div style={{ fontSize: '0.8rem', color: 'var(--muted)', marginTop: 8 }}>
        Hotel: o valor total é calculado automaticamente (diária × número de noites) no agendamento.<br />
        Banho e Tosa: o preço é sugerido de acordo com o porte do pet selecionado.
      </div>
    </>
  )
}
