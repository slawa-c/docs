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




