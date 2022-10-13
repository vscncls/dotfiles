#!/bin/sh

set -eu

systemctl --user import-environment DISPLAY
systemctl --user start dunst
setxkbmap -layout br -model pc101
sxhkd &
$HOME/.config/screen-layout/screen-layout.sh
$HOME/.fehbg
picom --config $HOME/.config/compton/compton.conf &
pasystray &
nm-applet &
redshift-gtk &
easyeffects &

exec bspwm
