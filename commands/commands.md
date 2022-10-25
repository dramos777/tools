### Comando ls
O comando **ls** é utilizado basicamente para listar conteúdo de diretórios e informações úteis para o gerenciamento de arquivos.

Listar arquivos sem exibir backup (arquivos com ~ no final):
```
ls -B

```
Listar arquivos diferenciando por cores:

```
ls --color=auto

```
Remover cores da lista (inverso do comando ls --color=auto):

```
ls --color=never
```

O comando ls permite listar o conteúdo de mais de um diretório ao mesmo tempo:

```
ls Diretorio1 Diretorio2

```
Listar apenas o nome diretório sem listar o conteúdo:

```
ls -ld
```

Classificar a listagem por ordem de criação do inode de disco do arquivo/diretorio

```
ls -lf

```
Listar diretório colocando identificadores no final dos arquivos (/ para diretorios, = para caracteres, @ para link simbolico, * para executaveis):

```
ls -F

```
Ocultar a coluna Grupos da listagem

```
ls -lG

```
Não resolver nomes na listagem (substitui nome/grupo por id/gid)

```
ls -ln

```
Exibir apenas o dono do arquivo (-o de own)

```
ls -lo

```
Exibir apenas o grupo do arquivo

```
ls -lg

```
Exibir a listagem com uma / no final dos diretórios

```
ls -lp

```
Classificar a listagem por data, ordem atualização do arquivo/diretorio (mais recentes primeiro)

```
ls -lt

```
Inverter a classificação da listagem

```
ls -lr

```
Exibir a listagem classificada por data de forma invertida, inclusive arquivos ocultos. (ideal para auditoria de logs, para saber os logs que foram alterados por ultimo)

```
ls -lhatr

```
Classificar pela data de criação (ctime)

```
ls -lc

```
Classificar pela externsão do arqivo

```
ls -lX

```
Listar os diretorios de forma recursiva

```
ls -lR

```
#### CORINGAS
Coringas são caracteres especiais que são interpretados pelos programas
- Exibir arquivos que iniciam com **m** e tenham no segundo caractere as letras **a, b, c, d, e, f ou g**.
```
ls m[a-g] /tmp/diretorio/
```
- Exibir arquivos que iniciam com **m** com exceção dos arquivos que tenham como segundo caractere as letras de **a - g**:
```
ls m[^a-g] /tmp/diretorio/
```
- Exibir todos os arquivos que iniciam com x tenham zd ou ze após ele e qualquer caraceter no final:
```
ls x{zd,ze}* /usr/bin
```
saída do comando acima:
```
xzdiff xzegrep
```

### rmdir 
O comando rmdir remove diretório que estejam vazios

```
#Apagar pastas vazias recursivamente:
rmdir -p /tmp/diretorio1/diretorio2/diretorio3
```

### cat
O comando **cat** é utilizado para concatenar aquivos. No geral, ele é usado para exibir conteúdo de arquivos
```
#Visualizar conteúdo de arquivo:
cat /tmp/arquivo.txt

#Colocar um $ no final da linha do arquivo. Util para identificar linhas que encerram com espaço.
cat -E /tmp/arquivo.txt
```
### Variações do comando cat
```
#Visualizar arquivos .gz:
zcat /tmp/arquivo.gz

#Visualizar arquivos .bz2:
bzcat /tmp/arquivo.bz2

#Visualizar arquivos .xz:
xzcat /tmp/arquivo.xz
```

### cp
O comando **cp** é utilizado para copiar arquivos/diretorios

- Forçar copia e exibir em modo verbose
```
cp -vf arquivo.txt /tmp/
```
- Copiar apenas se o arquivo destino for mais antigo que o arquivo origem(update)
```
cp -vu arquivo.txt /tmp/
```
- Preservar dono/grupo do arquivo
```
cp -p arquivo.txt /tmp/ 
```

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

### find
- Pesquisar apenas arquivos que tenham o nome teste:
```
find . -type f -name teste
```
- Pesquisar apenas diretorios que tenham o nome teste
```
find . -type d -name teste
```
- Pesquisar pelo nome teste em até 2 níveis de profundiade (nivel atual + 1)
```
find /usr -maxdepth 2 -name teste
```
- Pesquisar pelo nome teste iniciando a partir do nível 2 de profundiade (nivel atual + 1)
```
find /usr -mindepth 2 -name teste
```

- Pesquisar os arquivos modificados até 1 dia atrás
```
find /etc -mtime -1
```
- Pesquisar os arquivos criados até 1 dia atrás
```
find /etc -ctime -1
```
- Pesquisar os arquivos acessados até 1 dia atrás
```
find /etc -atime -1
```
- Pesquisar os arquivos acessados até 10 minutos atrás
```
find /etc -amin -10
```
- Pesquisar os arquivos criados até 10 minutos atrás
```
find /etc -cmin -10
```

- Pesquisar os arquivos modificados a mais de 1 dia atrás
```
find /etc -mtime +1
```
- Pesquisar os arquivos criados a mais de 1 dia atrás
```
find /etc -ctime +1
```
- Pesquisar os arquivos acessados a mais de 1 dia atrás
```
find /etc -atime +1
```
- Pesquisar os arquivos acessados a mais de 10 minutos atrás
```
find /etc -amin +10
```
- Pesquisar os arquivos criados a mais de 10 minutos atrás
```
find /etc -cmin +10
```

- Pesquisar arquivos pelo gid do grupo 1000
```
find /usr -gid 1000
```
- Pesquisar arquivos pelo uid do usuário 0
```
find /usr -uid 0
```
- Pesquisar arquivos pelo nome de usuário teste
```
find /home -user teste
```
- Pesquisar arquivos pelo nome de grupo teste
```
find /home -group teste
```

- Pesquisar arquivos que possuem 2 links como referência
```
find /usr -links 2
```

- Pesquisar arquivos menores que 1000 blocos
```
find /usr -size -1000
```
- Pesquisar arquivos maiores que 1000 blocos
```
find /usr -size +1000
```

- Pesquisar arquivos menores que 1000kbytes
```
find /usr -size -1000k
```
- Pesquisar arquivos maiores que 1000kbytes
```
find /usr -size +1000k
```

