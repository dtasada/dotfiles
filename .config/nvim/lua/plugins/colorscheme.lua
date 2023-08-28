return {
	-- "catppuccin/nvim", name = "catppuccin",
  -- "folke/tokyonight.nvim", name = "tokyonight",
	"rose-pine/neovim", name = 'rose-pine',
	priority = 1000,

  config = function()
  	-- vim.cmd("colorscheme catppuccin-macchiato")
		-- vim.cmd("colorscheme tokyonight")
		vim.cmd("colorscheme rose-pine-moon")
		-- vim.api.nvim_set_hl(0, "Normal",      { bg = "none" })
		-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  end

}
