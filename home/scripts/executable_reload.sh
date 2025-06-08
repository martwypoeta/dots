#!/usr/bin/env bash

# reload.sh
#
# very simple reload script that takes care of:
#   * chezmoi
#   * sxhkd
#   * bspwm
#
# created: 01-06-2025
# author: feenko <szymonpel@proton.me>
#
# usage: ./reload.sh

set -euo pipefail

chezmoi apply --exclude=encrypted
sleep 0.5 # some chezmoi changes take little bit more time

processes=(dunst sxhkd)
for proc in "${processes[@]}"; do
  if pgrep -x "$proc" > /dev/null; then
    killall "$proc"
  fi
  nohup "$proc" > /dev/null 2>&1 &
  disown
done

bspc wm --restart

notify-send "reload.sh" "Successfully reloaded system configuration."

~/scripts/vcs.sh
