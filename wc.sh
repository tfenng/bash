#!/bin/bash

cat $1 | sed '/^\s*#/d;/^\s*$/d' | wc -l
