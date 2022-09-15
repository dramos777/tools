#!/usr/bin/env bash
echo "vm.swappiness=1" > /etc/sysctl.d/swappiness.conf
echo "vm.vfs_cache_pressure=50" >> /etc/sysctl.d/swappiness.conf
echo 1 > /proc/sys/vm/swappiness
