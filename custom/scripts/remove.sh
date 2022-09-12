#!/usr/bin/env bash

apt remove --purge xfce4-terminal xterm xfburn xsane xsane-common \
                   exfalso quodlibet parole libvte-2.91-0:amd64   \
                   libtext-charwidth-perl libncursesw6:amd64      \
                   libvte-2.91-common ncurses-base ncurses-bin    \
                   ncurses-term -y
