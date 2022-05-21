# Add ~/.local/bin/ to PATH
if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
fi

# Set dotfiles
export DOTFILES=$HOME/.dotfiles

# Set default programs
export EDITOR=nvim
export TERMINAL=alacritty

# Clean up $HOME
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CACHE_HOME=$HOME/.cache

export GTK2_RC_FILES=$XDG_CONFIG_HOME/gtk-2.0/gtkrc
export LESSHISTFILE=-
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export HISTFILE=$ZDOTDIR/.zsh_history
export PASSWORD_STORE_DIR=$XDG_DATA_HOME/password-store
export GNUPGHOME=$XDG_DATA_HOME/gnupg
export CARGO_HOME=$XDG_DATA_HOME/cargo
export RUSTUP_HOME=$XDG_DATA_HOME/rustup
export NPM_CONFIG_USERCONFIG=$XDG_DATA_HOME/npm/config
export NPM_CONFIG_CACHE=$XDG_CACHE_HOME/npm
export NPM_CONFIG_TMP=$XDG_RUNTIME_DIR/npm

# Fix Jetbrains software in BSPWM
export _JAVA_AWT_WM_NONREPARENTING=1

# Fix terminal TAB completion command duplication
export LC_CTYPE=en_US.UTF-8

# Use system QEMU by default
export LIBVIRT_DEFAULT_URI="qemu:///system"

# Use `bat` as `man` pager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
