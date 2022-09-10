#!/usr/bin/env bash

sed -i 's/main/main contrib non-free/g' /etc/apt/source.list

apt update && apt install firmware-linux-nonfree firmware-misc-nonfree -y
