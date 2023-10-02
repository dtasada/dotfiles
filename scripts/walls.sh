#!/bin/bash

while true; do
	killall swaybg || killall feh
	# feh --bg-fill --randomize ~/walls/catppuccin/ &
	swaybg -i ~/walls/sunfire/$(\ls ~/walls/sunfire | shuf -n 1) &
	sleep 90
done
