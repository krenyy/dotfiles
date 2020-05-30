#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# --------------------

# Set wallpaper
feh --no-fehbg --bg-scale $HOME/dotfiles/minimalist-nature-landscape-night-a191.jpg

# Set refresh rate
xrandr -r 75

# Set root cursor
xsetroot -cursor_name left_ptr &

# Auth agent
lxpolkit &

# Clipboard manager
greenclip daemon &

# Night light
redshift &

# BSPWM
exec bspwm