- Copiar os arquivos com nome ls para o diretorio /tmp
```
find /usr -iname ls -exec cp -r {} /tmp \;
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

### grep
- Exibir todas as linhas do arquivo /etc/passwd com excessão da linha que contém www-data
```
grep -v www-data /etc/passwd
```
- Procurar em /etc/passwd as expressões contidas no arquivo /tmp/expressao (a opção -f faz pesquisa com base em arquivos. No exemplo abaixo o grep iria procurar em /etc/passwd as expressões com base nas linhas do arquivo /tmp/expressao)
```
grep -f /tmp/expressao /etc/passwd
```
- Ignorar maiúscula e minúscula ("remove" o case sensitive)
```
grep -i /etc/passwd
```
- Utilizar utilizando expressões regulares ( ^ * $ [] {} . + ? | () )
```
grep -E
```
- Pesquisar caracteres especiais ao invés de interpretar como expressão
```
grep -F
```
- Exibir os arquivos que contenham determinado padrão de forma recursiva. (obs.: comando utilizado em diretórios)
```
grep -r 'Teste01' /tmp/
```
- Exibir apenas o nome do arquivo que contem determinado padrão (similar ao comando anterior, mas com a saída melhor.
```
grep -ril 'Teste01' /tmp/
```

### nl
- Enumerar as linhas pulando de 3 em 3 (obs. todas as linhas do arquivo são exibidas, apenas a numeração que pula de 3 em 3)
```
nl -i 3 /etc/passwd
```
- Enumerar as linhas começando do 3 (obs. todas as linhas são exibidas, apenas a numeração que começa do 3) 
```
nl -v 3 /etc/passwd
```

### sort
- Organizar a saída em ordem alfabética (obs.: classifica os números como se fossem strings)
```
sort
```
- Classificar a saída levando em consideração a ordem numérica (letras são classificadas primeiro)
```
sort -n
```
- Inverter a classificação
```
sort -r
```
- Exibir mensagem informando se a lista está ordenada ou não
```
sort -c
```
- Ordenar com base na segunda coluna
```
sort +1
```
- Ordenar com base no delimitador :
```
sort -t ":"
```
- Ordenar com base na segunda coluna (similuar ao +1)
```
sort -k 2
```
- Ordenar com base na segunda coluna levando em consideração o delimitador :
```
sort -t ":" -k 2
```

### time
O comando time serve basicamente para calcular o tempo de execução de um comando
- Calcular o tempo de execução do comando ls
```
time ls /usr/
```

### touch
- Se utilizado sem parâmetros cria um arquivo
```
touch /tmp/arquivo.txt
```
- Alterar a data de modificação do arquivo arquivo.txt para 16 de novembro de 1987 às 12:00h
```
touch -t 111612001987 arquivo.txt
```
- Alterar a data de ultimo acesso do arquivo arquivo.txt para 16 de novembro de 1987 às 12:00h
```
touch -a -t 111612001987 arquivo.txt
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

### su
- Eliminar todas as variáveis de ambiente antes de subir para root
```
su -
```
- Eliminar todas as variáveis de ambiente e utilizar o PATH do binário su para subir para root (prática é recomendada por questões de segurança, pois é possível ter um PATH alterado ao executar apenas o comando su)
```
/bin/su -
```
- Alterar para o usuário www-data e utilizar o shell bash. (por padrão o usuário www-data não tem um shell habilitado pra ele, a opção -s do comando su "garante" que o usuário utilize o terminal determinado no comando. Util para trobleshooting)
```
su - www-data -s /bin/bash
```

### sudo
- Adicionar o usuário technogaps no grupo sudo. (fazendo isso o usuário technogaps poderá usar o sudo utilizando sua senha convencional, ou seja, não precisará saber a senha de root propriamente dita)
```
adduser technogaps sudo
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

### reboot
- Reiniciar a máquina de forma forçada
```
reboot -f
```
- Reiniciar a máquina
```
shutdown -r now
```
- Reiniciar a máquina em um horário expecífico
```
shutdown -r 09:40
```
- Reinicia a máquina em 10min
```
shutdown -r +10
```
Reiniciar a máquina de forma extremamente forçada
```
echo b >/proc/sysrq-trigger
```

### shutdown

- Desligar a máquina
```
halt
```
- Desligar a máquina no momento que o comando for executado
```
shutdown -h now
```
- Desligar a máquina de forma extremamente forçada
```
echo o >/proc/sysrq-trigger
```
- Desligar a máquina em um horário expecífico
```
shutdown -h 09:40h
```
- Cancelar um agendamento feito anteriormente pelo comando shutdown
```
shutdown -c
```
- Desliga a máquina em 10min
```
shutdown -h +10
```

### wc
- Exibir o número de linhas, palavras e tamanho do arquivo
```
wc
```
- Exibir apenas o número de linhas
```
wc -l
```
- Exibir apenas o número de bytes
```
wc -c
```
- Exibir apenas o número de palavras
```
wc -w 
```

### seq
- Enumerar as linhas de 1 a 10
```
seq 10
```
- Enumerar as linhas começando do 2 até o 10
```
seq 2 10
```
- Enumerar as linhas iniciando em 2 e incrementando 2  até chegar no 10 (2 4 6 8 10)
```
seq 2 2 10
```
- Enumerar as linhas de 1 a 10 alinhando com um 0 a esquerda (01 02 03 04 05... 10)
```
seq -w 10
```

### attr
- Listar os atributos dos arquivos
```
lsattr
```
- Não permitir alterações ou deleções do arquivo/diretório nem mesmo com usuário root (tornar imutável)
```
chattr +i
```
- Remover o atributo imutável do arquivo/diretório
```
chattr -i
```
- Aplicar as configurações de modo recursivo
```
chattr -R
```
- Colocar o diretório em modo apend (o arquivo não pode ser deletado, apenas alterado)
```
chattr -a diretorio
```
- Colocar o arquivo em modo apend (o arquivo não pode ser deletado ou alterado, apenas aceita adição de novas linhas)
```
chattr -a arquivo
```
- Igualar os atributos (a, i, e) em todos os arquivos (*)
```
chattr =aie *
```
- Compactar o arquivo no momento do armazenamento. (obs. Algumas distros não possuem suporte a este atributo. Neste caso ele será ignorado)
```
chattr +c
```
- Utilizar atributo para deletar o arquivo de forma segura. (este atributo zera todos os dados do arquivo. Obs. Não funciona bem com sistemas com journal)
```
chattr +s
```
- Ativar o sync do arquivo para imediatamente.
```
chattr +S
```
- Ativar o sync em um diretório. CUIDADO. Este atributo grava os arquivos no disco sem passar pelo buffer e diminui a performace do sistema
```
chatt +D diretorio
```

### cut
- "Cortar" o primeiro e o sétimo campo (field) do arquivo /etc/passwd levando em consideração o delimitador :
```
cut -d ":" -f 1,7 /etc/passwd
```
- "Cortar" o intervalo de 1 a 3 do /arquivo
```
cut -d ":" -f 1-3 /arquivo
```
- "Cortar" os 4 primeiro bytes do arquivo.txt
```
cut -b 1-4 arquivo.txt
```
- "Corta" os 4 primeiros caracteres do arquivo.txt (em caractere o espaço não é contato)
```
cut -c 1-4 arquivo.txt
```

### cmp
Utilizado para comparar binários
- Comparar os arquivos e exibe o resultado na tela
```
cmp arquivo1 arquivo2
```
- Comparar os arquivos, mas não exibe o resultado, apenas guarda na variável $? o código de saída
```
cmp -s arquivo1 arquivo2
```

### diff
- Comparar e exibir as diferenças entre os arquivos arquivo1 e arquivo2
```
diff arquivo1 arquivo2
```
- Comparar os arquivos e exibe as linhas diferentes em um formato mais legível (unificado)
```
diff -u arquivo1 arquivo2
```
- Comparar e exibir as diferenças entre os diretórios diretorio1 e diretorio2. (Na saída do comando será exibido os arquivos que estão diferentes e as respectivas linhas diferentes)
```
diff -r diretorio1 diretorio2
```

#### Exemplo de utilização para atualizar um "app" (patch)
```
diff -ru /tmp/dir-app /tmp/dir-update > /tmp/diferencas.patch
cd /tmp/dir-app
patch -p1 -N < /tmp/diferencas.patch

