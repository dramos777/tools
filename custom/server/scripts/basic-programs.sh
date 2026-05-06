#!/usr/bin/env bash

PROGRAMS="vim wget curl git sudo bash-completion fail2ban"

apt update && apt install $PROGRAMS -y
