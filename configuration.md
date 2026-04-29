### Hide a URL using nginx proxy
```
# --- BLOCO HTTP (porta 80) ---
server {
    listen 80;
    server_name meusite.com;

    # Redireciona tudo de HTTP para HTTPS
    return 301 https://$host$request_uri;
}

# --- BLOCO HTTPS (porta 443) ---
server {
    listen 443 ssl;
    server_name meusite.com;

    # Configurações de certificado SSL
    ssl_certificate     /etc/letsencrypt/live/meusite.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/meusite.com/privkey.pem;

    # 1️⃣ Redireciona /old_page -> /new_page
    location ~ ^/oldpage(/.*)?$ {
        set $subpath $1;
        return 301 /newpage$subpath;
    }
    }

    # 2️⃣ Exibe conteúdo de /old_page quando acessarem /new_page
        location ~ ^/newpage(/.*)?$ {
            set $subpath $1;
        proxy_pass http://backend/old_page;  # troque pelo seu backend
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
}

```
### Config headers to browser store cache
```
# Assets estáticos — cache longo no browser
location ~* \.(css|js|jpg|jpeg|png|gif|ico|svg|woff|woff2|ttf|eot|pdf|map|wasm)$ {
    proxy_pass https://192.168.0.100:80;
    proxy_ssl_verify off;
    proxy_set_header Host              $host;
    proxy_set_header X-Real-IP         $remote_addr;
    proxy_set_header X-Forwarded-For   $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto $scheme;

    proxy_hide_header Cache-Control;
    proxy_hide_header Expires;
    proxy_hide_header Pragma;

    add_header Cache-Control "public, max-age=31536000, immutable" always;
    add_header Vary "Accept-Encoding" always;
}
```







