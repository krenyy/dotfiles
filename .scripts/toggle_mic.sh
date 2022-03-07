cd $(dirname $0)

CARD_NUMBER=$(grep card /proc/asound/U192k/pcm0c/info | awk '{print $2}')
AMIXER_CMD="amixer -c $CARD_NUMBER"

$AMIXER_CMD sget Mic | grep -q "\[on\]"
MUTED=$?

$AMIXER_CMD set Mic toggle >/dev/null

DISPLAY=:0
if [ $MUTED == 0 ]; then
  mpv ~/.local/share/sounds/micmute.wav >/dev/null
else
  mpv ~/.local/share/sounds/micunmute.wav >/dev/null
fi
