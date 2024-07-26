#!/usr/bin/expect -f

# Start a script
spawn ./meu_script.sh

# Wait for the prompt needed on action
expect "Chose A or B to continue:"

# Envia a opção 1
send "B\r"

# Interact with the rest of script
interact
