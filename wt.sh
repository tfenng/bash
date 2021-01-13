#!/bin/bash

CITY_NAME=$1
if [ -z $CITY_NAME ]
then
  curl wttr.in/$1
else
  curl wttr.in
fi
