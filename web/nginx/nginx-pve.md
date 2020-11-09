#nginx-pve

1. Install
```
https://pve.proxmox.com/wiki/Web_Interface_Via_Nginx_Proxy
```

```
# apt install nginx
copy nginx
# rm /etc/nginx/sites-enabled/default
```
```
vim /etc/nginx/conf.d/proxmox.conf
```
```
upstream proxmox {
    server "FQDN HOSTNAME";
}
 
server {
    listen 80 default_server;
    rewrite ^(.*) https://$host$1 permanent;
}
 
server {
    listen 443;
    server_name _;
    ssl on;
    ssl_certificate /etc/pve/local/pve-ssl.pem;
    ssl_certificate_key /etc/pve/local/pve-ssl.key;
    proxy_redirect off;
    location / {
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade"; 
        proxy_pass https://localhost:8006;
	proxy_buffering off;
	client_max_body_size 0;
	proxy_connect_timeout  3600s;
        proxy_read_timeout  3600s;
        proxy_send_timeout  3600s;
        send_timeout  3600s;
    }
}
```

```
# nginx -t  # checks config syntax
# systemctl restart nginx
# systemctl enable nginx
```


2. ngx_http_proxy_module

URL
```
```








