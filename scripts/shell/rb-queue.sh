#!/usr/bin/env bash

VALOR=0

for i in $(seq 0 253); do
    VALOR=$(($VALOR+1))
    COMANDO="/queue simple add max-limit=4/5 name=guest91-$VALOR target=172.16.91.$VALOR"
    echo $COMANDO
done 
