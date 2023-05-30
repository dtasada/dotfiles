#!/bin/bash

# pkill -USR1 -x sxhkd
killall sxhkd
killall polybar
killall shutter
bspc wm -r
