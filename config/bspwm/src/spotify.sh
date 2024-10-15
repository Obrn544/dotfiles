#!/bin/bash

if pgrep -x "spotify" > /dev/null
then
    # Spotify está ejecutándose
    spotifyctl -q status --format '%artist%: %title%'
else
    # Spotify no está ejecutándose
    echo "No Music"
fi
