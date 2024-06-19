#!/bin/sh

while true; do
	if [ "$(cat /sys/class/power_supply/BAT1/capacity)" -le 20 ]; then
		hyprshade on battery-low
		sleep 600
	else
		hyprshade off
		sleep 120
	fi
done
