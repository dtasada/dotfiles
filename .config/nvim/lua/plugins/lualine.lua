return {
	'nvim-lualine/lualine.nvim',
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				section_separators = { left = '', right = '' },
				component_separators = { left = '', right = '' },
			}
			-- section_separators = { left = 'ls', right = 'rs' },
			-- component_separators = { left = 'lc', right = 'rc' },

		})
	end
}
