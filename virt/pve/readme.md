PVE

- Install
```
USB (Rufus) -> MBR,BIOS&UEFI,FAT32-> запись в режиме DD-образ
            -> GPT
```

- Update
```
apt-get -y update
apt-get -y upgrade
apt install -y mc vim net-tools

URL https://pve.proxmox.com/wiki/Package_Repositories#sysadmin_enterprise_repo

vim /etc/apt/sources.list.d/pve-enterprise.list

#deb https://enterprise.proxmox.com/debian/pve buster pve-enterprise
deb http://download.proxmox.com/debian/pve buster pve-no-subscription

```


- Network
```
vim /etc/network/interfaces

apt-get install mc vim net-tools
systemctl restart networking
# sudo /etc/init.d/networking restart
or
# sudo /etc/init.d/networking stop
# sudo /etc/init.d/networking start
else
# sudo systemctl restart networking
```

- Add hdd
```
fdisk -l
fdisk /dev/sdb
mkfs.ext4 /dev/sdb1
mkdir /mnt/hdd1
mount -t ext4 /dev/sdb1 /mnt/hdd1
vim /etc/fstab 
```

- Create vm on winxp
```
- WinXP
  - NIC Realtek 8139 
```


```
pvecm status

dpkg-reconfigure locales


lxc

pct stop 114

vm
qm stop 114


```
