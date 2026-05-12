'use client'

import { useState } from 'react'
import Sidebar from './Sidebar'
import type { Perfil } from '@/types'

export default function AppShell({ children, role }: { children: React.ReactNode; role: Perfil }) {
  const [perfil, setPerfil] = useState<Perfil>(role)
  const [sidebarOpen, setSidebarOpen] = useState(false)

  return (
    <>
      <div
        className={`overlay ${sidebarOpen ? 'open' : ''}`}
        onClick={() => setSidebarOpen(false)}
      />

      <nav className="topbar" style={{ display: undefined }}>
        <button className="hamburger" onClick={() => setSidebarOpen(o => !o)}>
          <span /><span /><span />
        </button>
        <div className="topbar-logo">🐾 Cãoramelo</div>
        <div style={{ fontSize: 11, color: 'var(--grafite-200)' }}>{perfil}</div>
      </nav>

      <Sidebar
        perfil={perfil}
        onPerfilChange={p => { setPerfil(p); setSidebarOpen(false) }}
        isOpen={sidebarOpen}
      />

      <main className="main fade-in">
        {children}
      </main>
    </>
  )
}
