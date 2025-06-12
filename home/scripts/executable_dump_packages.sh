#!/usr/bin/bash
set -euo pipefail

dest="$HOME/projects/dotfiles/state"
mkdir -p "$dest"

file="$dest/pacman_$(date +%s).log"
latest=$(ls -1t "$dest"/pacman_*.log 2>/dev/null || true | head -1)

tmp=$(mktemp)
pacman -Qe > "$tmp"

if [[ -z $latest ]]; then
  mv "$tmp" "$file"
elif ! diff -q "$tmp" "$latest" &>/dev/null; then
  mv "$tmp" "$file"
else
  rm "$tmp"
fi
