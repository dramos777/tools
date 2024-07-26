#!/bin/bash

# Verifica se o usuário forneceu uma string de pesquisa e um diretório
if [ "$#" -ne 2 ]; then
    echo "Uso: $0 <string> <diretório>"
    exit 1
fi

# Armazena a string e o diretório fornecidos pelo usuário
string=$1
diretorio=$2

# Verifica se o diretório existe
if [ ! -d "$diretorio" ]; then
    echo "O diretório '$diretorio' não existe."
    exit 1
fi

# Executa a pesquisa usando grep
grep -rnl "$diretorio" -e "$string"

# Explica as opções usadas:
# -r: Pesquisa recursivamente em subdiretórios
# -n: Exibe o número da linha onde a string foi encontrada
# -l: Exibe apenas os nomes dos arquivos onde a string foi encontrada

