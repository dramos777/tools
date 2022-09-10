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

