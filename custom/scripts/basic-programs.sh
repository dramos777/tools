#!/usr/bin/env bash

PROGRAMS="vim wget curl git sudo terminator kcalc simplescreenrecorder bash-completion vlc remmina audacity"

apt update && apt install $PROGRAMS -y
