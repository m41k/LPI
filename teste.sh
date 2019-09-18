#!/bin/bash

LISTA="https://raw.githubusercontent.com/m41k/quest/master/ls"
wget -qO - $LISTA > /tmp/ls.lpi
LISTA=/tmp/ls.lpi

for L in $(cat $LISTA); do
   sleep 2
   clear
   wget -qO - https://raw.githubusercontent.com/m41k/LPI/master/base/$L > /tmp/ask$L
   C=`head -1 /tmp/ask$L`
   cat /tmp/ask$L | sed '1d'
   echo
   read R
   if [ $R = $C ]; then
        echo "correto"
   else
        echo "errado"
   fi
done
