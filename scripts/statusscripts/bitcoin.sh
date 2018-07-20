#!/bin/sh
# mjturt

btc=$(curl -s https://www.bitstamp.net/api/ticker/ | cut -d "\"" -f 8)
echo -e " $btc $"
