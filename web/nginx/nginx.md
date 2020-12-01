#nginx

[Содержание](../readme.md)

NGINX 

Install
apt install nginx
apt install build-essential
wget http://nginx.org/download/nginx-1.19.5.tar.gz
tar -xf 
apt install libpcre3 libpcre3-dev libpcrecpp0v5 libssl-dev zlib1g-dev
cd nginx
./configure --sbin-path=/usr/bin/nginx --conf-path=/etc/nginx/nginx.conf --error-log-path=/var/log/nginx/error.log --http-log-path=/var/log/nginx/access.log --with-debug --with-pcre --with-http_ssl_module
make
make install



Это: 
- HTTP-сервер
- Обратный прокси сервер
- Почтовый прокси-сервер
- TCP/UDP прокси-сервер общего назначения


Отдать код ответа
if ($http_user_agent ~ (Ahrefs|MJ12bot|LinkpadBot|MauiBot)) {
        return;
 }
 
Редирект
301 перманентный - статический (постоянный) 
302              - временный
статический контент
проксировать запросы


конфигкрация
/etc/nginx/nginx.conf

Дерективы:
- Простая
access_log /var/log/nginx/access.log main;
- Блочная 
events {
  worker_connections 1024;
}

-- контенст
- main
- events
- location
- http
- server

HTTPS - надстройка над HTTP

Конфиги импортируются из директории /etc/nginx/conf.d/*.conf

Поступ HTTP-запрос на ip:port
Ищит по всем контекстам сервера в значении listen (кто принимает запрос по этому ip:port)
Host - сопаставляет с значением server_name (ищет самое верхнее полное савподение, если не нашел смотрит самое точное совпадение server_name 
если не нашел - то выбирает дефолтовый - или указать явно default в директиве listen после ip:port





