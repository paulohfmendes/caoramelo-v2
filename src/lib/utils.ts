export function formatCurrency(value: number): string {
  return new Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL' }).format(value)
}

export function formatDate(date: string): string {
  return new Date(date).toLocaleDateString('pt-BR')
}

export function cn(...classes: (string | undefined | false | null)[]): string {
  return classes.filter(Boolean).join(' ')
}

export function servicoLabel(servico: string): string {
  const map: Record<string, string> = {
    hotel: '🏨 Hotel',
    creche: '🏫 Creche',
    banho: '🛁 Banho e Tosa',
    transporte: '🚗 Transporte',
  }
  return map[servico] ?? servico
}

export function banhoStatusLabel(status: string): string {
  const map: Record<string, string> = {
    agendado: 'Agendado',
    chegou: 'Chegou',
    em_banho: 'Em Banho',
    em_tosa: 'Em Tosa',
    pronto: 'Pronto',
    retirado: 'Retirado',
  }
  return map[status] ?? status
}
