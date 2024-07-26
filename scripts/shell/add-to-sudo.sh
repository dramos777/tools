#!/usr/bin/env bash
echo -n "Enter the user name that will be added to the sudo group: "
read USERTOSUDO
adduser $USERTOSUDO sudo
