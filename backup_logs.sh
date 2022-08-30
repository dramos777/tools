#!/bin/bash
tar -cvjf /tmp/bkp_var_log_$(hostname -s)_$(date +%d-%m-%y).tar.bz2  /var/log
scp -P 2222 /tmp/bkp_var_log_$(hostname -s)_$(date +%d-%m-%y).tar.bz2 root@storage:/logs
