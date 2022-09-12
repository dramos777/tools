#!/usr/bin/env bash

PROGRAMS="vim wget curl git sudo qterminal kcalc simplescreenrecorder bash-completion vlc"

apt update && apt install $PROGRAMS -y
