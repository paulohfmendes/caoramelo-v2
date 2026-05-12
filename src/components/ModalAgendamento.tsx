'use client'

import { useState, useEffect } from 'react'

interface PetOpt {
  id: string
  nome: string
  tutor_nome: string
  porte: string | null
}

interface TabelaServico {
  id: string
  chave: string
  servico: string
  valor: number
}

interface Props {
  pets: PetOpt[]
  onClose: () => void
  onSaved: () => void
  somenteLeitura?: boolean
}

function addDays(dateStr: string, days: number): string {
  const d = new Date(dateStr)
  d.setDate(d.getDate() + days)
  return d.toISOString().split('T')[0]
}

function endOfMonth(dateStr: string): string {
  const d = new Date(dateStr)
  d.setMonth(d.getMonth() + 1, 0)
  return d.toISOString().split('T')[0]
}

export default function ModalAgendamento({ pets, onClose, onSaved, somenteLeitura }: Props) {
  const [servico, setServico] = useState('')
  const [petId, setPetId] = useState('')
  const [dataInicio, setDataInicio] = useState('')
  const [dataFim, setDataFim] = useState('')
  const [hora, setHora] = useState('')
  const [plano, setPlano] = useState('avulso')
  const [taxiPet, setTaxiPet] = useState(false)
  const [origem, setOrigem] = useState('')
  const [destino, setDestino] = useState('')
  const [valor, setValor] = useState('')
  const [dataVencimento, setDataVencimento] = useState('')
  const [obs, setObs] = useState('')
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState('')
  const [precos, setPrecos] = useState<Record<string, number>>({})

  useEffect(() => {
    fetch('/api/servicos')
      .then(r => r.json())
      .then((rows: TabelaServico[]) => {
        const map: Record<string, number> = {}
        rows.forEach(r => { map[r.chave] = Number(r.valor) })
        setPrecos(map)
      })
      .catch(() => {})
  }, [])

  // Auto-calcula valor
  useEffect(() => {
    if (!servico || !Object.keys(precos).length) return

    if (servico === 'creche') {
      const chave = `creche_${plano}`
      let v = precos[chave] ?? 0
      if (taxiPet) v += (precos['creche_taxi'] ?? 0)
      setValor(v > 0 ? String(v) : '')
      return
    }
    if (servico === 'hotel' && dataInicio && dataFim) {
      const noites = Math.max(0, Math.round((new Date(dataFim).getTime() - new Date(dataInicio).getTime()) / 86400000))
      const diaria = precos['hotel_diaria'] ?? 0
      setValor(noites > 0 && diaria > 0 ? String(noites * diaria) : '')
      return
    }
    if (servico === 'banho' && petId) {
      const pet = pets.find(p => p.id === petId)
      const porte = pet?.porte ?? 'pequeno'
      const v = precos[`banho_${porte}`] ?? precos['banho_pequeno'] ?? 0
      setValor(v > 0 ? String(v) : '')
      return
    }
    if (servico === 'transporte') {
      const v = precos['transporte_ida'] ?? 0
      setValor(v > 0 ? String(v) : '')
      return
    }
  }, [servico, plano, taxiPet, petId, dataInicio, dataFim, precos, pets])

  // Auto-sugere data de vencimento
  useEffect(() => {
    if (!servico || !dataInicio) return

    if (servico === 'hotel') {
      // Vence no check-out
      if (dataFim) setDataVencimento(dataFim)
      return
    }
    if (servico === 'creche') {
      if (plano === 'avulso') {
        // Avulso: paga no dia
        setDataVencimento(dataInicio)
      } else {
        // Plano mensal: vence no último dia do mês de início
        setDataVencimento(endOfMonth(dataInicio))
      }
      return
    }
    if (servico === 'banho' || servico === 'transporte') {
      // Paga no dia do serviço
      setDataVencimento(dataInicio)
      return
    }
  }, [servico, plano, dataInicio, dataFim])

  async function handleSave() {
    if (!servico || !petId || !dataInicio) { setError('Preencha os campos obrigatórios'); return }
    setLoading(true)
    const res = await fetch('/api/agendamentos', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        servico, pet_id: petId, data_inicio: dataInicio,
        data_fim: dataFim || null, hora: hora || null,
        plano_creche: plano, taxi_pet: taxiPet,
        origem, destino,
        valor: valor ? Number(valor) : null,
        data_vencimento: dataVencimento || null,
        observacoes: obs,
      }),
    })
    if (!res.ok) {
      const text = await res.text()
      let msg = 'Erro ao salvar agendamento'
      try { msg = JSON.parse(text).error ?? msg } catch { /* não era JSON */ }
      setError(msg); setLoading(false); return
    }
    onSaved()
  }

  const noitesHotel = servico === 'hotel' && dataInicio && dataFim
    ? Math.max(0, Math.round((new Date(dataFim).getTime() - new Date(dataInicio).getTime()) / 86400000))
    : 0

  return (
    <div className="modal-overlay open">
      <div className="modal modal-lg">
        <div className="modal-header">
          <div className="modal-title">📅 Novo Agendamento</div>
          <button className="modal-close" onClick={onClose}>✕</button>
        </div>

        {error && <div className="alert alert-danger" style={{ marginBottom: 14 }}><span>⚠️</span>{error}</div>}

        <div className="form-row">
          <div className="form-group">
            <label className="form-label">Serviço *</label>
            <select className="form-control" value={servico} onChange={e => setServico(e.target.value)} disabled={somenteLeitura}>
              <option value="">Selecionar...</option>
              <option value="hotel">🏨 Hotel</option>
              <option value="creche">🏫 Creche</option>
              <option value="banho">🛁 Banho e Tosa</option>
              <option value="transporte">🚗 Transporte</option>
            </select>
          </div>
          <div className="form-group">
            <label className="form-label">Pet *</label>
            <select className="form-control" value={petId} onChange={e => setPetId(e.target.value)} disabled={somenteLeitura}>
              <option value="">Selecionar pet...</option>
              {pets.map(p => (
                <option key={p.id} value={p.id}>🐾 {p.nome} ({p.tutor_nome})</option>
              ))}
            </select>
          </div>
        </div>

        {servico === 'hotel' && (
          <>
            <div className="modal-divider" />
            <div className="modal-section-title">Período de Hospedagem</div>
            <div className="form-row">
              <div className="form-group">
                <label className="form-label">Check-in *</label>
                <input type="date" className="form-control" value={dataInicio} onChange={e => setDataInicio(e.target.value)} />
              </div>
              <div className="form-group">
                <label className="form-label">Check-out *</label>
                <input type="date" className="form-control" value={dataFim} onChange={e => setDataFim(e.target.value)} />
              </div>
            </div>
            {noitesHotel > 0 && (
              <div style={{ fontSize: 12, color: 'var(--muted)', marginBottom: 10 }}>
                {noitesHotel} noite{noitesHotel > 1 ? 's' : ''} × R$ {(precos['hotel_diaria'] ?? 0).toFixed(2).replace('.', ',')}
              </div>
            )}
            <div style={{ background: 'var(--grafite-600)', padding: '10px 13px', borderRadius: 'var(--radius)', fontSize: 12, color: 'var(--grafite-200)' }}>
              Sinal de 30% via PIX — CNPJ 60.910.542/0001-23
            </div>
          </>
        )}

        {servico === 'creche' && (
          <>
            <div className="modal-divider" />
            <div className="modal-section-title">Plano de Creche</div>
            <div className="form-row">
              <div className="form-group">
                <label className="form-label">Tipo de Plano</label>
                <select className="form-control" value={plano} onChange={e => setPlano(e.target.value)}>
                  <option value="avulso">Avulso / Day Use{precos['creche_avulso'] ? ` — R$ ${precos['creche_avulso'].toFixed(2).replace('.', ',')}` : ''}</option>
                  <option value="1x">1x por semana{precos['creche_1x'] ? ` — R$ ${precos['creche_1x'].toFixed(2).replace('.', ',')}` : ''}</option>
                  <option value="2x">2x por semana{precos['creche_2x'] ? ` — R$ ${precos['creche_2x'].toFixed(2).replace('.', ',')}` : ''}</option>
                  <option value="3x">3x por semana{precos['creche_3x'] ? ` — R$ ${precos['creche_3x'].toFixed(2).replace('.', ',')}` : ''}</option>
                  <option value="4x">4x por semana{precos['creche_4x'] ? ` — R$ ${precos['creche_4x'].toFixed(2).replace('.', ',')}` : ''}</option>
                  <option value="5x">5x por semana{precos['creche_5x'] ? ` — R$ ${precos['creche_5x'].toFixed(2).replace('.', ',')}` : ''}</option>
                </select>
              </div>
              <div className="form-group">
                <label className="form-label">Táxi Pet</label>
                <select className="form-control" value={taxiPet ? 'sim' : 'nao'} onChange={e => setTaxiPet(e.target.value === 'sim')}>
                  <option value="nao">Não</option>
                  <option value="sim">Sim{precos['creche_taxi'] ? ` (+R$ ${precos['creche_taxi'].toFixed(2).replace('.', ',')})` : ' (até 10km)'}</option>
                </select>
              </div>
            </div>
            <div className="form-group">
              <label className="form-label">Data de início *</label>
              <input type="date" className="form-control" value={dataInicio} onChange={e => setDataInicio(e.target.value)} />
            </div>
          </>
        )}

        {servico === 'banho' && (
          <>
            <div className="modal-divider" />
            <div className="modal-section-title">Banho e Tosa</div>
            <div className="form-row">
              <div className="form-group">
                <label className="form-label">Data *</label>
                <input type="date" className="form-control" value={dataInicio} onChange={e => setDataInicio(e.target.value)} />
              </div>
              <div className="form-group">
                <label className="form-label">Horário *</label>
                <input type="time" className="form-control" value={hora} onChange={e => setHora(e.target.value)} />
              </div>
            </div>
          </>
        )}

        {servico === 'transporte' && (
          <>
            <div className="modal-divider" />
            <div className="modal-section-title">🚗 Transporte</div>
            <div className="form-row">
              <div className="form-group">
                <label className="form-label">Data *</label>
                <input type="date" className="form-control" value={dataInicio} onChange={e => setDataInicio(e.target.value)} />
              </div>
              <div className="form-group">
                <label className="form-label">Horário *</label>
                <input type="time" className="form-control" value={hora} onChange={e => setHora(e.target.value)} />
              </div>
            </div>
            <div className="form-group">
              <label className="form-label">Endereço de Origem *</label>
              <input type="text" className="form-control" placeholder="Rua, número, bairro" value={origem} onChange={e => setOrigem(e.target.value)} />
            </div>
            <div className="form-group">
              <label className="form-label">Destino *</label>
              <input type="text" className="form-control" placeholder="Destino do transporte" value={destino} onChange={e => setDestino(e.target.value)} />
            </div>
          </>
        )}

        {servico && (
          <>
            <div className="modal-divider" />
            <div className="form-row">
              <div className="form-group">
                <label className="form-label">Valor (R$)</label>
                <input
                  type="number"
                  className="form-control"
                  placeholder="0,00"
                  value={valor}
                  onChange={e => setValor(e.target.value)}
                />
                <div style={{ fontSize: 12, color: 'var(--muted)', marginTop: 4 }}>
                  Pré-calculado pela tabela de serviços — editável
                </div>
              </div>
              <div className="form-group">
                <label className="form-label">Vencimento</label>
                <input
                  type="date"
                  className="form-control"
                  value={dataVencimento}
                  onChange={e => setDataVencimento(e.target.value)}
                />
                <div style={{ fontSize: 12, color: 'var(--muted)', marginTop: 4 }}>
                  {servico === 'hotel' && 'Sugerido: data do check-out'}
                  {servico === 'creche' && plano !== 'avulso' && 'Sugerido: último dia do mês'}
                  {servico === 'creche' && plano === 'avulso' && 'Sugerido: data do serviço'}
                  {(servico === 'banho' || servico === 'transporte') && 'Sugerido: data do serviço'}
                </div>
              </div>
            </div>
            <div className="form-group">
              <label className="form-label">Observações</label>
              <textarea className="form-control" placeholder="Informações adicionais..." value={obs} onChange={e => setObs(e.target.value)} rows={3} />
            </div>
          </>
        )}

        <div className="modal-footer">
          <button className="btn btn-ghost" onClick={onClose}>Cancelar</button>
          {!somenteLeitura && (
            <button className="btn btn-primary" onClick={handleSave} disabled={loading}>
              {loading ? 'Salvando...' : '💾 Salvar Agendamento'}
            </button>
          )}
        </div>
      </div>
    </div>
  )
}
