mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

$env.config = {
	show_banner: false
	edit_mode: 'vi'

	buffer_editor: "nvim"

	rm: { always_trash: true }
}

$env.config.keybindings ++= [
	{
		name: kill_tmux
		modifier: control
		keycode: char_k
		mode: [emacs vi_normal vi_insert]
		event: {
			send: executehostcommand,
			cmd: "tmux kill-session -t (tmux ls | parse \"{name}: {other}\" | get name | to text | fzf)",
		},
	}
	{
		name: dev_tmux
		modifier: control
		keycode: char_f
		mode: [emacs vi_normal vi_insert]
		event: {
			send: executehostcommand,
			cmd: "bash ($env.HOME)/scripts/dev-tmux.sh",
		}
	}
	{
		name: open_tmux
		modifier: control
		keycode: char_g
		mode: [emacs vi_normal vi_insert]
		event: {
			send: executehostcommand,
			cmd: "bash ($env.HOME)/scripts/open-tmux.sh",
		}
	}
]


alias ll = ls -l
alias la = ls -la
alias lt = ls **/*
alias cl = clear

$env.PATH ++= [
	"$env.HOME/.local/bin",
	"$env.HOME/go/bin",
	"/opt/homebrew/opt/llvm/bin",
]
