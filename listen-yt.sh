#!/bin/bash

if [[ -z "$1" ]]; 
    then echo "Enter a search string!"; 
    else mpv "$(youtube-dl --default-search 'ytsearch1:' \"$1\" --get-url | tail -1)"; 
fi