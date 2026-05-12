ALTER TABLE pets
  ADD COLUMN IF NOT EXISTS peso       NUMERIC(5,2),
  ADD COLUMN IF NOT EXISTS nascimento DATE,
  ADD COLUMN IF NOT EXISTS pelagem    VARCHAR(50);

-- porte e sexo passam a aceitar NULL (informação não disponível na migração legada)
ALTER TABLE pets
  ALTER COLUMN porte DROP NOT NULL,
  ALTER COLUMN sexo  DROP NOT NULL;
