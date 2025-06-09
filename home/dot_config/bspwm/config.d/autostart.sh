#!/bin/sh

autostart() {
  local cmd="$1"
  local name=$(basename "$cmd" | cut -d' ' -f1)

  if ! pgrep -x "$name" > /dev/null; then
    eval "$cmd &"
  fi
}

autostart "picom --config ~/.config/picom/picom.conf"
autostart "polybar"
autostart "sxhkd"
autostart "dunst"
