# Nushell Config File
#
# version = "0.92.2"

# For more information on defining custom themes, see
# https://www.nushell.sh/book/coloring_and_theming.html
# And here is the theme collection
# https://github.com/nushell/nu_scripts/tree/main/themes
let dark_theme = {
	separator: "#a89984"
	leading_trailing_space_bg: { attr: "n" }
	header: { fg: "#98971a" attr: "b" }
	empty: "#458588"
	bool: {|| if $in { "#8ec07c" } else { "light_gray" } }
	int: "#a89984"
	filesize: {|e|
		if $e == 0b {
			"#a89984"
			} else if $e < 1mb {
				"#689d6a"
			} else {{ fg: "#458588" }}
	}
	duration: "#a89984"
	date: {|| (date now) - $in |
		if $in < 1hr {
			{ fg: "#cc241d" attr: "b" }
			} else if $in < 6hr {
				"#cc241d"
			} else if $in < 1day {
				"#d79921"
			} else if $in < 3day {
				"#98971a"
			} else if $in < 1wk {
				{ fg: "#98971a" attr: "b" }
			} else if $in < 6wk {
				"#689d6a"
			} else if $in < 52wk {
				"#458588"
			} else { "dark_gray" }
	}
	range: "#a89984"
	float: "#a89984"
	string: "#a89984"
	nothing: "#a89984"
	binary: "#a89984"
	cellpath: "#a89984"
	row_index: { fg: "#98971a" attr: "b" }
	record: "#a89984"
	list: "#a89984"
	block: "#a89984"
	hints: "dark_gray"
	search_result: { fg: "#cc241d" bg: "#a89984" }

	shape_and: { fg: "#b16286" attr: "b" }
	shape_binary: { fg: "#b16286" attr: "b" }
	shape_block: { fg: "#458588" attr: "b" }
	shape_bool: "#8ec07c"
	shape_custom: "#98971a"
	shape_datetime: { fg: "#689d6a" attr: "b" }
	shape_directory: "#689d6a"
	shape_external: "#689d6a"
	shape_externalarg: { fg: "#98971a" attr: "b" }
	shape_filepath: "#689d6a"
	shape_flag: { fg: "#458588" attr: "b" }
	shape_float: { fg: "#b16286" attr: "b" }
	shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
	shape_globpattern: { fg: "#689d6a" attr: "b" }
	shape_int: { fg: "#b16286" attr: "b" }
	shape_internalcall: { fg: "#689d6a" attr: "b" }
	shape_list: { fg: "#689d6a" attr: "b" }
	shape_literal: "#458588"
	shape_match_pattern: "#98971a"
	shape_matching_brackets: { attr: "u" }
	shape_nothing: "#8ec07c"
	shape_operator: "#d79921"
	shape_or: { fg: "#b16286" attr: "b" }
	shape_pipe: { fg: "#b16286" attr: "b" }
	shape_range: { fg: "#d79921" attr: "b" }
	shape_record: { fg: "#689d6a" attr: "b" }
	shape_redirection: { fg: "#b16286" attr: "b" }
	shape_signature: { fg: "#98971a" attr: "b" }
	shape_string: "#98971a"
	shape_string_interpolation: { fg: "#689d6a" attr: "b" }
	shape_table: { fg: "#458588" attr: "b" }
	shape_variable: "#b16286"

	background: "#282828"
	foreground: "#ebdbb2"
	cursor: "#ebdbb2"
}

# External completer example
# let carapace_completer = {|spans|
#     carapace $spans.0 nushell ...$spans | from json
# }

