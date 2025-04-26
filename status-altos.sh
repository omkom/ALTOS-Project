#!/bin/bash

echo "🔍 Vérification de l'état global du projet ALTOS..."

# 1. Chargement sécurisé des variables d'environnement
if [ -f ".env" ]; then
    echo "🔒 Chargement sécurisé des variables d'environnement..."
    set -a
    source .env
    set +a
else
    echo "❌ Fichier .env manquant. Impossible de continuer."
    exit 1
fi

# 2. Vérification des dossiers critiques
echo ""
echo "📂 Vérification des dossiers principaux requis :"
critical_dirs=(foundation evolution voice archives notes docs boot_logs .secure)
for dir in "${critical_dirs[@]}"; do
    if [ -d "$dir" ]; then
        echo "✅ $dir existe"
    else
        echo "❌ $dir MANQUANT"
    fi
done

# 3. Vérification des fichiers essentiels à la racine
echo ""
echo "📄 Vérification des fichiers essentiels à la racine :"
critical_files=(README.md LICENSE.md CONTRIBUTING.md CODE_OF_CONDUCT.md sync-altos.sh status-altos.sh)
for file in "${critical_files[@]}"; do
    if [ -f "$file" ]; then
        echo "✅ $file présent"
    else
        echo "❌ $file MANQUANT"
    fi
done

# 4. Vérification des README.md dans les sous-dossiers principaux
echo ""
echo "📜 Vérification des README.md dans chaque dossier critique :"
for dir in foundation evolution voice archives notes docs boot_logs; do
    if [ -f "$dir/README.md" ]; then
        echo "✅ $dir/README.md présent"
    else
        echo "⚠️  $dir/README.md manquant"
    fi
done

# 5. Vérification de l'intégrité avec checksums
echo ""
echo "🔒 Vérification de l'intégrité des fichiers critiques par checksums..."

if [ -z "$CHECKSUM_FILE_PATH" ]; then
    echo "❌ Variable CHECKSUM_FILE_PATH non définie dans .env. Arrêt."
    exit 1
fi

if [ ! -f "$CHECKSUM_FILE_PATH" ]; then
    echo "⚠️  Fichier de référence checksums introuvable ($CHECKSUM_FILE_PATH)."
else
    echo "🔍 Vérification des fichiers..."
    if shasum -a 256 --check "$CHECKSUM_FILE_PATH" --quiet; then
        echo "✅ Tous les fichiers critiques sont conformes et intègres."
    else
        echo "⚠️  Attention : Un ou plusieurs fichiers critiques ont été modifiés ou altérés !"
    fi
fi

echo ""
echo "🚀 Vérification complète terminée."
