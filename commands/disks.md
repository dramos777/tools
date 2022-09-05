# Discos

Tipo DOS
```
Rótulos - GPT, SGI, DOS, SUN
Os rótulos são esquemas de particionamento.
Sistemas com boot UEFI precisa ter o esquema de particionamento GPT obrigatoriamente, porém um esquema de particionamento GPT também pode ser instalado em sistemas com BIOS no Linux
De 1 a 4 - partições primárias
Limite de até 2TB de tamanho de partições

```
Tipo GPT
Não possui um número limite de partições primárias expecificadas, mas no geral são 128 partições primárias disponíveis
Limite de tamanho de até 9,4ZB (Zetabytes - 1 trilhão de GB)

### fdisk
```
fdisk -l >> Lista os discos e as partições

fdisk /dev/sdb >> Seleciona a partição /dev/sdb para ser alterada
p >> Faz o print das partições do disco
m >> Exibe um help dos comandos

g >> Cria uma nova tabela (esquema) de partição GPT
o >> Cria uma nova tabela (esquema) de partição DOS
n >> Cria uma nova partição
t >> Altera o tipo da partição (L exibe a lista de partições, 82 swap, 83 Linux)
w >> Write as alterações realizadas

```
### gdisk

```
gdisk /dev/sdb >> Seleciona a partição /dev/sdb para ser alterada
? >> Exibe as teclas de atalho (help)
i >> Exibe detalhes de partições criadas
l >> Lista partições conhecidas no alvo

o >> Cria uma nova tebela (esquema) de partição GPT
n >> Cria uma nova partição

```

### Formatar partição
```
mkfs.ext3 /dev/sdb1 >> Formata a partição /dev/sdb1 como ext3
mkswap /dev/sdb1 >> Formata a partição /dev/sdb1 como swap
wipefs -a /dev/sdb >> Apaga/Destroi dados de partições criadas em /dev/sdb

```
