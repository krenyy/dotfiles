# oh-my-zsh
ZSH=/usr/share/oh-my-zsh/
ZSH_THEME="robbyrussell"

DISABLE_AUTO_UPDATE="true"

plugins=(git)

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh
# ---

# Rehash ZSH completions automatically
zstyle ":completion:*:commands" rehash 1

# Aliases
alias cp="cp -i"
alias df="df -h"
alias ip='ip -c'
alias ls='exa -alH --group-directories-first'
alias mv='mv -i'
alias rm='rm -i'
alias wget='wget --hsts-file /dev/null'

alias sprunge='curl -F "sprunge=<-" http://sprunge.us'

if command -v pazi &>/dev/null; then
  eval "$(pazi init zsh)"
fi
