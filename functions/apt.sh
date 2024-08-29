# Check if package is already installed
check_and_install() {
    local command=$1

    if dpkg -l | grep -iw $command > /dev/null; then
        echo "$command already installed."
    else
        echo "$command not found. Installing $command..."
        apt install -y $command
    fi
}

