#!/bin/sh
setxkbmap -layout br -model pc101
xrandr --output DisplayPort-0 --off --output DisplayPort-1 --off --output DisplayPort-2 --off --output HDMI-A-0 --primary --mode 2560x1080 --pos 0x0 --rotate normal --output DVI-D-0 --mode 1920x1080 --rate 60 --pos 2560x0 --rotate normal
sxhkd &
$HOME/.fehbg &
compton --config $HOME/.config/compton/compton.conf &
dunst &
$HOME/.config/polybar/panel.sh &
pasystray &
nm-applet &

exec bspwm
