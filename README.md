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
   1. Inside qemu write :
        ``` bash
        sudo raspi-config
        ```
   2. With arrows select Interfacing Option  
   3. Select SSH and enable it
   4. Finish
6. From your terminal (mac) , you can access to your emulator using ssh
  ``` bash 
  ssh -p 5022 pi@localhost
  ```
  1. Insert password (raspberry)
