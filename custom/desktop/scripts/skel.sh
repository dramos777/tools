#!/usr/bin/env bash

#umask default
sed -i 's/#umask 022/umask 027/g' /etc/skel/.profile

#bash_completion
sed -i '/source \/usr\/share\/bash-completion\/bash_completion/d' /etc/skel/.bashrc
echo "source /usr/share/bash-completion/bash_completion" >> /etc/skel/.bashrc
#k8s bash_completion
sed -i '/source <(kubectl completion bash)/d' /etc/skel/.bashrc
echo "#source <(kubectl completion bash)" >> /etc/skel/.bashrc

#Discard SSD
sed -i '/sudo fstrim -va/d' /etc/skel/.bash_login
echo "sudo fstrim -va" >> /etc/skel/.bash_login

echo -n "Enter the user name to update profile: "
read USERPROFILE
cp -av /etc/skel/.profile /home/$USERPROFILE/
cp -av /etc/skel/.bashrc /home/$USERPROFILE/
cp -av /etc/skel/.bash_login /home/$USERPROFILE/
cp -av /etc/skel/.profile /root/
cp -av /etc/skel/.bashrc /root/
cp -av /etc/skel/.bash_login /root/
