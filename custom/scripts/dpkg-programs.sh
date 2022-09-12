#!/usr/bin/env bash

rm -rf tmp/links.sh
dpkg -i tmp/*
while [ $? != 0 ]; do
	echo "Missing Dependencies. Fixing Installation"
	apt install -f -y && \
	dpkg -i tmp/*
done
apt autoremove && apt clean -y

rm -rf tmp/*

echo "Concluded!"
