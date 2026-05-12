# Cãoramelo — Documentação Técnica

> Sistema de gestão para hotel de cães. Versão 2 — Next.js full-stack, Railway + PostgreSQL.

---

## Sumário

1. [Visão geral](#1-visão-geral)
2. [Stack e dependências](#2-stack-e-dependências)
3. [Estrutura de diretórios](#3-estrutura-de-diretórios)
4. [Banco de dados](#4-banco-de-dados)
5. [Autenticação e sessão](#5-autenticação-e-sessão)
6. [API Routes](#6-api-routes)
7. [Páginas e componentes](#7-páginas-e-componentes)
8. [Controle de acesso por perfil](#8-controle-de-acesso-por-perfil)
9. [Variáveis de ambiente](#9-variáveis-de-ambiente)
10. [Deploy (Railway)](#10-deploy-railway)
11. [Domínio e DNS](#11-domínio-e-dns)
12. [Migrations](#12-migrations)
13. [Desenvolvimento local](#13-desenvolvimento-local)

---

## 1. Visão geral

Aplicação web para gestão interna do hotel de cães Cãoramelo (Campo Grande/MS).

| Camada | Serviço |
|--------|---------|
| Front-end + API | Next.js 14 (App Router) — Railway |
| Banco de dados | PostgreSQL — Railway |
| Site institucional | Netlify |
| Domínio | Cloudflare — `caoramelo.com` |

**URLs de produção:**
- Sistema de gestão: `sistema.caoramelo.com` → Railway
- Site institucional: `caoramelo.com` / `www.caoramelo.com` → Netlify

---

## 2. Stack e dependências

```
next          14.x   — framework (App Router, Server Components, API Routes)
react         18.x
pg            8.x    — cliente PostgreSQL
bcryptjs      2.x    — hash de senhas
jose          5.x    — JWT (RS256/HS256) — assinatura e verificação de tokens
zod           3.x    — validação de schemas (disponível, uso pontual)
typescript    5.x
```

**Scripts disponíveis:**

| Script | Comando |
|--------|---------|
| Desenvolvimento | `npm run dev` |
| Build | `npm run build` |
| Start produção | `npm run start` |
| Rodar migrations | `npm run db:migrate` |

---

## 3. Estrutura de diretórios

```
caoramelo-v2/
├── migrations/
│   ├── 001_initial.sql       # Schema completo
│   ├── 002_seed.sql          # 3 usuários padrão (bcrypt)
│   └── run.js                # Runner idempotente de migrations
│
├── src/
│   ├── types/
│   │   └── index.ts          # Todos os tipos TypeScript do domínio
│   │
│   ├── lib/
│   │   ├── db.ts             # Pool PostgreSQL + helpers query/queryOne
│   │   ├── auth.ts           # JWT: signToken, verifyToken, getSession, requireSession
│   │   └── utils.ts          # formatCurrency, formatDate, servicoLabel, banhoStatusLabel
│   │
│   ├── components/
│   │   ├── AppShell.tsx      # Wrapper client: gerencia perfil, sidebar mobile
│   │   ├── Sidebar.tsx       # Navegação lateral + logout + trocar senha
│   │   ├── ModalAgendamento.tsx  # Modal de criação de agendamentos (4 serviços)
│   │   └── ModalTrocarSenha.tsx  # Modal de troca de senha
│   │
│   └── app/
│       ├── layout.tsx        # Root layout (Google Fonts: Syne + DM Sans)
│       ├── globals.css       # Design system completo (tema grafite/caramelo)
│       ├── page.tsx          # Redirect / → /dashboard
│       │
│       ├── login/
│       │   ├── page.tsx
│       │   └── LoginForm.tsx # Seletor de perfil + senha
│       │
│       ├── (internal)/       # Route group — layout com auth guard
│       │   ├── layout.tsx    # Verifica sessão; redireciona para /login se ausente
│       │   ├── dashboard/
│       │   ├── agendamentos/
│       │   ├── banho-tosa/
│       │   ├── monitor/
│       │   ├── transporte/
│       │   ├── tutores/
│       │   ├── pets/
│       │   ├── financeiro/
│       │   └── relatorios/
│       │
│       └── api/
│           ├── auth/
│           │   ├── login/route.ts
│           │   ├── logout/route.ts
│           │   └── change-password/route.ts
│           ├── agendamentos/
│           │   ├── route.ts
│           │   └── [id]/banho-status/route.ts
│           ├── tutores/route.ts
│           ├── pets/route.ts
│           ├── pagamentos/route.ts
│           ├── checklist/route.ts
│           └── transporte/route.ts
│
├── next.config.js            # output: 'standalone' (Railway)
├── .env.local                # Variáveis locais (não commitado)
└── package.json
```

---

## 4. Banco de dados

### Tabelas

#### `users`
| Coluna | Tipo | Descrição |
|--------|------|-----------|
| `id` | UUID PK | |
| `name` | VARCHAR(100) | Nome de exibição |
| `role` | VARCHAR(20) | `atendente` \| `monitor` \| `gestor` |
| `password_hash` | VARCHAR(255) | bcrypt, 12 rounds |
| `active` | BOOLEAN | Soft-disable de conta |
| `created_at` | TIMESTAMPTZ | |

> Um registro por perfil. O login é por perfil, não por usuário individual.

#### `tutores`
| Coluna | Tipo | Descrição |
|--------|------|-----------|
| `id` | UUID PK | |
| `nome` | VARCHAR(150) | |
| `whatsapp` | VARCHAR(20) | |
| `endereco` | TEXT | Opcional |
| `created_at` | TIMESTAMPTZ | |

#### `pets`
| Coluna | Tipo | Descrição |
|--------|------|-----------|
| `id` | UUID PK | |
| `tutor_id` | UUID FK → tutores | CASCADE DELETE |
| `nome` | VARCHAR(100) | |
| `raca` | VARCHAR(100) | |
| `porte` | VARCHAR(10) | `pequeno` \| `medio` \| `grande` |
| `peso` | NUMERIC(5,2) | kg, opcional |
| `sexo` | VARCHAR(6) | `macho` \| `femea` |
| `castrado` | BOOLEAN | |
| `vacinas_ok` | BOOLEAN | |
| `medicamento` | TEXT | Opcional |
| `observacoes` | TEXT | Opcional |
| `created_at` | TIMESTAMPTZ | |

#### `agendamentos`
| Coluna | Tipo | Descrição |
|--------|------|-----------|
| `id` | UUID PK | |
| `pet_id` | UUID FK → pets | CASCADE DELETE |
| `servico` | VARCHAR(15) | `hotel` \| `creche` \| `banho` \| `transporte` |
| `status` | VARCHAR(15) | `agendado` \| `ativo` \| `concluido` \| `cancelado` |
| `banho_status` | VARCHAR(15) | Apenas para `servico = banho`. Ver kanban |
| `data_inicio` | DATE | |
| `data_fim` | DATE | Hotel/creche: data de saída |
| `hora` | TIME | Banho/transporte |
| `plano_creche` | VARCHAR(20) | `mensal` \| `quinzenal` \| `diario` |
| `taxi_pet` | BOOLEAN | Creche: táxi pet incluso |
| `origem` | TEXT | Transporte: endereço de origem |
| `destino` | TEXT | Transporte: endereço de destino |
| `valor` | NUMERIC(10,2) | |
| `observacoes` | TEXT | |
| `created_at` | TIMESTAMPTZ | |

**Fluxo de `banho_status` (kanban):**
```
agendado → chegou → em_banho → em_tosa → pronto → retirado
```

#### `pagamentos`
| Coluna | Tipo | Descrição |
|--------|------|-----------|
| `id` | UUID PK | |
| `agendamento_id` | UUID FK → agendamentos | CASCADE DELETE |
| `valor` | NUMERIC(10,2) | |
| `forma` | VARCHAR(10) | `pix` \| `dinheiro` \| `cartao` |
| `data` | TIMESTAMPTZ | |

#### `checklist_registros`
| Coluna | Tipo | Descrição |
|--------|------|-----------|
| `id` | UUID PK | |
| `data` | DATE | Data do checklist |
| `tipo` | VARCHAR(20) | `creche_manha` \| `creche_tarde` \| `hospedagem` |
| `itens` | JSONB | `{ "item_key": true/false, ... }` |
| `intercorrencias` | TEXT | Observações livres |
| `created_by` | UUID FK → users | |
| `created_at` | TIMESTAMPTZ | |

#### `_migrations`
Tabela de controle interna do runner de migrations. Não manipular manualmente.

### Índices
```sql
idx_agendamentos_data    ON agendamentos(data_inicio)
idx_agendamentos_servico ON agendamentos(servico)
idx_agendamentos_status  ON agendamentos(status)
idx_pets_tutor           ON pets(tutor_id)
idx_pagamentos_data      ON pagamentos(data)
```

---

## 5. Autenticação e sessão

- **Mecanismo**: JWT HS256 armazenado em cookie httpOnly `session`
- **Expiração**: 8 horas
- **Payload do token**: `{ id, name, role }`
- **Biblioteca**: `jose` (Web Crypto API — compatível com Edge Runtime)

### Funções em `src/lib/auth.ts`

| Função | Uso |
|--------|-----|
| `signToken(user)` | Gera JWT assinado — chamado no login |
| `verifyToken(token)` | Verifica e decodifica o token |
| `getSession()` | Lê cookie `session` e retorna `User \| null` |
| `requireSession()` | Igual a `getSession()` mas lança erro se não autenticado |

### Fluxo de login

1. `POST /api/auth/login` recebe `{ role, password }`
2. Busca user ativo pelo role no banco
3. `bcrypt.compare(password, hash)`
4. Se válido: `signToken` → seta cookie `session` (httpOnly, secure em prod, SameSite=lax)
5. Retorna `{ ok: true }`

### Fluxo de logout

1. `POST /api/auth/logout`
2. Limpa cookie `session` (maxAge=0)
3. Client redireciona para `/login`

### Auth guard nas páginas

O layout `src/app/(internal)/layout.tsx` chama `getSession()` e redireciona para `/login` se não houver sessão válida. Todas as rotas dentro de `(internal)` são protegidas automaticamente.

---

## 6. API Routes

Todas as rotas verificam sessão via `requireSession()`. Erros de autenticação retornam HTTP 401.

### `POST /api/auth/login`
```ts
body: { role: Perfil, password: string }
response: { ok: true } | { error: string }
cookie: session (httpOnly JWT)
```

### `POST /api/auth/logout`
```ts
// Sem body
response: { ok: true }
// Limpa cookie session
```

### `POST /api/auth/change-password`
```ts
// Trocar própria senha:
body: { senha_atual: string, nova_senha: string }

// Gestor trocando senha de outro perfil (sem senha atual):
body: { role_alvo: Perfil, nova_senha: string }

response: { ok: true } | { error: string }
// nova_senha deve ter >= 4 caracteres
// Apenas gestor pode usar role_alvo diferente do próprio role
```

### `GET /api/agendamentos`
```ts
response: Agendamento[]  // inclui pet_nome e tutor_nome via JOIN
```

### `POST /api/agendamentos`
```ts
body: Partial<Agendamento>  // pet_id e servico obrigatórios
// Se servico === 'banho': banho_status é setado para 'agendado' automaticamente
response: Agendamento
```

### `PATCH /api/agendamentos/[id]/banho-status`
```ts
body: { banho_status: BanhoStatus }
response: { ok: true }
// Atualiza coluna kanban do banho/tosa
```

### `GET /api/tutores`
```ts
response: Tutor[]
```

### `POST /api/tutores`
```ts
body: { nome: string, whatsapp: string, endereco?: string }
response: Tutor
```

### `GET /api/pets`
```ts
response: Pet[]  // inclui tutor_nome via JOIN
```

### `POST /api/pets`
```ts
body: Omit<Pet, 'id' | 'created_at'>
response: Pet
```

### `GET /api/pagamentos`
```ts
response: Pagamento[]  // inclui pet_nome, tutor_nome, servico via JOIN
```

### `POST /api/pagamentos`
```ts
// Apenas gestor
body: { agendamento_id: string, valor: number, forma: 'pix' | 'dinheiro' | 'cartao' }
response: Pagamento
// 403 se não for gestor
```

### `GET /api/checklist`
```ts
query: ?data=YYYY-MM-DD  // opcional, filtra por data
response: ChecklistRegistro[]
```

### `POST /api/checklist`
```ts
body: { data: string, tipo: 'creche_manha'|'creche_tarde'|'hospedagem', itens: Record<string,boolean>, intercorrencias?: string }
response: ChecklistRegistro
```

### `GET /api/transporte`
```ts
response: Agendamento[]  // servico = 'transporte', com pet_nome e tutor_nome
```

### `POST /api/transporte`
```ts
// Apenas gestor
body: { pet_id, data_inicio, hora, origem, destino, valor?, observacoes? }
response: Agendamento
// 403 se não for gestor
```

---

## 7. Páginas e componentes

### Páginas

| Rota | Acesso | Descrição |
|------|--------|-----------|
| `/login` | Público | Seletor de perfil + senha |
| `/dashboard` | Todos | Estatísticas (hotel/creche/banho ativos, pets com medicação) |
| `/agendamentos` | Todos | Tabela com filtros + criar agendamento |
| `/banho-tosa` | Todos | Kanban de 6 colunas para banho e tosa |
| `/monitor` | monitor, gestor | Checklists de creche manhã/tarde e hospedagem |
| `/transporte` | Todos (criar: gestor) | Lista de transportes agendados |
| `/tutores` | Todos | Cadastro de tutores |
| `/pets` | Todos | Cadastro de pets (cards) |
| `/financeiro` | gestor | Estatísticas financeiras + registro de pagamentos |
| `/relatorios` | gestor | Links para demais seções |

### Padrão Server/Client Component

Cada página usa o padrão:
- `page.tsx` — Server Component: busca dados no banco e passa como props
- `[Página]Client.tsx` — Client Component: renderiza UI interativa com os dados

### Componentes compartilhados

#### `AppShell.tsx`
- Gerencia estado do `perfil` ativo (lê da sessão, permite trocar via select na sidebar)
- Controla abertura/fechamento da sidebar no mobile
- Renderiza `Sidebar` + slot de conteúdo

#### `Sidebar.tsx`
- Navegação com links ativos por `usePathname()`
- Itens condicionais por perfil:
  - Monitor: oculto para `atendente`
  - Financeiro/Relatórios: apenas `gestor`
  - Transporte: todos (criar: apenas gestor na página)
- Footer: botões "Trocar Senha" e "Sair"

#### `ModalAgendamento.tsx`
- Formulário dinâmico por tipo de serviço:
  - **Hotel**: data check-in, data check-out, valor, chave PIX
  - **Creche**: plano (mensal/quinzenal/diário), táxi pet, data início
  - **Banho**: data, hora, valor
  - **Transporte**: data, hora, origem, destino, valor

#### `ModalTrocarSenha.tsx`
- Perfil próprio: exige senha atual + nova senha + confirmação
- Gestor: seletor de perfil alvo; se escolher outro perfil, campo "senha atual" some
- Tela de sucesso após salvar

---

## 8. Controle de acesso por perfil

| Funcionalidade | atendente | monitor | gestor |
|----------------|:---------:|:-------:|:------:|
| Dashboard | ✅ | ✅ | ✅ |
| Agendamentos (ver/criar) | ✅ | ✅ | ✅ |
| Banho e Tosa (kanban) | ✅ | ✅ | ✅ |
| Monitor (checklists) | ❌ | ✅ | ✅ |
| Transporte (ver) | ✅ | ✅ | ✅ |
| Transporte (criar) | ❌ | ❌ | ✅ |
| Tutores (ver/criar) | ✅ | ✅ | ✅ |
| Pets (ver/criar) | ✅ | ✅ | ✅ |
| Financeiro | ❌ | ❌ | ✅ |
| Relatórios | ❌ | ❌ | ✅ |
| Registrar pagamento | ❌ | ❌ | ✅ |
| Trocar própria senha | ✅ | ✅ | ✅ |
| Trocar senha de outros perfis | ❌ | ❌ | ✅ |

O controle é aplicado em dois lugares:
1. **UI**: links/botões condicionais por `perfil` no `AppShell`/`Sidebar`
2. **API**: `requireSession()` + verificação de `user.role` em cada route handler

---

## 9. Variáveis de ambiente

| Variável | Obrigatória | Descrição |
|----------|:-----------:|-----------|
| `DATABASE_URL` | ✅ | Connection string PostgreSQL completa |
| `JWT_SECRET` | ✅ | String longa e aleatória para assinar tokens |
| `NODE_ENV` | — | `development` / `production` (controla SSL do pg) |

**Arquivo `.env.local`** (desenvolvimento local — não commitado no git):
```env
DATABASE_URL=postgresql://user:pass@host:port/dbname
JWT_SECRET=sua-chave-secreta-aqui
NODE_ENV=development
```

**No Railway** (produção): configurar em **Variables** do serviço.
- `DATABASE_URL`: usar `${{ Postgres.DATABASE_URL }}` para referenciar o banco interno
- `HOSTNAME=0.0.0.0` — obrigatório para o servidor Next.js standalone aceitar conexões no Railway

---

## 10. Deploy (Railway)

### Configuração do serviço

| Campo | Valor |
|-------|-------|
| Build command | `npm run build && cp -r .next/static .next/standalone/.next/static` |
| Start command | `HOSTNAME=0.0.0.0 node .next/standalone/server.js` |
| Root directory | `/` |

> O `cp` manual é necessário porque o Next.js `output: standalone` não inclui os assets estáticos automaticamente.

### `next.config.js`
```js
const nextConfig = {
  output: 'standalone',
}
module.exports = nextConfig
```

### Migrations no deploy
As migrations rodam automaticamente via `migrations/run.js` quando o serviço inicia. O runner é idempotente: verifica a tabela `_migrations` antes de executar cada arquivo SQL, pulando os já aplicados.

### Fluxo de deploy
1. Push para `main` no GitHub
2. Railway detecta e executa build
3. Build: `next build` + copia estáticos
4. Start: migrations → servidor Next.js

---

## 11. Domínio e DNS

**Registrar**: Cloudflare — `caoramelo.com`

### Registros DNS (Cloudflare)

| Tipo | Nome | Conteúdo | Proxy |
|------|------|----------|-------|
| `CNAME` | `@` | `[site].netlify.app` | ☁️ Proxied |
| `CNAME` | `www` | `[site].netlify.app` | ☁️ Proxied |
| `CNAME` | `sistema` | `caoramelo-v2-production.up.railway.app` | ☁️ DNS only |

> Railway **não é compatível com Cloudflare Proxy** para HTTPS. O CNAME do `sistema` deve ser **DNS only** (nuvem cinza).

### Configuração no Railway
Em **Settings → Networking → Custom Domain**: adicionar `sistema.caoramelo.com`. O Railway emite certificado SSL via Let's Encrypt automaticamente.

### Configuração no Netlify
Em **Site settings → Domain management**: adicionar `caoramelo.com` e `www.caoramelo.com`. SSL automático.

---

## 12. Migrations

### Estrutura
```
migrations/
├── 001_initial.sql   # Cria todas as tabelas e índices
├── 002_seed.sql      # Insere os 3 usuários padrão
└── run.js            # Runner
```

### Como rodar localmente
```bash
DATABASE_URL="postgresql://..." node migrations/run.js
```

### Como adicionar uma migration
1. Criar arquivo `migrations/003_nome.sql`
2. Escrever SQL idempotente (use `IF NOT EXISTS`, `IF EXISTS`)
3. O Railway rodará automaticamente no próximo deploy

### Usuários padrão (seed)
| Perfil | Senha padrão |
|--------|-------------|
| atendente | `sombra` |
| monitor | `sombra` |
| gestor | `sombra` |

> Trocar as senhas após o primeiro acesso via modal "Trocar Senha" na sidebar.

---

## 13. Desenvolvimento local

### Pré-requisitos
- Node.js 18+
- Acesso ao PostgreSQL (local ou Railway public URL)

### Setup
```bash
# 1. Clonar
git clone https://github.com/paulohfmendes/caoramelo-v2.git
cd caoramelo-v2

# 2. Instalar dependências
npm install

# 3. Criar .env.local
cp .env.example .env.local  # ou criar manualmente
# Editar DATABASE_URL e JWT_SECRET

# 4. Rodar migrations
npm run db:migrate

# 5. Iniciar em modo dev
npm run dev
# Disponível em http://localhost:3000
```

> **Nota**: Se o projeto estiver em uma unidade de rede (ex: VirtualBox VBoxSvr mapeado como `Z:`), o Node.js pode não conseguir resolver `node_modules`. Nesse caso, copiar os arquivos para `C:\temp\` ou `/tmp/` e rodar de lá.

### Observações de desenvolvimento
- Server Components buscam dados diretamente do banco (sem fetch de API interna)
- Client Components usam `fetch('/api/...')` para mutações
- O cookie `session` é httpOnly — não acessível por JavaScript no browser
- Em `NODE_ENV=development`, o SSL do PostgreSQL é desabilitado (`ssl: false`)
