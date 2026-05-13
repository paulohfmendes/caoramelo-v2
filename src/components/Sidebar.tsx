'use client'

import { useState } from 'react'
import Image from 'next/image'
import Link from 'next/link'
import { usePathname, useRouter } from 'next/navigation'
import type { Perfil } from '@/types'
import ModalTrocarSenha from './ModalTrocarSenha'

interface SidebarProps {
  perfil: Perfil
  onClose: () => void
  isOpen?: boolean
}

const perfilNome: Record<Perfil, string> = {
  atendente: '👩‍💼 Atendente',
  monitor: '🔍 Monitor',
  gestor: '📊 Gestor / Sócio',
}

export default function Sidebar({ perfil, onClose, isOpen }: SidebarProps) {
  const path = usePathname()
  const router = useRouter()
  const nav = (href: string) => path === href ? 'nav-item active' : 'nav-item'
  const [showTrocarSenha, setShowTrocarSenha] = useState(false)

  async function handleLogout() {
    await fetch('/api/auth/logout', { method: 'POST' })
    router.push('/login')
    router.refresh()
  }

  function handleNav() {
    onClose()
  }

  return (
    <aside className={`sidebar ${isOpen ? 'open' : ''}`}>
      <Link href="/dashboard" onClick={handleNav} className="sidebar-logo" style={{ textDecoration: 'none', cursor: 'pointer' }}>
        <Image
          src="/logo.png"
          alt="Cãoramelo"
          width={52}
          height={52}
          style={{ objectFit: 'contain', flexShrink: 0 }}
          priority
        />
        <div>
          <div className="logo-mark">Cãoramelo</div>
          <div className="logo-sub">Sistema de Gestão</div>
        </div>
      </Link>

      <div className="perfil-area">
        <div className="perfil-label">Perfil ativo</div>
        <div className="perfil-badge">
          <div className="perfil-badge-dot" />
          <div className="perfil-badge-nome">{perfilNome[perfil]}</div>
        </div>
      </div>

      <div className="nav-section">
        <div className="nav-section-label">Operação</div>
        <Link href="/dashboard" className={nav('/dashboard')} onClick={handleNav}>
          <span className="nav-icon">📊</span> Dashboard
        </Link>
        <Link href="/agendamentos" className={nav('/agendamentos')} onClick={handleNav}>
          <span className="nav-icon">📅</span> Agendamentos
        </Link>
        <Link href="/banho-tosa" className={nav('/banho-tosa')} onClick={handleNav}>
          <span className="nav-icon">🛁</span> Banho e Tosa
        </Link>
        {perfil !== 'atendente' && (
          <Link href="/monitor" className={nav('/monitor')} onClick={handleNav}>
            <span className="nav-icon">🔍</span> Monitor
          </Link>
        )}
        <Link href="/transporte" className={nav('/transporte')} onClick={handleNav}>
          <span className="nav-icon">🚗</span> Transporte
        </Link>
      </div>

      <div className="nav-divider" />

      <div className="nav-section">
        <div className="nav-section-label">Cadastros</div>
        <Link href="/tutores" className={nav('/tutores')} onClick={handleNav}>
          <span className="nav-icon">👥</span> Tutores
        </Link>
        <Link href="/pets" className={nav('/pets')} onClick={handleNav}>
          <span className="nav-icon">🐶</span> Pets
        </Link>
        <Link href="/servicos" className={nav('/servicos')} onClick={handleNav}>
          <span className="nav-icon">💰</span> Tabela de Serviços
        </Link>
      </div>

      {perfil === 'gestor' && (
        <>
          <div className="nav-divider" />
          <div className="nav-section">
            <div className="nav-section-label">Gestão</div>
            <Link href="/financeiro" className={nav('/financeiro')} onClick={handleNav}>
              <span className="nav-icon">💰</span> Financeiro
            </Link>
            <Link href="/relatorios" className={nav('/relatorios')} onClick={handleNav}>
              <span className="nav-icon">📈</span> Relatórios
            </Link>
          </div>
        </>
      )}

      <div className="sidebar-footer">
        <div className="sidebar-footer-info">
          <strong>Campo Grande · MS</strong><br />(67) 99641-0273
        </div>
        <div style={{ display: 'flex', flexDirection: 'column', gap: 6, marginTop: 12 }}>
          <button
            className="btn btn-ghost"
            style={{ width: '100%', justifyContent: 'center', fontSize: 13 }}
            onClick={() => setShowTrocarSenha(true)}
          >
            🔑 Trocar Senha
          </button>
          <button
            className="btn btn-ghost"
            style={{ width: '100%', justifyContent: 'center', fontSize: 13, color: 'var(--vermelho)' }}
            onClick={handleLogout}
          >
            🚪 Sair
          </button>
        </div>
      </div>

      {showTrocarSenha && (
        <ModalTrocarSenha perfil={perfil} onClose={() => setShowTrocarSenha(false)} />
      )}
    </aside>
  )
}
