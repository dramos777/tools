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
lshw >> Escanea todos os hardware e exibe as informações na tela em formato de arvore de forma detalhada (Exibe o mapa da placa mãe completa)