```

- **-p1** --> Nível da pasta que o patch foi aplicado (esta opção diz: desça uma pasta para localizar o patch)
- **-N** --> Não desfazer patchs que já foram aplicados

#### Para reverter o patch aplicado
```
patch -p1 -R < /tmp/diferencas.patch
```

### whereis
whereis é utilizado para encontrar pastas de manuais por string

### which
Which é utilizado para encontra onde o binário está instalado no sistema operacional
- Exibir onde o binário do **ls** está localizado no sistema operacional
```
which ls
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
### screen
**screen** --> Abre uma screen

**CTRL+w** --> Exibe o numero de screens existentes

**CTRL+a+c** --> Cria uma nova sessão

**CTRL+a** --> Alterna entre as screens criadas

**CTRL+a+1** --> Alterna para a screen 1

**CTRL+a+2** --> Alterna para a screen 2 e assim sucessivamente

**CTRL+a+d** --> Detacha da screen sem fechar

**screen -ls** --> Lista as screens

**screen -x** --> Reconecta na screen

### tmux
**tmux new** --> Cria uma nova sessão

**CTRL+b+c** --> Cria uma nova tela

**CTRL+b+0** --> Alterna para a tela 0

**CTRL+b+1** --> Alterna para a tela 1 e assim sucessivamente

**CTRL+b+d** --> Detacha do tmux

**tmux attach** --> Reconecta em uma tmux criada

**CTRL+b+"** --> Divide a tela na horizontal

**CTRL+$** --> Divide a tela na vertical

**CTRL+b+seta pra cima/baixo** --> Alterna para a tmux de cima/baixo
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

Mapa de opções do arquivo /etc/fstab

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
- Exibir todas as configurações dos pontos de montagens. Interessante utilizar com o grep pra filtrar e checar as opções de ponto de montagem
```
mount -a
```
- Remontar o ponto de montagem /var como somente leitura
```
mounte -o remount,ro /var
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

# Administração de usuários e grupos
O carquivo */etc/passwd* é o arquivo de configuração dos usuários, nele são encontrados os nomes dos usuários, senha criptografada ou indicação de senhas (se não estiver criptografada no arquivo um x indica que a senha está no /etc/shadow), diretório home, shell, etc.

Descrição das colunas separadas por **:**
```
#usuario:x:uid:gid:comentarios:home:shell

#ex:
root:x:0:0:root:/root:/bin/bash
```
O arquivo */etc/shadow* é o arquivo de configuração das senhas dos usuários, nele são encontrados informações da conta do usuário como expiração da senha, senha criptografada, etc

O arquivo */etc/group* é o arquivo de configurção dos grupos de usuário, nele são encontrados informações como nome do grupo, GID, se o grupo tem senha e os usuários pertencentes ao grupo

O arquivo /etc/gshadow é o arquivo onde encontramos o nome do grupo, senha criptografada, administrador do grupo e membros do grupo.

**OBS.:** Quando adicionamos uma senha no grupo é possível alterar o grupo do usuário naquela sessão com o comando newgrp [-] [grupo]

### Comandos adduser e addgroup (interativo)
O arquivo de configuração é */etc/adduser.conf*, nele é possível alterar váriso parametros de criação de usuário.

Opções do comando **adduser** para usuários normais:
|                   |                     |                    |             |
|-------------------|---------------------|--------------------|-------------|
|   [--home DIR]    |   [--shell SHELL]   | [--no-create-home] | [--uid ID]  |
|  [--firstuid ID]  |   [--lastuid ID]    |   [--gecos GECOS]  | [--gid ID]  |
| [--ingroup GROUP] |[--disabled-password]| [--disabled-login] |[--add_extra_groups]|


Opções do comando **adduser** para usuários de sistema            
|                       |                  |                    |            |
|-----------------------|------------------|--------------------|------------|
| --system [--home DIR] | [--shell SHELL]  | [--no-create-home] | [--uid ID] |
|   [--gecos GECOS]     |    [--group      |    --ingroup GRUPO |  --gid ID] |
|[--disabled-password]  |[--disabled-login]|[--add_extra_groups]|            |

Exemplos:
```
#Adicionar um grupo de usuário
adduser --group [--gid ID] GRUPO
addgroup [--gid ID] GRUPO

#Adicionar um grupo de sistema
addgroup --system [--gid ID] GRUPO

