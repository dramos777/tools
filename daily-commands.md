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
### Clone a repository using recursive option
```
git clone --recursive https://github.com/owasp-modsecurity/ModSecurity ModSecurity
```
The --recursive option in the git clone command is used to clone a Git repository that contains submodules. Submodules are Git repositories included within another Git repository as a subdirectory. After cloning the main repository, Git also clones all the submodules defined in the main repository. These submodules are specified in the .gitmodules file of the main repository. Example of a .gitmodules file configuration:
```
[submodule "test/test-cases/secrules-language-tests"]
	path = test/test-cases/secrules-language-tests
	url = https://github.com/owasp-modsecurity/secrules-language-tests
[submodule "others/libinjection"]
	path = others/libinjection
	url = https://github.com/libinjection/libinjection.git
[submodule "bindings/python"]
	path = bindings/python
	url = https://github.com/owasp-modsecurity/ModSecurity-Python-bindings.git
[submodule "others/mbedtls"]
	path = others/mbedtls
	url = https://github.com/Mbed-TLS/mbedtls.git
```

