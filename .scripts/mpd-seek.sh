#!/bin/sh

if [ -z "$1" ]; then
  echo "no arguments passed!" && exit
fi

BEFORE_STATE=$(mpc status "%state%")

mpc $1
$DOTFILES/.scripts/mpd-info.sh

if [ "$BEFORE_STATE" = "paused" ]; then
  mpc pause
fi
