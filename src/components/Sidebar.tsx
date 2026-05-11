'use client'

import Link from 'next/link'
import { usePathname } from 'next/navigation'
import type { Perfil } from '@/types'

interface SidebarProps {
  perfil: Perfil
  onPerfilChange: (p: Perfil) => void
  isOpen?: boolean
}

const perfilNome: Record<Perfil, string> = {
  atendente: 'Atendente',
  monitor: 'Monitor',
  gestor: 'Gestor',
}

export default function Sidebar({ perfil, onPerfilChange, isOpen }: SidebarProps) {
  const path = usePathname()
  const nav = (href: string) => path === href ? 'nav-item active' : 'nav-item'

  return (
    <aside className={`sidebar ${isOpen ? 'open' : ''}`}>
      <div className="sidebar-logo">
        <div className="logo-paw">🐾</div>
        <div>
          <div className="logo-mark">Cãoramelo</div>
          <div className="logo-sub">Sistema de Gestão</div>
        </div>
      </div>

      <div className="perfil-area">
        <div className="perfil-label">Perfil ativo</div>
        <select
          className="form-control"
          value={perfil}
          onChange={e => onPerfilChange(e.target.value as Perfil)}
        >
          <option value="atendente">👩‍💼 Atendente / Recepção</option>
          <option value="monitor">🔍 Monitor</option>
          <option value="gestor">📊 Gestor / Sócio</option>
        </select>
        <div className="perfil-badge" style={{ marginTop: 8 }}>
          <div className="perfil-badge-dot" />
          <div className="perfil-badge-nome">{perfilNome[perfil]}</div>
        </div>
      </div>

      <div className="nav-section">
        <div className="nav-section-label">Operação</div>
        <Link href="/dashboard" className={nav('/dashboard')}>
          <span className="nav-icon">📊</span> Dashboard
        </Link>
        <Link href="/agendamentos" className={nav('/agendamentos')}>
          <span className="nav-icon">📅</span> Agendamentos
        </Link>
        <Link href="/banho-tosa" className={nav('/banho-tosa')}>
          <span className="nav-icon">🛁</span> Banho e Tosa
        </Link>
        {perfil !== 'atendente' && (
          <Link href="/monitor" className={nav('/monitor')}>
            <span className="nav-icon">🔍</span> Monitor
          </Link>
        )}
        <Link href="/transporte" className={nav('/transporte')}>
          <span className="nav-icon">🚗</span> Transporte
        </Link>
      </div>

      <div className="nav-divider" />

      <div className="nav-section">
        <div className="nav-section-label">Cadastros</div>
        <Link href="/tutores" className={nav('/tutores')}>
          <span className="nav-icon">👥</span> Tutores
        </Link>
        <Link href="/pets" className={nav('/pets')}>
          <span className="nav-icon">🐶</span> Pets
        </Link>
      </div>

      {perfil === 'gestor' && (
        <>
          <div className="nav-divider" />
          <div className="nav-section">
            <div className="nav-section-label">Gestão</div>
            <Link href="/financeiro" className={nav('/financeiro')}>
              <span className="nav-icon">💰</span> Financeiro
            </Link>
            <Link href="/relatorios" className={nav('/relatorios')}>
              <span className="nav-icon">📈</span> Relatórios
            </Link>
          </div>
        </>
      )}

      <div className="sidebar-footer">
        <div className="sidebar-footer-info">
          <strong>Campo Grande · MS</strong><br />(67) 99641-0273
        </div>
      </div>
    </aside>
  )
}
