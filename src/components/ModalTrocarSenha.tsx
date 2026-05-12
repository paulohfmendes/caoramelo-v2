'use client'

import { useState } from 'react'
import type { Perfil } from '@/types'

interface Props {
  perfil: Perfil
  onClose: () => void
}

const perfilNome: Record<Perfil, string> = {
  atendente: 'Atendente',
  monitor: 'Monitor',
  gestor: 'Gestor',
}

export default function ModalTrocarSenha({ perfil, onClose }: Props) {
  const isGestor = perfil === 'gestor'
  const [roleAlvo, setRoleAlvo] = useState<Perfil>(perfil)
  const [senhaAtual, setSenhaAtual] = useState('')
  const [novaSenha, setNovaSenha] = useState('')
  const [confirmar, setConfirmar] = useState('')
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState(false)

  const trocandoProprioPeril = roleAlvo === perfil

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault()
    setError('')
    if (novaSenha !== confirmar) {
      setError('As senhas não conferem')
      return
    }
    if (novaSenha.length < 4) {
      setError('Nova senha deve ter ao menos 4 caracteres')
      return
    }
    setLoading(true)
    const body: Record<string, string> = { nova_senha: novaSenha }
    if (!trocandoProprioPeril) {
      body.role_alvo = roleAlvo
    } else {
      body.senha_atual = senhaAtual
    }
    const res = await fetch('/api/auth/change-password', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(body),
    })
    const data = await res.json()
    setLoading(false)
    if (!res.ok) {
      setError(data.error ?? 'Erro ao trocar senha')
      return
    }
    setSuccess(true)
  }

  return (
    <div className="modal-overlay open" onClick={onClose}>
      <div className="modal" onClick={e => e.stopPropagation()} style={{ maxWidth: 420 }}>
        <div className="modal-header">
          <div className="modal-title">🔑 Trocar Senha</div>
          <button className="modal-close" onClick={onClose}>✕</button>
        </div>

        {success ? (
          <div className="modal-body" style={{ textAlign: 'center', padding: '32px 24px' }}>
            <div style={{ fontSize: 40, marginBottom: 12 }}>✅</div>
            <div style={{ color: 'var(--branco)', fontWeight: 600, marginBottom: 8 }}>
              Senha alterada com sucesso!
            </div>
            {!trocandoProprioPeril && (
              <div style={{ color: 'var(--grafite-200)', fontSize: 13 }}>
                Senha do perfil <strong>{perfilNome[roleAlvo]}</strong> atualizada.
              </div>
            )}
            <button className="btn btn-primary" style={{ marginTop: 24, width: '100%', justifyContent: 'center' }} onClick={onClose}>
              Fechar
            </button>
          </div>
        ) : (
          <form onSubmit={handleSubmit}>
            <div className="modal-body">
              {isGestor && (
                <div className="form-group">
                  <label className="form-label">Perfil</label>
                  <select className="form-control" value={roleAlvo} onChange={e => { setRoleAlvo(e.target.value as Perfil); setSenhaAtual('') }}>
                    <option value="atendente">👩‍💼 Atendente</option>
                    <option value="monitor">🔍 Monitor</option>
                    <option value="gestor">📊 Gestor</option>
                  </select>
                </div>
              )}

              {trocandoProprioPeril && (
                <div className="form-group">
                  <label className="form-label">Senha atual</label>
                  <input
                    type="password"
                    className="form-control"
                    placeholder="••••••••"
                    value={senhaAtual}
                    onChange={e => setSenhaAtual(e.target.value)}
                    required
                  />
                </div>
              )}

              <div className="form-group">
                <label className="form-label">Nova senha</label>
                <input
                  type="password"
                  className="form-control"
                  placeholder="••••••••"
                  value={novaSenha}
                  onChange={e => setNovaSenha(e.target.value)}
                  required
                />
              </div>

              <div className="form-group">
                <label className="form-label">Confirmar nova senha</label>
                <input
                  type="password"
                  className="form-control"
                  placeholder="••••••••"
                  value={confirmar}
                  onChange={e => setConfirmar(e.target.value)}
                  required
                />
              </div>

              {error && (
                <div className="alert alert-danger">
                  <span>⚠️</span> {error}
                </div>
              )}
            </div>

            <div className="modal-footer">
              <button type="button" className="btn btn-ghost" onClick={onClose}>Cancelar</button>
              <button type="submit" className="btn btn-primary" disabled={loading}>
                {loading ? 'Salvando...' : 'Salvar senha'}
              </button>
            </div>
          </form>
        )}
      </div>
    </div>
  )
}
