### Check firmware
###### Firmware repository
```
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
```
###### After clone the repository copy the missing firmware to /lib/firmware/vendor_directory/ and update initramfs . Ex: 
```
sudo cp intel/ibt-0040-2120.sfi /lib/firmware/intel/
sudo update-initramfs -u
sudo reboot now
```
###### After reboot check again
```
sudo dmesg | grep -B 5 -A 5 -i missing
```
