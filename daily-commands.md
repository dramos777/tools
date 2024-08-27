### Ansible
Execute a playbook without ssh host-key-checking
```
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts main.yml
```
### Copy files speeder through networking
```
scp -c arcfour arquivo.gz usuario@servidor:/tmp/
```
### Check actives IPs
```
fping -aqg 192.169.0.0/24
```
### Show files with path (util in scripts)
```
ls teste/*
```
### Remove Carriage Return (Util to remove some problems in scripts format)
```
sed "s/\r//"
```
### Make a random temp file
```
mktemp
```
