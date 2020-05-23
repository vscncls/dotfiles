#! /bin/sh

# Stolen and adapted from https://old.reddit.com/r/bspwm/comments/au6ody/update_desktops_on_monitor_change/eh6ucze/

pgrep bspwm > /dev/null || exit 0

DESKTOPS_ON_SECOND_MONITOR=4
DESKTOPS=$(bspc query --desktops | tail -n $DESKTOPS_ON_SECOND_MONITOR)

monitor_add() {
    xrandr --output $BSPWM_EXTERNALMONITOR --right-of $BSPWM_INTERNALMONITOR --auto

    for desktop in $1; do
        bspc desktop $desktop --to-monitor $BSPWM_EXTERNALMONITOR
    done

    # Whenever bspwm initializes a new monitor, it automatically assigns it a desktop called Desktop. Just because.
    # We don't want it so let's remove that desktop Desktop:
    bspc desktop Desktop --remove > /dev/null
}

monitor_remove() {
    # Create a new desktop so we can move the desktops out of the old monitor, since BSPWM doesnt allow a monitor to have 0 desktops
    bspc monitor $BSPWM_EXTERNALMONITOR -a Desktop > /dev/null

    for desktop in $1; do
        bspc desktop $desktop --to-monitor $BSPWM_INTERNALMONITOR
    done

    bspc monitor $BSPWM_EXTERNALMONITOR --remove > /dev/null

    xrandr --output $BSPWM_EXTERNALMONITOR --off
}

main() {
    if xrandr | grep -o $BSPWM_EXTERNALMONITOR connected > /dev/null; then
        monitor_add $DESKTOPS
    else
        monitor_remove $DESKTOPS
    fi

    $HOME/.config/bspwm/panel.sh
}

main
