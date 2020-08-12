#!/bin/bash
ts=`date`; echo "Start $ts"
sleep 5 &
wait
ts=`date`; echo "  End $ts"
