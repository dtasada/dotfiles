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
			'bashls',
			'cssls',
			'kotlin_language_server',
			'lua_ls',
			'pylsp',
			'rust_analyzer',
			'tsserver'
		})

		local cmp = require('cmp')
		local cmp_select = {behavior = cmp.SelectBehavior.Select}
		-- local cmp_mappings = 
        lsp.setup_nvim_cmp({ mapping = lsp.defaults.cmp_mappings({
            ["<C-n>"] = cmp.mapping.select_next_item(select_opts),
            ["<C-p>"] = cmp.mapping.select_prev_item(select_opts),
            ["<C-u>"] = cmp.mapping.scroll_docs(-4),
            ["<C-d>"] = cmp.mapping.scroll_docs(4),
            ["<C-e>"] = cmp.mapping.abort(),

            ["<Tab>"] = cmp.mapping.confirm({ select = true, }),
            ["<cr>"] = cmp.mapping.confirm({ select = true, }),
            })
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
