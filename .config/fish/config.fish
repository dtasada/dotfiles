if status is-interactive
    # Commands to run in interactive sessions can go here

	starship init fish | source
	
	if type -q pacman
		alias s='yay -S'
		alias ss='yay -Ss'
		alias syu='yay -Syu'
		alias rns='yay -Rns'
		alias r='yay -R'
	end
	
	if type -q nala
		alias s='sudo nala install'
		alias ss='nala search'
		alias syu='sudo nala update'
		alias rns='sudo nala remove'
	end
	
	if type -q dnf
		alias s='sudo dnf install'
		alias ss='dnf search'
		alias syu='sudo dnf update'
		alias rns='sudo dnf remove'
	end
	
	set edit 'helix'
	set browser 'brave'
	set fileman 'pcmanfm'
	set fish_greeting
	
	alias ls='exa -l --icons --color=always --group-directories-first'
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

	alias crun='cd build && cmake .. && make && cd target && ./main && cd ../..'
	
	export EDITOR=helix
	if [ $COLUMNS -ge 90 ]
	  colorscript -r
	else
	  pfetch
  	end
	
	fish_add_path $HOME/.emacs.d/bin
	fish_add_path $HOME/.local/bin
	fish_add_path $HOME/.cargo/bin

end

