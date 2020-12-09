Docker

```
Virtual Machines предоставляют нам hardware level virtualization
Docker Containers предоставляют operating system level virtualization
```

```
Изначально Docker использовал LinuX Containers (LXC)
Сейчас Docker использует runC (известный как libcontainer)
```

Отличие:
```
Virtual Machine: состоит из приложения, связанных библиотек и исходного кода и отдельной ОС. 
Каждая виртуальная машина получает часть ОЗУ и ЦП хост-машины.
Docker Container: получает своё собственное изолированное пространство, 
которое содержит само приложение и относящийся к нему исходный код.
```

![alt text](screenshots/docker1.png "Отличие")​

![alt tag](https://raw.githubusercontent.com/vitovts/screenshots/main/docker1.png "Отличие")​

![alt tag](https://raw.githubusercontent.com/vitovts/screenshots/main/docker2.png "Преимущества")​


Docker — программное обеспечение для автоматизации развёртывания и управления приложениями в средах с поддержкой контейнеризации.

ПРОИСХОЖДЕНИЕ:
```
Первый релиз был опубликован 13 марта 2013 года # Автор — Соломоном Хайксом (Solomon Hykes)
Соавторы — Андреа Лудзарди (Andrea Luzzardi) и Франсуа-Ксавье Бурле (François- Xavier Bourlet).
```

ОСОБЕННОСТИ:
```
Open-source 
Enterprise
Cross-platform
Написан на Go
```

ОБЛАСТИ ПРИМЕНЕНИЯ:
```
Контейнеризация Web приложений 
Построение отказоустойчивых систем 
Kubernetes
Тестирование Web приложений
CI/CD
```

ПОПУЛЯРНОСТЬ 
```
Большие возможности
Возможность предоставить заказчику готовый продукт 
Огромное комьюнити
Низкий порог входа
Малое потребление ресурсов
Используют миллионы людей во всём мире
Огромное количество готовых Docker образов
```

УСТАНОВКА: 
- WINDOWS
```
Windows 10 64bit: Pro, Enterprise or Education (1607 Update, Build 14393 or later) 
Virtualization is enabled in BIOS.
CPU SLAT-capable feature
At least 4GB of RAM.
```
- MACOS
```
Mac hardware must be a 2010 or newer model
macOS Sierra 10.12+
VirtualBox prior to version 4.3.30+ (optional) 
At least 4GB of RAM.
```
- UBUNTU 
```
Linux kernel version 3.10 or higher 
512+ Mb of RAM.
```




