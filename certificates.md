## Gerar certificados auto assinados para testes
```
sudo mkdir -p /etc/nginx/ssl
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout /etc/nginx/ssl/site.key \
  -out /etc/nginx/ssl/site.crt
```
