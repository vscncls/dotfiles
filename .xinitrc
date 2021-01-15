#!/bin/sh
setxkbmap -layout br -model pc101
xrandr --output HDMI-A-0 --primary --mode 2560x1080 --pos 0x634 --output DVI-D-0 --mode 1920x1080 --rate 60 --pos 2560x0 --rotate right
sxhkd &
$HOME/.fehbg &
picom --config $HOME/.config/compton/compton.conf &
dunst &
$HOME/.config/polybar/panel.sh &
pasystray &
nm-applet &
redshift-gtk &

exec bspwm
