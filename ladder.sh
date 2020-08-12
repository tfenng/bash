#!/bin/bash

ladder -addr=0.0.0.0:8123 -remote-proxy-addr=$1:443
