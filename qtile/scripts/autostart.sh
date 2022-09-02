#!/bin/bash

#Set keyboard layout
setxkbmap -layout us -variant intl &

#picom
picom -f --experimental-backends &

#nitrogen
nitrogen --restore &

#nm-applet
nm-applet &

#blueman
blueman-applet &

#polkit
/usr/lib/polkit-1 &

#mpd
mpd ~/.config/mpd/mpd.conf &

#emacs
/usr/bin/emacs --daemon &
