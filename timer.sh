#!/bin/bash
ts=`date`; echo "Start $ts"
sleep $1 &
wait
ts=`date`; echo "End $ts"
