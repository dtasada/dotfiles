-- Generic
vim.keymap.set("n", "<leader>e", "<cmd>wqa<cr>", { desc = "Save all and exit" })
vim.keymap.set("n", "<leader>s", "<cmd>wa<cr>", { desc = "Save all" })
vim.keymap.set("n", "<leader>q", "<cmd>qa!<cr>", { desc = "Exit all without saving" })
vim.keymap.set("n", "<leader>rt", "<cmd>term<cr>", { desc = "Open terminal window" })

vim.keymap.set("n", "J", "mzJ`z") 
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("x", "<leader>p", [["_dP]]) -- greatest remap ever
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.api.nvim_set_keymap("n", "<leader>w", "<C-w>", { desc = "Windows" })

-- LSP
vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, { desc = "LSP: Rename variable" })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "LSP: Code Action" })
vim.keymap.set('n', '<leader>cd', vim.lsp.buf.definition, { desc = "LSP: Go to definition" })
vim.keymap.set('n', '<leader>ci', vim.lsp.buf.implementation, { desc = "LSP: Go to implementation" })
vim.keymap.set('n', '<leader>cr', require('telescope.builtin').lsp_references, { desc = "LSP: Telescope references" })
vim.keymap.set('n', '<leader>K', vim.lsp.buf.hover, { desc = "LSP: Show definition" })

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
