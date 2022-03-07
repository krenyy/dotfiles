# Start X
if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
  startx ~/.xinitrc
  logout
fi
