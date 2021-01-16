#!/bin/sh

set -eu

setxkbmap -layout br -model pc101
sxhkd &
$HOME/.config/screen-layout/screen-layout.sh
$HOME/.fehbg
picom --config $HOME/.config/compton/compton.conf &
dunst &
$HOME/.config/polybar/panel.sh
pasystray &
nm-applet &
redshift-gtk &

exec bspwm
