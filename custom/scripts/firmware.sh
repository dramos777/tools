#!/usr/bin/env bash

sed -i 's/main contrib non-free/main/g' /etc/apt/sources.list && \
sed -i 's/main/main contrib non-free/g' /etc/apt/sources.list

apt update && apt install firmware-linux-nonfree firmware-misc-nonfree -y
