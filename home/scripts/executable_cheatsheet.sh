#!/usr/bin/bash

# cheatsheet.sh
#
# displays common keybinds, useful for dummies like myself
#
# created: 02-06-2025
# author: feenko <szymonpel@proton.me>
#
# usage: ./cheatsheet.sh

icon=""

keybinds=(
  "Q" "terminal"
  "F" "browser"
  "D" "code"
  "V" "discord"
  "R" "deadbeef"
)

min_gap=22

# calculate max length of first column (key + label)
max_width=0
for ((i = 0; i < ${#keybinds[@]}; i += 2)); do
  key="${keybinds[i]}"
  label="${keybinds[i+1]}"
  width=$(( ${#icon} + 1 + ${#key} + 1 + ${#label} )) # icon + space + key + space + label
  (( width > max_width )) && max_width=$width
done

msg=""
for ((i = 0; i < ${#keybinds[@]}; i += 2)); do
  key1="${keybinds[i]}"
  label1="${keybinds[i+1]}"
  col1="<b>$icon $key1</b> $label1"

  if (( i + 3 < ${#keybinds[@]} )); then
    key2="${keybinds[i+2]}"
    label2="${keybinds[i+3]}"
    col2="<b>$icon $key2</b> $label2"

    # calculate actual gap
    gap_size=$(( max_width + min_gap - ${#col1} ))
    gap=$(printf '%*s' "$gap_size" '')

    msg+="$col1$gap$col2\n"
    ((i+=2)) # skip handled pair
  else
    msg+="$col1\n"
  fi
done

notify-send "cheatsheet.sh" "$msg" --hint=int:transient:1
