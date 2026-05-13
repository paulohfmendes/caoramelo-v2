export const BANHO_STATUS = ['agendado', 'chegou', 'em_atendimento', 'pronto'] as const
export const AGENDAMENTO_STATUS = ['agendado', 'ativo', 'concluido', 'cancelado'] as const
export const SERVICO_TIPOS = ['hotel', 'creche', 'banho', 'transporte'] as const
export const FORMA_PAGAMENTO = ['pix', 'dinheiro', 'cartao'] as const
export const PORTE_OPCOES = ['pequeno', 'medio', 'grande'] as const
export const SEXO_OPCOES = ['macho', 'femea'] as const
export const PERFIL_ROLES = ['atendente', 'monitor', 'gestor'] as const

export type BanhoStatusConst = typeof BANHO_STATUS[number]
export type AgendamentoStatusConst = typeof AGENDAMENTO_STATUS[number]
export type ServicoTipoConst = typeof SERVICO_TIPOS[number]
export type FormaPagamentoConst = typeof FORMA_PAGAMENTO[number]
export type PorteConst = typeof PORTE_OPCOES[number]
export type SexoConst = typeof SEXO_OPCOES[number]
export type PerfilRoleConst = typeof PERFIL_ROLES[number]
