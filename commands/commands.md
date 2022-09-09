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

-Enviar o horário do systema pro hardware:
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
```
free >> Exibe informações da memória física e swap da estação
free --kilo >> Exibe em kilobytes (bloco de 1000)
free --kibi >> Exibe em kilobytes (bloco de 1024)
free --mega >> Exibe em megabytes (bloco de 1000)
free --mebi >> Exibe em megabytes (bloco de 1024)
free --giga >> Exibe em gigabytes (bloco de 1000)
free --gibi >> Exibe em gigabytes (bloco de 1024)

free --mega -s 1 >> Exibe em megabytes a cada 1 segundo
```

### grep
```
grep -v www-data /etc/passwd >> Inverte a busca, ou seja, exibe todas as linhas do arquivo /etc/passwd com excessão da linha que contém www-data
grep -f /tmp/expressao /etc/passwd >> A opção -f faz pesquisa com base em arquivos, ou seja, o grep iria procurar em /etc/passwd as expressões contidas no arquivo /tmp/expressao
grep -i >> Ignora maiúscula e minúscula ("remove" o case sensitive)
grep -E >> Utilizado para fazer pesquisas com expressões regulares ( ^ * $ [] {} . + ? | () )
grep -F >> Pesquisa caracteres especiais ao invés de interpretar como expressão
grep -r >> Exibe os arquivos de forma recursiva que contem determinado padrão. Ex: grep -ri 'Foca02' /tmp/ (obs.: comando utilizado em diretórios)
grep -ril >> Exibe apenas o nome do arquivo que contem determinado padrão (similar ao comando anterior, mas com a saída melhor.
```

### nl
```
nl -i 3 /etc/passwd >> Enumera as linhas pulando de 3 em 3 (obs. todas as linhas do arquivo são exibidas, apenas a numeração que pula de 3 em 3)
nl -v 3 /etc/passwd >> Enumera as linhas começando do 3 (obs. todas as linhas são exibidas, apenas a numeração que começa do 3) 
```

### sort
```
sort >> Organiza a saída em ordem alfabética (obs.: classifica os números como se fossem strings)
sort -n >> Classifica a saída levando em consideração a ordem numérica (letras são classificadas primeiro)
sort -r >> Inverte a classificação
sort -c >> Apenas exibe na saída do comando se a lista já está ordenada ou não
sort +1 >> Vai ordenar com base na segunda coluna
sort -t ":" >> Vai ordenar com base no delimitador :
sort -k 2 >> Vai ordenar com base na segunda coluna (similuar ao +1)
sort -t ":" -k 2 >> Vai ordenar com base na segunda coluna levando em consideração o delimitador :
```

#### time
```
time ls >> O comando time serve basicamente para calcular o tempo de execução de um comando
```

### touch
```
touch >> Se utilizado sem parâmetros cria um arquivo
touch -t 111612001987 arquivo.txt >> Vai alterar a data de modificação do arquivo para 16 de novembro de 1987 às 12:00h
touch -a -t 111612001987 arquivo.txt >> Vai alterar a data de ultimo acesso do arquivo para 16 de novembro de 1987 às 12:00h
```

### dmesg
```
dmesg -w >> Prende a tela do exibindo tudo que está ocorrendo naquele momento
dmesg -x >> Classifica as mensagens de forma mais legível
dmesg -T >> Pega o timestemp do boot e transforma para uma forma mais legível
dmesg -c >> Limpa as mensagens do buffer do Kernel
```

### su
```
su - >> Elimina todas as variáveis de ambiente antes de subir para root
/bin/su -  >> Elimina todas as variáveis de ambiente e utiliza o PATH do binário su. Esta prática é recomendada por questões de segurança, pois é possível ter um PATH alterado ao executar apenas o comando su
su - www-data -s /bin/bash >> Vai alterar para o usuário www-data e utilizar o shell bash. Por padrão o usuário www-data não tem um shell habilitado pra ele, a opção -s do comando su "garante" que o usuário utilize o terminal determinado no comando. Util para trobleshooting
```

### sudo
```
adduser technogaps sudo >> Vai adicionar o usuário technogaps no grupo sudo. Fazendo isso o usuário technogaps poderá usar o sudo utilizando sua senha convencional, ou seja, não precisará saber a senha de root propriamente dita
```

### uname
```
uname -a >> Retorna dados do sistema como Versão do Linux, arquitetura
uname -s >> Exibe o kernel
uname -n >> Exibe o nome da máquina
uname -r >> Retorna a versão atual do kernel
uname -v >> Exibe a data que o kernel foi compilado
uname -m >> Exibe a arquitetura utilizada no kernel
```

### reboot
```
reboot -f >> Reinicia a máquina de forma forçada
shutdown -r now >> Reinicia a máquina
shutdown -r 09:40 >> Reinicia a máquina em um horário expecífico
shutdown -r +10 >> Reinicia a máquina em 10min
echo b >/proc/sysrq-trigger >> Reinicia a máquina de forma extremamente forçada
```

