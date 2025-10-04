### ZSH configurations
###### To show just the current directory on zsh with POWERLEVEL10K change the line POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_unique to:

```
POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_last
```
###### To change directory and its icon color use:
```
POWERLEVEL9K_DIR_FOREGROUND=136
```
### VLC
###### VLC - Configuration - Video Stuttering

    - Tools > Preferences > Input/Codecs: "Hardware-accelerated decoding" (DISABLE)
    - Tools > Preferences > Video: "Video Output OpenGL"
### How to enable brigth button in lenovo x11

```
# Edit line GRUB_CMDLINE_LINUX_DEFAULT to one of follow:
# GRUB_CMDLINE_LINUX_DEFAULT="quiet splash acpi_backlight=vendor"
# GRUB_CMDLINE_LINUX_DEFAULT="quiet splash acpi_backlight=video"
# GRUB_CMDLINE_LINUX_DEFAULT="quiet splash acpi_backlight=native"
# GRUB_CMDLINE_LINUX_DEFAULT="quiet splash acpi_backlight=none"
sudo vim /etc/default/grub
sudo update-grub
sudo reboot
```

