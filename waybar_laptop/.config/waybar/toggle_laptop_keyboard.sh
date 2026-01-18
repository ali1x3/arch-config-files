#!/bin/bash


#~/.config/waybar/toggle-laptop-keyboard.sh &
#  _____                 _             
# |_   _|__   __ _  __ _| | ___  
#   | |/ _ \ / _` |/ _` | |/ _ \ 
#   | | (_) | (_| | (_| | |  __/    
#   |_|\___/ \__, |\__, |_|\___|    
#            |___/ |___/                          
#

export XDG_RUNTIME_DIR="/run/user/$(id -u)"
SOCKET_PATH=$(find "$XDG_RUNTIME_DIR/hypr" -type s -name "*.socket.sock" 2>/dev/null | head -n1)
export HYPRLAND_INSTANCE_SIGNATURE=$(basename "$(dirname "$SOCKET_PATH")")
CACHE_FILE="/home/alex/.cache/laptop-keyboard-disabled"

hyprctl -- keyword 'device[evremap-virtual-input-for-/dev/input/event3]:enabled' 0

if [ -f "$CACHE_FILE" ] ;then
    rm "$CACHE_FILE"
    hyprctl -r -- keyword 'device[at-translated-set-2-keyboard]:enabled' 1
    notify-send -u normal "Laptop keyboard enabled"
else
    touch "$CACHE_FILE"
    hyprctl -r -- keyword 'device[at-translated-set-2-keyboard]:enabled' 0
    notify-send -u normal "Laptop keyboard disabled"
fi

