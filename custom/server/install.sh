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
#Basic config
scripts/basic-programs.sh && \
scripts/add-to-sudo.sh    && \
scripts/firmware.sh       && \
scripts/skel.sh           && \
scripts/swappiness.sh     && \

#To install programs using dpkg
#mkdir tmp                         && \
#cat vars/shebang > tmp/links.sh   && \
#cat vars/links >> tmp/links.sh    && \
#cat vars/wget >> tmp/links.sh     && \
#chmod +x tmp/links.sh             && \
#bash tmp/links.sh                 && \
#scripts/dpkg-programs.sh          && \

#To install docker
scripts/docker.sh                 && \

#To clean
apt autoremove -y and apt clean -y
