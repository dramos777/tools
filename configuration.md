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
    location = /old_page {
        return 301 /new_page;
    }

    # 2️⃣ Exibe conteúdo de /old_page quando acessarem /new_page
    location = /new_page {
        proxy_pass http://backend/old_page;  # troque pelo seu backend
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
}

```
