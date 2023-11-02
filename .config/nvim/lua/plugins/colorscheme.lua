return {
	"catppuccin/nvim", name = "catppuccin",
	-- "Evalir/dosbox-vim-colorscheme", name = "dosbox",
	-- "folke/tokyonight.nvim", name = "tokyonight",
	-- "i3d/vim-jimbothemes", name = "jimbo",
	-- "rebelot/kanagawa.nvim", name = "kanagawa",
	-- "rose-pine/neovim", name = 'rose-pine',
	priority = 1000,

	config = function()
		vim.opt.background = "dark"
		vim.opt.termguicolors = true

		vim.cmd("colorscheme catppuccin-macchiato")

		-- vim.cmd("colorscheme kanagawa-wave")
		-- vim.cmd("colorscheme breakingbad")
		-- vim.cmd("colorscheme dosbox")
		-- vim.cmd("colorscheme rose-pine-moon")
		-- vim.cmd("colorscheme tokyonight")
		-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		-- vim.api.nvim_set_hl(0, "Normal",      { bg = "none" })
	end
}
