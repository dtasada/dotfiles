#!/bin/bash

#rclone --vfs-cache-mode writes mount "OneDrive": ~/OneDrive

# while :
# do
# #walldir=/home/dt/OneDrive/Personal/Walls
#   walldir=/home/dt/walls/
#   wallnum=wall$(( ( RANDOM % $(ls $walldir | wc -l))  + 1 )).jpg
#   swaybg -i $walldir/$wallnum &
#   sleep 30
# done

while :
do
  walldir=$HOME/walls/catppuccin
  wall=$(ls $walldir | shuf -n 1)
  swaybg -i $walldir/$wall
done
