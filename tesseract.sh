#!/bin/bash

cmd="tesseract $1.png $1 --psm 7 -l eng"
echo $cmd
eval $cmd
cat $1.txt