### shutdown
```
halt >> Desliga a máquina
shutdown -h now >> Reinicia a máquina no momento que o comando for executado
echo o >/proc/sysrq-trigger >> Desliga a máquina de forma extremamente forçada
shutdown -h 09:40h >> Desliga a máquina em um horário expecífico
shutdown -c >> Cancela um agendamento feito anteriormente pelo comando shutdown
shutdown -h +10 >> Desliga a máquina em 10min
```

### wc
```
wc >> Exibe o número de linhas, palavras e tamanho do arquivo
wc -l >> Exibe apenas o número de linhas
wc -c >> Exibe apenas o número de bytes
wc -w >> Exibe apenas o número de palavras
```

### seq
```
seq 10 >> Enumera as linhas de 1 a 10
seq 2 10 >> Enumera as linhas começando do 2 até o 10
seq 2 2 10 >> Enumera as linhas iniciando em 2 e incrementando 2  até chegar no 10 (2 4 6 8 10)
seq -w 10 >> Enumera as linhas de 1 a 10 alinhando com um 0 a esquerda (01 02 03 04 05... 10)
```

### attr
```
lsattr >> Lista os atributos dos arquivos
chattr +i >> (imutável) Não permite alterações ou deleções do arquivo/diretório nem mesmo com usuário root
chattr -i >> Remove o atributo imutável do arquivo/diretório
chattr -R >> Modo recursivo
chattr -a diretorio >> Coloca o diretório em modo apend (o arquivo não pode ser deletado, apenas alterado)
chattr -a arquivo >> Coloca o arquivo em modo apend (o arquivo não pode ser deletado ou alterado, apenas aceita adição de novas linhas)
chattr =aie * >> Irá igualar os atributos (a, i, e) em todos os arquivos (*)
chattr +c >> Compacta o arquivo no momento do armazenamento. (obs. Algumas distros não possuem suporte a este atributo. Neste caso ele será ignorado)
chattr +s >> É utilizado para deletar o arquivo de forma segura. Ele zera todos os dados do arquivo. (obs. Não funciona bem com sistemas com journal)
chattr +S >> Ativa o sync do arquivo para imediatamente.
chatt +D diretorio >> Ativa o sync em um diretório. CUIDADO. Este atributo grava os arquivos no disco sem passar pelo buffer e diminui a performace do sistema
```

### cut
```
cut -d ":" -f 1,7 /etc/passwd >> "Corta" o primeiro e o sétimo campo (field) do arquivo /etc/passwd levando em consideração o delimitador :
cut -d ":" -f 1-3 /arquivo >> "Corta" o intervalo de 1 a 3 do /arquivo
cut -b 1-4 arquivo.txt >> "Corta" os 4 primeiro bytes do arquivo.txt
cut -c 1-4 arquivo.txt >> Corta os 4 primeiros caracteres do arquivo.txt (em caractere o espaço não é contato)
```

### cmp
```
cmp arquivo1 arquivo2 >> Compara os arquivos e exibe o resultado na tela
cmp -s arquivo1 arquivo2 >> Compara os arquivos, mas não exibe o resultado, apenas guarda na variável $? o código de saída
```

### diff
```
diff arquivo1 arquivo2 >> Compara os arquivos e exibe as linhas diferentes
diff -u arquivo1 arquivo2 >> Compara os arquivos e exibe as linhas diferentes em um formato mais legível (unificado)
diff -r diretorio1 diretorio2 >> Permite a comparação entre diretórios. Na saída do comando será exibido os arquivos que estão diferentes e as respectivas linhas diferentes

### patch Exemplo de utilização para atualização de um "app"
diff -ru /tmp/dir-app /tmp/dir-update > /tmp/diferencas.patch
cd /tmp/dir-app
patch -p1 -N </tmp/diferencas.patch

### -p1 >> Nível da pasta que o patch foi aplicado (esta opção diz: desça uma pasta para localizar o patch)
### -N >> Não desfazer patchs que já foram aplicados

### Para reverter o patch aplicado
```
patch -p1 -R </tmp/diferencas.patch
```

### whereis
```
whereis é utilizado para encontrar pastas de manuais por string
```

### which
```
which ls >> Encontra onde o binário está localizado no sistema operacional
```
### mount
```
mount -o remount /var >> Vai remontar o ponto de montagem /var
mount -a >> Exibe todas as configurações dos pontos de montagens. Interessante utilizar com o grep pra filtrar e checar as opções de ponto de montagem
mounte -o remount,ro /var >> Vai remontar o ponto de montagem /var como somente leitura

```
### lsof
```
lsof /var >> Vai exibir os arquivos do diretório /var abertos e o PID do processo
lsof -t /var >> Vai exibir o PID do processo dos arquivos abertos no diretório /var
```

###irqtop
```
apt update && apt install irqtop
irqtop >> Similuar a o comando top só que para gerenciar interrupções e I/O
```

###lspci
lspci >> Exibe os periféricos que estão conectados no barramento PCI do sistema
lspci -vv >> Exibe detalhes das configurações dos periféricos PCI conectados (IRQ, IO Port, Módulo do Kernel, Região de memória alocado)

###lsusb
lsusb >> Exibe os periféricos que estão conectados no barramento USB do sistema

###lshw
apt update && apt install lshw
lshw >> Escanea os hardware e exibe as informações na tela em formato de arvore

