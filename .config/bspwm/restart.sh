#!/bin/bash

pkill -USR1 -x sxhkd
killall sxhkd
# sxhkd &
killall polybar
bspc wm -r
