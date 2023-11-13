
# set dotfiles directory
set -x DOTFILES "$HOME/.dotfiles"

# set default programs
set -x EDITOR nvim
set -x TERMINAL foot

# set xdg variables
set -x XDG_CACHE_HOME "$HOME/.cache"
set -x XDG_CONFIG_HOME "$HOME/.config"
set -x XDG_DATA_HOME "$HOME/.local/share"
set -x XDG_STATE_HOME "$HOME/.local/state"

# clean up $HOME
set -x ANDROID_HOME "$XDG_DATA_HOME/android"
set -x CARGO_HOME "$XDG_DATA_HOME/cargo"
set -x CUDA_CACHE_PATH "$XDG_CACHE_HOME/nv"
set -x DOT_SAGE "$XDG_CONFIG_HOME/sage"
set -x GNUPGHOME "$XDG_DATA_HOME/gnupg"
set -x GTK2_RC_FILES "$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
set -x LESSHISTFILE -
set -x MATHEMATICA_USERBASE "$XDG_CONFIG_HOME/mathematica"
set -x NPM_CONFIG_CACHE "$XDG_CACHE_HOME/npm"
set -x NPM_CONFIG_TMP "$XDG_RUNTIME_DIR/npm"
set -x NPM_CONFIG_USERCONFIG "$XDG_DATA_HOME/npm/config"
set -x NUGET_PACKAGES "$XDG_CACHE_HOME/NuGetPackages"
set -x PASSWORD_STORE_DIR "$XDG_DATA_HOME/password-store"
set -x RUSTUP_HOME "$XDG_DATA_HOME/rustup"
set -x XINITRC "$XDG_CONFIG_HOME/X11/xinitrc"

# update PATH
set -x PATH "$HOME/.dotnet/tools:$PATH"
set -x PATH "$CARGO_HOME/bin:$PATH"
set -x PATH "$HOME/.local/share/rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin:$PATH"
set -x PATH "$HOME/.local/share/rustup/toolchains/nightly-x86_64-unknown-linux-gnu/bin:$PATH"
set -x PATH "$HOME/.local/bin:$PATH"

# gpg-agent as ssh-agent
set -e SSH_AGENT_PID
set -x SSH_AUTH_SOCK "$(gpgconf --list-dirs agent-ssh-socket)"

# firefox with wayland
set -x MOZ_ENABLE_WAYLAND 1

# explicit specification of video driver
set -x VDPAU_DRIVER radeonsi
set -x LIBVA_DRIVER_NAME radeonsi
