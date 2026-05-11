'use client'

import { useState } from 'react'

const CHECKLIST_MANHA = [
  { id: 'cm1', label: 'Recepção e conferência dos pets chegando' },
  { id: 'cm2', label: 'Alimentação da manhã fornecida' },
  { id: 'cm3', label: 'Água disponível e limpa em todos os bebedouros' },
  { id: 'cm4', label: 'Áreas de convívio higienizadas' },
  { id: 'cm5', label: 'Período de socialização realizado' },
  { id: 'cm6', label: 'Pets monitorados durante interação' },
  { id: 'cm7', label: 'Nenhum sinal de briga ou estresse observado' },
  { id: 'cm8', label: 'Necessidades fisiológicas atendidas' },
  { id: 'cm9', label: 'Nenhum pet com sinais de doença ou lesão' },
  { id: 'cm10', label: 'Portões e cercas conferidos' },
]

const CHECKLIST_TARDE = [
  { id: 'ct1', label: 'Alimentação da tarde fornecida' },
  { id: 'ct2', label: 'Água reposta e limpa' },
  { id: 'ct3', label: 'Áreas higienizadas após o almoço' },
  { id: 'ct4', label: 'Período de descanso respeitado' },
  { id: 'ct5', label: 'Pets conferidos antes da retirada' },
  { id: 'ct6', label: 'Tutores avisados sobre horário de retirada' },
  { id: 'ct7', label: 'Nenhum sinal de doença ou lesão observado' },
  { id: 'ct8', label: 'Ambiente limpo e organizado ao final' },
]

export default function MonitorPage() {
  const [aba, setAba] = useState<'creche' | 'hospedagem'>('creche')
  const [turno, setTurno] = useState<'manha' | 'tarde'>('manha')
  const [checkedM, setCheckedM] = useState<Record<string, boolean>>({})
  const [checkedT, setCheckedT] = useState<Record<string, boolean>>({})
  const [obsM, setObsM] = useState('')
  const [obsT, setObsT] = useState('')
  const [hospObs, setHospObs] = useState('')
  const [hospData, setHospData] = useState(new Date().toISOString().split('T')[0])
  const [saving, setSaving] = useState(false)
  const [saved, setSaved] = useState(false)

  const lista = turno === 'manha' ? CHECKLIST_MANHA : CHECKLIST_TARDE
  const checked = turno === 'manha' ? checkedM : checkedT
  const setChecked = turno === 'manha' ? setCheckedM : setCheckedT
  const total = lista.length
  const done = Object.values(checked).filter(Boolean).length

  async function salvar() {
    setSaving(true)
    await fetch('/api/checklist', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        tipo: aba === 'creche' ? `creche_${turno}` : 'hospedagem',
        itens: aba === 'creche' ? checked : {},
        intercorrencias: aba === 'creche' ? (turno === 'manha' ? obsM : obsT) : hospObs,
        data: hospData,
      }),
    })
    setSaving(false)
    setSaved(true)
    setTimeout(() => setSaved(false), 3000)
  }

  return (
    <>
      <div className="page-header">
        <div>
          <div className="page-title">Monitor 🔍</div>
          <div className="page-subtitle">Checklists diários · Creche e Hospedagem</div>
        </div>
        <div className="page-actions">
          <button className="btn btn-secondary" onClick={salvar} disabled={saving}>
            {saving ? 'Salvando...' : '📋 Salvar Registros'}
          </button>
        </div>
      </div>

      {saved && <div className="alert alert-success" style={{ marginBottom: 16 }}><span>✅</span> Registro salvo com sucesso!</div>}

      <div className="tabs">
        <button className={`tab ${aba === 'creche' ? 'active' : ''}`} onClick={() => setAba('creche')}>🏫 Creche</button>
        <button className={`tab ${aba === 'hospedagem' ? 'active' : ''}`} onClick={() => setAba('hospedagem')}>🏨 Hospedagem</button>
      </div>

      {aba === 'creche' && (
        <>
          <div className="tabs">
            <button className={`tab ${turno === 'manha' ? 'active' : ''}`} onClick={() => setTurno('manha')}>🌅 Manhã</button>
            <button className={`tab ${turno === 'tarde' ? 'active' : ''}`} onClick={() => setTurno('tarde')}>🌆 Tarde</button>
          </div>
          <div className="card">
            <div className="card-title">
              <span className="card-title-icon">✅</span>
              Checklist — Creche {turno === 'manha' ? 'Manhã' : 'Tarde'}
            </div>
            {lista.map(item => (
              <div key={item.id} className="checklist-item">
                <input
                  type="checkbox"
                  id={item.id}
                  checked={!!checked[item.id]}
                  onChange={e => setChecked(prev => ({ ...prev, [item.id]: e.target.checked }))}
                />
                <label className={`checklist-label ${checked[item.id] ? 'done' : ''}`} htmlFor={item.id}>
                  {item.label}
                </label>
              </div>
            ))}

            <div style={{ margin: '16px 0 6px' }}>
              <div style={{ display: 'flex', justifyContent: 'space-between', fontSize: 11, color: 'var(--grafite-200)', marginBottom: 6 }}>
                <span>Progresso</span>
                <span>{done} de {total} itens</span>
              </div>
              <div style={{ background: 'var(--grafite-500)', borderRadius: 8, height: 6, overflow: 'hidden' }}>
                <div style={{ background: 'var(--verde)', height: '100%', width: `${(done / total) * 100}%`, borderRadius: 8, transition: 'width .3s' }} />
              </div>
            </div>

            <div className="section-title" style={{ marginTop: 16 }}>Intercorrências</div>
            <textarea
              className="form-control"
              placeholder="Registre qualquer ocorrência..."
              rows={3}
              value={turno === 'manha' ? obsM : obsT}
              onChange={e => turno === 'manha' ? setObsM(e.target.value) : setObsT(e.target.value)}
            />
          </div>
        </>
      )}

      {aba === 'hospedagem' && (
        <div className="card">
          <div className="card-title"><span className="card-title-icon">🏨</span> Registro de Hospedagem</div>
          <div className="alert alert-info" style={{ marginBottom: 20 }}>
            <span>ℹ️</span>
            <div>Registre as ocorrências dos pets hospedados. Um registro por dia é suficiente.</div>
          </div>
          <div className="form-group">
            <label className="form-label">Data do registro *</label>
            <input type="date" className="form-control" style={{ maxWidth: 240 }} value={hospData} onChange={e => setHospData(e.target.value)} />
          </div>
          <div className="form-group">
            <label className="form-label">Observações do dia</label>
            <textarea
              className="form-control"
              placeholder="Comportamento geral, intercorrências, medicamentos administrados, alimentação..."
              rows={6}
              value={hospObs}
              onChange={e => setHospObs(e.target.value)}
            />
          </div>
          <button className="btn btn-primary" onClick={salvar} disabled={saving}>
            {saving ? 'Salvando...' : '💾 Salvar Registro'}
          </button>
        </div>
      )}
    </>
  )
}
