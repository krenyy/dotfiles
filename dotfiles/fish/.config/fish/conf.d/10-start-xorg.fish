if begin
        test -z $DISPLAY; and test (tty) = /dev/tty1
    end
    xinit
    exit
end
