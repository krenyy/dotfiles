export ZSH="$XDG_DATA_HOME/oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh


# Rehash ZSH completions automatically
zstyle ":completion:*:commands" rehash 1


# Disable oh-my-zsh update prompt
export DISABLE_UPDATE_PROMPT="true"


# Aliases
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'
alias watch='watch --color '
alias ip='ip -c'
alias df="df -h"
alias ls='exa -al --group-directories-first'
alias wget='wget --content-disposition'
alias clock='tty-clock -c -C 1'
alias qr='shotgun -g $(slop) - | zbarimg -q --raw -'
alias tb='nc termbin.com 9999'
alias sprunge='curl -F "sprunge=<-" http://sprunge.us'


# Use `bat` as `man` pager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"


# Use system qemu as default
export LIBVIRT_DEFAULT_URI="qemu:///system"


# Get info from magnet link
magnet-info() {
	hash=$(echo "$1" | grep -oP "(?<=btih:).*?(?=&)")
	echo "Magnet hash: $hash"
	aria2c --bt-metadata-only=true --bt-save-metadata=true -q "$1"
	aria2c "$hash.torrent" -S
	rm -f "$hash.torrent"
}


# Start X
if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
	startx $DOTFILES/dotfiles/.xinitrc
	logout
fi

