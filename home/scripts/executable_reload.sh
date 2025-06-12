#!/usr/bin/bash
set -euo pipefail

~/scripts/vcs.sh &
~/scripts/dump_packages.sh &

chezmoi apply --force --exclude=encrypted
sleep 0.5

procs=(dunst sxhkd picom polybar)
for p in "${procs[@]}"; do
  pkill -x "$p" 2>/dev/null || true
  nohup "$p" >/dev/null 2>&1 & disown
done

bspc wm --restart
notify-send "Reload" "Successfully reloaded system configuration."
