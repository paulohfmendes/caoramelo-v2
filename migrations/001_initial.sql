CREATE EXTENSION IF NOT EXISTS "pgcrypto";

CREATE TABLE IF NOT EXISTS users (
  id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name          VARCHAR(100) NOT NULL,
  role          VARCHAR(20)  NOT NULL CHECK (role IN ('atendente', 'monitor', 'gestor')),
  password_hash VARCHAR(255) NOT NULL,
  active        BOOLEAN      NOT NULL DEFAULT true,
  created_at    TIMESTAMPTZ  NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS tutores (
  id         UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  nome       VARCHAR(150) NOT NULL,
  whatsapp   VARCHAR(20)  NOT NULL,
  endereco   TEXT,
  created_at TIMESTAMPTZ  NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS pets (
  id           UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  tutor_id     UUID         NOT NULL REFERENCES tutores(id) ON DELETE CASCADE,
  nome         VARCHAR(100) NOT NULL,
  raca         VARCHAR(100) NOT NULL,
  porte        VARCHAR(10)  NOT NULL CHECK (porte IN ('pequeno', 'medio', 'grande')),
  peso         NUMERIC(5,2),
  sexo         VARCHAR(6)   NOT NULL CHECK (sexo IN ('macho', 'femea')),
  castrado     BOOLEAN      NOT NULL DEFAULT false,
  vacinas_ok   BOOLEAN      NOT NULL DEFAULT true,
  medicamento  TEXT,
  observacoes  TEXT,
  created_at   TIMESTAMPTZ  NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS agendamentos (
  id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  pet_id        UUID         NOT NULL REFERENCES pets(id) ON DELETE CASCADE,
  servico       VARCHAR(15)  NOT NULL CHECK (servico IN ('hotel', 'creche', 'banho', 'transporte')),
  status        VARCHAR(15)  NOT NULL DEFAULT 'agendado' CHECK (status IN ('agendado', 'ativo', 'concluido', 'cancelado')),
  banho_status  VARCHAR(15)  CHECK (banho_status IN ('agendado', 'chegou', 'em_banho', 'em_tosa', 'pronto', 'retirado')),
  data_inicio   DATE         NOT NULL,
  data_fim      DATE,
  hora          TIME,
  plano_creche  VARCHAR(20),
  taxi_pet      BOOLEAN      NOT NULL DEFAULT false,
  origem        TEXT,
  destino       TEXT,
  valor         NUMERIC(10,2),
  observacoes   TEXT,
  created_at    TIMESTAMPTZ  NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS pagamentos (
  id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  agendamento_id  UUID         NOT NULL REFERENCES agendamentos(id) ON DELETE CASCADE,
  valor           NUMERIC(10,2) NOT NULL,
  forma           VARCHAR(10)  NOT NULL CHECK (forma IN ('pix', 'dinheiro', 'cartao')),
  data            TIMESTAMPTZ  NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS checklist_registros (
  id               UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  data             DATE         NOT NULL,
  tipo             VARCHAR(20)  NOT NULL CHECK (tipo IN ('creche_manha', 'creche_tarde', 'hospedagem')),
  itens            JSONB        NOT NULL DEFAULT '{}',
  intercorrencias  TEXT,
  created_by       UUID         REFERENCES users(id),
  created_at       TIMESTAMPTZ  NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_agendamentos_data    ON agendamentos(data_inicio);
CREATE INDEX IF NOT EXISTS idx_agendamentos_servico ON agendamentos(servico);
CREATE INDEX IF NOT EXISTS idx_agendamentos_status  ON agendamentos(status);
CREATE INDEX IF NOT EXISTS idx_pets_tutor           ON pets(tutor_id);
CREATE INDEX IF NOT EXISTS idx_pagamentos_data      ON pagamentos(data);
