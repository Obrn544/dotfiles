#!/bin/bash
# ██████╗ ██╗      █████╗ ██╗   ██╗              ██████╗  █████╗ ██╗   ██╗███████╗███████╗
# ██╔══██╗██║     ██╔══██╗╚██╗ ██╔╝              ██╔══██╗██╔══██╗██║   ██║██╔════╝██╔════╝
# ██████╔╝██║     ███████║ ╚████╔╝     █████╗    ██████╔╝███████║██║   ██║███████╗█████╗  
# ██╔═══╝ ██║     ██╔══██║  ╚██╔╝      ╚════╝    ██╔═══╝ ██╔══██║██║   ██║╚════██║██╔══╝  
# ██║     ███████╗██║  ██║   ██║                 ██║     ██║  ██║╚██████╔╝███████║███████╗
# ╚═╝     ╚══════╝╚═╝  ╚═╝   ╚═╝                 ╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚══════╝

#   Author: obrn544
#   url: https://github.com/obrn544/dotfiles
#   Script to display play/pause icon for spotify

if playerctl -p spotify status 2>/dev/null | grep -qi "Playing"; then
    echo "  "
elif playerctl -p spotify status 2>/dev/null | grep -qi "Paused"; then
    echo "  "
else
    echo "  "
fi
