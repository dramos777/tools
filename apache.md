# "Redirect" urls http to https on apache web server:

```
a2enmod headers
a2enmod remoteip

# Add lines in apache config:
<VirtualHost *:80>
...
    SetEnvIf X-Forwarded-Proto "https" HTTPS=on
    RequestHeader set X-Forwarded-Proto "https" env=HTTPS
...
</VirtualHost>

apache2ctl restart

```
