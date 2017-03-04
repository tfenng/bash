#!/bin/bash

find . -type f -name *.htm | while read i
do html2text -o $i.txt -nobs $i
done
