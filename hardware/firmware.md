#Firmware
/lib/firmware >> Diretório padrão das firmwares instaladas na máquina
Para adicionar firmwares proprietários é necessários editar o arquivo /etc/apt/source.list para que busque em reposítórios fora da main (contrib, non-free) ou baixar a firmware e instalar manualmente.
Depois do arquivo /etc/source.list editado com as flags contrib e non-free é possível executar o comando apt search firmware-linux-nonfree e encontrar os pacotes fora da main


