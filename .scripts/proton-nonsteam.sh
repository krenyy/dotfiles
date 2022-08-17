#!/bin/echo this file is meant to be sourced, not executed directly!

# --- EXAMPLE FILE
# #!/bin/bash
#
# export EXE_PATH="./NieRAutomata.exe"
# export LAUNCH_OPTIONS=""
#
# export PROTON="/usr/share/steam/compatibilitytools.d/proton-ge-custom/proton"
#
# export WINE_FULLSCREEN_FSR=1
# export WINE_FULLSCREEN_FSR_STRENGTH=2
#
# export MANGOHUD=1
# export MANGOHUD_CONFIG="no_display,cpu_stats,gpu_stats,vram,ram,toggle_hud=Shift_R+F12"
#
# . $DOTFILES/.scripts/proton-nonsteam.sh
# ---

cd "$(dirname "$0")"
export SCRIPT_NAME="$0"

export STEAM_COMPAT_CLIENT_INSTALL_PATH=/dev/null
export STEAM_COMPAT_DATA_PATH="$(realpath ./.prefix)"
mkdir -p "$STEAM_COMPAT_DATA_PATH"

# symlink home directory from outside the prefix
# this allows for easy prefix regeneration without losing data
export HOME_DIR="$(realpath ./.home)"
mkdir -p "$HOME_DIR"
export USERS_DIR="$STEAM_COMPAT_DATA_PATH/pfx/drive_c/users"
export STEAMUSER_DIR="$USERS_DIR/steamuser"
mkdir -p "$USERS_DIR"
ln -fnrs "$HOME_DIR" "$STEAMUSER_DIR"

export EXE_DIR="$(dirname "$EXE_PATH")"
export EXE="$(basename "$EXE_PATH")"

case "$1" in
"")
  cd "$EXE_DIR"
  "$PROTON" run "$EXE" "$LAUNCH_OPTIONS"
  ;;
*)
  "$PROTON" run "${@:1}"
  ;;
esac
