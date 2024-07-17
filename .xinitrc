#!/bin/bash

set -eu

systemctl --user import-environment DISPLAY
systemctl --user start dunst
sxhkd &
##$HOME/.config/screen-layout/screen-layout.sh
$HOME/.fehbg
picom --config $HOME/.config/compton/compton.conf &
pasystray &
nm-applet &
redshift-gtk &
easyeffects &

thorium-browser &
spotify &
discord &
steam &

setxkbmap -option compose:caps

exec bspwm
