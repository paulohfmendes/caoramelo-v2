'use client'

import { useState } from 'react'

interface Props {
  pets: { id: string; nome: string; tutor_nome: string }[]
  onClose: () => void
  onSaved: () => void
  somenteLeitura?: boolean
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
  const [obs, setObs] = useState('')
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState('')

  async function handleSave() {
    if (!servico || !petId || !dataInicio) { setError('Preencha os campos obrigatórios'); return }
    setLoading(true)
    const res = await fetch('/api/agendamentos', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ servico, pet_id: petId, data_inicio: dataInicio, data_fim: dataFim || null, hora: hora || null, plano_creche: plano, taxi_pet: taxiPet, origem, destino, valor: valor ? Number(valor) : null, observacoes: obs }),
    })
    if (!res.ok) { const d = await res.json(); setError(d.error ?? 'Erro'); setLoading(false); return }
    onSaved()
  }

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
            <div className="form-group">
              <label className="form-label">Valor (R$)</label>
              <input type="number" className="form-control" placeholder="0,00" value={valor} onChange={e => setValor(e.target.value)} />
            </div>
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
                  <option value="avulso">Avulso / Day Use — R$40</option>
                  <option value="1x">1x por semana — R$150</option>
                  <option value="2x">2x por semana — R$300</option>
                  <option value="3x">3x por semana — R$420</option>
                  <option value="4x">4x por semana — R$560</option>
                  <option value="5x">5x por semana — R$700</option>
                </select>
              </div>
              <div className="form-group">
                <label className="form-label">Táxi Pet</label>
                <select className="form-control" value={taxiPet ? 'sim' : 'nao'} onChange={e => setTaxiPet(e.target.value === 'sim')}>
                  <option value="nao">Não</option>
                  <option value="sim">Sim (até 10km)</option>
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
            <div className="form-group">
              <label className="form-label">Valor (R$)</label>
              <input type="number" className="form-control" placeholder="0,00" value={valor} onChange={e => setValor(e.target.value)} />
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
            <div className="form-group">
              <label className="form-label">Valor (R$)</label>
              <input type="number" className="form-control" placeholder="0,00" value={valor} onChange={e => setValor(e.target.value)} />
            </div>
          </>
        )}

        {servico && (
          <div className="form-group" style={{ marginTop: 14 }}>
            <label className="form-label">Observações</label>
            <textarea className="form-control" placeholder="Informações adicionais..." value={obs} onChange={e => setObs(e.target.value)} rows={3} />
          </div>
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
