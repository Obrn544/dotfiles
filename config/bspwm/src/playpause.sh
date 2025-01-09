#!/bin/bash

if playerctl -p spotify status 2>/dev/null | grep -qi "Playing"; then
    echo "  "
elif playerctl -p spotify status 2>/dev/null | grep -qi "Paused"; then
    echo "  "
else
    echo "  "
fi
