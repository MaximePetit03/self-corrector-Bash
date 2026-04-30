#!/bin/bash

finalNote=0
CorrectResult=true

function insertCsv() {
    folderName=$(basename "$PWD")
    
    # -F',' indique à awk que le séparateur est la virgule
    surname=$(echo "$folderName" | awk -F '_' '{print $1}')
    firstname=$(echo "$folderName" | awk -F '_' '{print $2}')

    if [ -f notes.csv ]; then
        if ! head -n 1 notes.csv | grep -q "Nom"; then
            echo -e "Nom,Prénom,Note\n$surname'$firstname'$finalNote" >> notes.csv
        else
            echo "$surname'$firstname'$finalNote" >> notes.csv
        fi
    else
        echo "Nom,Prénom,Note" > notes.csv
    fi
}

# On redirige tout résultat de la compilation dans dev/null 
make > /dev/null 2>&1

if [ -f "./factorielle" ]; then
    echo "Compilation ok"
    finalNote=$((finalNote + 2))
else 
    echo "Erreur de compilation"
    finalNote=0

    insertCsv
    exit 1
fi

# 2>&1 redirige fusionne les erreurs avec la sortie standard
result0=$(./factorielle 0 2>&1)
NoParameterError=$(./factorielle 2>&1)
NegativeNumberError=$(./factorielle -1 2>&1)

trueResult=1
for ((i=1; i<=10; i++))
do
    trueResult=$((trueResult * i))
    result=$(./factorielle $i)
    
    if [ "$result" -ne "$trueResult" ]; then
        CorrectResult=false
        break 
    fi
done

if [ "$CorrectResult" = true ]; then
    echo "code factorielle ok"
    finalNote=$((finalNote + 5))
fi

if [ "$result0" -eq 1 ]; then
    echo "Factorielle de 0 ok"
    finalNote=$((finalNote + 3))
fi

if grep -q "int factorielle( int number )" main.c; then
    echo "Signature ok"
    finalNote=$((finalNote + 2))
fi

if [ "$NoParameterError" = "Erreur: Mauvais nombre de parametres" ]; then
    echo "La gestion d'aucun paramètre ok"
    finalNote=$((finalNote + 4))
fi

if [ "$NegativeNumberError" = "Erreur: nombre negatif" ]; then
    echo "la gestion d'un nombre négatif ok"
    finalNote=$((finalNote + 4))
fi

filesToTest="main.c"
[ -f "header.h" ] && filesToTest="main.c header.h"

# Redirige les erreurs de fichier vers /dev/null et on test si y a la sortie 1
# 2 étant les erreurs et 1 le bon résultat
if awk 'length($0) > 80 {exit 1} ' $filesToTest 2>/dev/null; then
    echo "80 char par ligne ok"
else
    finalNote=$((finalNote - 2))
fi

if [ ! -f header.h ]; then
    finalNote=$((finalNote - 2))
fi

if awk '
BEGIN { 
        indent = 0; error = 0 
    }
{   
    # Le ~ cherche si l accolade fermante est présent dans la ligne actuelle
    # ~ = correspond à
    if ($0 ~ /}/) { 
        indent -= 2 
    }
    
    # On vérifie si la ligne commence par le bon nombre d espaces
    # ^ représente le début de ligne et on répète les espaces d indent
    regex = "^"
    for (i = 0; i < indent; i++) { 
        regex = regex " " 
    }

    regex = regex "[^ ]" # Suivi par un caractère qui n est pas un espace
    
    # Si la ligne n est pas vide et ne respecte pas le regex il y a une erreur
    # !~ = ne correspond pas à
    # /^[ \t]*$/ est un regex pour les espaces/tabulation sur une ligne vide
    if (length($0) > 0 && $0 !~ /^[ \t]*$/ && $0 !~ regex && $0 !~ /^}/){
        error = 1;
        exit 1
    }

    # Si la ligne contient une accolade ouvrante, on augmente l indent désiré
    if ($0 ~ /{/) { 
        indent += 2 
    }
}
END { 
if (error == 1) 
    exit 1 
}' main.c 2>/dev/null; then
    echo "Indentation : OK"
else
    finalNote=$((finalNote - 2))
fi

make clean > /dev/null 2>&1
if [ -f "./factorielle" ]; then
    echo "Make clean ne marche pas"
    finalNote=$((finalNote - 2))
fi

insertCsv

echo "$finalNote/20 de $firstname $surname envoyée dans notes.csv"