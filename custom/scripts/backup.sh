#!/usr/bin/env bash

echo -n "Enter the source path to backup: "
read -e DIR1

echo -n "Enter the destination path for backup: "
read -e DIR2
    
	if [ -d $DIR1 ] && [ -d $DIR2 ]; then
		cp -afv $DIR1* $DIR2
		cp -afv $DIR1.[a-z]* $DIR2 2>/dev/null
		cp -afv $DIR1.[0-9]* $DIR2 2>/dev/null
		exit 0

		if [ -f $DIR1 ] && [ -d $DIR2 ]; then
			cp -afv $DIR1 $DIR2
		fi
		exit 0

	else
		echo ""
 		echo "File or Directory not found, please, tap a valid information!"
		echo ""
		exit 1

	fi
