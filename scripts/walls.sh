#!/bin/bash

walldir=$HOME/walls/dreamy

while :
do
  wall=$(ls $walldir | shuf -n 1)
  swaybg -i $walldir/$wall
  sleep 30
done
