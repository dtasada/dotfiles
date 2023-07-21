# .bashrc

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

unset rc

eval "$(starship init bash)"

command_exists () {
	type "$1" &> /dev/null ;
}

if command_exists pacman ; then
	alias s='yay -S'
	alias ss='yay -Ss'
	alias syu='yay -Syyu'
	alias rns='yay -Rns'
fi

if command_exists nala ; then
	alias s='sudo nala install'
	alias ss='nala search'
	alias syu='sudo nala update'
	alias rns='sudo nala remove'
fi

if command_exists dnf ; then
	alias s='sudo dnf install'
	alias ss='dnf search'
	alias syu='sudo dnf update'
	alias rns='sudo dnf remove'
fi

if command_exists xbps-install ; then
	alias s='sudo xbps-install'
	alias ss='xbps-query -Rs'
	alias syu='sudo xbps-install -Su'
	alias rns='sudo xbps-remove -R'
	alias qrs='sudo xbps-query -Rs'
	alias qi='sudo xbps-query -R'
fi

edit='hx'
browser='firefox'
fileman='pcmanfm'

alias ls='exa -l --icons --color=always --group-directories-first'
alias ll='exa -l --icons --color=always --group-directories-first'
alias la='exa -la --icons --color=always --group-directories-first'
alias ld='exa -D --icons --color=always --group-directories-first'
alias lg='exa --icons --color=always --group-directories-first'
alias lt='exa -T --icons --color=always --group-directories-first'

alias fs='flatpak install'
alias fss='flatpak search'
alias v='$edit'
alias sv='sudo $edit'
alias dw='cd ~/Downloads'
alias od='cd ~/OneDrive && ls'
alias ..='cd ..'
alias cfgwm='$edit ~/.config/bspwm/bspwmrc'
alias cfgsh='$edit ~/.config/fish/config.fish'
alias cl='clear'
alias push='~/scripts/gitpush.sh'
alias glone='~/scripts/gitclone.sh'
alias untar='tar -xvf'

export EDITOR=helix

if [ $COLUMNS -ge 92 ]
then
  colorscript -r
else
  pfetch
fi

export PATH=$PATH:/home/dt/.nix-profile/bin

if [[ "$(tty)" = "/dev/tty1" ]]; then
  startx
fi
