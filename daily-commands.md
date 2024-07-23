## Ansible
Execute a playbook without ssh host-key-checking
```
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts main.yml
```
## Copy files speeder through networking
```
scp -c arcfour arquivo.gz usuario@servidor:/tmp/
```
