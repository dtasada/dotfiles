# .bashrc

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
  PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

unset rc

eval "$(starship init bash)"

export EDITOR=nvim

alias ls='exa -l --icons --color=always --group-directories-first'
alias ll='exa -l --icons --color=always --group-directories-first'
alias la='exa -la --icons --color=always --group-directories-first'
alias ld='exa -D --icons --color=always --group-directories-first'
alias lg='exa --icons --color=always --group-directories-first'
alias lt='exa -T --icons --color=always --group-directories-first'

alias v='$EDITOR'
alias sv='sudo $EDITOR'
alias dw='cd ~/Downloads'
alias od='cd ~/OneDrive && ls'
alias ..='cd ..'
alias cl='clear'
alias push='~/scripts/gitpush.sh'
alias glone='~/scripts/gitclone.sh'

neofetch
