#!/bin/bash

if [[ -z $1 ]]; then exit; fi

# Create a new tmux session
name=$(basename $1)
tmux new-session -d -s $name -c $1 

# Split the first window horizontally and run the first command
tmux send-keys -t $name:1 "exec nvim" C-m

# Split the second window vertically and run the second command
tmux new-window -t $name:2 -n "lazygit" -c $1
tmux send-keys -t $name:2 "exec lazygit" C-m

# Create a new window and run the third command
tmux new-window -t $name:3 -n "shell" -c $1

# Attach to the tmux session
tmux attach -t $name
