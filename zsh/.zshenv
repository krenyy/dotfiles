export PATH="$PATH:$(du "$HOME/.local/bin" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="firefox"

# Clean-up ~/ dir
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export GTK2_RC_FILES=$XDG_CONFIG_HOME/gtk-2.0/gtkrc
export LESSHISTFILE="-"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$ZDOTDIR/.zsh_history"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export KODI_DATA="$XDG_DATA_HOME/kodi"

# Fix Jetbrains software in BSPWM
export _JAVA_AWT_WM_NONREPARENTING=1

# Fix terminal TAB completion command duplication
export LC_CTYPE=en_US.UTF-8

