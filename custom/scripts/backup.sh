#!/usr/bin/env bash

echo -n "Enter the source direcotory to backup: "
read DIR1
echo ""
echo -n "Enter the destination direcotory to backup: "
read DIR2
echo ""
cp -av $DIR1 $DIR2
