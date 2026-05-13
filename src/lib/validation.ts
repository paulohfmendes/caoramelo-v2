import { z } from 'zod'
import {
  BANHO_STATUS,
  AGENDAMENTO_STATUS,
  SERVICO_TIPOS,
  FORMA_PAGAMENTO,
  PORTE_OPCOES,
  SEXO_OPCOES,
  PERFIL_ROLES,
} from '@/lib/constants'

export const LoginSchema = z.object({
  role: z.enum(PERFIL_ROLES),
  password: z.string().min(1, 'Senha obrigatória'),
})

export const ChangePasswordSchema = z.object({
  role_alvo: z.enum(PERFIL_ROLES).optional(),
  senha_atual: z.string().optional(),
  nova_senha: z.string().min(8, 'Nova senha deve ter ao menos 8 caracteres'),
})

export const AgendamentoCreateSchema = z.object({
  servico: z.enum(SERVICO_TIPOS),
  pet_id: z.string().uuid('pet_id deve ser um UUID válido'),
  data_inicio: z.string().min(1, 'data_inicio obrigatória'),
  data_fim: z.string().optional().nullable(),
  hora: z
    .string()
    .regex(/^\d{2}:\d{2}(:\d{2})?$/, 'hora deve estar no formato HH:MM')
    .optional()
    .nullable(),
  plano_creche: z.string().optional().nullable(),
  taxi_pet: z.boolean().optional().nullable(),
  origem: z.string().max(200).optional().nullable(),
  destino: z.string().max(200).optional().nullable(),
  valor: z.number().nonnegative('Valor não pode ser negativo').optional().nullable(),
  data_vencimento: z.string().optional().nullable(),
  dias_semana: z.string().optional().nullable(),
  observacoes: z.string().max(1000).optional().nullable(),
})

export const AgendamentoPatchSchema = z.object({
  status: z.enum(AGENDAMENTO_STATUS),
})

export const AgendamentoUpdateSchema = z.object({
  valor: z.number().nonnegative().optional().nullable(),
  data_vencimento: z.string().optional().nullable(),
  status: z.enum(AGENDAMENTO_STATUS).optional(),
  observacoes: z.string().max(1000).optional().nullable(),
  dias_semana: z.string().optional().nullable(),
})

export const BanhoStatusSchema = z.object({
  banho_status: z.enum(BANHO_STATUS),
})

export const PagamentoSchema = z.object({
  agendamento_id: z.string().uuid('agendamento_id deve ser um UUID válido'),
  valor: z.number().positive('Valor deve ser maior que zero'),
  forma: z.enum(FORMA_PAGAMENTO),
})

export const TutorSchema = z.object({
  nome: z.string().min(2, 'Nome deve ter ao menos 2 caracteres').max(150),
  whatsapp: z
    .string()
    .transform(v => v.replace(/\D/g, ''))
    .pipe(
      z
        .string()
        .min(10, 'WhatsApp deve ter ao menos 10 dígitos')
        .max(11, 'WhatsApp deve ter no máximo 11 dígitos')
    ),
  endereco: z.string().max(300).optional().nullable(),
})

export const TutorUpdateSchema = TutorSchema.partial()

export const PetSchema = z.object({
  tutor_id: z.string().uuid('tutor_id deve ser um UUID válido'),
  nome: z.string().min(1, 'Nome obrigatório').max(100),
  raca: z.string().min(1, 'Raça obrigatória').max(100),
  porte: z.enum(PORTE_OPCOES).optional().nullable(),
  peso: z.number().nonnegative().optional().nullable(),
  sexo: z.enum(SEXO_OPCOES).optional().nullable(),
  castrado: z.boolean().optional(),
  vacinas_ok: z.boolean().optional(),
  nascimento: z.string().optional().nullable(),
  pelagem: z.string().max(50).optional().nullable(),
  medicamento: z.string().max(500).optional().nullable(),
  observacoes: z.string().max(1000).optional().nullable(),
})

export const PetUpdateSchema = PetSchema.omit({ tutor_id: true }).partial()

export function parseBody<T>(schema: z.ZodType<T>, data: unknown): { data: T } | { error: string; status: 400 } {
  const result = schema.safeParse(data)
  if (!result.success) {
    const msg = result.error.errors.map(e => e.message).join('; ')
    return { error: msg, status: 400 }
  }
  return { data: result.data }
}
