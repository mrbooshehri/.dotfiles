#! /bin/bash

# status bar
dwmblocks &

# Keyboard listner
pgrep -x sxhkd > /dev/null || sxhkd -c ~/.config/sxhkd/sxhkdrc_dwm > /dev/null 2>&1 &

# android studio hack
wmname LG3D

# transparancy
#compton -f -D 10 &
pgerp -x picom > /dev/null || picom -f -D 6 &

# set layout
#setxkbmap -layout us,ir 
#setxkbmap -option 'grp:alt_shift_toggle' 

# pol-kit
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
# conky
pgerp -x conky > /dev/null || conky > /dev/null 2>&1 &

# redshift
pgerp -x redshift > /dev/null || redshift -c ~/.config/redshift/redshift.conf > /dev/null 2>&1 &

# colorscheme
#bash ~/scripts/general/color-scheme.sh

feh --bg-fill --randomize /mnt/1TB/Pictures/Wallpaper.repo/* 

# application
#korganizer &
nm-applet &
blueman-applet &
pywalfox start &
#variety &
safeeyes &
syncthing &
#megasync &
kdeconnect-indicator
#optimus-manager-qt &
#mocp -S 
# hide mouse cursor
#unclutter -idle 1 -root
