# Gerenciamento de Discos
Tabela (esquema) de particionamento (GPT, SGI, DOS, SUN)


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

#### xfs
Se sobressai melhor em sistemas que possuem um número de gravações muito grande (servidor de e-mails, por exemplo). A capacidade de recuperação de arquivos em caso de corrompimento é bem grande
```
apt update && apt install xfsprogs
```
#### reiserfs
Indicado para armazenamento de arquivos pequenos (5k, 10k) porque ele trabalha com a unidade de alocação de forma mais dinâmico
```
apt update && apt install reiserfs-progs
```
#### btrfs
Para instalar:
```
apt update && apt install btrfs-tools
```
Sistema de arquivo de segunda geração. Além da capacidade de armazenamento normal de arquivo também permite o armazenamento compactado de arquivos, deduplicação e RAID (2 arquivos iguais ocupam o mesmo espaço no disco caso estejam em diretorios diferentes. 

**OBS1.:** A opção de compactação não vem ativa por padrão, é necessário utilzar ferramentas de terceiros para ativar. Ex:
```
mount /dev/sdb1 /mnt -o compress
```
**OBS2.:** Cuidado com a opção de compactação pois consome mais CPU

#### zfs
Sistema de arquivos de segunda geração com compactação e deduplicação nativas, mas possui licença incompatível com o Linux e por isso não é distribuido por padrão nas distribuições. Para utilizar o zfs é necessário instalar o suporte a ele na distribuição

### /etc/mke2fs.conf

Arquivo de configuração contendo as especificações utilizado na criação das partições.

**block size** --> Tamanho de cada bloco do arquivo. Ex com block size 1024: Um arquivo ocupa no mínimo 1024 de tamanho em disco. Caso ultrapasse o tamanho de 1024 ele vai usar mais um bloco de 1024 para completer seu tamanho.

**inode ratio** --> Espaçamento entre cada block size

### Formatar partição

- Formatar a partição /dev/sdb1 como ext4 seguindo as especificações do fs_types news disponvível no arquivo /etc/mke2fs.conf
```
mkfs.ext4 -T news /dev/sdb1
```
- Formatar a partição /dev/sdb1 como swap
```
mkswap /dev/sdb1
```

- Apagar/Destruir os dados das partições criados em /dev/sdb
```
wipefs -a /dev/sdb
```

- Formatar a partição como ext4 levando em consideração o inode_ratio do largefile (Essas especificações estão disponível em /etc/mke2fs.conf)
```
mkfs.ext4 -T largefile /dev/sdb1
```

### mklost+fourd
- Criar a pasta lost+found no diretório corrente
```
mklost+found
```

### blkid
- Exibir apenas o UUID da partição /dev/sdb1
```
blkid -s UUID /dev/sdb1 >> Retorna apenas o UUID da partição /dev/sdb1
```

### /etc/fstab
|file system | mount point | type | options | dump | check |
|------------|-------------|------|---------|------|-------|
|/dev/sdb6   |	/var       |ext4  |defaults |	0  |	1  |

#### Mapa de opções do arquivo /etc/fstab
**defaults** --> Opções defaults

**noatime** --> Não atualiza o access time dos arquivos

**nodiratime** --> Não atualiza o access time dos diretórios

**norelatime** --> Não atualiza o access time dos inodes

**noexec** --> Não permite executáveis no sistema de arquivos nem mesmo ao usuário root

**nosuid** --> Não permite criar arquivos suid

**nodev** --> Não permite a criação de dispositivos

**rw** --> Read and Write

**ro** --> Read only

**errors=remount-ro** --> Em caso de erros remonta como Read Only

**commit=60** --> Realiza o sync do disco a cada 60 segundo

### mount
O comando mount é utilizado para montar e remontar partições. Ele permite opões durante a montagem
- Remontar o ponto de montagem /var
```
mount -o remount /var
```
- Exibir informações de montagem de /var
```
mount -a|grep -i var
```

### dumpe2fs
Exibir dados internos do disco relacionado a formatação do sistema de arquivos (label, uuid, status do filesystem, contagem de blocos, blocos reservados, etc)
```
dumpe2fs /dev/sdb1
```

### tune2fs
- Adicionar a label LabelName na partição /dev/sdb1
```
tune2fs -L LabelName /dev/sdb1
```
- Alterar o mount count para 10
```
tune2fs -c 10 /dev/sdb1
```
Alterar o intervalo de checagem de disco com fsck para 180 dias, ou seja, quando o servidor atingir 180 dias de uso ele realizará uma checagem de disco
```
tune2fs -i 180 /dev/sdb1
```
- Altera o comportamento caso ocorra um erro no sistema de arquivos remontando como somente leitura
```
tune2fs -e remount-ro /dev/sdb1
```
- Alterar para 1% o espaço reservado ao root
```
tune2fs -m 1 /dev/sdb1
```
- Altera para 0.1% o espaço reservado ao root
```
tune2fs -m 0.1 /dev/sdb1
```
- Remover o Journal do sistema de arquivos. Esta opção melhora a performace diminuindo o IO de disco, principalmente quando utilizado em rede. Esta técnica foi adotada massivamente por ambientes de clouds.
```
tune2fs -O ^has_journal /dev/sdb1
```
- Habilita o Journal do sistema de arquivos.
```
tune2fs -O has_journal /dev/sdb1
```

### truncate
- Criar um "disco" dinamicamente alocado de 1G em teste.img. Depois de driado é possível formatar e montar o sistema de arquivos (mkfs.ext4 teste.img)
```
truncate -s 1G teste.img
```

### dd
- Criar um "disco" com tamanho real de 1G. Depois de criado é possível formatar e montar (mkswap teste.img)
```
dd fi=/dev/zero of=teste.img bs=1024 count=1024000
```

### lsblk
- Exibir uma arvore com os discos e partições existentes
```
lsblk
```
# LVM - Logical Volume Manager
Instalar pacote lvm
```
apt update && apt install lvm2
```
Para entender o LVM é necessário pensar em camadas:
- **Physical Volume** ou **PV** --> possui o tamanho fixo. Na criação da partição será necessário utilizar o tipo de sistema de arquivos como LVM (utilizando o cfdisk, por exemplo).

- **Group Volume** ou **GV** --> "Agrupa" os PVs para dar a intenção de maior capacidade

- **Logical Volume** ou **LV** --> É o volume que de fato será formatado (ext4, xfs, etc) e montado no sistema.

### Physical Volume

- Criar um volume fisico (Physical Volume) na partição /dev/sdb1
```
pvcreate /dev/sdb1
```
- Exibir informações dos PVs criados
```
pvdisplay
```
- Exibir informações dos PVs criados de forma sumarizada
```
pvs
```

### Group Volume
- Criar um grupo de volumes (GV ou Group Volume) chamado vg-tecnogaps e adiciona a partição /dev/sdb1 ao grupo
```
vgcreate vg-technogaps /dev/sdb1
```
- Exibir informações dos GVs criados
```
vgdisplay
```
- Exibir informações dos GVs criados de forma sumarizada
```
vgs
```

- Expande o GV vg-technogaps, ou seja, adiciona a partição /dev/sdb2 ao grupo já existente chamado vg-technogaps
```
vgextend vg-technogaps /dev/sdb2
```
### Logical Volume
- Criar um Volume Lógico (LV ou Logical Volume) chamado lv-technogaps com tamnho de 200M utilizando o GV vg-technogaps
```
lvcreate -n lv-technogaps -L 200M vg-technogaps
```
- Exibir informações dos LVs criados
```
lvdisplay
```
- Exibir informações dos LVs criados de forma sumarizada
```
lvs
```

- Formatar o volume lógico criado
```
mkfs.ext4 /dev/vg-technogaps/lv-technogaps
```

- Adicionar 200M no PV lv-technogaps
```
lvextend -L +200M /dev/vg-technogaps/lv-technogaps
```
- Determinar o valor total de 400M para o PV lv-technogaps
```
lvextend -L 400M /dev/vg-technogaps/lv-technogaps
```

- Resize sistema de arquivos ext4
```
resize2fs /dev/vg-technogaps/lv-technogaps
```
### fstrim (Discard SSD)
- Escanear e liberar todo o sistema de arquivos que tenha o discard. (Utilizar esta técnica em discos SSD é recomendado para otimizar o uso do disco e diminuir lentidão no sistema. OBS.: Agendar para ser executado periodicamente ou no login da máquina)
```
fstrim -va
```
