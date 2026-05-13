'use client'

import { useState } from 'react'
import Image from 'next/image'
import Link from 'next/link'
import Sidebar from './Sidebar'
import type { Perfil } from '@/types'

export default function AppShell({ children, role }: { children: React.ReactNode; role: Perfil }) {
  const [sidebarOpen, setSidebarOpen] = useState(false)

  return (
    <>
      <div
        className={`overlay ${sidebarOpen ? 'open' : ''}`}
        onClick={() => setSidebarOpen(false)}
      />

      <nav className="topbar">
        <button className="hamburger" onClick={() => setSidebarOpen(o => !o)}>
          <span /><span /><span />
        </button>
        <Link href="/dashboard" className="topbar-logo" style={{ display: 'flex', alignItems: 'center', textDecoration: 'none' }}>
          <Image src="/logo.svg" alt="Cãoramelo" height={36} width={36} style={{ objectFit: 'contain' }} priority unoptimized />
        </Link>
        <div style={{ fontSize: 11, color: 'var(--grafite-200)' }}>{role}</div>
      </nav>

      <Sidebar
        perfil={role}
        isOpen={sidebarOpen}
        onClose={() => setSidebarOpen(false)}
      />

      <main className="main fade-in">
        {children}
      </main>
    </>
  )
}
