-- Generic
vim.keymap.set("n", "<leader>e", "<cmd>wqa<cr>", { desc = "Save all and exit" })
vim.keymap.set("n", "<leader>s", "<cmd>wa<cr>", { desc = "Save all" })
vim.keymap.set("n", "<leader>q", "<cmd>qa!<cr>", { desc = "Exit all without saving" })
vim.keymap.set("n", "<leader>ot", "<cmd>term<cr>", { desc = "Open terminal window" })

vim.keymap.set("n", "J", "mzJ`z") 
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("x", "<leader>p", [["_dP]]) -- greatest remap ever
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.api.nvim_set_keymap("n", "<leader>w", "<C-w>", { desc = "Windows" })

-- -- BarBar
-- vim.keymap.set("n", "<leader>l", "<cmd>BufferNext<CR>", { desc = "Buffer: Cycle to next" })
-- vim.keymap.set("n", "<leader>h", "<cmd>BufferPrevious<CR>", { desc = "Buffer: Cycle to previous" })
-- vim.keymap.set("n", "<leader>L", "<cmd>BufferMoveNext<CR>", { desc = "Buffer: Swap with next" })
-- vim.keymap.set("n", "<leader>H", "<cmd>BufferMovePrevious<CR>", { desc = "Buffer: Swap with previous" })
-- vim.keymap.set("n", "<leader>bc", "<cmd>BufferClose<CR>", { desc = "Buffer: Close" })

-- vim.keymap.set("n", "<leader>bsd", "<cmd>BufferOrderByDirectory<CR>", { desc = "Buffer: Sort by directory" })
-- vim.keymap.set("n", "<leader>bsl", "<cmd>BufferOrderByLanguage<CR>", { desc = "Buffer: Sort by language" })

-- -- NeoTree
-- vim.keymap.set("n", "<leader>tt", "<cmd>Neotree focus<CR>", { desc = "NvimTree: Focus" })
-- vim.keymap.set("n", "<leader>tc", "<cmd>Neotree close<CR>", { desc = "NvimTree: Close" })
-- vim.keymap.set("n", "<leader>tr", "<cmd>Neotree refresh<CR>", { desc = "NvimTree: Refresh" })
-- vim.keymap.set("n", "<leader>tW", "<cmd>Neotree collapse<CR>", { desc = "NvimTree: Collapse" })

-- LSP
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})	
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
-- vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})

-- Telescope
-- vim.keymap.set('n', '<leader>ff', "<cmd>Telescope find_files<CR>", { desc = "Telescope: Find files in directory" })
-- vim.keymap.set('n', '<leader>fg', "<cmd>Telescope live_grep<CR>", { desc = "Telescope: Live grep in directory" })
-- vim.keymap.set('n', '<leader>fb', "<cmd>Telescope buffers<CR>", { desc = "Telescope: Find buffers" })

-- WhichKey LDR Keys
local which_key_status, which_key = pcall(require, "which-key")
if which_key_status then
	which_key.register({
		l = { "<cmd>BufferNext<cr>",         "Buffer: Cycle to next" },
		h = { "<cmd>BufferPrevious<cr>",     "Buffer: Cycle to previous" },
		L = { "<cmd>BufferMoveNext<cr>",     "Buffer: Swap with next" },
		H = { "<cmd>BufferMovePrevious<cr>", "Buffer: Swap with previous" },

		gs = { "<cmd>Git<cr>", "Git: Status" },

		b = {
			name = "Buffers",
			c = { "<cmd>BufferClose<cr>",            "Buffer: Close" },
			C = { "<cmd>BufferClose!<cr>",            "Buffer: Force close" },
			s = {
				name = "Sort",
				d = { "<cmd>BufferOrderByDirectory<CR>", "Buffer: Sort by directory" },
				l = { "<cmd>BufferOrderByLanguage<CR>",  "Buffer: Sort by language" },
			},
		},

		t = {
			name = "File Explorer",
      t = { "<cmd>Neotree focus<cr>",    "File Explorer: Focus" },
      c = { "<cmd>Neotree close<cr>",    "File Explorer: Close" },
      r = { "<cmd>Neotree refresh<cr>",  "File Explorer: Refresh" },
      W = { "<cmd>Neotree collapse<cr>", "File Explorer: Collapse" },
		},

		f = {
			name = "Telescope",
			f = { "<cmd>Telescope find_files<cr>",  "Telescope: Find file" },
			g = { "<cmd>Telescope git_files<cr>",  "Telescope: Find git files" },
			t = { "<cmd>Telescope live_grep<cr>",   "Telescope: Find text" },
			r = { "<cmd>Telescope oldfiles<cr>",    "Telescope: Recent files" },
			l = { "<cmd>Telescope resume<cr>",      "Telescope: Resume last search" },
			c = { "<cmd>Telescope colorscheme<cr>", "Telescope: Pick colorscheme" },
			p = { "<cmd>Telescope projects<cr>",    "Telescope: Projects" },
		},

		P = {
			name = "Plugins",
			l = { "<cmd>Lazy<cr>", "Lazy" },
			m = { "<cmd>Mason<cr>", "Mason" },
		},

	}, { prefix = "<leader>" })
end
