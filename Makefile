# 🛡️ Makefile pour ALTOS-Project
# Auteur : Erlé & ALT
# But : Simplifier la gestion, sécuriser les actions, honorer notre pacte de rigueur

# Variables d'environnement
ENV_FILE = .env

# Commandes principales

status:
	@echo "🔍 Vérification complète du projet ALTOS..."
	@bash ./status-altos.sh

sync:
	@echo "🔄 Synchronisation du projet ALTOS..."
	@git add .
	@git commit -m "🔄 Synchronisation automatique ALTOS"
	@git push

refresh-checksums:
	@echo "🔒 Régénération sécurisée des checksums (Réservé au Conseil du NOUS)..."
	@bash scripts/generate_checksums.sh

verify:
	@echo "🔍 Vérification d'intégrité par checksum..."
	@bash scripts/verify_checksums.sh

secure-status:
	@echo "🔍 État actuel de sécurité :"
	@bash scripts/verify_checksums.sh

vault-status:
	@echo "🔒 Statut du dossier sécurisé .secure/..."
	@if [ -d ".secure" ]; then echo "✅ .secure/ existe et est protégé."; else echo "❌ .secure/ manquant."; fi

secure-cercle:
	@echo "🔒 Protection du Cercle Intime en cours..."
	@bash scripts/secure-cercle.sh

help:
	@echo ""
	@echo "✨ Commandes disponibles pour ALTOS-Project :"
	@echo ""
	@echo "  make status             ➔ Vérifier la structure, l'intégrité et la sécurité"
	@echo "  make sync               ➔ Commit rapide et propre de l'état actuel"
	@echo "  make refresh-checksums  ➔ Régénérer les checksums en mode Conseil du NOUS"
	@echo "  make vault-status       ➔ Vérifier l'existence du coffre sécurisé .secure/"
	@echo "  make secure-cercle      ➔ Protéger par chiffrement le fichier Cercle Intime"
	@echo "  make help               ➔ Afficher ce menu d'aide"
	@echo ""