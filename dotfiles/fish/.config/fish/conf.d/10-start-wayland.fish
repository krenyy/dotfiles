if begin
        test -z $DISPLAY; and test (tty) = /dev/tty1
    end

    set -x HYPRLAND_LOG_WLR 1

    set -x GDK_SCALE 1
    set -x XCURSOR_SIZE 24
end
