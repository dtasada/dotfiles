if status is-interactive
    # Commands to run in interactive sessions can go here
	function command_exists
		type "$1" &> /dev/null
	end

	# function fish_prompt
	# 	echo ''
	# 	set_color cyan; echo -n (pwd)
	# 	set_color green; echo ' ❯ '
	# end

	starship init fish | source
	
	if command_exists yay
		alias s='yay -Syu'
		alias ss='yay -Ss'
		alias syu='yay -Syu'
		alias rns='yay -Rns'
		alias r='yay -R'
	end
	
	if command_exists nala
		alias s='sudo nala install'
		alias ss='nala search'
		alias syu='sudo nala update'
		alias rns='sudo nala remove'
	end
	
	if command_exists dnf
		alias s='sudo dnf install'
		alias ss='dnf search'
		alias syu='sudo dnf update'
		alias rns='sudo dnf remove'
	end
	
	set edit 'nvim'
	set browser 'brave'
	set fileman 'pcmanfm'
	set fish_greeting
	
	alias ls='exa -l --icons --color=always --group-directories-first'
	alias la='exa -la --icons --color=always --group-directories-first'
	alias ld='exa -D --icons --color=always --group-directories-first'
	alias lg='exa -G --icons --color=always --group-directories-first'
	alias lt='exa -T --icons --color=always --group-directories-first'
	
	alias fs='flatpak install'
	alias fss='flatpak search'
	alias cpa='cp'
	alias v='$edit'
	alias sv='sudo $edit'
	alias dw='cd ~/Downloads'
	alias od='cd ~/OneDrive && ls'
	alias ..='cd ..'
	alias cfgi3='$edit ~/.config/i3/config'
	alias cfgwm='$edit ~/.config/hypr/hyprland.conf'
	alias cfgsh='$edit ~/.zshrc'
	alias cl='clear'
	alias push='~/scripts/gitpush.sh'
	alias glone='~/scripts/gitclone.sh'
	alias untar='tar -xvf'
	export EDITOR=vim
	if [ $COLUMNS -ge 90 ]
	  colorscript -r
	else
	  pfetch
  	end
	
	fish_add_path $HOME/.emacs.d/bin
	fish_add_path $HOME/.local/bin

end

