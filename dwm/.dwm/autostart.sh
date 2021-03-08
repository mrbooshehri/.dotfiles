#! /bin/bash

# status bar
dwmblocks &

# android studio hack
wmname LG3D

# transparancy
#compton -f -D 10 &
picom -f -D 8 &

# set layout
setxkbmap -layout us,ir 
setxkbmap -option 'grp:alt_shift_toggle' 

# pol-kit
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
# conky
conky > /dev/null 2>&1 &

# redshift
redshift -c ~/.config/redshift/redshift.conf > /dev/null 2>&1 &

# application
#korganizer &
nm-applet &
blueman-applet &
variety &
safeeyes &
syncthing &
#megasync &
kdeconnect-indicator
optimus-manager-qt &
#mocp -S 
# hide mouse cursor
#unclutter -idle 1 -root
