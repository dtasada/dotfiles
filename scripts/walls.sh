#!/bin/bash

killall swaybg || killall feh

while true; do
	# if [[ $(ps -e | grep -E "(swaybg|feh)" | wc -l) -gt 1 ]]; then
	# 	kill $(ps -e | grep -E "(swaybg|feh)" | head -1 | awk '{print $1}')
	# fi
	#
	# gert -m '3440' -l 1 -o ~/walls -H -s WidescreenWallpaper -f top -p all
	# rm -rf ~/walls/wides/
	# mv ~/walls/WidescreenWallpaper ~/walls/wides
	DIR=~/walls/gruvbox

	# feh --bg-fill --randomize ~/walls/catppuccin/ &
	killall swaybg
	swaybg -i $DIR/$(\ls $DIR | shuf -n 1) --mode fill &

	sleep 90
done
#
# swaybg -i ~/walls/leapoffaith.jpg &

