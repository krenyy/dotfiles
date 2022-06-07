if begin
        test -z $DISPLAY; and test (tty) = /dev/tty1
    end
    startx ~/.xinitrc
    exit
end
