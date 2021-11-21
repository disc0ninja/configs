#!/bin/sh

# make sure this is before the exec command
# source .xprofile
#[ -f ~/.xprofile ] && .  ~/.xprofile
exec xrdb -merge ~/.Xresources &

exec redshift &
exec xscreensaver &
exec /usr/local/bin/slstatus & 
#exec urxvtd --quiet --opendisplay --fork &
#exec setxkbmap -option caps:swapescape &
exec feh --bg-center ~/configs/multnomah.jpg & 
exec dbus-launch --exit-with-session dwm
#exec dbus-launch --exit-with-session qtile
#exec dbus-launch --exit-with-session leftwm
xset +fp /usr/share/fonts/fontawesome &
