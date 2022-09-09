Determinar quais diretorios receberão atributos do attr

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
### lsof
- Exibir os arquivos do diretório /var abertos e o PID do processo
```
lsof /var >> Vai exibir os arquivos do diretório /var abertos e o PID do processo
```
- Exibir o PID do processo dos arquivos abertos no diretório /var
```
lsof -t /var >> Vai exibir o PID do processo dos arquivos abertos no diretório /var
```

###irqtop
- Instalar o pacote irqtop
```
apt update && apt install irqtop
```
- Similuar a o comando top só que para gerenciar interrupções e I/O
```
irqtop
```

###lspci
- Exibir os periféricos que estão conectados no barramento PCI do sistema
```
lspci
```
- Exibir detalhes das configurações dos periféricos PCI conectados (IRQ, IO Port, Módulo do Kernel, Região de memória alocado)
```
lspci -vv
```

###lsusb
- Exibir os periféricos que estão conectados no barramento USB do sistema
```
lsusb
```

###lshw
- Instalar o pacote lshw
```
apt update && apt install lshw
```
- Escanear os hardware e exibe as informações na tela em formato de arvore
```
lshw
```
