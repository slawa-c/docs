# mint

Сожержание:

1. [intro](mint-intro/README.md) **"intro"**
2. [virt](mint-virt/README.md) **"virt"**
3. [k8s](mint-k8s/README.md) **"k8s"**




10. [usb-sd](usb-sd/README.md) **"usb-sd"**



```
You can reset your password following the next steps:

Reboot your computer / Turn your computer on.
Hold down the Shift key at the start of the boot process to enable the GNU GRUB boot menu (if it does not show)
Press ESC at the GNU GRUB prompt.
Press e for edit.
Use the Arrow keys to highlight the line that begins with kernel and press the e key.
Go to the very end of the line and add rw init=/bin/bash
Press Enter and then press b to boot your system.
Your system will boot up to a passwordless root shell.
Type in passwd yourusername
Set your new password.
Restart your system.



inst
```
sudo dpkg -i xxx.deb
sudo apt-get -f install
```


