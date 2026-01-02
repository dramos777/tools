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
### How to Bypass or Reset a Password on Debian via GRUB
To bypass or reset a user password (including root) on Debian using the GRUB bootloader, follow these steps:

1. Access the GRUB Menu
Restart your computer. As soon as the manufacturer's logo disappears, hold down the Shift key (or press Esc repeatedly) to display the boot menu [1, 2].

2. Edit the Boot Entry
With the Debian option selected, press the e key to edit the boot parameters [1, 3].

3. Modify the Kernel Line
Locate the line that starts with linux /boot/vmlinuz.... Go to the very end of this line and replace the parameters ro quiet splash (if they exist) with:

```
rw init=/bin/bash
#[2, 4]
```
4. Boot the System
Press Ctrl + X or F10 to boot using these temporary settings. You will drop directly into a terminal with root privileges [1, 4].

5. Reset the Password
In the terminal, type the command below (replace username with your actual username, or use just passwd to change the root password):

```
passwd username
#[2, 3]
```

Enter the new password twice when prompted (note that characters will not appear on the screen for security reasons).

6. Sync and Reboot
Type sync to ensure that changes are written to the disk. Then, force the machine to reboot
