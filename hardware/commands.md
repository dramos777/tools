### date
O comando date gerencia a data e hora do sistema.

- Altera a data/hora atual para 16 de novembro de 1987 às 12:00h (syntax: mes dia hora ano)
```
date 111612001987
```
Exibir a data (ex: 02-10-2022 07:52:53). Esta syntax é muito utilizada em script para logar início e término de determinada tarefa:
```
date "+%d-%m-%Y %T"
```
### hwclock
Comando utilizado para aplicar alterações de data de hora no sistema e no hardware(bios)

- Enviar o horário do systema pro hardware:
```
hwclock --systohc
```
- Eviar o horário do hardware pro systema:
```
hwclock --hctosys
```

### df
- Lista somente sistemas de arquivos locais. Não exibe sistema de arquivo montado via rede
```
df -l
```
- Exibir a saída em Megabytes. Util quando precisa tratar a saida em scripts
```
df -m
```
- Exibir detalhes, inclusive pseudo filesystem
```
df -a
```
- Exibir os inodes
```
df -i
```
- Exibir qual sistema de arquivo está sendo usado em cada partição
```
df -T
```
- Exibir apenas as partições que estão formatadas com ext4
```
df -t ext4 
```
- Exibir a saída em formato posix (util em scripts)
```
df -P 
```

### du
- Exibir em formato humano e sumariza o tamanho
```
du -hs /tmp/diretorio
```
- Exibir em kbytes
```
du -k /tmp/diretorio
```
- Exibir em mbytes
```
du -m /tmp/diretorio
```
- Exibir os dados dos inodes ao invés de kbytes
```
du --inodes /tmp/diretorio
```

### free
- Exibir informações da memória física e swap da estação
```
free
```
- Exibir em kilobytes (bloco de 1000)
```
free --kilo
```
- Exibir em kilobytes (bloco de 1024)
```
free --kibi
```
- Exibir em megabytes (bloco de 1000)
```
free --mega
```
- Exibir em megabytes (bloco de 1024)
```
free --mebi
```
- Exibir em gigabytes (bloco de 1000)
```
free --giga
```
- Exibir em gigabytes (bloco de 1024)
```
free --gibi
```

Exibir em megabytes a cada 1 segundo
```
free --mega -s 1
```

### dmesg
- Prender a tela do demesg para exibir tudo que está ocorrendo naquele momento
```
dmesg -w
```
- Classificar as mensagens de forma mais legível
```
dmesg -x
```
- Exibir o timestemp do boot e transformar para uma forma mais legível
```
dmesg -T
```
- Limpar as mensagens do buffer do Kernel
```
dmesg -c
```

### uname

- Exibir dados do sistema como Versão do Linux, arquitetura
```
uname -a
```
- Exibir o kernel
```
uname -s
```
- Exibir o nome da máquina
```
uname -n
```
- Exibir a versão atual do kernel
```
uname -r
```
- Exibir a data que o kernel foi compilado
```
uname -v
```
- Exibir a arquitetura utilizada no kernel
```
uname -m
```

### mount
- Remontar o ponto de montagem /var
```
mount -o remount /var
```
- Exibir todas as configurações dos pontos de montagens. Interessante utilizar com o grep pra filtrar e checar as opções de ponto de montagem
```
mount -a
```
- Remontar o ponto de montagem /var como somente leitura
```
mounte -o remount,ro /var
```

### irqtop
- Instalar o pacote irqtop
```
apt update && apt install irqtop
```
- Similuar a o comando top só que para gerenciar interrupções e I/O
```
irqtop
```

### lspci
- Exibir os periféricos que estão conectados no barramento PCI do sistema
```
lspci
```
- Exibir detalhes das configurações dos periféricos PCI conectados (IRQ, IO Port, Módulo do Kernel, Região de memória alocado)
```
lspci -vv
```

### lsusb
- Exibir os periféricos que estão conectados no barramento USB do sistema
```
lsusb
```

### lshw
- Instalar o pacote lshw
```
apt update && apt install lshw
```
- Escanear os hardware e exibe as informações na tela em formato de arvore
```
lshw
```
# Firmware
```
apt install firmware-linux-nonfree firmware-misc-nonfree -y
```

**/lib/firmware** --> Diretório padrão das firmwares instaladas na máquina

Para adicionar firmwares proprietários é necessários editar o arquivo **/etc/apt/source.list** para que busque em reposítórios fora da main (contrib, non-free) ou baixar a firmware e instalar manualmente.

