
# Start X
if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
	startx $DOTFILES/dotfiles/.xinitrc
	logout
fi

