**Configuração padrão /etc/fstab:**
```
/dev/sda1   /  ext4    defaults,commit=240,noatime,nodiratime,norelatime,errors=remount-ro 0       1
```

### tune2fs
- Altera para 0.5% o espaço reservado ao root
```
tune2fs -m 0.5 /dev/sdb1
```
