#!/bin/echo MEANT_TO_BE_SOURCED!

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

# default runtime values
export PROTON="${PROTON:-/usr/share/steam/compatibilitytools.d/proton-ge-custom/proton}"

export WINE_FULLSCREEN_FSR="${WINE_FULLSCREEN_FSR:-1}"
export WINE_FULLSCREEN_FSR_STRENGTH="${WINE_FULLSCREEN_FSR_STRENGTH:-2}"
export USE_GAMESCOPE="${USE_GAMESCOPE:-1}"

export MANGOHUD="${MANGOHUD:-1}"
_MANGOHUD_CONFIG=(
	gpu_stats
	gpu_temp
	gpu_core_clock
	gpu_mem_clock
	gpu_power
	cpu_stats
	cpu_temp
	cpu_power
	cpu_mhz
	vram
	ram
	swap
	no_display
	toggle_hud=Shift_R+F12
)
export MANGOHUD_CONFIG="${MANGOHUD_CONFIG:-$(
	IFS=,
	echo "${_MANGOHUD_CONFIG[*]}"
)}"
# ---

cd "$(dirname "$0")" || (echo "cd failed" >&2 && exit)

STEAM_COMPAT_CLIENT_INSTALL_PATH=/dev/null
STEAM_COMPAT_DATA_PATH="$(realpath ./.prefix)"
mkdir -p "$STEAM_COMPAT_DATA_PATH"

export STEAM_COMPAT_CLIENT_INSTALL_PATH
export STEAM_COMPAT_DATA_PATH

# symlink home directory from outside the prefix
# this allows for easy prefix regeneration without losing data
HOME_DIR="$(realpath ./.home)"
mkdir -p "$HOME_DIR"
USERS_DIR="$STEAM_COMPAT_DATA_PATH/pfx/drive_c/users"
mkdir -p "$USERS_DIR"
STEAMUSER_DIR="$USERS_DIR/steamuser"
[ -d "$STEAMUSER_DIR" ] && [ ! -L "$STEAMUSER_DIR" ] && rm -rf "$STEAMUSER_DIR"
ln -fnrs "$HOME_DIR" "$STEAMUSER_DIR"

EXE_DIR="$(dirname "$EXE_PATH")"
EXE="$(basename "$EXE_PATH")"

GAMESCOPE="gamescope -b $(cat /sys/class/drm/*/modes | sort -h | uniq | fzf | sed -E 's/^/-W /;s/x/ -H /') -r $(printf '30\n60\n72\n90\n120\n144\n165\n240' | fzf) --"
[ "$USE_GAMESCOPE" -eq 0 ] && GAMESCOPE=""

case "$1" in
"")
	cd "$EXE_DIR" || (echo "cd failed" >&2 && exit)
	$GAMESCOPE "$PROTON" run "$EXE" "$LAUNCH_OPTIONS"
	;;
"tricks")
	PROTON_DIR="$(dirname "$PROTON")"
	export WINEPREFIX="${STEAM_COMPAT_DATA_PATH}/pfx"
	export PATH="${PROTON_DIR}/files/bin:${PATH}"
	"${PROTON_DIR}"/protonfixes/winetricks "${@:2}"
	;;
*)
	echo "running: $PROTON run" "${@:1}"
	$GAMESCOPE "$PROTON" run "${@:1}"
	;;
esac
