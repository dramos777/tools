# Gerenciamento de Discos
Tabela (esquema) de particionamento (GGPT, SGI, DOS, SUN)


Tipo de particionamento (Primario, Extendida, lógica)


Tipo de sistema de arquivo (ext2, ext3, ext4, ntfs, swap, etc)

### Esquema/rótulo de particionamento do tipo DOS
- De 1 a 4 - partições primárias
- Limite de até 2TB de tamanho de partições

### Esquema/rótulo de particionamento do tipo GPT
- Não possui um número limite de partições primárias expecificadas, mas no geral são 128 partições primárias disponíveis
- Limite de tamanho de até 9,4ZB (Zetabytes - 1 trilhão de GB)
- Sistemas com boot UEFI precisa ter o esquema de particionamento GPT obrigatoriamente, porém um esquema de particionamento GPT também pode ser instalado em sistemas com BIOS no Linux

### Sistemas de arquivos

#### ext2
```
Tamanho máximo da partição - 2Tb - 16Tb (número de blocos limitados a 65 536)

Tamanho máximo de Arquivo - 16Gb
```
#### ext3

```
Tamanho máximo da partição 2Tb - 32Tb - (número de blocos limitados a 65 536)

Tamanho máximo de Arquivo - 16Gb - 2Tb
```
#### ext4
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
### /etc/mke2fs.conf

Arquivo de especificações utilizado na criação das partições.
block size >> Tamanho de cada bloco do arquivo. Ex com block size 1024: Um arquivo ocupa no mínimo 1024 de tamanho em disco. Caso ultrapasse o tamanho de 1024 ele vai usar mais um bloco de 1024 para completer seu tamanho.
inode ratio >> Espaçamento entre cada block size

### Formatar partição
```
mkfs.ext3 /dev/sdb1 >> Formata a partição /dev/sdb1 como ext3
mkfs.ext4 -T news /dev/sdb1 >> Formata a partição /dev/sdb1 como ext4 seguindo as especificações do fs_types news disponvível no arquivo /etc/mke2fs.conf
mkswap /dev/sdb1 >> Formata a partição /dev/sdb1 como swap

wipefs -a /dev/sdb >> Apaga/Destroi dados de partições criadas em /dev/sdb

mkfs.ext4 -T largefile /dev/sdb1 >> Vai formatar a partição como ext4 levando em consideração o inode_ratio do largefile (Essas especificações estão disponível em /etc/mke2fs.conf)

```
### mklost+fourd
```
mklost+found >> Cria a pasta lost+found no diretório corrente
```

### blkid
```
blkid /dev/sdb1 >> Retorna o UUID da partição /dev/sdb1
blkid -s UUID /dev/sdb1 >> Retorna apenas o UUID da partição /dev/sdb1
```

### /etc/fstab
<file system>  	<mount 	point>  <type>  <options>  	<dump>  <check>
/dev/sdb6	/var		ext4	defaults	0	1

```
defaults >> Opções defaults
noatime >> Não atualiza o access time dos arquivos
nodiratime >> Não atualiza o access time dos diretórios
norelatime >> Não atualiza o access time dos inodes
noexec >> Não permite executáveis no sistema de arquivos nem mesmo ao usuário root
nosuid >> Não permite criar arquivos suid
nodev >> Não permite a criação de dispositivos
rw >> Read and Write
ro >> Read only
errors=remount-ro >> Em caso de erros remonta como Read Only
commit=60 >> Realiza o sync do disco a cada 60 segundo

mount -o remount /var >> Remonta o ponto de montagem /var
mount -a|grep var >> Vai exibir informações de montagem de /var
```

### dumpe2fs
```
dumpe2fs /dev/sdb1 >> Exibe dados internos do disco relacionado a formatação do sistema de arquivos (label, uuid, status do filesystem, contagem de blocos, blocos reservados, etc)
```

### tune2fs
```
tune2fs -L LabelName /dev/sdb1 >> Adiciona a label LabelName na partição /dev/sdb1
tune2fs -c 10 /dev/sdb1 >> Altera o mount count para 10
tune2fs -i 180 /dev/sdb1 >> Altera o intervalo de checagem de disco com fsck para 180 dias, ou seja, quando o servidor atingir 180 dias de uso ele realizará uma checagem de disco
tune2fs -e remount-ro /dev/sdb1 >> Altera o comportamento caso ocorra um erro no sistema de arquivos remontando como somente leitura
tune2fs -m 1 /dev/sdb1 >> Altera para 1% o espaço reservado ao root
tune2fs -m 0.1 /dev/sdb1 >> Altera para 0.1% o espaço reservado ao root
tune2fs -O ^has_journal /dev/sdb1 >> Remove o Journal do sistema de arquivos. Esta opção melhora a performace diminuindo o IO de disco, principalmente quando utilizado em rede. Esta técnica foi adotada massivamente por ambientes de clouds.
tune2fs -O has_journal /dev/sdb1 >> Habilita o Journal do sistema de arquivos.

```
### truncate
truncate -s 1G teste.img >> Cria um "disco" dinamicamente alocado de 1G em teste.img. Depois de driado é possível formatar e montar o sistema de arquivos (mkfs.ext4 teste.img)

### dd
dd fi=/dev/zero of=teste.img bs=1024 count=1024000 >> Cria um "disco" com tamanho real de 1G. Depois de criado é possível formatar e montar (mkswap teste.img)

###lsblk
lsblk >> Exibe uma arvore com os discos e partições existentes
