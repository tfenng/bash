#!/bin/bash

totalsize=0
while IFS= read -r filesize; do
  totalsize=$((totalsize + filesize))
done < <(ls -l . | awk '/^-/ {print $5}')
echo "Total file size in current directory: $totalsize"
