#!/bin/sh

revert() {
    xset dpms 0 0 0
}

trap revert HUP INT TERM
xset +dpms dpms 5 5 5

c0='#00000000' # clear
c1='#ffffffff' # white
c2='#ff0000ff' # red

i3lock \
-n			\
--insidevercolor=$c0	\
--ringvercolor=$c1	\
--insidewrongcolor=$c0	\
--ringwrongcolor=$c2	\
\
--insidecolor=$c0	\
--ringcolor=$c0		\
--separatorcolor=$c0	\
--linecolor=$c0		\
\
--timecolor=$c1		\
--datecolor=$c1		\
--keyhlcolor=$c1	\
--bshlcolor=$c1		\
\
--blur 5                \
--clock                 \
--indicator             \
--radius 180		\
--ring-width 10		\
--timestr="%H:%M"	\
--datestr="%A, %B %d."	\
\
--veriftext=""			\
--wrongtext=""			\
--timesize=80			\
--datesize=20

revert

