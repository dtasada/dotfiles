#!/bin/bash

arg=$(find ~/git -maxdepth 1 -type d | fzf)
if [[ -z $arg ]]; then exit; fi

name=$(basename $arg)
existing=$(tmux ls | awk -F : '{print $arg}')

if [[ "$existing" == *"$name"* ]]; then
	echo "Session already exists!"
	tmux attach-session -t $name:1
else
	echo "Creating new session"
	tmux new-session -d -s $name -c $arg 

	tmux send-keys -t $name:1 "exec nvim" C-m

	tmux new-window -t $name:2 -n "lazygit" -c $arg
	tmux send-keys -t $name:2 "exec lazygit" C-m

	tmux new-window -t $name:3 -n "shell" -c $arg

	tmux attach -t $name:1
fi
