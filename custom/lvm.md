#LVM - Logical Volume Manager
```
apt update && apt install lvm2
```
Para entender o LVM é necessário pensar em camadas:
- Physical Volume ou PV >> possui o tamanho fixo. Na criação da partição será necessário utilizar o tipo de sistema de arquivos como LVM (utilizando o cfdisk, por exemplo).
- Group Volume ou GV >> "Agrupa" os PVs para dar a intenção de maior capacidade
- Logical Volume ou LV >> É o volume que de fato será formatado (ext4, xfs, etc) e montado no sistema.

###Physical Volume
´´´
pvcreate /dev/sdb1 >> Cria um volume fisico (Physical Volume) na partição /dev/sdb1
pvdisplay >> Exibe informações dos PVs criados
pvs >> Exibe informações dos PVs criados de forma sumarizada
´´´

###Group Volume
```
vgcreate vg-technogaps /dev/sdb1 >> Cria um grupo de volumes (GV ou Group Volume) chamado vg-tecnogaps e adiciona a partição /dev/sdb1 ao grupo
vgdisplay >> Exibe informações dos GVs criados
vgs >> Exibe informações dos GVs criados de forma sumarizada

vgextend vg-technogaps /dev/sdb2 >> Expande o GV vg-technogaps, ou seja, adiciona a partição /dev/sdb2 ao grupo já existente chamado vg-technogaps

```
###Logical Volume
```
lvcreate -n lv-technogaps -L 200M vg-technogaps >> Cria um Volume Lógico (LV ou Logical Volume) chamado lv-technogaps com tamnho de 200M utilizando o GV vg-technogaps
lvdisplay >> Exibe informações dos LVs criados
lvs >> Exibe informações dos LVs criados de forma sumarizada

mkfs.ext4 /dev/vg-technogaps/lv-technogaps >> Formata o volume lógico criado

lvextend -L +200M /dev/vg-technogaps/lv-technogaps >> Adiciona 200M no PV lv-technogaps
lvextend -L 400M /dev/vg-technogaps/lv-technogaps >> Determina o valor total de 400M para o PV lv-technogaps

resize2fs /dev/vg-technogaps/lv-technogaps >> Resize sistema de arquivos ext4

```
