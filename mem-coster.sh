#!/bin/bash
if test $# -lt 2
then
  echo "Usage: mem_coster.sh mem_size seconds"
  exit
fi

size=$1
sec=$2

mkdir /tmp/memory
mount -t tmpfs -o size=${size}M tmpfs /tmp/memory
dd if=/dev/zero of=/tmp/memory/block
sleep $sec
rm /tmp/memory/block
umount /tmp/memory
rmdir /tmp/memory
