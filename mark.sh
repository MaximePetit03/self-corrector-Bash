#!/bin/bash

finalNote=0
CorrectResult=true

make > /dev/null 2>&1

if [ -f "./factorielle" ]; then
    echo "Compilation ok"
else 
    finalNote=0
    exit 1
fi

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
    finalNote=$((finalNote + 5))
fi

if [ "$result0" -eq 1 ]; then
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

make clean > /dev/null 2>&1
if [ -f "./factorielle" ]; then
    echo "Make clean ne marche pas"
    finalNote=$((finalNote - 2))
fi

echo "Note finale : $finalNote/20"