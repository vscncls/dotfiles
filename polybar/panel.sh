killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

PRIMARY=$(xrandr | grep primary | awk '{print $1}')

MONITOR=$PRIMARY polybar --reload mainbar-bspwm &

for m in $(polybar --list-monitors | cut -d":" -f1 | grep -v $PRIMARY); do
		MONITOR=$m polybar --reload sidebar-bspwm &
done
