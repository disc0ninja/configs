#!/bin/sh

# make sure this is before the exec command
# source .xprofile
#[ -f ~/.xprofile ] && .  ~/.xprofile
exec xrdb -merge ~/.Xresources &

exec xscreensaver &
exec /usr/local/bin/slstatus & 
#exec urxvtd --quiet --opendisplay --fork &
#exec setxkbmap -option caps:swapescape &
exec hsetroot -fill ~/configs/multnomah.jpg &
exec dbus-launch --exit-with-session dwm
#exec dbus-launch --exit-with-session qtile
#exec dbus-launch --exit-with-session leftwm
xset +fp /usr/share/fonts/fontawesome &