#Adicionar um usuário existente a um grupo existente
adduser USUARIO GRUPO
```
Opções gerais:

| Argumento           | Descrição                                     |
|---------------------|-----------------------------------------------|
|  --quiet [-q]       | não passa informações de processo para stdout |
|  --force-badname    | permite nomes de usuário que não combinam com a variável de configuração NAME_REGEX                                                |
|  --help [-h]        | mensagem de utilização                        |
|  --version  [-v]    | número de versão e copyright                  |
|  --conf [-c] FILE   | usa ARQUIVO como arquivo de configuração      |

### Comando useradd e groupadd (não interativo)

**Uso:** 
```
useradd [opções] LOGIN
useradd -D
useradd -D [opções]
```

Opções:

|     --badnames               | do not check for bad names                     |
|------------------------------|------------------------------------------------|
|  -b, --base-dir BASE_DIR     |  diretório base para o diretório pessoal da nova conta|
|      --btrfs-subvolume-home  |  use BTRFS subvolume for home directory        |
|  -c, --comment COMENTÁRIO    |  campo GECOS da nova conta                     |
|  -d, --home-dir DIR_PESSOAL  |  diretório pessoal da nova conta               |
|  -D, --defaults              |  exibe ou altera configuração padrão do useradd|
|  -e, --expiredate DATA_DE_EXPIRAÇÃO | data de expiração da nova conta         |
|  -f, --inactive INATIVO      |  período de inatividade de senha da nova conta |
|  -g, --gid GRUPO             |  nome ou ID do grupo primário da nova conta    |
|  -G, --groups GRUPOS         |  lista de grupos complementares da nova conta  |
|  -h, --help                  |  mostrar esta mensagem de ajuda e sair         |
|  -k, --skel SKEL_DIR         |  use este diretório esqueleto (skeleton) alternativo|
|  -K, --key CHAVE=VALOR       |  sobreescreve os padrões de /etc/login.defs    |
|  -l, --no-log-init           |  não adiciona o usuário aos bancos de dados lastlog e faillog|
|  -m, --create-home           |  cria o diretório pessoal do usuário|
|  -M, --no-create-home        |  não cria o diretório pessoal do usuário|
|  -N, --no-user-group         |  não cria um grupo com o mesmo nome do usuário|
|  -o, --non-unique            |  permite criar usuários com UID duplicado (não-único)|
|  -p, --password SENHA        |  senha criptografada da nova conta|
|  -r, --system                |  cria uma conta de sistema|
|  -R, --root CHROOT_DIR	   | directório para onde fazer chroot|
|  -P, --prefix PREFIX_DIR     |  prefix directory where are located the /etc/* files|
|  -s, --shell SHELL           |  shell de login da nova conta|
|  -u, --uid UID               |  ID de usuário da nova conta|
|  -U, --user-group            |  cria um grupo com o mesmo nome do usuário|
|  -Z, --selinux-user USUÁRIO_SE|  usa um USUÁRIO_SE específico para o mapeamento de usuário SELinux|

### Comando deluser
Remove um usuário normal do sistema
exemplo:
```
deluser mike
```
| Argumento           | Descrição                                           |
|---------------------|-----------------------------------------------------|
|  --remove-home      |  remove o diretório pessoal e mail spool do usuário|
|  --remove-all-files |  remove todos os arquivos dos quais o usuário é o dono|
|  --backup           |  realiza backup de arquivos antes de remover.|
|  --backup-to <DIR>  |  diretório de destino para os backups. O padrão é o diretório corrente.
|  --system           |  remove somente se for usuário de sistema|
|  --only-if-empty    |  remove somente se não houver membros restantes|
|  --quiet [-q]       |  não passa informações de processo para stdout|
|  --help  [-h]       |   mensagem de utilização|
|  --version [-v]     |  número da versão e copyright|
|  --conf [-c] ARQUIVO|  usa ARQUIVO como arquivo de configuração|


**Uso**
```
#remove um grupo do sistema
delgroup GRUPO
deluser --group GRUPO
deluser --group students

#remove o usuário de um grupo
deluser USUÁRIO GRUPO
deluser mike students
```

### Comando id
Exibe informações de usuários e grupos
```
id technogaps
```
### Comando newgrp
Adiciona um usuário a um novo grupo temporariamente, ou seja, só durante aquela sessão. Útil para conseguir permissões de determinado grupo sem fazer alterações definitivas. Uso:
```
 newgrp [-] [grupo]
```
### Comando passwd

**Uso:**
```
passwd [opções] [LOGIN]
```

| Opções                    |                 Descrição                        |
|---------------------------|--------------------------------------------------|
|  -a, --all                |     reportar estado de senhas em toda as contas|
|  -d, --delete             |     remover a senha para a conta indicada|
|  -e, --expire             |     forçar expiração da senha para a conta indicada|

**Exemplos:**
```
passwd -d userteste
passwd -e userteste
```
| Opções                    |        Descrição                                 |
|---------------------------|--------------------------------------------------|
|  -h, --help               |     mostrar esta mensagem de ajuda e sair|
|  -k, --keep-tokens        |     mudar senha somente caso expirada|
|  -i, --inactive INATIVO   |     definir senha inativa após expiração para INATIVO|
|  -l, --lock               |     trava a conta indicada|
|  -u, --unlock             |     destravar a conta indicada|
|  -de, --delete,--expire   |     deleta a senha e expira|
```
passwd -l userteste
passwd -u userteste
passwd -de userteste
```
| Opções                    |        Descrição                                 |
|---------------------------|--------------------------------------------------|
|  -n, --mindays MIN_DIAS   |     define número mínimo de dias antes da troca de senhas para MIN_DIAS|
|  -q, --quiet              |     modo silencioso|
|  -r, --repository REPOSITÓRIO|  mudar senha no repositório REPOSITÓRIO|
|  -R, --root CHROOT_DIR	|	directório para onde fazer chroot|
|  -S, --status             |     reportar estado de senha para a conta indicada|
|  -w, --warndays DIAS_AVISO |    define dias de aviso de expiração para DIAS_AVISO|
|  -x, --maxdays MAX_DIAS    |    define número máximo de dias antes da troca de senhas para MAX_DIAS|

### Comando gpasswd

**Uso:**
```
gpasswd [opção] GRUPO

#Colocar senha no grupo
gpasswd grupo

#Adicionar usuário teporariamente (sessão atual) no grupo que tem senha
newgrp grupo
```

|Opções                        | Descrição |
|------------------------------|-----------|
|  -a, --add USER GROUP        | adiciona o USUÁRIO ao GRUPO|
|  -d, --delete USER GROUP     |  remove USUÁRIO do GRUPO|
|  -M, --members USUÁRIO,...   |  ajusta a lista de membros do GRUPO|
|  -r, --remove-password       |  remove a senha do GRUPO|
|  -A, --administrators ADMIN    ajusta a lista de administradores para o GRUPO|

Exemplos
```
gpasswd -a userteste grupoteste
gpasswd -d userteste grupoteste
gpasswd -M userteste grupoteste
gpasswd -r grupoteste
gpasswd -A userteste grupoteste
```
|Opções                        | Descrição |
|------------------------------|-----------|
|  -h, --help                  |  mostrar esta mensagem de ajuda e sair|
|  -Q, --root CHROOT_DIR	   | directório para onde fazer chroot|
|  -R, --restrict              |  restringe acesso dos membros ao GRUPO|

Exceto para as opções -A e -M, as opções não podem ser combinadas.

### Comando usermod
**Uso:** 

É possível escrever uma linha de códico com vários argumentos ou executar o comando separadamente.
```
#uso padrão
usermod [opções] LOGIN

