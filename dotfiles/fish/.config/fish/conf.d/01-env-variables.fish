# add ~/.local/bin/ to PATH
set -x PATH "$HOME/.local/bin:$PATH"

# set dotfiles directory
set -x DOTFILES "$HOME/.dotfiles"

# set default programs
set -x EDITOR nvim
set -x TERMINAL alacritty

# set xdg variables
set -x XDG_CONFIG_HOME "$HOME/.config"
set -x XDG_DATA_HOME "$HOME/.local/share"
set -x XDG_CACHE_HOME "$HOME/.cache"

# clean up $HOME
set -x GTK2_RC_FILES "$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
set -x LESSHISTFILE -
set -x PASSWORD_STORE_DIR "$XDG_DATA_HOME/password-store"
set -x GNUPGHOME "$XDG_DATA_HOME/gnupg"
set -x CARGO_HOME "$XDG_DATA_HOME/cargo"
set -x RUSTUP_HOME "$XDG_DATA_HOME/rustup"
set -x NPM_CONFIG_USERCONFIG "$XDG_DATA_HOME/npm/config"
set -x NPM_CONFIG_CACHE "$XDG_CACHE_HOME/npm"
set -x NPM_CONFIG_TMP "$XDG_RUNTIME_DIR/npm"

# fix jetbrains software in bspwm
set -x _JAVA_AWT_WM_NONREPARENTING 1

# `bat` as `man` pager
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
