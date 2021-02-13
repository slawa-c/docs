# VirtualBox 6.1
https://computingforgeeks.com/install-virtualbox-on-kali-linux-linux-mint/

[Содержание](../README.md)

*NB: Использован дистрибутив `LinuxMint 19.3` с Xfce 64-bit

1. Обновление :

    ```bash
    sudo apt-get update -y
    sudo apt-get upgrade -y
    sudo reboot
    ```

2. Import apt repository
   
   Add repository key :

    ```bash
    wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
    wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
    ```

3. Add the VirtualBox Repository

    ```bash
    echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian bionic contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
    ```
    kali
    
    ```bash 
    echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian buster contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
    ```

4. Install (Kali Linux / Linux Mint)
    
   ```bash
   sudo apt update && sudo apt upgrade
   sudo reboot
   sudo apt install linux-headers-$(uname -r) dkms
   sudo apt-get install virtualbox-6.1
   ```

5. Download VirtualBox Extension Pack

    ```bash
    cd ~/
    wget https://download.virtualbox.org/virtualbox/6.1.6/Oracle_VM_VirtualBox_Extension_Pack-6.1.6.vbox-extpack
    ```



[Назад к содержанию](../README.md)
