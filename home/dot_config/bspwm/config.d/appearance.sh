#!/bin/sh

wallpaper="qd2q7q"
feh --no-fehbg --bg-scale ~/pictures/wallpapers/$wallpaper@1920x1080.png

bspc config border_width 1
bspc config window_gap 10

bspc config focused_border_color "#dcd7ba"
bspc config normal_border_color "#1f1f28"
