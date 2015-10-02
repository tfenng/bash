#!/bin/bash

IFS=:

while read name empid dept
do
  echo "$name ($empid) , $dept "
done < ./employees.txt
