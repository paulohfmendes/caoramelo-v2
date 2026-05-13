-- Migração 008: updated_at, soft delete em agendamentos, normalização banho_status

-- 1. Adicionar updated_at nas tabelas principais
ALTER TABLE users             ADD COLUMN IF NOT EXISTS updated_at TIMESTAMPTZ;
ALTER TABLE tutores            ADD COLUMN IF NOT EXISTS updated_at TIMESTAMPTZ;
ALTER TABLE pets               ADD COLUMN IF NOT EXISTS updated_at TIMESTAMPTZ;
ALTER TABLE agendamentos       ADD COLUMN IF NOT EXISTS updated_at TIMESTAMPTZ;
ALTER TABLE pagamentos         ADD COLUMN IF NOT EXISTS updated_at TIMESTAMPTZ;
ALTER TABLE checklist_registros ADD COLUMN IF NOT EXISTS updated_at TIMESTAMPTZ;

-- 2. Função que atualiza updated_at automaticamente
CREATE OR REPLACE FUNCTION set_updated_at()
RETURNS TRIGGER LANGUAGE plpgsql AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$;

-- 3. Triggers por tabela
DROP TRIGGER IF EXISTS trg_users_updated_at ON users;
CREATE TRIGGER trg_users_updated_at
  BEFORE UPDATE ON users
  FOR EACH ROW EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS trg_tutores_updated_at ON tutores;
CREATE TRIGGER trg_tutores_updated_at
  BEFORE UPDATE ON tutores
  FOR EACH ROW EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS trg_pets_updated_at ON pets;
CREATE TRIGGER trg_pets_updated_at
  BEFORE UPDATE ON pets
  FOR EACH ROW EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS trg_agendamentos_updated_at ON agendamentos;
CREATE TRIGGER trg_agendamentos_updated_at
  BEFORE UPDATE ON agendamentos
  FOR EACH ROW EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS trg_pagamentos_updated_at ON pagamentos;
CREATE TRIGGER trg_pagamentos_updated_at
  BEFORE UPDATE ON pagamentos
  FOR EACH ROW EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS trg_checklist_updated_at ON checklist_registros;
CREATE TRIGGER trg_checklist_updated_at
  BEFORE UPDATE ON checklist_registros
  FOR EACH ROW EXECUTE FUNCTION set_updated_at();

-- 4. Soft delete em agendamentos
ALTER TABLE agendamentos ADD COLUMN IF NOT EXISTS deleted_at TIMESTAMPTZ;

CREATE INDEX IF NOT EXISTS idx_agendamentos_deleted
  ON agendamentos(deleted_at)
  WHERE deleted_at IS NULL;

-- 5. Normalizar valores legados de banho_status
UPDATE agendamentos
  SET banho_status = 'em_atendimento'
  WHERE banho_status IN ('em_banho', 'em_tosa');

UPDATE agendamentos
  SET banho_status = 'pronto'
  WHERE banho_status = 'retirado';

-- 6. Atualizar CHECK constraint do banho_status para apenas os valores novos
ALTER TABLE agendamentos DROP CONSTRAINT IF EXISTS agendamentos_banho_status_check;
ALTER TABLE agendamentos ADD CONSTRAINT agendamentos_banho_status_check
  CHECK (banho_status IN ('agendado', 'chegou', 'em_atendimento', 'pronto'));
