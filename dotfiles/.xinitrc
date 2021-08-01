#!/bin/sh

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ]; then
	for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

# Polkit
lxpolkit &

# Set wallpaper
feh --no-fehbg --bg-scale $DOTFILES/.wallpapers/.current

# Set default cursor
xsetroot -cursor_name left_ptr &

if [[ -z "$WM" ]]; then
	WM="bspwm"
fi

# Start the window manager
while true; do
	$WM
done
