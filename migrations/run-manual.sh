#!/bin/bash
# Script para executar as migrações manualmente

# Certifique-se de que DATABASE_URL está definido
if [ -z "$DATABASE_URL" ]; then
  echo "❌ Erro: DATABASE_URL não está definida"
  echo ""
  echo "Configure a variável de ambiente antes de executar:"
  echo "  export DATABASE_URL=\"postgresql://usuario:senha@host:5432/database\""
  echo ""
  echo "Depois execute:"
  echo "  bash migrations/run-manual.sh"
  exit 1
fi

echo "🔄 Executando migrações..."
node migrations/run.js

if [ $? -eq 0 ]; then
  echo "✅ Migrações concluídas com sucesso!"
else
  echo "❌ Erro ao executar migrações"
  exit 1
fi
