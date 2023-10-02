#!/bin/bash

while true; do
	killall swaybg || killall feh
	DIR=~/walls/dreamy
	# feh --bg-fill --randomize ~/walls/catppuccin/ &
	swaybg -i $DIR/$(\ls $DIR | shuf -n 1) &
	sleep 90
done
