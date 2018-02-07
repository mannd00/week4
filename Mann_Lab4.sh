#!/bin/bash

echo "Welcome to Week 4 Lab Script!"
echo "We will be working with partitions today. you can read the manual by running man udevadm"

echo "Lets list the partitions on the disk"
sudo fdisk -l /dev/sda
cd /tmp

echo "Next lets create a file we can play with partitions in without breaking real hardware"
dd if=/dev/zero of=./32MB.img bs=1M count=32
sleep 5
echo "Now we have a 32MB image file"
echo " next we will checkout whats in there."
hexdump ./32MB.img | less

echo "Next we format it with ext4 filesystem"
sudo mkfs -t ext4 ./32MB.img
echo "Finally, mount the image so we can put stuff in it"
sleep 5

mkdir /mnt/tmp
sudo mount ./32MB.img /mnt/tmp
mount; df -h
lsblk

sleep 5

cd /mnt/tmp; ls
echo "Hello World" > hello.txt

sudo umount /mnt/tmp

echo "Now we will see if we can find our hello text in the hexdump"

sleep 2
cd /tmp
hexdump -c ./32MB.img | less



