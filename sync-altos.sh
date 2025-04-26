#!/bin/bash

echo "🔄 Synchronisation du projet ALTOS en cours..."

git add .
git commit -m "Sync automatique du $(date '+%Y-%m-%d %H:%M:%S')"
git push

echo "✅ Synchronisation terminée."
