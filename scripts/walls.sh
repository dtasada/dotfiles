#!/bin/bash

killall swaybg || killall feh
swww-daemon &

# while true; do
# 	# if [[ $(ps -e | grep -E "(swaybg|feh)" | wc -l) -gt 1 ]]; then
# 	# 	kill $(ps -e | grep -E "(swaybg|feh)" | head -1 | awk '{print $1}')
# 	# fi
# 	#
# 	# gert -m '3440' -l 1 -o ~/walls -H -s WidescreenWallpaper -f top -p all
# 	# rm -rf ~/walls/wides/
# 	# mv ~/walls/WidescreenWallpaper ~/walls/wides
# 	DIR=~/walls/gruvbox
#
# 	# feh --bg-fill --randomize ~/walls/catppuccin/ &
# 	killall swaybg
# 	swaybg -i $DIR/$(\ls $DIR | shuf -n 1) --mode fill &
#
# 	sleep 90
# done

# export SWWW_TRANSITION_FPS=60
# export SWWW_TRANSITION_STEP=2
# export SWWW_TRANSITION=wipe
#
# # This controls (in seconds) when to switch to the next image
#
# while true; do
# 	swww img "$DIR/$(\ls $DIR | shuf -n 1)"
# 	sleep 90
# done

DIR=~/walls/gruvbox
swww img "$DIR/$(\ls $DIR | shuf -n 1)"
