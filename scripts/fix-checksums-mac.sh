#!/bin/bash

# ====================================
# 🔒 ALTOS - Correction Manuelle des Checksums pour Mac
# ====================================

OUTPUT_FILE=".secure/checksums_reference.txt"

echo "🔧 Correction manuelle des checksums sur Mac (shasum -a 256)..."

TARGET_DIRS=("agent" "docs" "foundation" "boot_logs" "notes")

> "$OUTPUT_FILE"

for dir in "${TARGET_DIRS[@]}"; do
    if [ -d "$dir" ]; then
        find "$dir" -type f -exec shasum -a 256 {} \; >> "$OUTPUT_FILE"
    fi
done

echo "✅ Fichier de référence corrigé pour environnement Mac."
