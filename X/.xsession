#! /bin/sh
export LC_CTYPE="en_US.UTF-8"
xrdb -merge "$HOME/.Xresources"
# select DPI here based on docked / undocked state
xrandr | grep 'DP-3 connected' && xrdb -merge xrdb -merge $HOME/.local/etc/xresources-when-docked

# background
# $HOME/.fehbg &

# layouts
setxkbmap -layout us,ru -option grp:win_space_toggle

# /usr/local/bin/fvwm2
# cwm

# dwm with status bar
# /usr/local/bin/dstat iwm0 &
# /usr/local/bin/dwm

# awesome
/usr/local/bin/awesome
