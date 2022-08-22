#!/bin/sh

switch_to_desktop() {
  xrandr --output eDP-1 --off --output HDMI-1 --primary --mode 2560x1440 --refresh 144
}

switch_to_laptop() {
  xrandr --output HDMI-1 --off --output eDP-1 --primary --mode 1920x1080 --refresh 120
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

if [ "$CURRENT_DISPLAY" == "eDP-1" ]; then
  switch_to_desktop
else
  switch_to_laptop
fi
