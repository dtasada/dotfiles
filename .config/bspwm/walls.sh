# #!/bin/bash
# 
# #rclone --vfs-cache-mode writes mount "OneDrive": ~/OneDrive
# 
# while :
# do
# #walldir=/home/dt/OneDrive/Personal/Walls
# walldir=/home/dt/walls/
# wallnum=wall$(( ( RANDOM % $(ls $walldir | wc -l)) + 1 )).jpg
# swaybg -i $walldir/$wallnum &
# sleep 30
# done
#

# rclone --vfs-cache-mode writes mount "OneDrive": ~/OneDrive

# #### MY WALLS
# while :
# do
#   walldir=/home/dt/walls
#   # wallnum=wall$(( ( RANDOM % $(ls -l $walldir | wc -l)) + 1 )).jpg
#   if wallnum=wall$(( ( RANDOM % $(ls -l $walldir | wc -l)) + 1 )).jpg; then
# 	  feh --bg-max $walldir/$wallnum
#   fi
#   sleep 30
# done
#
# #### CATPPUCCIN
while :
do
  feh --bg-fill --randomize $HOME/walls/catppuccin/
  sleep 30
done
