#!/bin/sh

TRACK_TITLE="$(mpc current -f "%title%")"
if [ "${#TRACK_TITLE}" -le 1 ]; then
  TRACK_TITLE="$(basename "$(mpc current)")"
fi
TRACK_PERCENTAGE="$(mpc status %percenttime% | xargs | sed 's/%//')"
TIME_ELAPSED="$(mpc status "%currenttime%/%totaltime%")"
MPD_VOLUME="$(mpc volume | cut -d':' -f2 | xargs)"

notify-send -a "$TRACK_TITLE" "$TIME_ELAPSED - $MPD_VOLUME" \
  -t 1000 \
  -e \
  --hint int:value:"$TRACK_PERCENTAGE" \
  --hint string:x-dunst-stack-tag:mpd
