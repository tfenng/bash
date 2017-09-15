#!/bin/bash
if test $# -lt 1
then
  echo "Usage: cpu_coster.sh prime-max-count"
  exit
fi

size=$1
sysbench --num-threads=4 --test=cpu --cpu-max-prime=$1 run
