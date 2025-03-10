export EDITOR=nvim
export VISUAL=nvim

export TERM=xterm-256color
export DISPLAY=172.19.32.1:0.0
export HOMEBREW_NO_INSTALL_FROM_API=1

export PATH="$PATH:$HOME/.local/bin"

HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Aliases & bindings
alias ls='exa --icons --color=always --group-directories-first --git -l'
alias ll='ls -l'
alias la='ls -la'
alias ld='ls -D'
alias lt='ls -T'
alias lg='ls --git'

alias v='$EDITOR'
alias sv='sudo $EDITOR'
alias cl='clear'
alias rm='trash'
alias ..='cd ..'

bindkey -v
bindkey "^k" history-search-backward
bindkey "^j" history-search-forward
bindkey -s "^P" 'kill -9 $(ps aux | fzf | awk "{print \\$2}")^M'
bindkey -s "^F" '~/scripts/dev-tmux.sh^M'
bindkey -s "^K" 'tmux kill-session -t $(tmux ls | awk -F: "{print \\$1}" | fzf)^M'

# Sources
if [[ -f "/opt/homebrew/bin/brew" ]] then
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-syntax-highlighting
zinit light Aloxaf/fzf-tab

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls $realpath'

autoload -Uz compinit && compinit

zinit cdreplay -q

eval "$(starship init zsh)"
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
