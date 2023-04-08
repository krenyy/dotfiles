#!/bin/fish

function run_xorg
    bash -c "(xinit <(echo 'dwm & unclutter & $PROGRAM') -- -config headless/$(echo $MODE | cut -dx -f2 | cut -dH -f1).conf && killall sunshine) & DISPLAY=:0 sunshine"
end

function run_wayland
    set SWAY_OPTS "\
bindsym Mod1+f fullscreen
bindsym Mod1+1 workspace number 1
bindsym Mod1+2 workspace number 2
bindsym Mod1+3 workspace number 3
bindsym Mod1+4 workspace number 4
bindsym Mod1+5 workspace number 5
bindsym Mod1+6 workspace number 6
bindsym Mod1+7 workspace number 7
bindsym Mod1+8 workspace number 8
bindsym Mod1+9 workspace number 9
bindsym Mod1+0 workspace number 10
bindsym Mod1+Shift+1 move container to workspace number 1
bindsym Mod1+Shift+2 move container to workspace number 2
bindsym Mod1+Shift+3 move container to workspace number 3
bindsym Mod1+Shift+4 move container to workspace number 4
bindsym Mod1+Shift+5 move container to workspace number 5
bindsym Mod1+Shift+6 move container to workspace number 6
bindsym Mod1+Shift+7 move container to workspace number 7
bindsym Mod1+Shift+8 move container to workspace number 8
bindsym Mod1+Shift+9 move container to workspace number 9
bindsym Mod1+Shift+0 move container to workspace number 10
bindsym Mod1+q kill
bindsym Mod1+Return exec alacritty
exec swaymsg create_output
exec swaymsg output \"HEADLESS-1\" mode $MODE
exec sunshine & $PROGRAM && killall sunshine sway || killall sunshine sway\
"
    sway --unsupported-gpu --config (echo "$SWAY_OPTS" | psub)
end

set MODE "$argv[1]"
set PROTOCOL "$argv[2]"
set PROGRAM "$argv[3]"
[ -z $PROGRAM ] || [ "$PROGRAM" -eq "" ] && exit 1
switch $argv[2]
    case xorg
        run_xorg "$MODE"
    case wayland
        run_wayland "$MODE"
    case '*'
        echo "failed!"
end
