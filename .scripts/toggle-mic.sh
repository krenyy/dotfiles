#!/bin/sh
cd $(dirname $0)

CARD_NUMBER="$(grep card /proc/asound/U192k/pcm0c/info | awk '{print $2}')"
AMIXER_CMD="amixer -c $CARD_NUMBER"

$AMIXER_CMD sget Mic | grep -q "\[on\]"
MUTED="$?"

if [ "$MUTED" == "0" ]; then
  MESSAGE=" muted"
  SOUND_FILENAME="message.oga"
else
  MESSAGE=" unmuted"
  SOUND_FILENAME="bell.oga"
fi

$AMIXER_CMD set Mic toggle >/dev/null &&
  notify-send.py "$MESSAGE" --hint boolean:transient:true -t 1000 --replaces-process "mic-toggle-popup" &&
  DISPLAY=:0 mpv "/usr/share/sounds/freedesktop/stereo/$SOUND_FILENAME" >/dev/null
