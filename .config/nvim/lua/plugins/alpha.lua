return {
	'goolord/alpha-nvim',

	dependencies = { "nvim-tree/nvim-web-devicons" },

	event = "VimEnter",

	config = function ()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.buttons.val = {
			dashboard.button("e", "  New file", ":ene <BAR> startinsert<CR>"),
			dashboard.button("LDR f f", "  Find files", "<cmd>Telescope find_files<CR>"),
			dashboard.button("LDR f g", "󰊄  Find text", "<cmd>Telescope live_grep<CR>"),
			dashboard.button("LDR f r", "󰔠  Recent files", "<cmd>Telescope oldfiles<CR>"),
			dashboard.button("LDR f p", "󱠏  Projects", "<cmd>Telescope projects<CR>"),
			dashboard.button("LDR p c", "  Config", "<cmd>e ~/.config/nvim/<CR>"),
			dashboard.button("LDR P l", "  Plugins", "<cmd>Lazy<CR>"),
			dashboard.button("LDR q", "  Quit", "<cmd>qa<CR>"),
		}

		alpha.setup(dashboard.config)
	end,
}
