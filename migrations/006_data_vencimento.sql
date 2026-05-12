ALTER TABLE agendamentos
  ADD COLUMN IF NOT EXISTS data_vencimento DATE;

CREATE INDEX IF NOT EXISTS idx_agendamentos_vencimento ON agendamentos(data_vencimento);
