#!/bin/sh
cd $(dirname $0)

amixer sget Capture | grep -q "\[on\]"
MUTED="$?"

if [ "$MUTED" == "0" ]; then
  MESSAGE=" muted"
  SOUND_FILENAME="bell.oga"
else
  MESSAGE=" unmuted"
  SOUND_FILENAME="message.oga"
fi

amixer set Capture toggle >/dev/null &&
  notify-send.py "$MESSAGE" --hint boolean:transient:true -t 1000 --replaces-process "mic-toggle-popup" &&
  DISPLAY=:0 mpv "/usr/share/sounds/freedesktop/stereo/$SOUND_FILENAME" >/dev/null
