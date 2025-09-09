#!/usr/bin/env bash

cat <<EOF>/etc/X11/xorg.conf.d/40-libinput.conf
Section "InputClass"
    Identifier "touchpad catchall"
    Driver "libinput"
    MatchIsTouchpad "on"
    Option "Tapping" "on"
EndSection
EOF