#uso com varios argumentos
usermod -d -m /home/userteste -c "usuario de testes" -l novologin -g 0 -u 5555 userteste
```

| Opções                     |     Descrição   |
|----------------------------|-----------------|
|  -b, --badnames            |    Permite nomes fora dos padrões|
|  -c, --comment COMENTÁRIO  |    novo valor do campo GECOS|
|  -d, --home DIR_PESSOAL    |    novo diretório de login para a nova conta de usuário|
|  -e, --expiredate DATA_EXPIRA | define data de expiração de conta para DATA_EXPIRA (YYYY-MM-DD). Se DATA_EXPIRA estiver vazia ele desabilita a expiração|
|  -g, --gid GRUPO           |    forçar usar GRUPO como novo grupo primário|
|  -l, --login LOGIN         |    novo valor do nome de login (altera o nome do usuario)|
|  -L, --lock                |    trava a conta de usuário|
|  -m, --move-home           |    move o conteúdo do diretório pessoal para a nova localização (use somente com -d)|
|  -s, --shell SHELL         |    novo shell de login para a conta de usuário|
|  -u, --uid UID             |    novo UID para a conta de usuário|


```
#Adicionar informações do usuário para o usuário
usermod -c "Usuario de testes" userteste

#Definir diretório home na criação da conta
usermod -d /home/userteste userteste

#Expirar a conta dia 31 de dezembro de 2022
usermod -e userteste 2022-12-31

#Cancelar expiração da conta
usermod -e userteste

#Força a utilização do grupo 0 como novo grupo primário
usermod -g 0 userteste

#Altera o nome do login do usuário
usermod -l novonomedeusuario userteste 

#Trava a conta do usuário
usermod -L userteste

#Mover o diretório home do usuário para outro local
usermod -m -d /home/novodiretorio userteste

#Altera o shell do usuário para zsh
usermod -s /bin/zsh userteste

#Altera o UID do usuário
usermod -u 5555 userteste
```

| Opções                     |     Descrição   |
|----------------------------|-----------------|
|  -f, --inactive INATIVO    |    define inatividade de senha após expiração para INATIVO|
|  -G, --groups GRUPOS       |    nova lista de GRUPOS suplementares|
|  -a, --append              |    anexa o usuário para os GRUPOS suplementares mencionados pela opção -G sem remove-lo de outros grupos|
|  -h, --help                |    mostrar esta mensagem de ajuda e sair|
|  -o, --non-unique          |    permitir usar UID duplicados (não-únicos)|
|  -p, --password SENHA      |    usar senha criptografada para a nova senha|
|  -R, --root CHROOT_DIR	 |   directório para onde fazer chroot|
|  -P, --prefix PREFIX_DIR   |    prefix directory where are located the /etc/* files|
|  -U, --unlock              |    destravar a conta de usuário|
|  -v, --add-subuids FIRST-LAST | add range of subordinate uids|
|  -V, --del-subuids FIRST-LAST | remove range of subordinate uids|
|  -w, --add-subgids FIRST-LAST | add range of subordinate gids|
|  -W, --del-subgids FIRST-LAST | remove range of subordinate gids|
|  -Z, --selinux-user SEUSER   | novo mapeamento de utilizador SELinux para a conta do utilizador|

### Comando groupmod
**Uso:**
```
groupmod [opções] GRUPO
```

| Opções                      |  Descrição      |
|-----------------------------|-----------------|
|  -g, --gid GID              |   muda o ID do grupo para GID|
|  -h, --help                 |   mostrar esta mensagem de ajuda e sair|
|  -n, --new-name NOVO_GRUPO  |   muda o nome para NOVO_GRUPO|
|  -o, --non-unique           |   permite usar um GID (não-único) duplicado|
|  -p, --password SENHA       |   muda a senha para esta SENHA (criptografada)|
|  -R, --root CHROOT_DIR	  |  directório para onde fazer chroot|
|  -P, --prefix PREFIX_DIR    |   prefix directory where are located the /etc/* files|

### Comando chfn
**Uso:**
```
chfn [opções] [LOGIN]
```
| Opções   | Descrição |
|----------|-----------|
|  -f, --full-name NOME_COMPLETO |alterar o nome completo do utilizador|
|  -h, --home-phone TEL_CASA   | alterar o número de telefone de casa do utilizador|
|  -o, --other OUTRA_INFO  | alterar outra info GECOS do utilizador|
|  -r, --root NUMERO_PORTA | alterar o número da porta do utilizador|
|  -R, --root CHROOT_DIR   | 	directório para onde fazer chroot|
|  -u, --help              |      mostrar esta mensagem de ajuda e sair|
|  -w, --work-phone TEL_EMPREGO |alterar o número de telefone do emprego do utilizador|

### Comando chsh
**Uso:**
```
chsh [opções] [LOGIN]
```

|Opções | Descrição|
|-------|----------|
|  -h, --help      |              mostrar esta mensagem de ajuda e sair|
|  -R, --root CHROOT_DIR   | 	directório para onde fazer chroot|
|  -s, --shell SHELL       |      novo shell de login para a conta de usuário|

### Comando lastlog
**Uso:**
```
lastlog [opções]
```
**OBS.:** O comando lastlog se basea as informações do arquivo /etc/log/lastlog

| Opções | Descrição |
|--------|-----------|
|  -b, --before DIAS |            imprime somente registros lastlog mais antigos que DIAS|
|  -C, --clear        |           clear lastlog record of an user (usable only with -u)|
|  -h, --help       |             mostrar esta mensagem de ajuda e sair|
|  -R, --root CHROOT_DIR	  |  directório para onde fazer chroot||  -S, --set                  |   set lastlog record to current time (usable only with -u)|
|  -t, --time DIAS      |         imprime somente registros lastlog mais recentes que DIAS|
|  -u, --user LOGIN     |         imprime registro lastlog para usuário com LOGIN especificado|

### Comando last
**Uso:**
```
 last [opções] [<usuário>...] [<tty>...]
 ```

Mostra uma listagem dos últimos usuários autenticados.

|Opções|Descrição|
|-------|----|
| -<número>  |          quantidade de linhas para mostrar|
| -a, --hostlast  |     exibe nomes de máquina na última coluna|
| -d, --dns      |      traduz o número de IP para um nome de máquina|
| -f, --file <arquivo> |usa um arquivo específico em vez de /var/log/wtmp|
| -F, --fulltimes    |  mostra horários e datas completos de login e logout|
| -i, --ip       |      exibe números de IP na anotação números-e-pontos|
| -n, --limit <número> |quantidade de linhas para mostrar|
| -R, --nohostname   |  não exibe o campo de nome de máquina|
| -s, --since <hora> |  exibe as linhas desde o horário especificado|
| -t, --until <hora> |  exibe as linhas até o horário especificado|
| -p, --present <hora> |exibe quem estava presente no horário especificado|
| -w, --fullnames     | exibe os nomes de domínio e usuário completos|
| -x, --system       |  exibe entradas de desligamento do sistema e alterações no nível de execução|
|     --time-format <formato>|  mostra marcas de tempo usando o <formato>:[notime][short][full][iso]
| -h, --help       |    exibe esta ajuda e sai|
| -V, --version    |    exibe a versão|

É costume usar /var/log/wtmp como ARQUIVO.

### Comando users
Exibe os usuários logados no sistema

### Comando groups
Exibe os grupos dos usuários logados no sistema

# Alterar o editor padrão
```
update-alternatives --config editor
```
ou
```
echo "export EDITOR=vim" >> ~/.bashrc
```
# Permissões

Tipos de arquivos:
- *-* arquivo
- *d* diretorio
- *l* link simbólico
- *b* dispositivo de bloco
- *c* dispositivo de caractere
- *s* socket

Forma de escrita:
- Literal ( -rwxrw-r-- )
- Octal (764)

Significado das permissões e valor octal:
- **-** ausência de permissão             == *0*
- **r** permissão de leitura (read)       == *4*
- **w** permissão de escrita (write)      == *2*
- **x** Permissão de execução (execute)   == *1*

- **u** user
- **g** group
- **o** others
- **a** all

Tabela Explicativa                   
| Tipo de arquivo | Perm do dono | Perm do grupo | Outros |
|-----------------|--------------|---------------|--------|
|        -        |      rwx     |      rw-      |   r--  |
|                 |       7      |       6       |    4   |

### Comando chmod
Modifica as permissões utilizando argumentos literais ou octal

Exemplos:
```
#adição de execução no arquivo
chmod +x teste.txt

