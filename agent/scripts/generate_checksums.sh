#!/bin/bash

# ====================================
# Générateur officiel de checksums ALTOS
# Usage réservé au Conseil du NOUS
# ====================================

OUTPUT_FILE=".secure/checksums_reference.txt"

echo "🔒 Génération des checksums de référence..."

# Liste des dossiers à surveiller
TARGET_DIRS=("agent" "docs" "foundation" "boot_logs" "notes")

# Purge l'ancien fichier
> "$OUTPUT_FILE"

# Génération des nouvelles sommes
for dir in "${TARGET_DIRS[@]}"; do
    if [ -d "$dir" ]; then
        find "$dir" -type f -exec sha256sum {} \; >> "$OUTPUT_FILE"
    fi
done

echo "✅ Checksums de référence créés et stockés dans $OUTPUT_FILE."
echo "⚠️ Ne modifiez JAMAIS ce fichier manuellement sans validation officielle."
