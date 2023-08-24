

return {
	"neovim/nvim-lspconfig",

	dependencies = {
			{ "williamboman/mason.nvim" },
			"williamboman/mason-lspconfig.nvim",

			"folke/neodev.nvim",
			"ray-x/lsp_signature.nvim",
		},

	config = function()
		local lspconfig = require('lspconfig')
		local lsp_defaults = lspconfig.util.default_config

		lsp_defaults.capabilities = vim.tbl_deep_extend(
			'force',
			lsp_defaults.capabilities,
			require('cmp_nvim_lsp').default_capabilities()
		)

		lspconfig.lua_ls.setup({})

		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				-- "pylyzer",	-- Python
				"rome", 								-- JS, HTML, CSS, JSON, TS, Md
				"lua_ls", 						-- Lua
			},
		})

	end
}
