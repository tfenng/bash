#!/bin/bash

find . -type f -name "*.htm" | while IFS= read -r i; do
  html2text -o "${i}.txt" -nobs "$i"
done
