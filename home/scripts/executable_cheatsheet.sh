#!/usr/bin/bash
set -euo pipefail

icon=""
gap=22
k=( Q terminal W browser E code A deadbeef )

w=0
for ((i=0;i<${#k[@]};i+=2)); do
  l="${#icon} + 1 + ${#k[i]} + 1 + ${#k[i+1]}"
  (( l > w )) && w=$l
done

m=""
for ((i=0;i<${#k[@]};i+=2)); do
  c1="<b>$icon ${k[i]}</b> ${k[i+1]}"
  if (( i+3 < ${#k[@]} )); then
    c2="<b>$icon ${k[i+2]}</b> ${k[i+3]}"
    g=$(printf '%*s' $((w+gap-${#c1})) '')
    m+="$c1$g$c2\n"
    ((i+=2))
  else
    m+="$c1\n"
  fi
done

notify-send "Keybinds" "$m" --hint=int:transient:1
