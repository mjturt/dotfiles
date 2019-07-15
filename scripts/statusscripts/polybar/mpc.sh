#!/usr/bin/env bash
# mjturt

if mpc --format "" 2> /dev/null | grep -q "playing"; then
    echo "%{F#719611}%{F-} $(mpc status | head -1 | cut -c 1-40)"
elif mpc --format "" 2> /dev/null | grep -q "paused"; then
    echo "%{F#FFB402}%{F-} $(mpc status | head -1 | cut -c 1-40)"
else
    echo "%{F#aa4450}%{F-}"
fi
