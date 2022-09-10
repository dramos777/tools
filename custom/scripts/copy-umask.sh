#!/bin/bash
for FUNCIONARIO in $(ls /srv/homes/)
do
cp -v /etc/skel/.bashrc /srv/homes/$FUNCIONARIO/
done
