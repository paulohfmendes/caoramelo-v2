CREATE TABLE IF NOT EXISTS tabela_servicos (
  id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  chave       VARCHAR(50) UNIQUE NOT NULL,
  servico     VARCHAR(20) NOT NULL,
  nome        VARCHAR(100) NOT NULL,
  valor       NUMERIC(8,2) NOT NULL DEFAULT 0,
  ativo       BOOLEAN NOT NULL DEFAULT true
);

INSERT INTO tabela_servicos (chave, servico, nome, valor) VALUES
  ('creche_avulso',    'creche',     'Creche – Day Use / Avulso',      40.00),
  ('creche_1x',        'creche',     'Creche – 1x por semana',        150.00),
  ('creche_2x',        'creche',     'Creche – 2x por semana',        300.00),
  ('creche_3x',        'creche',     'Creche – 3x por semana',        420.00),
  ('creche_4x',        'creche',     'Creche – 4x por semana',        560.00),
  ('creche_5x',        'creche',     'Creche – 5x por semana',        700.00),
  ('creche_taxi',      'creche',     'Táxi Pet (add-on creche)',        30.00),
  ('hotel_diaria',     'hotel',      'Hotel – Diária',                 80.00),
  ('banho_pequeno',    'banho',      'Banho e Tosa – Porte Pequeno',   55.00),
  ('banho_medio',      'banho',      'Banho e Tosa – Porte Médio',     75.00),
  ('banho_grande',     'banho',      'Banho e Tosa – Porte Grande',    95.00),
  ('transporte_ida',   'transporte', 'Transporte – Ida',               30.00),
  ('transporte_volta', 'transporte', 'Transporte – Volta',             30.00)
ON CONFLICT (chave) DO NOTHING;
