# Discos
Tabela (esquema) de particionamento >> GPT, MSDOS, ETC
Tipo de particionamento >> Primario, Extendida, lógica
Tipo de sistema de arquivo >> EXT2, EXT4, NTFS, SWAP, ETC

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

### Sistemas de arquivos

ext2
```
Tamanho máximo da partição - 2Tb - 16Tb (número de blocos limitados a 65 536)

Tamanho máximo de Arquivo - 16Gb
```
ext3

```
Tamanho máximo da partição 2Tb - 32Tb - (número de blocos limitados a 65 536)

Tamanho máximo de Arquivo - 16Gb - 2Tb
```
ext4
```

Tamanho máximo da partição - 1Eb (número de blocos limitados a 65 536)

Tamanho máximo de Arquivo - 16Tb (para blocos de 4k)
```

Detalhes sobre o cálculo de blocos e como atingir valores máximos, podem ser

encontrados em:
```

https://pt.wikipedia.org/wiki/Ext4

https://pt.wikipedia.org/wiki/Ext3
```

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
b >> Cria um backup do esquema de particionamento do disco
w >> Write as configurações alteradas
z >> Destroy a estrutura de dados da partição (similar ao wipefs -a)

```
### parted
```
parted /dev/sdb >> Seleciona o disco /dev/sdb
print >> Exibe as partições existentes no HD
help >> Ajuda do comando parted
mklabel msdos >> Cria um nova tabela (esquema) de partição msdos
mkpart >> Cria uma partição do tipo primaria/estendida/logica e o sistema de arquivos (ext3, ext4, etc)
unit kB >> Vai alterar a visualização da unidade de medida para kilobytes
unit mB >> Vai alterar a visualização da unidade de medida para megabytes
rm >> Remove a partição (após o rm ele vai perguntar qual o número da partição)
```
### cfdisk
O cfdisk é interativo. As opções estarão na tela
```
cfdisk /dev/sdb >> Seleciona o disco /dev/sdb
```

### Formatar partição
```
mkfs.ext3 /dev/sdb1 >> Formata a partição /dev/sdb1 como ext3
mkswap /dev/sdb1 >> Formata a partição /dev/sdb1 como swap
wipefs -a /dev/sdb >> Apaga/Destroi dados de partições criadas em /dev/sdb

```
### mklost+fourd
mklost+found >> Cria a pasta lost+found no diretório corrente


