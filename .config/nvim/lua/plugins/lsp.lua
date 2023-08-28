-- return {
-- 	"neovim/nvim-lspconfig",
--
-- 	dependencies = {
-- 			{ "williamboman/mason.nvim" },
-- 			"williamboman/mason-lspconfig.nvim",
--
-- 			"folke/neodev.nvim",
-- 			"ray-x/lsp_signature.nvim",
-- 		},
--
-- 	config = function()
-- 		local lspconfig = require('lspconfig')
-- 		local lsp_defaults = lspconfig.util.default_config
--
-- 		lsp_defaults.capabilities = vim.tbl_deep_extend(
-- 			'force',
-- 			lsp_defaults.capabilities,
-- 			require('cmp_nvim_lsp').default_capabilities()
-- 		)
--
-- 		lspconfig.lua_ls.setup({})
--
-- 		require("mason").setup()
-- 		require("mason-lspconfig").setup({
-- 			ensure_installed = {
-- 				-- "pylyzer",	-- Python
-- 				"rome", 								-- JS, HTML, CSS, JSON, TS, Md
-- 				"lua_ls", 						-- Lua
-- 			},
-- 		})
--
-- 	end
-- }

return {
	'VonHeikemen/lsp-zero.nvim',
	branch = 'v2.x',
	dependencies = {
		-- LSP Support
		{'neovim/nvim-lspconfig'},             -- Required
		{'williamboman/mason.nvim'},           -- Optional
		{'williamboman/mason-lspconfig.nvim'}, -- Optional

		-- Autocompletion
		{'hrsh7th/nvim-cmp'},     -- Required
		{'hrsh7th/cmp-nvim-lsp'}, -- Required
		{'L3MON4D3/LuaSnip'},     -- Required
	},

	config = function()
		local lsp = require('lsp-zero').preset('recommended')

		lsp.ensure_installed({
			'anakin-lanugage-server',
			'cssls',
			'custom_elements_ls',
			'clangd',
			-- 'sumneko_lua',
			'rust_analyzer',
		})

		local cmp = require('cmp')
		local cmp_select = {behavior = cmp.SelectBehavior.Select}
		local cmp_mappings = lsp.defaults.cmp_mappings({
			["<C-n>"] = cmp.mapping.select_next_item(select_opts),
			["<C-p>"] = cmp.mapping.select_prev_item(select_opts),
			["<C-u>"] = cmp.mapping.scroll_docs(-4),
			["<C-d>"] = cmp.mapping.scroll_docs(4),
			["<C-e>"] = cmp.mapping.abort(),

			["<C-Space>"] = cmp.mapping.complete({}),
			["<Tab>"] = cmp.mapping.confirm({ select = true, }),
			["<CR>"] = cmp.mapping.confirm({ select = true, }),
		})

		-- lsp.set_preferences({
		-- 	suggest_lsp_servers = false,
		-- 	sign_icons = {
		-- 		error = 'E',
		-- 		warn = 'W',
		-- 		hint = 'H',
		-- 		info = 'I'
		-- 	}
		-- })

		lsp.on_attach(function(client, bufnr)
			local opts = {buffer = bufnr, remap = false}

			vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
			vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
			vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
			vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
			vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
			vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
			vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
			vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
			vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
			vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
		end)

		lsp.setup()
	end
}
