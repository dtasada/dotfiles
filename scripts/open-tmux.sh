#!/bin/bash

name=$(tmux ls | awk -F : '{print $1}' | fzf)

tmux attach-session -t $name
