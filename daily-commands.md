### Kubernetes
###### Copy from pod to host
```
kubectl -n <yournamespace> cp <yourpod>:<yourdirectory>/file.txt ./file.txt
```
### Ansible
###### Execute a playbook without ssh host-key-checking
```
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts main.yml
```
### Others
###### Copy files speeder through networking
```
scp -c arcfour arquivo.gz usuario@servidor:/tmp/
```
###### Check actives IPs
```
fping -aqg 192.169.0.0/24
```
###### Show files with path (util in scripts)
```
ls teste/*
```
###### Remove Carriage Return (Util to remove some problems in scripts format)
```
sed "s/\r//"
```
###### Make a random temp file
```
mktemp
```
###### Clone a repository using recursive option
```
git clone --recursive https://github.com/owasp-modsecurity/ModSecurity ModSecurity
```
###### *The --recursive option in the git clone command is used to clone a Git repository that contains submodules. Submodules are Git repositories included within another Git repository as a subdirectory. After cloning the main repository, Git also clones all the submodules defined in the main repository. These submodules are specified in the .gitmodules file of the main repository. Example of a .gitmodules file configuration:*
```
[submodule "test/test-cases/secrules-language-tests"]
	path = test/test-cases/secrules-language-tests
	url = https://github.com/owasp-modsecurity/secrules-language-tests
[submodule "others/libinjection"]
	path = others/libinjection
	url = https://github.com/libinjection/libinjection.git
[submodule "bindings/python"]
	path = bindings/python
	url = https://github.com/owasp-modsecurity/ModSecurity-Python-bindings.git
[submodule "others/mbedtls"]
	path = others/mbedtls
	url = https://github.com/Mbed-TLS/mbedtls.git
```
###### Remove rectangle on ls command output
```
dircolors -p | sed 's/;42/;01/' > ~/.dircolors
```
###### Add exec permission on subdirectories with find
```
find /home/userdir -type d -exec chmod +x {} +
```
###### *Explanation of the Command:*

######     *- find /home/userdir: Starts the search from the directory /home/userdir.*
######     *-type d: Limits the search to directories only.*
######     *-exec chmod +x {} +: For each directory found ({}), the command chmod +x is executed, adding execute permission. The + at the end allows find to pass multiple files to the chmod command at once, which is more efficient than executing the chmod command separately for each directory.*

###### Kill all process of a script
```
ps aux | grep script.sh | grep -v grep | awk '{print $2}' | xargs kill
```

###### Rsync
```
rsync -ar --info=progress2 --progress --stats -e "ssh -i /home/user/.ssh/id_rsa" big_file.tar user@192.168.0.100:/home/user/
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
- Remover um PV
```
lvremove [lv-name] [vg-name]
vgremove [vg-name]
pvremove /dev/sdb1
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
- Remover um GV
```
vgremove vg-technogaps
```
### Logical Volume
- Criar um Volume Lógico (LV ou Logical Volume) chamado lv-technogaps com tamnho de 200M utilizando o GV vg-technogaps
```
lvcreate -n lv-technogaps -L 200M vg-technogaps
# or to use all space in disc
lvcreate -l 100%FREE -n lv_servicos vg-technogaps
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

- Adicionar 200M no LV lv-technogaps
```
lvextend -L +200M /dev/vg-technogaps/lv-technogaps
```
- Determinar o valor total de 400M para o LV lv-technogaps
```
lvextend -L 400M /dev/vg-technogaps/lv-technogaps
```

- Resize sistema de arquivos ext4
```
resize2fs /dev/vg-technogaps/lv-technogaps
```
- Desativar um LV
```
lvchange -an /dev/vg-technogaps/lv-technogaps
```
- Remover um LV
```
lvremove /dev/vg-technogaps/lv-technogaps
```
Sync directory
```
sudo rsync -avxHAX /var/ /mnt/new_var/
```
