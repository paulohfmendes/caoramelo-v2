import { query } from '@/lib/db'
import { getSession } from '@/lib/auth'
import { redirect } from 'next/navigation'
import ServicosClient from './ServicosClient'

export default async function ServicosPage() {
  const user = await getSession()
  if (!user) redirect('/login')

  const servicos = await query(`SELECT * FROM tabela_servicos ORDER BY servico, chave`).catch(() => [])
  return <ServicosClient servicos={servicos as TabelaServico[]} isGestor={user.role === 'gestor'} />
}

interface TabelaServico {
  id: string
  chave: string
  servico: string
  nome: string
  valor: number
  ativo: boolean
}
