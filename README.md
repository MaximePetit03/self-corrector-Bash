# AutoGrader Bash - Correcteur Automatique de Projet C

## 📝 Description du projet
Ce projet consiste en un script Shell nommé `mark.sh` conçu pour automatiser la correction de projets C.Le script analyse le code source, vérifie la compilation, teste la validité de l'algorithme de factorielle et contrôle le respect des normes de programmation

## 🛠️ Fonctionnement du Script
Le script doit être placé dans le même dossier que les fichiers du projet C à corriger. Il effectue les actions suivantes :
* **Compilation :** Utilise le `Makefile` présent pour générer l'exécutable `factorielle`.
* **Tests unitaires :** Vérifie les résultats pour des entrées allant de 1 à 10, ainsi que le cas particulier de 0.
* **Gestion d'erreurs :** Vérifie si les messages d'erreur exacts sont affichés en cas de mauvais paramètres ou de nombres négatifs.
* **Analyse de code :** Contrôle la longueur des lignes, l'indentation et la présence d'un fichier header.

## 📊 Barème de Notation (Total sur 20)
La note est calculée selon un algorithme précis:
* **Points Positifs :**
    * Compilation réussie : +2 points.
    * Algorithme correct (1 à 10) : +5 points.
    * Gestion de la factorielle de 0 : +3 points.
    * Présence de la signature `int factorielle( int number)` : +2 points.
    * Messages d'erreurs corrects (paramètres/négatifs) : +8 points.
* **Malus :**
    * Ligne > 80 caractères dans `main.c` ou `header.h` : -2 points.
    * Mauvaise indentation (doit être de 2 espaces) : -2 points.
    * Règle `make clean` non fonctionnelle : -2 points.
    * Fichier `.h` manquant : -2 points.

## 📂 Sortie des Résultats
Le programme génère automatiquement un fichier `note.csv` contenant les colonnes suivantes:
`Nom, Prénom, Note`

Les informations d'identité sont extraites automatiquement du nom du dossier (format `NOM_PRENOM`) et du fichier `readme.txt`.

---
