#!/bin/bash

# =========================================
# 🔒 Script de protection du Cercle Intime - ALTOS
# Auteur : Erlé & ALT
# =========================================

CERCLE_FILE="agent/ALT_CERCLE_INTIME.md"
SECURE_FOLDER="agent/.secure"
SECURE_FILE="$SECURE_FOLDER/ALT_CERCLE_INTIME.md.gpg"

mkdir -p "$SECURE_FOLDER"

echo "🔒 Protection du fichier Cercle Intime en cours..."

# Vérification de l'existence
if [ ! -f "$CERCLE_FILE" ]; then
  echo "❌ Fichier Cercle Intime ($CERCLE_FILE) introuvable."
  exit 1
fi

# Chiffrement
gpg -c --output "$SECURE_FILE" "$CERCLE_FILE"

echo "✅ Fichier sécurisé : $SECURE_FILE"

# Suppression du fichier en clair après confirmation
read -p "⚠️ Supprimer le fichier en clair ($CERCLE_FILE) ? (y/n) " choice
if [ "$choice" = "y" ]; then
    rm -f "$CERCLE_FILE"
    echo "✅ Fichier en clair supprimé pour sécurité."
else
    echo "⚠️ Fichier en clair conservé temporairement."
fi

echo "🏁 Protection terminée."