#remoção de execução no arquivo
chmod -x teste.txt

#adição de execução para usuario dono
chmod u+x teste.txt

#adição de execução para grupo dono
chmod g+x teste.txt

#adição de execução para outros
chmod o+x teste.txt

#remoção de leitura para o usuario dono
chmod u-r teste.txt

#remoção de escrita para o grupo dono
chmod g-w teste.txt

#remoção de execução para outros
chmod o-x teste.txt

#usuario recebe permissão igual a rwx
chmod u=rwx teste.txt

#todos recebem permissão de leitura e escrita
chmod a=rw teste.txt

#permissão atribuida ao diretório de forma recursiva
chmod -R 755 dir_teste
```

### Comando chown
Altera o dono e o grupo dono do arquivo ou diretório

Exemplos:
```
#alterar dono e grupo dono
chown user1:user1 teste.txt

#alterar dono
chown user1 teste.txt

#alterar grupo dono
chown :user1 teste.txt

#alterar dono e grupo dono do diretorio de forma recursiva
chown -R user1:user1 dir_teste
```
# Permissões especiais - Stick Bit, Sgid Bit e Suid Bit
Essas permissões são utilizadas adicionando um caractere a esquerda da forma octal padrão. (Exemplo: 1755)

|Permissões | Octal | Literal   | Descrição               |
|-----------|-------|-----------|-------------------------|
|Suid Bit   |   4   |    s(S)   | Em binários herda o poder de dono quando executado
| Sgid Bit  |   2   |    s(S)   | Em diretórios permite herança de grupos
| Stick Bit |   1   |    t(T)   | Em diretórios restringe a remoção de arquivos e diretórios somente ao dono|

Exemplos:
|  Literal    |  Octal | Permissão   | Descrição                       |
|-------------|-----------|----------|---------------------------------|
| -rwsr--r--  |  4744  |  Suid Bit   | Arquivo. Dono COM permissão de execução e SuidBit ativo (**s** minúsculo no campo **USER**)|
| -rwSr--r--  |  4644  |  Suid Bit   | Arquivo. Dono SEM permissão de execução e SuidBit ativo (**S** maiúsculo no campo **USER**)|
| drw-r-sr--  |  2654  |  Sgid Bit   | Diretório. Grupo COM permissão de execução e Sgid Bit ativo (**s** minúsculo no campo **GROUP**)
| drw-r-Sr--  |  2644  |  Sgid Bit   | Diretório. Grupo SEM permissão de execução e Sgid Bit ativo (**S** maiúsculo no campo **GROUP**)
| drw-r--r-t  |  1645  |  Stick Bit   | Diretório. Outros COM permissão de execução e Stick Bit ativo (**s** minúsculo no campo **OTHERS**)
| drw-r--r-T  |  1644  |  Stick Bit   | Diretório. Outros SEM permissão de execução e Stick Bit ativo (**S** maiúsculo no campo **OTHERS**)

# Entendendo umask
A **umask** define a permissão que um diretório ou arquivo será criado.

- O valor padrão de umask é 022
Arquivos que podem ser utilizados para alterar a umask:
- ~/.profile
- ~/.bashrc
- /etc/profile
- /etc/bash.bashrc
- /etc/profile.d/arquivo.sh
- /etc/skel/.profile ~> Para definir umask padrão para novos usuários


Para calcular pegamos a permissão total menos a umask para diretórios e menos o bit de execução para arquivos.

|Permissão total |  777 |
|----------------|------|
|      umask     |  022 |
|    Diretório   |  755 |
|Bit de execução |  111 |
|    Arquivo     |  644 |

# Redirecionadores - stdin - stdout - stderr - and - or - pipe - tee
**FD (File Descriptor):**

stdin = 0

stdout = 1

stderr = 2

- [**>**] Redireciona a saída padrão e sobrescreve [stdout]
```
#Exemplo:
uptime > teste.txt

#Exemplo - criação de texto com cat
cat > teste.txt
```
- [**>>**] Redireciona a saída padrão e concatena[stdout]
```
#Exemplo:
upitme >> teste.txt

#Exemplo - concatenação de texto com cat
cat >> teste.txt
```
- [**<**] Redireciona a entrada padrão [stdin]
```
#Exemplo
cat < teste.txt
```

- [**<<**] Redireciona a entrada padrão [stdin]
```
#Exemplo - criação de texto com cat [EOF]
cat << palavra
texto1
texto2
texto3
palavra

#Exemplo - criação de arquivo [EOF]
cat << palavra > arquivo.txt
texto1
texto2
texto3
palavra

#Exemplo - criação de arquivo [EOF] na prática
cat << EOF > arquivo.txt
texto1
texto2
texto3
EOF

#Exemplo - concatenção de arquivo [EOF]
cat << EOF >> arquivo.txt
texto1
texto2
texto3
EOF
```

- [**2>**] Redireciona a saída de erro padrão - [stderr]
- [**2>>**] Redireciona a saída de erro padrão - [stderr]
```
#Exemplo
asdf 2> erro.txt

#Exemplo
asdf 2>> erro.txt
```

- [**2>&1**] Redirecionado a saída de erro para o file descriptor stdout (saída padrão)
- [**1>&2**] Redireciona a saída padrão para o file descriptor stderr (saída de erro)
```
#Exemplo - redirecionar stderr para stdout e salvar no arquivo.txt
ls asdf /tmp > arquivo.txt 2>&1

