#!/bin/sh
# Root indicator

if [ $(id -u) -eq 0 ]
then echo ""
   exit
fi
