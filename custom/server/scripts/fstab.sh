#!/usr/bin/env bash

sed -i '/UUID/ s/errors=remount-ro/commit=120,noatime,nodiratime,norelatime,errors=remount-ro/g' /etc/fstab
sed -i '/UUID/ s/defaults/defaults,commit=120,noatime,nodiratime,norelatime,errors=remount-ro/g' /etc/fstab

sed -i '/\/dev/ s/errors=remount-ro/commit=120,noatime,nodiratime,norelatime,errors=remount-ro/g' /etc/fstab
sed -i '/\/dev/ s/defaults/defaults,commit=120,noatime,nodiratime,norelatime,errors=remount-ro/g' /etc/fstab

sed -i '/boot/ s/defaults,commit=120,noatime,nodiratime,norelatime,errors=remount-ro/defaults/g' /etc/fstab
