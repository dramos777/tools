### Remove files
```
00 00 * * * /usr/bin/find /var/log/myapp -type f -atime +30 -delete 2> /dev/null
```
