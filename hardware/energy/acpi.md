#ACPI
apt update && apt install acpid

O acpid é responsável pelo controle e monitoramento do acpi da máquina. Ele gerencia o desligamento correto utilizando o botão da máquina, por exemplo, além de permitir a customização utilizando os arquivos do diretório /etc/acpi

OBS.: Por padrão o systemd já possui suporte para desligamento usando ACPI e o gerenciamento é feito através do arquivo /etc/systemd/logind.conf, mas é menos flexivo, ele só permite utilizar as configurações padrões dele enquanto no ACPI é possível determinar um script
