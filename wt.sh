#!/bin/bash

CITY=$1
echo $CITY
if [ -z "$CITY" ]
then
  curl wttr.in
else
  curl "wttr.in/$CITY"
fi
