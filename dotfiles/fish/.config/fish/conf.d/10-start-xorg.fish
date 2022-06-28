if begin
        test -z $DISPLAY; and test (tty) = /dev/tty1
    end
    xinit -- vt1
    exit
end
