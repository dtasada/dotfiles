# Created by newuser for 5.9

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
  PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

unset rc

eval "$(starship init zsh)"

export EDITOR=nvim
export VISUAL='kitty -e nvim'

alias ls='exa --icons --color=always --group-directories-first --git -l'
alias ll='exa --icons --color=always --group-directories-first --git -l'
alias la='exa --icons --color=always --group-directories-first --git -la'
alias ld='exa --icons --color=always --group-directories-first --git -D'
alias lt='exa --icons --color=always --group-directories-first --git -T'
alias lg='exa --icons --color=always --group-directories-first --git'

alias v='$EDITOR'
alias sv='sudo $EDITOR'
alias dw='cd ~/Downloads'
alias od='cd ~/OneDrive && ls'
alias ..='cd ..'
alias cl='clear'
alias push='~/scripts/gitpush.sh'
alias glone='~/scripts/gitclone.sh'

neofetch

if [[ "$(tty)" = "/dev/tty1" ]]; then
	exec Hyprland
fi

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# sudo pacman -S zsh-syntax-highlighting zsh-autosuggestions
