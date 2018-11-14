#! /bin/bash
#Install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#Install wget
brew install wget

#Install qemu
brew install qemu

#Download Kernel
wget https://raw.githubusercontent.com/dhruvvyas90/qemu-rpi-kernel/master/kernel-qemu-4.9.59-stretch

#Download RASPBIAN STRETCH LITE
wget http://director.downloads.raspberrypi.org/raspbian_lite/images/raspbian_lite-2018-10-11/2018-10-09-raspbian-stretch-lite.zip

#Unzip image
unzip 2018-10-09-raspbian-stretch-lite.zip

#Downlaod versatile-pd.dtb
wget https://github.com/dhruvvyas90/qemu-rpi-kernel/raw/master/versatile-pb.dtb

#Run 
qemu-system-arm -kernel kernel-qemu-4.9.59-stretch -cpu arm1176 -m 256 -M versatilepb -dtb versatile-pb.dtb -no-reboot -append "root=/dev/sda2 panic=1 rootfstype=ext4 rw" -net nic -net user,hostfwd=tcp::5022-:22 -drive "file=2018-10-09-raspbian-stretch-lite.img,index=0,media=disk,format=raw"


