#!/bin/bash


#Install brew
which -s brew && echo brew already  installed || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#Install wget
which -s brew && echo wget already installed || brew install wget

#Install qemu
which -s brew && echo qemu already installed || brew install qemu


#Download Kernel
if [ -e kernel-qemu-4.9.59-stretch ]
    then
        echo "Kernel Presente"
    else
        wget https://raw.githubusercontent.com/dhruvvyas90/qemu-rpi-kernel/master/kernel-qemu-4.9.59-stretch
fi

echo "Quale versione Avviare ?"
echo "1 Versione Lite"
echo "2 Versione Desktop"
read x
if [ $x = 1 ]
    then
        if [ -e 2018-10-09-raspbian-stretch-lite.img ]
            then
                echo "Raspbian lite Presente"
        else
            wget http://director.downloads.raspberrypi.org/raspbian_lite/images/raspbian_lite-2018-10-11/2018-10-09-raspbian-stretch-lite.zip
            unzip 2018-10-09-raspbian-stretch-lite.zip
        fi
    else
        if [ -e 2018-10-09-raspbian-stretch.img ]
            then
                echo "Raspbian Presente"
            else
                wget http://director.downloads.raspberrypi.org/raspbian/images/raspbian-2018-10-11/2018-10-09-raspbian-stretch.zip
                unzip 2018-10-09-raspbian-stretch.zip
        fi
fi

if [ -e versatile-pb.dtb ]
    then
        echo "Versatile-pd.dtb Presente"
    else
        wget https://github.com/dhruvvyas90/qemu-rpi-kernel/raw/master/versatile-pb.dtb
fi


if [ $x = 1 ]
    then
        qemu-system-arm -kernel kernel-qemu-4.9.59-stretch -cpu arm1176 -m 256 -M versatilepb -dtb versatile-pb.dtb -no-reboot -append "root=/dev/sda2 panic=1 rootfstype=ext4 rw" -net nic -net user,hostfwd=tcp::5022-:22 -drive "file=2018-10-09-raspbian-stretch-lite.img,index=0,media=disk,format=raw"
    else
       qemu-system-arm -kernel kernel-qemu-4.9.59-stretch -cpu arm1176 -m 256 -M versatilepb -dtb versatile-pb.dtb -no-reboot -append "root=/dev/sda2 panic=1 rootfstype=ext4 rw" -net nic -net user,hostfwd=tcp::5022-:22 -drive "file=2018-10-09-raspbian-stretch.img,index=0,media=disk,format=raw"
fi
