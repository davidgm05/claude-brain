#!/bin/bash
# save-session.sh - Guarda resumen de sesión en Obsidian vault
# Uso: ./save-session.sh "título" "contenido"

VAULT="/home/ubuntu/SecondBrain"
SESSION_FILE="$VAULT/sessions/$(date '+%Y-%m-%d-%H%M')-session.md"

cat > "$SESSION_FILE" << 'EOF'
---
tags: [session]
created: $(date '+%Y-%m-%d %H:%M')
---

# Sesión $(date '+%Y-%m-%d %H:%M')

EOF

echo "$SESSION_FILE creado"
ls -la "$SESSION_FILE"