#!/bin/bash

killall swaybg || killall feh

DIR=~/walls/dreamy

while true; do
	# feh --bg-fill --randomize ~/walls/catppuccin/ &
	swaybg -i $DIR/$(\ls $DIR | shuf -n 1) &

	if [[ $(ps -e | grep -E "(swaybg|feh)" | wc -l) -gt 1 ]]; then
		kill $(ps -e | grep -E "(swaybg|feh)" | head -1 | awk '{print $1}')
	fi

	sleep 90
done
