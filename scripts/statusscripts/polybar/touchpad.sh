#!/usr/bin/env bash
# Touchpad toggle button for polybar/lemonbar
# mjturt

if [ "$(xinput list | grep "Elan Touchpad")" ]; then
    DEVICE="Elan Touchpad"
else
    DEVICE="SynPS/2 Synaptics TouchPad"
fi

STATE=$(xinput list-props "$DEVICE" | grep "Device Enabled" | cut -f3)

case "$1" in
    --toggle)
        if [ "$STATE" -eq 1 ]; then
            xinput --disable "$DEVICE"
        else
            xinput --enable "$DEVICE"
        fi
        ;;
    *)
        if [ "$STATE" -eq 1 ]; then
            echo ""
        else
            echo ""
        fi
        ;;
esac
