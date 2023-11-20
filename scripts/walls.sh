#!/bin/bash

killall swaybg || killall feh

DIR=~/walls/wides

while true; do
	rm -rf ~/walls/wides/
	gert -m '3440' -l 1 -o ~/walls/ -H -s WidescreenWallpaper -f top -p all
	mv ~/walls/WidescreenWallpaper ~/walls/wides

	if [[ $(ps -e | grep -E "(swaybg|feh)" | wc -l) -gt 1 ]]; then
		kill $(ps -e | grep -E "(swaybg|feh)" | head -1 | awk '{print $1}')
	fi

	# feh --bg-fill --randomize ~/walls/catppuccin/ &
	swaybg -i $DIR/$(\ls $DIR | shuf -n 1) &

	sleep 2
done
