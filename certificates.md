## Gerar certificados auto assinados para testes
```
sudo mkdir -p /etc/nginx/ssl
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout /etc/nginx/ssl/privkey.pem \
  -out /etc/nginx/ssl/fullchain.pem

# Diffie helman
openssl dhparam -out /etc/nginx/ssl/dhparam.pem 2048
```
