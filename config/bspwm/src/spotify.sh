#!/bin/bash
# ███████╗██████╗  ██████╗ ████████╗██╗███████╗██╗   ██╗
# ██╔════╝██╔══██╗██╔═══██╗╚══██╔══╝██║██╔════╝╚██╗ ██╔╝
# ███████╗██████╔╝██║   ██║   ██║   ██║█████╗   ╚████╔╝ 
# ╚════██║██╔═══╝ ██║   ██║   ██║   ██║██╔══╝    ╚██╔╝  
# ███████║██║     ╚██████╔╝   ██║   ██║██║        ██║   
# ╚══════╝╚═╝      ╚═════╝    ╚═╝   ╚═╝╚═╝        ╚═╝   

#   Author: obrn544
#   url: https://github.com/obrn544/dotfiles
#   Script to display current song playing in spotify

if playerctl --player=spotify status > /dev/null 2>&1; then
    playerctl --player=spotify metadata --format '{{ title }}'
else
    echo " No Music "
fi
