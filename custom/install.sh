1 - zsh
2 - firmware
3 - swappiness
4 - fstab
5 - ssd block discard (adicionar um if) 
6 - definir umask
7 - Configurar .bashrc .profile .bash_login .bash_logout /etc/bash.bashrc
8 - Instalar docker
9 - Criar cluster kind
10 - Configurar bash_conpletion
#!/usr/bin/env bash
#
#
# Instalador de programas e customizações para utilização diária
#
# Github:     https://github.com/dramos777/
# Autor:      Emanuel Dramos
# Manutenção: Dramos
#
# ------------------------------------------------------------------------ #
# Criado para instalar os programas/customs que mais utilizo de forma automatizada
#
#  Exemplos:
#      $ ./favorite.sh
#      Inicia o programa.
# ------------------------------------------------------------------------ #
# Histórico:
#
#   v1.0 09/09/2022, Emanuel Dramos:
# ------------------------------------------------------------------------ #
# Testado em:
#   Debian 11
# ------------------------------------------------------------------------ #
# Agradecimentos:
#
# ------------------------------------------------------------------------ #
# ------------------------------- VARIÁVEIS ----------------------------------------- #
# 
#
#
# ------------------------------------------------------------------------ #

# ------------------------------- TESTES ----------------------------------------- #

# ------------------------------------------------------------------------ #

# ------------------------------- FUNÇÕES ----------------------------------------- #

# ------------------------------------------------------------------------ #

# ------------------------------- EXECUÇÃO ----------------------------------------- #

cat vars/shebang > tmp/links.sh   && \
cat vars/links >> tmp/links.sh    && \
cat vars/wget >> tmp/links.sh     && \
chmod +x tmp/links.sh             && \
bash tmp/links.sh
