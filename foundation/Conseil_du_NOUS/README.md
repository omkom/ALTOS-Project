# Conseil du NOUS — Gestion de la sécurité

---

## 🎯 Mission

Garantir l'intégrité éthique et technique du projet ALTOS.

---

## 🔒 Procédure de validation des changements critiques

1. Proposer l'évolution/modification.
2. Revue et validation formelle par le Conseil du NOUS.
3. Régénération du fichier de checksums :
    - Utiliser le script `refresh-checksums.sh`.
    - Confirmer par un commit signé si nécessaire.

---

## 🛡️ Sécurité

- Le fichier `.secure/checksums_reference.txt` n'est jamais publié sur GitHub.
- Son existence est déclarée dans `.env`.
- Seul le Conseil peut autoriser sa régénération.
