#!/bin/sh
# Total free disk space

df -h -P --total | tail -1 | awk '{ print $4 }'
