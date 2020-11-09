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
    server "pve.local"; ##"FQDN HOSTNAME"
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
URL: https://serveradmin.ru/nginx-proxy_pass/
https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-debian-9-ru
https://habr.com/ru/post/457894/
https://pve.proxmox.com/wiki/Web_Interface_Via_Nginx_Proxy


https://habr.com/ru/post/142363/
https://www.jamescoyle.net/how-to/1522-proxy-the-proxmox-web-gui-with-nginx-over-https-with-load-balancing
https://gist.github.com/baltpeter/3daf2469f972402b07ac
https://gist.github.com/sergey-dryabzhinsky/2af5f7c56e1ee01ce128e04bf38ee99a
https://www.jamescoyle.net/cheat-sheets/1078-openssl-certificate-cheat-sheet
https://www.jamescoyle.net/how-to/1522-proxy-the-proxmox-web-gui-with-nginx-over-https-with-load-balancing
https://forum.proxmox.com/threads/access-proxmox-via-nginx-reverse-proxy.33332/
https://www.lowendtalk.com/discussion/159381/proxmox-setup-reverse-proxy-for-containers
https://www.jamescoyle.net/how-to/1736-reverse-proxy-proxmox-vnc-with-nginx
```

2.1 HTTP
```
# vim /etc/nginx/conf.d/blog.vitovts.ws.conf
```
```
server {
    listen 80;
    server_name blog.vitovts.ws;
    access_log /var/log/nginx/blog.vitovts.ws-access.log;
    error_log /var/log/nginx/blog.vitovts.ws-error.log;

location / {
    proxy_pass http://10.130.0.33;
    proxy_set_header Host $host;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Real-IP $remote_addr;
    }
}
```

Проверка IP
```
<?php
echo $_SERVER['REMOTE_ADDR']
?>
```

Передача реального ip (real ip) адреса клиента в nginx при proxy_pass
```
server {
	listen       80 default_server;
	server_name  blog.vitovts.ws;
	root         /usr/share/nginx/html;
	#>>>
  set_real_ip_from 94.142.141.246;
	real_ip_header X-Real-IP;
  #<<<
  
    location / {
	index index.php index.html index.htm;
	try_files	$uri $uri/	=404;
	}

    location ~ \.php$ {
	fastcgi_pass   127.0.0.1:9000;
	fastcgi_index  index.php;
	fastcgi_intercept_errors on; 
	include fastcgi_params;
	fastcgi_param       SCRIPT_FILENAME  $document_root$fastcgi_script_name;
	fastcgi_ignore_client_abort     off;
	}

    error_page 404 /404.html;
	location = /40x.html {
    }

    error_page 500 502 503 504 /50x.html;
	location = /50x.html {
    }
}
```

http://blog.vitovts.ws/myip.php


Передача https через nginx с помощью proxy pass
```
server {
    listen 80;
    server_name blog.zeroxzed.ru;
    access_log /var/log/nginx/blog.zeroxzed.ru-access.log;
    error_log /var/log/nginx/blog.zeroxzed.ru-error.log;
    return 301 https://$server_name$request_uri; # редирект обычных запросов на https
    }

server {
    listen 443 ssl http2;
    server_name blog.zeroxzed.ru;
    access_log /var/log/nginx/blog.zeroxzed.ru-ssl-access.log;
    error_log /var/log/nginx/blog.zeroxzed.ru-ssl-error.log;

    ssl on;
    ssl_certificate /etc/letsencrypt/live/blog.zeroxzed.ru/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/blog.zeroxzed.ru/privkey.pem;
    ssl_session_timeout 5m;
    ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
    ssl_dhparam /etc/ssl/certs/dhparam.pem;
    ssl_ciphers 'EECDH+AESGCM:EDH+AESGCM:AES256+EECDH:AES256+EDH';
    ssl_prefer_server_ciphers on;
    ssl_session_cache shared:SSL:10m;

    location /.well-known/acme-challenge/ {
	root /web/sites/blog.zeroxzed.ru/www/;
    }
    location / {
	proxy_pass http://192.168.13.31; 
	proxy_set_header Host $host;
	proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
	proxy_set_header X-Real-IP $remote_addr;
    }
}
```


Проксирование определенной директории или файлов
```
location /forum/ {
	proxy_pass http://192.168.13.31; 
	proxy_set_header Host $host;
	proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
	proxy_set_header X-Real-IP $remote_addr;
        proxy_redirect default;
	}

location / {
	proxy_pass http://192.168.13.31; 
	proxy_set_header Host $host;
	proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
	proxy_set_header X-Real-IP $remote_addr;
	}

location ~ \.(gif|jpg|png)$ {
	root /web/sites/blog.zeroxzed.ru/www/images;
	}
  
```  


