#!/bin/bash

# ====================================
# Vérificateur d'intégrité ALTOS
# ====================================

REFERENCE_FILE=".secure/checksums_reference.txt"

echo "🔍 Vérification des checksums en cours..."

if [ ! -f "$REFERENCE_FILE" ]; then
    echo "❌ Fichier de référence manquant : $REFERENCE_FILE"
    exit 1
fi

# Test tous les fichiers listés
errors=0

while read -r line; do
    expected_sum=$(echo "$line" | awk '{print $1}')
    file_path=$(echo "$line" | awk '{print $2}')

    if [ ! -f "$file_path" ]; then
        echo "❌ Fichier manquant : $file_path"
        ((errors++))
        continue
    fi

    actual_sum=$(sha256sum "$file_path" | awk '{print $1}')

    if [ "$expected_sum" != "$actual_sum" ]; then
        echo "❌ Fichier modifié : $file_path"
        ((errors++))
    fi
done < "$REFERENCE_FILE"

if [ "$errors" -eq 0 ]; then
    echo "✅ Intégrité parfaite confirmée."
    exit 0
else
    echo "⚠️ Attention : $errors erreur(s) d'intégrité détectée(s)!"
    exit 2
fi