#Exemplo - redirecionar stdout para stderr e salvar no arquivo.txt
ls asdf /tmp 2> arquivo.txt 1>&2
```
Redirecionar a saída padrão para um arquivo e exibir na tela utilizando o **tee**
```
#Sobrescreve o arquivo caso exista
ls /tmp | tee arquivo.txt

#Faz um append no final do arquivo
ls /tmp | tee -a arquivo.txt

```

Redirecionador && (and) e || (or)
```
# O && (and) executa comando por comando enquanto não apresentar erro. Se ocorrer um erro ele para a execução
ls /tmp && apt install cmatrix

# O || (or), enquanto os comandos listados apresentarem erro ele continua tentando executar. Quando encontra um comando que é executado com sucesso para o processo
ls asdf || ls fdsa || apt update || apt install cmatrix

```
# Páginas de manual (man)
Syntax: **man [sessao] comando**

**Sessões:**
```
cd /usr/share/man
```
- 1 Programas executáveis ou comandos de shell;
- 2 Chamadas do Sistema (funções fornecidas pelo Kernel);
- 3 Chamadas de Biblioteca (funções fornecidas pelas bibliotecas);
- 4 Arquivos especiais, especialmente aqueles localizados em /dev;
- 5 Formatos de arquivos e convenções;
- 6 Jogos;
- 7 Pacotes Macro;
- 8 Comandos administrativos;
- 9 Rotinas do kernel.

```
#Exemplo1
man 5 passwd

#Exemplo2
man passwd

#Exibir em qual sessão está determiado padrão (similar ao apropos)
man -k passwd
```

### Comando apropos
Exibe em qual sessão da man page está localizado determiado padrão

```
#Exemplo
apropos ls

#Exemplo - filtrar por palavra exata (ls)
apropos -e ls

#Exemplo - reconhecimento de wildcard (coringas)
apropos -w i?con*
```
### Comando whatis
Exibe uma breve descrição e em qual sessão da man page está localizado determiado padrão

```
#Exemplo
whatis ls

#Exemplo - reconhecimento de wildcard (coringas)
whatis -w i?con*
```
# Comando which
Localiza o caminho do binário
```
#Exemplo
which crontab

#Exemplo
which -a crontab
```
**OBS.** O diretório /usr/share/doc/ possui documentações dos comandos instalados no linux após a instalação padrão do sistema

# Gerenciadores de pacotes - Debian e derivados
Diretório padrão para download dos arquivos .deb
```
/var/cache/apt/archives
```
Verificar versão
```
cat /etc/debian_version

cat /etc/issue
```
### dpkg - Debian Package (não resolve dependências)
Exemplos
```
#Instalar o pacote cmatrix.deb
dpkg -i cmatrix.deb

#Verificar se o programa cmatrix foi instalado
dpkg -l cmatrix

#Remover o programa cmatrix (mantendo as configurações)
dpkg -r cmatrix

#Remover o programa cmatrix completamente (remove tudo, inclusive arquivos de configurações)
dpkg -P cmatrix

#Localizar todos os pacotes (arquivos e diretórios) do cmatrix
dpkg -L cmatrix

#Descobrir de qual programa determinado arquivo pertence
dpkg -S /usr/share/doc/cmatrix/README.md

#Verificar informações do pacote cmatrix.
#A opção -I exibe informações de um pacote .deb NÃO instalado na máquina.
dpkg -I cmatrix.deb

#Verificar status do pacote cmatrix
dpkg -s cmatrix

#Reconfigurar um aplicativo
dpkg --reconfigure
```
### apt (resolve dependências)
Arquivo/diretório de configuração
```
#Diretório dos arquivos de configuração
/etc/apt/

#Arquivo de configuração dos repositório
/etc/apt/source.list

#Extensão do arquivo de configuração /etc/apt/source.list
/etc/apt/source.list.d

#Nova sintax para adição de repositórios assinados por chaves OpenGPG
deb [arch=amd64 signed-by=/usr/share/keyrings/signal-archive-keyring.gpg] https://updates.signal.org/desktop/apt xenial main

```

Exemplos
```
#Atualização da lista de pacotes do repositório
apt update

#Instalação do cmatrix
apt install cmatrix

#Remover o cmatrix (mantendo os arquivos de configuração)
apt remove cmatrix

#Remover o cmatrix completamente (incluíndo arquivos de configurações)
apt remove --purge cmatrix

#Reinstalar o pacote cmatrix
apt reinstall cmatrix

#Limpar a pasta dos arquivos .deb
apt clean

#Remover automaticamente todos os pacotes não usados (cuidado)
apt autoremove

#Limpar pacotes de instação antigos
apt autoclean

#Baixar o pacotes .deb do cmatrix sem instalar
apt download cmatrix

#Atualizar os pacotes instalados com excessão dos pacotes do sistema
#Mantem os arquivos de instalação
apt upgrade

#Atualizar todos os pacotes e os pacotes do sistema se necessário (incluindo o kernel do Linux)
#Remove todos os arquivos de instalações anteriores se necessário
apt dist-upgrade

#Simular a atualização dos pacotes instalados com excessão dos pacotes do sistema
apt --simulate upgrade

#Simular a atualização dos pacotes incluindo pacotes do sistema se necessário (incluindo o kernel do Linux)
apt --simulate dist-upgrade

#Procurar o pacote cmatrix nos repositórios
apt search cmatrix
```
# gpg keys - Como adicionar
- As chaves gpg dos repositórios devem ser gravadas em um local onde apenas o root tenha acesso (Ex: **/usr/share/keyrings**)
- Por convenção, o nome do arquivo precisa ter archive.keyring (Ex: /usr/share/keyrings/meurepositorio-archive-keyring.gpg)
- Os arquivos de chaves OpenGPG geralmente são encontradas com as extensões .gpg, .asc ou .key
- Os arquivos OpenPGP podem ser blindados com ASCII ou não

Adicionando chaves OpenGPG **NÃO** blindadas ASCII
sintax
```
#Utilizando o wget
wget -O- https://linkdoarquivo.gpg/arquivo.gpg | sudo tee /usr/share/keyrings/

#Utilizando o curl
curl 
sudo curl -fsSLo /usr/share/keyrings/signal-archive-keyring.gpg https://linkdoarquivo.gpg/arquivo.gpg

```
Adicionando chaves OpenGPG blindadas ASCII - **utilizando wget**

```
wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor | sudo tee /usr/share/keyrings/signal-archive-keyring.gpg

