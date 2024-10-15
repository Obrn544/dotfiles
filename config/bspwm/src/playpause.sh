#!/bin/bash

if pgrep -x "spotify" > /dev/null && playerctl status -p spotify | grep -qi "playing"; then
    # Spotify está ejecutándose y en reproducción
    echo "  " # Icono de pausa
else
    # Spotify no está ejecutándose o está en pausa
    echo "  "   # Icono de play
fi
