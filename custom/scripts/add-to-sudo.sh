#!/usr/bin/env bash
echo ""
echo -n "Enter a user name to be added to the sudo group: "
read USERTOSUDO
adduser $USERTOSUDO sudo
echo ""
