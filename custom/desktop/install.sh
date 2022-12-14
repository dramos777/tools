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
#Basic Config
scripts/basic-programs.sh && \
scripts/add-to-sudo.sh    && \
scripts/firmware.sh       && \
scripts/skel.sh           && \
scripts/swappiness.sh     && \
scripts/fstab.sh	  && \

#To install some programs with dpkg
cat vars/shebang > tmp/links.sh   && \
cat vars/links >> tmp/links.sh    && \
cat vars/wget >> tmp/links.sh     && \
chmod +x tmp/links.sh             && \
bash tmp/links.sh                 && \
scripts/remove.sh                 && \
scripts/dpkg-programs.sh          && \
scripts/docker.sh                 && \

#To install zsh and configure it
scripts/zsh/zsh-root.sh           && \
scripts/zsh/zsh-user.sh           && \

#To clean
apt autoremove -y && apt clean -y
