# AutoGrader Bash - Correcteur Automatique de Projet C

## 📝 Description du projet
[cite_start]Ce projet consiste en un script Shell nommé `mark.sh` conçu pour automatiser la correction de projets C[cite: 6, 68]. [cite_start]Le script analyse le code source, vérifie la compilation, teste la validité de l'algorithme de factorielle et contrôle le respect des normes de programmation[cite: 6, 22, 23].

## 🛠️ Fonctionnement du Script
[cite_start]Le script doit être placé dans le même dossier que les fichiers du projet C à corriger[cite: 71]. Il effectue les actions suivantes :
* [cite_start]**Compilation :** Utilise le `Makefile` présent pour générer l'exécutable `factorielle`[cite: 15, 23].
* [cite_start]**Tests unitaires :** Vérifie les résultats pour des entrées allant de 1 à 10, ainsi que le cas particulier de 0[cite: 27].
* [cite_start]**Gestion d'erreurs :** Vérifie si les messages d'erreur exacts sont affichés en cas de mauvais paramètres ou de nombres négatifs[cite: 18, 19, 30, 31].
* [cite_start]**Analyse de code :** Contrôle la longueur des lignes, l'indentation et la présence d'un fichier header[cite: 38, 40, 56].

## 📊 Barème de Notation (Total sur 20)
[cite_start]La note est calculée selon un algorithme précis[cite: 21]:
* **Points Positifs :**
    * [cite_start]Compilation réussie : +2 points[cite: 25].
    * [cite_start]Algorithme correct (1 à 10) : +5 points[cite: 27].
    * [cite_start]Gestion de la factorielle de 0 : +3 points[cite: 27].
    * [cite_start]Présence de la signature `int factorielle( int number)` : +2 points[cite: 28, 29].
    * [cite_start]Messages d'erreurs corrects (paramètres/négatifs) : +8 points (4+4)[cite: 30, 31].
* **Malus :**
    * [cite_start]Ligne > 80 caractères dans `main.c` ou `header.h` : -2 points[cite: 37, 38].
    * [cite_start]Mauvaise indentation (doit être de 2 espaces) : -2 points[cite: 40, 41].
    * [cite_start]Règle `make clean` non fonctionnelle : -2 points[cite: 52, 53].
    * [cite_start]Fichier `.h` manquant : -2 points[cite: 57].

## 📂 Sortie des Résultats
[cite_start]Le programme génère automatiquement un fichier `note.csv` contenant les colonnes suivantes[cite: 59, 63]:
[cite_start]`Nom, Prénom, Note` [cite: 61]

[cite_start]Les informations d'identité sont extraites automatiquement du nom du dossier (format `NOM_PRENOM`) et du fichier `readme.txt`[cite: 14, 65].

---
[cite_start]**Rendu :** Projet réalisé en binôme[cite: 92].
[cite_start]**Contact :** dany.siriphol@gmail.com[cite: 93].
