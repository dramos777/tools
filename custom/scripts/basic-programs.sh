#!/usr/bin/env bash

PROGRAMS="vim wget curl git sudo terminator kcalc simplescreenrecorder bash-completion"

apt update && apt install $PROGRAMS -y
