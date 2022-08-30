#!/usr/bin/env bash

VAR1="/ip address="
VAR2="list=SCOND"

file1="$1"

while IFS= read -r linha || [[ -n "$linha" ]]; do
  echo -n "$VAR1"
  echo -n "$linha"
  echo "$VAR2"
done < "$file1"
