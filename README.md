# qemu-raspbian-macos
Script for installing raspberry emulator on macOs

1. Open Terminal 
2. Give permission of execution to qemu.sh 
  ``` bash
  chmod u+x qemu.sh
  ```
  
3. Run Script
  ``` bash
  ./qemu.sh
  ```
  
4. Wait the installation. Inside qemu, log with default user
   ` user: pi password: raspberry `
5. Enable ssh on qemu 
   Inside qemu write :
        ``` bash
        sudo raspi-config
        ```
   With arrows select Interfacing Option  
   Select SSH and enable it
   Finish
6. From your terminal (mac) , you can access to your emulator using ssh
  ``` bash 
  ssh -p 5022 pi@localhost
  ```
  Insert password (raspberry)
