#!/bin/bash
echo "Realizando a leitura do arquivo usuarios.txt"
echo
for i in $(cat /root/usuarios.txt); do
   USUARIO=$(getent passwd | grep ^$i | cut -d: -f1)
   test -z $USUARIO
   if [ $? -eq 0 ]; then
       echo
       echo "O usuário $i não está cadastrado"
       echo "Para cadastrar o usuário pressione <ENTER>"
       read
       adduser --home /srv/homes/$i $i
       echo "$i:4linux" | chpasswd
       echo "Usuário $i Cadastrado com Sucesso!"
          else
       echo "O usuário $i já está cadastrado"
     fi
done
