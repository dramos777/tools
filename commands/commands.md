### ls
O comando **ls** é utilizado basicamente para listar conteúdo de diretórios e informações úteis para o gerenciamento de arquivos.
- listar arquivos sem exibir backup (arquivos com ~ no final):
```
ls -B
```
- Listar arquivos diferenciando por cores:
```
ls --color=auto
```
- Remover cores da lista (inverso do comando ls --color=auto):
```
ls --color=never
```
- O comando ls permite listar o conteúdo de mais de um diretório ao mesmo tempo:
```
ls Diretorio1 Diretorio2
```
- Listar apenas o nome diretório sem listar o conteúdo:
```
ls -ld
```
- Classificar a listagem por ordem de criação do inode de disco do arquivo/diretorio
```
ls -lf
```
- Listar diretório colocando identificadores no final dos arquivos (/ para diretorios, = para caracteres, @ para link simbolico, * para executaveis):
```
ls -F
```
- Ocultar a coluna Grupos da listagem
```
ls -lG
```
- Não resolver nomes na listagem (substitui nome/grupo por id/gid)
```
ls -ln
```
- Exibir apenas o dono do arquivo (-o de own)
```
ls -lo
```
- Exibir apenas o grupo do arquivo
```
ls -lg
```
- Exibir a listagem com uma / no final dos diretórios
```
ls -lp
```
- Classificar a listagem por data, ordem atualização do arquivo/diretorio (mais recentes primeiro)
```
ls -lt
```
- Inverter a classificação da listagem
```
ls -lr
```
- Exibir a listagem classificada por data de forma invertida, inclusive arquivos ocultos. (ideal para auditoria de logs, para saber os logs que foram alterados por ultimo)
```
ls -lhatr
```
- Classificar pela data de criação (ctime)
```
ls -lc
```
- Classificar pela externsão do arqivo
```
ls -lX
```
- Listar os diretorios de forma recursiva
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

- Apagar pastas vazias recursivamente:
```
rmdir -p /tmp/diretorio1/diretorio2/diretorio3
```

### cat
O comando **cat** é utilizado para concatenar aquivos. No geral, ele é usado para exibir conteúdo de arquivos
- Visualizar conteúdo de arquivo:
```
cat /tmp/arquivo.txt
```
- Colocar um $ no final da linha do arquivo. Util para identificar linhas que encerram com espaço.
```
cat -E /tmp/arquivo.txt
```
### Variações do comando cat

- Visualizar arquivos .gz:
```
zcat /tmp/arquivo.gz
```
- Visualizar arquivos .bz2:
```
bzcat /tmp/arquivo.bz2
```
- Visualizar arquivos .xz:
```
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
