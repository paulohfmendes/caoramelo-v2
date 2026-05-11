-- Senha inicial: "sombra" — troque após o primeiro acesso
INSERT INTO users (name, role, password_hash) VALUES
  ('Atendente', 'atendente', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewqpNBFi.nOT2kTu'),
  ('Monitor',   'monitor',   '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewqpNBFi.nOT2kTu'),
  ('Gestor',    'gestor',    '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewqpNBFi.nOT2kTu')
ON CONFLICT DO NOTHING;
