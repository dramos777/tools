## Desativar IPV6
Se não estiver usando então é extremamente recomendado desabilitar o IPV6
### Desativar IPV6 temporariamente
```
sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1
sudo sysctl -w net.ipv6.conf.default.disable_ipv6=1
sudo sysctl -w net.ipv6.conf.lo.disable_ipv6=1
```
### Desativar IPV6 permanentemente
```
echo "net.ipv6.conf.all.disable_ipv6 = 1" | sudo tee -a /etc/sysctl.conf
echo "net.ipv6.conf.default.disable_ipv6 = 1" | sudo tee -a /etc/sysctl.conf
echo "net.ipv6.conf.lo.disable_ipv6 = 1" | sudo tee -a /etc/sysctl.conf
sudo sysctl -p
```
### Gerar parâmetros Diffie-Hellman com OpenSSL
```
openssl dhparam -out dhparam.pem 2048
```
### Breakdown password - live CD
1. Identify and mount the partition
First, find where your system is installed:

```
sudo fdisk -l  # Look for something like /dev/sda2 or /dev/nvme0n1p2
sudo mount /dev/sda2 /mnt
```

2. Mount essential filesystems
For commands like passwd to work, the chroot environment needs access to hardware and kernel processes:

```
for d in dev proc sys run; do sudo mount --bind /$d /mnt/$d; done
```

3. Enter the system (The key step)
Now, change the root to the folder where you mounted the disk:

```
sudo chroot /mnt
# Note: The prompt will change. You are now root inside your installed system.
```

4. Reset the password
Since you are already root in the target system, just type:

```
passwd your_username
```

5. Exit safely
It is important to unmount everything before rebooting:

```
exit  # Exits the chroot environment
for d in dev proc sys run; do sudo umount /mnt/$d; done
sudo umount /mnt
sudo reboot
```
