#!/bin/sh

TRACK_TITLE="$(mpc current -f "%title%")"
if [ "$(echo "$TRACK_TITLE" | wc -c)" -le 1 ]; then
  TRACK_TITLE="$(basename $(mpc current))"
fi
TRACK_PERCENTAGE="$(mpc status %percenttime% | xargs | sed 's/%//')"
TIME_ELAPSED="$(mpc status "%currenttime%/%totaltime%")"
MPD_VOLUME="$(mpc volume | cut -d':' -f2 | xargs)"

notify-send.py "$TRACK_TITLE" "$TIME_ELAPSED $MPD_VOLUME" \
  --hint boolean:transient:true int:has-percentage:"$TRACK_PERCENTAGE" -t 2000 \
  --replaces-process "mpd-info-popup"
