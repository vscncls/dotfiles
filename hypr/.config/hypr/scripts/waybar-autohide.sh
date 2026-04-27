#!/usr/bin/env bash

THRESHOLD=5
HIDE_DELAY=1.0
POLL=0.05
visible=false

toggle() {
  pkill -SIGUSR1 waybar
}

# Start hidden
toggle
visible=false

while true; do
  y=$(hyprctl cursorpos -j | jq '.y')

  if ((y <= THRESHOLD)); then
    if ! $visible; then
      toggle
      visible=true
    fi
    sleep "$HIDE_DELAY"
  else
    if $visible; then
      toggle
      visible=false
    fi
  fi

  sleep "$POLL"
done
