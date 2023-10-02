return {
	-- "catppuccin/nvim", name = "catppuccin",
	"i3d/vim-jimbothemes", name = "jimbo",
	-- "folke/tokyonight.nvim", name = "tokyonight",
	-- "rose-pine/neovim", name = 'rose-pine',
	priority = 1000,

	config = function()
		-- vim.cmd("colorscheme catppuccin-macchiato")
		vim.opt.background = "dark"
		vim.opt.termguicolors = true

		vim.cmd("colorscheme breakingbad")
		-- vim.cmd("colorscheme rose-pine-moon")
		-- vim.cmd("colorscheme tokyonight")
		-- vim.api.nvim_set_hl(0, "Normal",      { bg = "none" })
		-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	end

}
