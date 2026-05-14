#!/bin/bash
if test $# -lt 2
then
  echo "Usage: mem_coster.sh mem_size seconds"
  exit
fi

size=$1
sec=$2

mkdir -p /tmp/memory || { echo "Error: cannot create /tmp/memory"; exit 1; }
mount -t tmpfs -o size="${size}M" tmpfs /tmp/memory || { echo "Error: cannot mount tmpfs"; rmdir /tmp/memory; exit 1; }
dd if=/dev/zero of=/tmp/memory/block || { echo "Error: dd failed"; umount /tmp/memory; rmdir /tmp/memory; exit 1; }
sleep "$sec"
rm -f /tmp/memory/block
umount /tmp/memory
rmdir /tmp/memory
