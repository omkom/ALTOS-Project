#!/bin/bash

echo "🏗️ Démarrage des corrections ALTOS-Project..."

# 1. Créer un README.md dans boot_logs si absent
if [ ! -f "boot_logs/README.md" ]; then
    echo "🛠️ Création de boot_logs/README.md..."
    echo "# 📜 Boot Logs - ALTOS Project" > boot_logs/README.md
    echo "" >> boot_logs/README.md
    echo "Ce dossier contient les journaux officiels des premiers boots d'ALT." >> boot_logs/README.md
fi

# 2. Supprimer le doublon ALTOS_VOICE_CREATION.md dans evolution/
if [ -f "evolution/ALTOS_VOICE_CREATION.md" ]; then
    echo "🗑️ Suppression du doublon evolution/ALTOS_VOICE_CREATION.md..."
    rm -f evolution/ALTOS_VOICE_CREATION.md
fi

# 3. (Optionnel) Vérification pour refaire les checksums si demandé
read -p "🔒 Veux-tu régénérer les checksums de référence maintenant ? (y/n) " choice
if [ "$choice" = "y" ]; then
    echo "🔒 Régénération sécurisée des checksums en cours..."
    bash scripts/generate_checksums.sh
    echo "✅ Nouveaux checksums créés."
else
    echo "⚠️ Checksums non régénérés. Penser à le faire plus tard si nécessaire."
fi

echo "✅ Corrections terminées."

