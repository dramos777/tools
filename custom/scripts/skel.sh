#!/usr/bin/env bash

#umask default
sed -i 's/#umask 022/umask 027/g' /etc/skel/.profile

#bash_completion
echo "source /usr/share/bash-completion/bash_completion" >> /etc/skel/.bashrc
#k8s bash_completion
echo "source <(kubectl completion bash)" >> /etc/skel/.bashrc

#Discard SSD
echo "fstrim -va" >> /etc/skel/.bash_login

cp -v /etc/skel/.* /home/*/
cp -v /etc/skel/.* /root/
