#!/bin/sh
# Root indicator
#mjturt

if [ $(id -u) -eq 0 ]
then echo ""
   exit
fi
