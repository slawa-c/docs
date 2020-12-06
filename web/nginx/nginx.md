#nginx

[Содержание](../readme.md)



```URL
http://nginx.org/ru/docs/ngx_core_module.html
http://nginx.org/ru/docs/configure.html
https://www.leaderssl.ru/articles/131-ustanovka-sertifikata-nginx
```


Это: 
- HTTP-сервер
- Обратный прокси сервер
- Почтовый прокси-сервер
- TCP/UDP прокси-сервер общего назначения


Отдать код ответа
```
if ($http_user_agent ~ (Ahrefs|MJ12bot|LinkpadBot|MauiBot)) {
        return;
 }
 ```
 
Редирект
301 перманентный - статический (постоянный) 
302              - временный
статический контент
проксировать запросы


конфигурация
/etc/nginx/nginx.conf


Directives (Дерективы) :
- Простая
```
access_log /var/log/nginx/access.log main;
```
- Блочная 
```
events {
  worker_connections 1024;
}
```

Contexts (контенст)

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




Matching Order (Порядок совпадения):
```
1. = Exact Match (полное совпадение)
2. ^~ Preferential Prefix (Префик преимущества)
3. ~&*~ Regex Math (Регулярное выражение)
4. no modifer (без модификатора) Prefix Match no modifier (Совпадение префикса (без модификатора))
```

Logging

acceess_log off;
error_log off;

Директивы
Наследование
HTTP -> SERVER -> LOCATION

Standard Directive (стандартные директивы)
gzip on;

Array Directive (директивы массивы)
access/log logs/access.log
access/log logs/access_notice.log notice;

Action Directive (директивы действия)
location /... {
 rewrite ..
 return ...
}

Dirctive try_files
try_files $uri = 404;
try_files $uri index.html = 404;