#wget ~> baixa a chave do link e envia pra stdout -O-
#gpg --dearmor ~> o gpg é a ferramenta de criptografia e a opção --dearmor descompacta a entrada de uma armadura OpenGPG ASCII
#sudo tee ~> redireciona a saída padrão para o arquivo /usr/share/keyring/signal-arquive-keyring.gpg e exibe na tela
```
Adicionando chaves OpenGPG blindadas ASCII - **utilizando curl**
```
curl https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > /usr/share/keyrings/signal-archive-keyring.gpg

#curl ~> baixa a chave do link
#gpg --dearmor ~> o gpg é a ferramenta de criptografia e a opção --dearmor descompacta a entrada de uma armadura OpenGPG ASCII
#> ~> redireciona a saída padrão para o arquivo /usr/share/keyring/signal-arquive-keyring.gpg
```
- Para adicionar os repositórios utilizando chaves assinadas da maneira acima é recomendado a criação de um arquivo com extensão .list em /etc/apt/source.list.d/ (ex: /etc/apt/source.list.d/signal.list)
- O arquivo precisa ter a seguinte estrutura:
```
deb [arch=amd64 signed-by=/usr/share/keyrings/signal-archive-keyring.gpg] https://updates.signal.org/desktop/apt xenial main
```
### Removendo chaves gpg do APT
Para remover as chaves do APT é necessários excluir os arquivos do /etc/apt/trusted.gpg.d/ e da base que o arquivo /etc/apt/trusted.gpg gera.
```
#Remover todos os arquivos de chaves gpg do diretório /etc/apt/trusted.gpg.d/
rm -rf /etc/apt/trusted.gpg.d/*

#Remover um repositório expecífico dentro de /etc/apt/trusted.gpg.d/
rm -rf /etc/apt/trusted.gpg.d/arquivo.gpg
```

Remover chaves geradas pelo arquivo /etc/apt/trusted.gpg
```
#Listar as chaves e identificar o ID GPG (são os 8 caracteres da impressão digital da chave GPG)
apt-key list

#Saída do comando acima:
pub   rsa4096 2016-04-22 [SC]      B9F8 D658 297A F3EF C18D  5CDF A2F6 83C5 2980 AECFuid           [ unknown] Oracle Corporation (VirtualBox archive signing key) <info@virtualbox.org>sub   rsa4096 2016-04-22 [E]

#ID GPG
2980 AECF

#Deletando a chave
apt-key del 2980AECF
```

# Gerenciadores de pacotes - Red Hat e derivados
### rpm
Gerenciador de pacotes de baixo nível do Red Hat. Não resolve dependências

Exemplos:
```
#Instalação do pacote cmatrix.rpm
rpm -ivh cmatrix.rpm

#Atualicação do pacote cmatrix.rpm
rpm -Uvh cmatrix.rpm

#Remover o pacote do cmatrix
rpm -ev cmatrix

#Listar todos os pacotes instalados
rpm -qa

#Listar o pacote cmatrix
rpm -qa cmatrix

#Listar os arquivos relacionados ao cmatrix
rpm -ql cmatrix

#Mostrar de qual pacote pertence determinado arquivo
rpm -qf /usr/share/man/man1/cmatrix.1.gz

#Exibir informações sobre o pacote cmatrix
rpm -qi cmatrix

#Exibir o arquivo de configuração de determinado serviço
rpm -qc cmatrix

#Exibir os programas que foram instalados por ultimo
rpm -qa --last

```
### dnf e yum - Resolve dependências
O dnf e o yum possuem a mesma sintax. O que é usado em um vai funcionar no outro

- Diretório de configuração dos repositórios (os arquivos precisamda extensão .repo)
```
/etc/yum.repos.d/
```

Exemplos
```
#Instalar o pacote cmatrix
dnf install cmatrix

#Remover o pacote cmatrix
dnf remove cmatrix

#Atualizar o pacote cmatrix (diferente do apt)
dnf update cmatrix

#Fazer busca por pacotes
dnf search cmatrix

#Exibir informações de determinado pacote
dnf info cmatrix

#Verificar os programas instalados na máquina
dnf list installed

#Listar todos os pacotes que ainda não foram instalados, mas que podem ser instaldos na máquina
dnf list

#Mostrar de qual pacote pertence determinado arquivo
dnf provides /usr/share/man/man1/cmatrix.1.gz

#Listar os grupos de aplicativos que podem ser instalados na máquina
dnf grouplist

#Instalar um grupo de aplicativos
dnf groupinstall "Container Management"

#Remover grupo de aplicativos instalados
dnf groupremove "Container Management"

#Listar os repositórios configurados como ENABLED no sistema
dnf repolist

#Listar todos os repositórios (ENABLED ou DISABLED)
dnf repolist all
```
# Variáveis de ambiente
Visualização de variáveis:
```
#Visualizar variáveis e funções do shell
set

#Visualizar apenas as variáveis
env

#Visualizar apenas as variáveis
printenv

#Exibir o conteúdo de uma variável (echo $VARIAVEL)
echo $PATH

#Exibir o conteúdo de uma variável sem usar o $
printenv BASH
```
Criação de variáveis (sintax: CHAVE=VALOR)
```
#Criação da variável USUARIO com o valor Maria de forma local
USUARIO=Maria

#Criação da variável USUARIO com o valor Maria de forma local (com set)
set USUARIO=Maria

#Criação da variável USUARIO com o valor Maria de forma global (para os sub-shells)
export USUARIO=Maria

#Remover a variavel USUARIO
unset USUARIO

#Criar uma variável com mais de um valor
USUARIOS=Maria:Joao:Fulustreca
```
### Alterando idioma do sistema utilizando variáveis
Para verificar a convenção de como se escreve o valor da variável é só consultar o arquivo **/etc/locale.gen**
```
#Setando como pt_BR com primário e caso não tenha disponível a tradução usar o en_US como secundário
LANG=pt_BR.UTF-8:en_US.UTF-8

#Alterar as mensagens do sistema para pt_BR
export LC_MESSAGES=pt_BR.UTF-8

#Alterar todas as mensagens do sistema para pt_BR
export LC_ALL=pt_BR.UTF-8
```
# Personalização do sistema com ALIAS
O comando alias cria um apelido do comando. Para exibir os alias criados utiliza-se o comando alias sem argumento

```
#Criar um alias para o comando whoami
alias quemsoueu=whoami

#Remover o alias quemsoueu
unalias quemsoueu
```
### Arquivos para alterar o comportamento do shell bash
- /etc/profile
- /etc/profile.d/
- /etc/bash.bashrc
- ~/.bash_login
- ~/.hushlogin ~> A presença deste arquivo impede a exibição da mensagem do motd
- ~/.profile
- ~/.bashrc
- ~/.bash_logout
- /etc/environment ~> Arquivo default pra adição de variáveis (são lidas no boot)

# Logs