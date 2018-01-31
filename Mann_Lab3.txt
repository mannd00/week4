#!/bin/bash
echo "Welcome to Chapter 3 Script"
echo "First we will check out the devices in /dev"
cd /dev
ls -l

echo "\n /dev/null is a special device that basically throws away whatever is sent to it"

echo "Hello World" > /dev/null

echo "\n We can use the blkid -k command to list all supported filesystem types"
blkid -k

echo "\n The lsblk -a command will list all devices"
lsblk -a

echo "\n Search /sys for sd and pipe into the less command for easier reading"
find /sys | grep sd | less

echo "\n Search in /dev and /dev/mapper"
ls -l /dev /dev/mapper | grep '^b'

echo "\n And list the partitions"
ls /proc/partitions

echo "\n Next we will test out dd by writing to a new file from /dev/zero"
cd /tmp
pwd
dd if=/dev/zero of=./empty.file bs=1M count=1
hexdump empty.file

dmesg | grep sd