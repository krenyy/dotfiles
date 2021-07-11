cd "$(dirname "$0")"

amixer sget Mic | grep -q "\[on\]"
MUTED=$?

amixer set Mic toggle >/dev/null

DISPLAY=:0
if [ $MUTED == 0 ]; then
  echo MUTED
  mpv ./sounds/micmute.wav > /dev/null
else
  echo UNMUTED
  mpv ./sounds/micunmute.wav > /dev/null
fi

