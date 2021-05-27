cd "$(dirname "$0")"


amixer -c1 sget Mic | grep -q "\[on\]"
MUTED=$?

amixer -c1 set Mic toggle > /dev/null

DISPLAY=:0
if [ $MUTED == 0 ]; then
  echo MUTED
  mpv ./sounds/micmute.wav > /dev/null
else
  echo UNMUTED
  mpv ./sounds/micunmute.wav > /dev/null
fi

