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
A opção --recursive no comando git clone é usada para clonar um repositório Git que contém submódulos. Submódulos são repositórios Git que estão incluídos dentro de outro repositório Git como uma subpasta. Depois de clonar o repositório principal, o Git também clona todos os submódulos definidos no repositório principal. Esses submódulos são especificados no arquivo .gitmodules do repositório principal. Exemplo de configuração de um arquivo .gitmodules:
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

