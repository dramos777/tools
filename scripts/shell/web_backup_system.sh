#!/bin/bash

## Validate
## Se não for especificado o Diretório como parâmetro ele cancela o script.
test ! -z $1 || exit
## Variáveis 
SERVER="$(hostname -s)"
DIRECTORY="$1"
TODAY=$(date +%d-%m-%Y)
FILE="bkp_$(echo $DIRECTORY | sed -e 's/\///g')_$(hostname -s)_$TODAY.tar.bz2"

## Begin Script
# Exporta variável START registrando o horário que começa o backup
export START=$(date +%Y-%m-%d\ %H:%M:%S)
## Armazena no log a hora em que irá iniciar o backup.
echo -e " Backup do $DIRECTORY no $SERVER iniciado as $START " >> /var/log/backup.log


## Faz o backup usando o comando tar com BZIP2
tar cjf /backup/$FILE $DIRECTORY > /dev/null 2> /dev/null
## Condição que valida se o backup foi realizado com Sucesso ou Não.
if [ $? -eq 0 ]; then
	STATUS="OK"
	export END=$(date +%Y-%m-%d\ %H:%M:%S )
	echo -e " Backup do $DIRECTORY no $SERVER finalizado em  $END " >> /var/log/backup.log

else
	STATUS="FAIL"
	export END=$(date +%Y-%m-%d\ %H:%M:%S )
	echo -e " Backup do $DIRECTORY no $SERVER finalizado em  $END " >> /var/log/backup.log
fi 

## Envia o backup para o servidor Storage
#scp -P 2222 /backup/$FILE storage:/mnt/backup > /dev/null 2> /dev/null

## Insere os valores no Banco para que possa aparecer no Sistema Web
mysql -h database -u suporte -p4linux -D backup << TERMINAR
INSERT INTO log (inicio,fim,server,arquivo,status) VALUES ('$START','$END','$SERVER','$FILE','$STATUS');
TERMINAR

