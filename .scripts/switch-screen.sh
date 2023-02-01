#!/bin/sh

switch_to_desktop() {
  xrandr --output eDP --off --output HDMI-A-0 --primary --mode 2560x1440 --refresh 144
}

switch_to_laptop() {
  xrandr --output HDMI-A-0 --off --output eDP --primary --mode 1920x1080 --refresh 120
}

CURRENT_DISPLAY="$(xrandr --listactivemonitors | grep -v Monitors | grep -Eo '[^ ]+$')"
N_OF_DISPLAYS="$(xrandr -q | grep " connected " | wc -l)"

if [ "$N_OF_DISPLAYS" -ne 2 ]; then
  notify-send.py "no display connected! (or too many!)" \
    --hint boolean:transient:true \
    -t 1000 \
    --replaces-process "switch-screen" &
  exit
fi

[ "$CURRENT_DISPLAY" = "eDP" ] && switch_to_desktop || switch_to_laptop
bspc wm -r && sleep 2 && bspc wm -r
