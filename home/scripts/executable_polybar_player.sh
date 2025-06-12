#!/usr/bin/bash
set -euo pipefail

status=$(playerctl status 2>/dev/null) || exit 0

[ "$status" != "Playing" ] && echo "" && exit 0

data=$(playerctl metadata 2>/dev/null)
title=$(echo "$data" | awk '/xesam:title/ { $1=""; $2=""; print substr($0,3) }')
artist=$(echo "$data" | awk '/xesam:artist/ { $1=""; $2=""; print substr($0,3) }')

[ -n "$title" ] && echo "$artist - $title" || echo ""
