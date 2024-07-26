#!/bin/bash
#while true
#do
echo -e "
  1 - Adicionar um usuário no Sistema 
  2 - Deletar um usuário do Sistema
  3 - Verificar se um usuário exite no Sistema
  4 - Sair "
echo -n "Escolha uma opção: "
read OPT
case $OPT in
1)
  clear
  echo -n "Digite o nome do usuário a ser adicionado: "
  echo
  read USUARIO
  echo
  echo -n "Digite a senha: "
  echo
  read -s SENHA
  echo
  echo "Adicionando novo usuário ($USUARIO) no sistema."
  echo
  adduser --home /srv/homes/$USUARIO $USUARIO
  echo "$USUARIO:$SENHA" | chpasswd
  if [ $? -eq 0 ]; then
         echo "O usuario $USUARIO foi adicionado com sucesso!"
  else
         echo "Não foi possivel adicionar o usuário no sistema!"
  fi
;;
2)
  clear
  echo "Digite o nome do usuário que deseja deletar"
  read USUARIO

  echo "Deletando o usuário ($USUARIO) do sistema"
  echo 
  userdel -r $USUARIO
  if [ $? -eq 0 ]; then
       echo "Usuário $USUARIO deletado com sucesso!"
  else
       echo "Não foi possivel deletar o usuário no sistema!"
  fi
;;
3)		
  clear
  echo "Digite o nome do usuário que deseja pesquisar"
  read USUARIO

  echo "Pesquisando usuário o ($USUARIO) no sistema"
  echo 
  getent passwd $USUARIO > /dev/null
  if [ $? -eq 0 ]; then
       echo "O usuário $USUARIO esta presente no sistema!"
  else
       echo "Não foi possivel encontrar o usuário no sistema!"
  fi
;;
4)
 exit
;;
*) echo "Escolha uma opção válida: 1|2|3|4" 
;;
esac
#done