# The default config record. This is where much of your global configuration is setup.
$env.config = {
	show_banner: false # true or false to enable or disable the welcome banner at startup

	ls: {
		use_ls_colors: true # use the LS_COLORS environment variable to colorize output
		clickable_links: true # enable or disable clickable links. Your terminal has to support links.
	}

	rm: {
		always_trash: false # always act as if -t was given. Can be overridden with -p
	}

	table: {
		mode: rounded # basic, compact, compact_double, light, thin, with_love, rounded, reinforced, heavy, none, other
		index_mode: always # "always" show indexes, "never" show indexes, "auto" = show indexes when a table has "index" column
		show_empty: true # show 'empty list' and 'empty record' placeholders for command output
		padding: { left: 1, right: 1 } # a left right padding of each column in a table
		trim: {
			methodology: wrapping # wrapping or truncating
			wrapping_try_keep_words: true # A strategy used by the 'wrapping' methodology
			truncating_suffix: "..." # A suffix used by the 'truncating' methodology
		}
		header_on_separator: false # show header text on separator/border line
		# abbreviated_row_count: 10 # limit data rows from top and bottom after reaching a set point
	}

	error_style: "fancy" # "fancy" or "plain" for screen reader-friendly error messages

	# datetime_format determines what a datetime rendered in the shell would look like.
	# Behavior without this configuration point will be to "humanize" the datetime display,
	# showing something like "a day ago."
	datetime_format: {
		# normal: '%a, %d %b %Y %H:%M:%S %z'    # shows up in displays of variables or other datetime's outside of tables
		# table: '%m/%d/%y %I:%M:%S%p'          # generally shows up in tabular outputs such as ls. commenting this out will change it to the default human readable datetime format
	}

	explore: {
		status_bar_background: { fg: "#1D1F21", bg: "#C4C9C6" },
		command_bar_text: { fg: "#C4C9C6" },
		highlight: { fg: "black", bg: "yellow" },
		status: {
			error: { fg: "white", bg: "red" },
			warn: {}
			info: {}
		},
		table: {
			split_line: { fg: "#404040" },
			selected_cell: { bg: light_blue },
			selected_row: {},
			selected_column: {},
		},
	}

	history: {
		max_size: 100_000 # Session has to be reloaded for this to take effect
		sync_on_enter: true # Enable to share history between multiple sessions, else you have to close the session to write history to file
		file_format: "plaintext" # "sqlite" or "plaintext"
		isolation: false # only available with sqlite file_format. true enables history isolation, false disables it. true will allow the history to be isolated to the current session using up/down arrows. false will allow the history to be shared across all sessions.
	}

	completions: {
		case_sensitive: false # set to true to enable case-sensitive completions
		quick: true    # set this to false to prevent auto-selecting completions when only one remains
		partial: true    # set this to false to prevent partial filling of the prompt
		algorithm: "prefix"    # prefix or fuzzy
		external: {
			enable: true # set to false to prevent nushell looking into $env.PATH to find more suggestions, `false` recommended for WSL users as this look up may be very slow
			max_results: 100 # setting it lower can improve completion performance at the cost of omitting some options
			completer: null # check 'carapace_completer' above as an example
		}
		use_ls_colors: true # set this to true to enable file/path/directory completions using LS_COLORS
	}

	filesize: {
		metric: false # true => KB, MB, GB (ISO standard), false => KiB, MiB, GiB (Windows standard)
		format: "auto" # b, kb, kib, mb, mib, gb, gib, tb, tib, pb, pib, eb, eib, auto
	}

	cursor_shape: {
		vi_insert: line # block, underscore, line, blink_block, blink_underscore, blink_line, inherit to skip setting cursor shape (block is the default)
		vi_normal: block # block, underscore, line, blink_block, blink_underscore, blink_line, inherit to skip setting cursor shape (underscore is the default)
	}

	color_config: $dark_theme # if you want a more interesting theme, you can replace the empty record with `$dark_theme`, `$light_theme` or another custom record
	use_grid_icons: true
	footer_mode: "25" # always, never, number_of_rows, auto
	float_precision: 2 # the precision for displaying floats in tables
	buffer_editor: "" # command that will be used to edit the current line buffer with ctrl+o, if unset fallback to $env.EDITOR and $env.VISUAL
	use_ansi_coloring: true
	bracketed_paste: true # enable bracketed paste, currently useless on windows
	edit_mode: vi # emacs, vi
	shell_integration: false # enables terminal shell integration. Off by default, as some terminals have issues with this.
	render_right_prompt_on_last_line: false # true or false to enable or disable right prompt to be rendered on last line of the prompt.
	use_kitty_protocol: true # enables keyboard enhancement protocol implemented by kitty console, only if your terminal support this.
	highlight_resolved_externals: false # true enables highlighting of external commands in the repl resolved by which.
	recursion_limit: 50 # the maximum number of times nushell allows recursion before stopping it

	plugins: {} # Per-plugin configuration. See https://www.nushell.sh/contributor-book/plugins.html#configuration.

	plugin_gc: {
		# Configuration for plugin garbage collection
		default: {
			enabled: true # true to enable stopping of inactive plugins
			stop_after: 10sec # how long to wait after a plugin is inactive to stop it
		}
		plugins: {
			# alternate configuration for specific plugins, by name, for example:
			#
			# gstat: {
			#     enabled: false
			# }
		}
	}

	hooks: {
		pre_prompt: [{ null }] # run before the prompt is shown
		# pre_prompt: "neofetch"
		pre_execution: [{ null }] # run before the repl input is run
		env_change: {
			PWD: [{|before, after| null }] # run if the PWD environment is different since the last repl input
		}
		display_output: "if (term size).columns >= 100 { table -e } else { table }" # run to display the output of a pipeline
		command_not_found: { null } # return an error message when a command is not found
	}

	menus: [
		# Configuration for default nushell menus
		# Note the lack of source parameter
		{
			name: completion_menu
			only_buffer_difference: false
			marker: "| "
			type: {
				layout: columnar
				columns: 4
				col_width: 20     # Optional value. If missing all the screen width is used to calculate column width
				col_padding: 2
			}
			style: {
				text: green
				selected_text: { attr: r }
				description_text: yellow
				match_text: { attr: u }
				selected_match_text: { attr: ur }
			}
		}
		{
			name: ide_completion_menu
			only_buffer_difference: false
			marker: "| "
			type: {
				layout: ide
				min_completion_width: 0,
				max_completion_width: 50,
				max_completion_height: 10, # will be limited by the available lines in the terminal
				padding: 0,
				border: true,
				cursor_offset: 0,
				description_mode: "prefer_right"
				min_description_width: 0
				max_description_width: 50
				max_description_height: 10
				description_offset: 1
				# If true, the cursor pos will be corrected, so the suggestions match up with the typed text
				#
				# C:\> str
				#      str join
				#      str trim
				#      str split
				correct_cursor_pos: false
			}
			style: {
				text: green
				selected_text: { attr: r }
				description_text: yellow
				match_text: { attr: u }
				selected_match_text: { attr: ur }
			}
		}
		{
			name: history_menu
			only_buffer_difference: true
			marker: "? "
			type: {
				layout: list
				page_size: 10
			}
			style: {
				text: green
				selected_text: green_reverse
				description_text: yellow
			}
		}
		{
			name: help_menu
			only_buffer_difference: true
			marker: "? "
			type: {
				layout: description
				columns: 4
				col_width: 20     # Optional value. If missing all the screen width is used to calculate column width
				col_padding: 2
				selection_rows: 4
				description_rows: 10
			}
			style: {
				text: green
				selected_text: green_reverse
				description_text: yellow
			}
		}
	]

	keybindings: [
		{
			name: kill_program
			modifier: control
			keycode: char_p
			mode: vi_insert
			event: [
				{
					edit: insertstring,
					value: 'bash -c `kill -9 $(ps aux | fzf | awk "{print \$2}")`'
				}
				{ send: enter }
			]
		}
		{
			name: open_editor
			modifier: control
			keycode: char_f
			mode: vi_insert
			event: [
				{
					edit: insertstring,
					value: "bash ~/scripts/dev-tmux.sh"
				}
				{ send: enter }
			]
		}
	]
}

### My Config
alias v = nvim
alias sv = kitty -e nvim
alias cl = clear
def ll [] { ls -l | reject inode target readonly num_links }
def la [] { ls -la | reject inode target readonly num_links }

use ~/.cache/starship/init.nu

neofetch
