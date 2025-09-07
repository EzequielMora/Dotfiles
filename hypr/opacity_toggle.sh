#!/bin/bash

STATE_FILE="/tmp/hypr_opacity_state"

if [[ -f "$STATE_FILE" ]]; then
    STATE=$(cat "$STATE_FILE")
else
    STATE="on"
fi

if [[ "$STATE" == "on" ]]; then
    hyprctl keyword decoration:active_opacity 1.0
    hyprctl keyword decoration:inactive_opacity 1.0
    hyprctl --batch "\
        keyword windowrulev2 opacity 1 1,class:^(kitty)$;\
        keyword windowrulev2 opacity 1 1,class:^(Spotify)$"
    echo "off" > "$STATE_FILE"
else
    hyprctl keyword decoration:active_opacity 0.96
    hyprctl keyword decoration:inactive_opacity 0.94
    hyprctl --batch "\
        keyword windowrulev2 opacity 0.90 0.90,class:^(kitty)$;\
        keyword windowrulev2 opacity 0.90 0.80,class:^(Spotify)$"
    echo "on" > "$STATE_FILE"
fi