Depois do arquivo **/etc/source.list** editado com as flags **contrib** e **non-free** é possível executar o comando apt search **firmware-linux-nonfree** e encontrar os pacotes fora da main. O pacote **firmware-misc-nonfree** também possui algumas otimizações do sistema

### lsof
- Exibir os arquivos do diretório /var abertos e o PID do processo
```
lsof /var >> Vai exibir os arquivos do diretório /var abertos e o PID do processo
```
- Exibir o PID do processo dos arquivos abertos no diretório /var
```
lsof -t /var >> Vai exibir o PID do processo dos arquivos abertos no diretório /var
```

### top

**m** --> Muda a forma que a memória é exibida

**1** --> Muda a forma de exibição do CPU


**M** --> Classifica por uso de memória

**F** --> Abre o seletor de classificação

**k** --> Disponibiliza campo para matar processos

**d** --> Altera o delay de atualização

**W** --> Salva customização


### top na linha de comandos
- Ignorar os processos zumbis
```
top -i
```
- Exibir a linha de comandos na listagem do processo
```
top -c
```

### nice/renice (prioridade padrão 0; maior prioridade -20; menor prioridade 19)
**Obs**.: Prioridades abaixo de 0 apenas o root tem permissão para alterar
- Iniciar o processo sleep com prioridade 10
```
nice -n 10 sleep 1000
```
- Reajustar a prioridade do processo 597 com nice = 15
```
renice -n 15 -p 597
```
- Reajustar todos os processos do usuário teste com prioridade 15
```
renice -n 15 -u teste
```
- Reajustar todos os processos do grupo teste com prioridade 15
```
renice -n 15 -g teste
```

### tload
- Exibir de forma gráfica um resumo dos processos rodando
```
tload
```

### vmstat
- Exibir um resumo do uso de memória, cpu, swap, system e io
```
vmstat >> Exibe um resumo do uso de memória, cpu, swap, system e io
```
- Exibir atualização do resumo da memória a cada 1 segundo
```
vmstat 1 >> Exibe atualização a cada 1 segundo
```

### ps
- Exibir os processos rodando no terminal corrent
```
ps
```
- Exibir os processos rodando em todos os terminais
```
ps -a
```
- Exibir os processos de todos os usuários do sistema sendo de terminais ou não
```
ps -ax
```
- Exibir os processos de todos os usuários
```
ps -aux
```
- Exibir detalhes do uso de memória
```
ps -axm
```
- Exibir as variáveis de ambientes utilizdas na execução do comando (o w server para exibir toda alinha)
```
ps -axew
```
- Classificar a saída com base no pid
```
ps -aux --sort=pid
```
- Classificar a saída com base na memória residente (RSS)
```
ps -ax --sort=rss
```

### pidof
- Exibir o PID do processo do cron (obs. É necessário passar o nome exato do programa rodando)
```
pidof cron
```

### pstree
- Exibir os processos em forma de "arvore"
```
pstree
```
- Exibir toda a estrutura, incluindo os processos PAI
```
pstree -c
```
- Exibir a estrutura destacando o processo PAI
```
pstree -h
```
- Exibir o PID dos processos entre ()
```
pstree -p
```

### kill
- Matar o processo de forma forçada
```
kill -9
```
- Mandar o processo reler as configurações sem finalizar
```
kill -HUP
```
- Matar um job que esteja rodando em segundo plano
```
kill %3
```

### pgrep
- Pesquisar todos os processos que possuem sshd e retornar o PID
```
pgrep sshd
```
- Exibir o PID de todos os processos do usuário root que tenham sshd
```
pgrep -u root sshd
```

### pkill
- Matar todos os processos que tenha firefox 
```
pkill firefox
```
- Matar todos os processos do usuário root que tenha firefox
```
pkill -u root firefox
```

### killall
- Matar todos os processos do usuáro root que tenha firefox
```
killall -u root firefox
```
- Matar todos os processos
```
killall5
```

### nohup
O nohup "proteje" o processo em execução pra que ele não seja afetado por sinais de interrupções que sejam diferentes de kill -9 ou kill -15. Ex:
```
nohup sleep 200
```

### &
- Iniciar o programa sleep em backgraound
```
sleep 100 &
```

### CTRL + z
- Enviar um programa que já está rodando em foreground para backgraund
```
CTRL+z
```

