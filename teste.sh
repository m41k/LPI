#!/bin/bash
wget -qO - https://raw.githubusercontent.com/m41k/LPI/master/base/a > /tmp/ask1
C=`head -1 /tmp/ask1`
cat /tmp/ask1 | sed '1d'
echo
read R
if [ $R = $C ]; then
 echo "correto"
fi

