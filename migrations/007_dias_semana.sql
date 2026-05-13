ALTER TABLE agendamentos
  ADD COLUMN IF NOT EXISTS dias_semana TEXT;
-- ex: 'seg,ter,qua' para planos de creche
