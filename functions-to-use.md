###### Check if package is already installed
```
check_and_install() {
    local _command=$1

    if command -v $_command > /dev/null 2>&1; then
        echo "$_command is installed on your system."
    else
        echo "$_command "is not installed on your system"
    fi

}
```
