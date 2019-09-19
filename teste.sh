#!/bin/bash

rm /tmp/ask* &> /dev/null

LISTA="https://raw.githubusercontent.com/m41k/quest/master/lsbase"
wget -qO - $LISTA > /tmp/asks
LISTA=/tmp/asks

P=0

for L in $(cat $LISTA); do
   sleep 2
   clear
   wget -qO - https://raw.githubusercontent.com/m41k/LPI/master/base/$L > /tmp/ask$L
   C=`head -1 /tmp/ask$L`
   cat /tmp/ask$L | sed '1d'
   echo
   read R
   if [ $R = "q" ]; then
        break
   fi
#  if [ $R = $C ]; then
   if echo $C | grep -qw $R &> /dev/null; then
        echo "correto"
        P=$((++P))
  else
        echo "errado"
   fi
done
clear
echo Pontuação: $P