### jobs
- Exibir os jobs que estão rodando em background
```
jobs
```

### bg
- Iniciar um programa com ID 3 que está parado em background (um programa enviado para background pelo CTRL+x não inicia automaticamente. É necessário utilizar o comando bg)
```
bg %3
```

### fg
- Enviar o job 3 rodando em background para foreground
```
fg %3
```

### kill
- Mata o job 3 de um programa que está rodando em background
```
kill %3
```

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

#### ext2
Tamanho máximo da partição - 2Tb - 16Tb (número de blocos limitados a 65 536)

Tamanho máximo de Arquivo - 16Gb

#### ext3

Tamanho máximo da partição 2Tb - 32Tb - (número de blocos limitados a 65 536)

Tamanho máximo de Arquivo - 16Gb - 2Tb

#### ext4
Tamanho máximo da partição - 1Eb (número de blocos limitados a 65 536)

Tamanho máximo de Arquivo - 16Tb (para blocos de 4k)

Detalhes sobre o cálculo de blocos e como atingir valores máximos, podem ser encontrados em:
```
https://pt.wikipedia.org/wiki/Ext4

https://pt.wikipedia.org/wiki/Ext3
```

### fdisk
- Listar os discos e as partições
```
fdisk -l
```

- Seleciona a partição /dev/sdb para ser alterada
```
fdisk /dev/sdb
```
**p** --> Faz o print das partições do disco

**m** --> Exibe um help dos comandos

**g** --> Cria uma nova tabela (esquema) de partição GPT

**o** --> Cria uma nova tabela (esquema) de partição DOS

**n** --> Cria uma nova partição

**t** --> Altera o tipo da partição (L exibe a lista de partições, 82 swap, 83 Linux)

**w** --> Write as alterações realizadas

### gdisk

- Selecionar a partição /dev/sdb para ser alterada
```
gdisk /dev/sdb
```
**?** --> Exibe as teclas de atalho (help)

**i** --> Exibe detalhes de partições criadas

**l** --> Lista partições conhecidas no alvo


**o** --> Cria uma nova tebela (esquema) de partição GPT

**n** --> Cria uma nova partição

**b** --> Cria um backup do esquema de particionamento do disco

**w** --> Write as configurações alteradas

**z** --> Destroy a estrutura de dados da partição (similar ao wipefs -a)

### parted
Selecionar o disco /dev/sdb
```
parted /dev/sdb
```
**print** --> Exibe as partições existentes no HD

**help** --> Ajuda do comando parted

**mklabel msdos** --> Cria um nova tabela (esquema) de partição msdos

**mkpart** --> Cria uma partição do tipo primaria/estendida/logica e o sistema de arquivos (ext3, ext4, etc)

**unit kB** --> Vai alterar a visualização da unidade de medida para kilobytes

**unit mB** --> Vai alterar a visualização da unidade de medida para megabytes

**rm** --> Remove a partição (após o rm ele vai perguntar qual o número da partição)

### cfdisk
O cfdisk é interativo. As opções estarão na tela
```
cfdisk /dev/sdb >> Seleciona o disco /dev/sdb
```
### /etc/mke2fs.conf

Arquivo de configuração contendo as especificações utilizado na criação das partições.

**block size** --> Tamanho de cada bloco do arquivo. Ex com block size 1024: Um arquivo ocupa no mínimo 1024 de tamanho em disco. Caso ultrapasse o tamanho de 1024 ele vai usar mais um bloco de 1024 para completer seu tamanho.

**inode ratio** --> Espaçamento entre cada block size

### Formatar partição

- Formatar a partição /dev/sdb1 como ext3
```
mkfs.ext3 /dev/sdb1
```
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
- Exibir o UUID da partição /dev/sdb1
```
blkid /dev/sdb1 >> Retorna o UUID da partição /dev/sdb1
```
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
# ACPI
O acpid é responsável pelo controle e monitoramento do acpi da máquina. Ele gerencia o desligamento correto utilizando o botão da máquina, por exemplo, além de permitir a customização utilizando os arquivos do diretório /etc/acpi.

- Instalar o acpi
```
apt update && apt install acpid
```

**OBS**.: Por padrão o systemd já possui suporte para desligamento usando ACPI e o gerenciamento é feito através do arquivo /etc/systemd/logind.conf, mas é menos flexivo, ele só permite utilizar as configurações padrões dele enquanto no ACPI é possível determinar um script
