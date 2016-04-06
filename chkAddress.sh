#!/bin/bash
# script
# description: check public ip Address and report in case of change
# author: Joao Bernardes

checkFile="/var/log/addressStatus/lastAddress"
MAIL="./sendEmail.sh"
currentAddress=`dig +short myip.opendns.com @resolver1.opendns.com`
lastAddress=`cat $checkFile`
MONADDR="example@gmail.com"
DATE=`date +%d-%m-%Y`
TIME=`date +%H%M`

if [ "$currentAddress" != "$lastAddress" ]; then
   echo "The IP Address has been changed! New Address: $currentAddress"
   echo $currentAddress > $checkFile
   $MAIL $MONADDR "Alteração de Endereço IP" \
      "O endereço IP do ambiente monitorado foi alterado para $currentAddress \n
       Informação coletada em $DATE, às $TIME"
else
   echo "The IP Address stay the same: $currentAddress" >> /var/log/chkAddress.log
fi
