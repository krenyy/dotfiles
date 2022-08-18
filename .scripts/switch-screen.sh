#!/bin/sh

switch_to_desktop() {
  xrandr --output eDP-1 --off --output HDMI-1 --primary --mode 2560x1440 --refresh 144
}

switch_to_laptop() {
  xrandr --output eDP-1 --primary --mode 1920x1080 --refresh 120 --output HDMI-1 --off
}

CURRENT_DISPLAY="$(xrandr --listactivemonitors | grep -v Monitors | grep -Eo '[^ ]+$')"
N_OF_DISPLAYS="$(xrandr -q | grep " connected " | wc -l)"

if [ "$N_OF_DISPLAYS" -neq 2 ]; then
  exit;
fi

if [ "$CURRENT_DISPLAY" == "eDP-1" ]; then
  switch_to_desktop
else
  switch_to_laptop
fi

bspc wm -r

