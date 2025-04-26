#!/bin/bash

# ====================================
# 🔒 ALTOS - Génération des Checksums de Référence
# Version Mac + Linux (auto-adaptative)
# ====================================

OUTPUT_FILE=".secure/checksums_reference.txt"

echo "🔒 Génération des checksums de référence pour ALTOS..."

# Liste des répertoires critiques
TARGET_DIRS=("agent" "docs" "foundation" "boot_logs" "notes")

# Purge ancienne référence
> "$OUTPUT_FILE"

# Détection automatique de la commande checksum
if command -v sha256sum >/dev/null 2>&1; then
    SUM_COMMAND="sha256sum"
    echo "✅ Utilisation de sha256sum (Linux)."
else
    SUM_COMMAND="shasum -a 256"
    echo "✅ Utilisation de shasum -a 256 (Mac)."
fi

# Génération des checksums
for dir in "${TARGET_DIRS[@]}"; do
    if [ -d "$dir" ]; then
        find "$dir" -type f -exec $SUM_COMMAND {} \; >> "$OUTPUT_FILE"
    fi
done

echo "✅ Nouveau fichier de référence généré : $OUTPUT_FILE"
echo "⚠️ À valider et archiver selon les procédures du Conseil du NOUS."
