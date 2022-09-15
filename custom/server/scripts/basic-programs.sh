#!/usr/bin/env bash

PROGRAMS="vim wget curl git sudo bash-completion"

apt update && apt install $PROGRAMS -y
