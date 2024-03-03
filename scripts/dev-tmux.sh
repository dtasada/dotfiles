#!/bin/bash

if [[ -z $1 ]]; then exit; fi

name=$(basename $1)
existing=$(tmux ls | awk -F : '{print $1}')

if [[ "$existing" == *"$name"* ]]; then
	echo "Session already exists!"
	tmux attach-session -t $name:1
else
	echo "Creating new session"
	tmux new-session -d -s $name -c $1 

	tmux send-keys -t $name:1 "exec nvim" C-m

	tmux new-window -t $name:2 -n "lazygit" -c $1
	tmux send-keys -t $name:2 "exec lazygit" C-m

	tmux new-window -t $name:3 -n "shell" -c $1

	tmux attach -t $name:1
fi
