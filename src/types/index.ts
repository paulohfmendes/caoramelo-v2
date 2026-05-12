export type Perfil = 'atendente' | 'monitor' | 'gestor'

export interface User {
  id: string
  name: string
  role: Perfil
}

export interface Tutor {
  id: string
  nome: string
  whatsapp: string
  endereco?: string
  created_at: string
}

export interface Pet {
  id: string
  tutor_id: string
  tutor_nome?: string
  nome: string
  raca: string
  porte?: 'pequeno' | 'medio' | 'grande' | null
  peso?: number | null
  sexo?: 'macho' | 'femea' | null
  castrado: boolean
  vacinas_ok: boolean
  nascimento?: string | null
  pelagem?: string | null
  medicamento?: string | null
  observacoes?: string | null
  created_at: string
}

export type ServicoTipo = 'hotel' | 'creche' | 'banho' | 'transporte'

export type AgendamentoStatus =
  | 'agendado' | 'ativo' | 'concluido' | 'cancelado'

export type BanhoStatus =
  | 'agendado' | 'chegou' | 'em_banho' | 'em_tosa' | 'pronto' | 'retirado'

export interface Agendamento {
  id: string
  pet_id: string
  pet_nome?: string
  tutor_nome?: string
  servico: ServicoTipo
  status: AgendamentoStatus
  banho_status?: BanhoStatus
  data_inicio: string
  data_fim?: string
  hora?: string
  plano_creche?: string
  taxi_pet?: boolean
  origem?: string
  destino?: string
  valor?: number
  observacoes?: string
  created_at: string
}

export interface Pagamento {
  id: string
  agendamento_id: string
  pet_nome?: string
  tutor_nome?: string
  servico: ServicoTipo
  valor: number
  forma: 'pix' | 'dinheiro' | 'cartao'
  data: string
}

export interface ChecklistRegistro {
  id: string
  data: string
  tipo: 'creche_manha' | 'creche_tarde' | 'hospedagem'
  itens: Record<string, boolean>
  intercorrencias?: string
  created_by: string
}
