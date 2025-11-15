-- Generic
vim.keymap.set("n", "<leader>e", "<cmd>wa | qa!<cr>", { desc = "Save all and exit" })
vim.keymap.set("n", "<leader>s", "<cmd>wa<cr>", { desc = "Save all" })
vim.keymap.set("n", "<leader>q", "<cmd>qa!<cr>", { desc = "Exit all without saving" })
vim.keymap.set("n", "<Bslash>", "<cmd>Oil<cr>", { desc = "Open Oil" })

vim.keymap.set("n", "<C-l>", "<cmd>BufferNext<cr>", { desc = "Buffer: Cycle to next" })
vim.keymap.set("n", "<C-h>", "<cmd>BufferPrevious<cr>", { desc = "Buffer: Cycle to previous" })
vim.keymap.set("n", "<C-S-l>", "<cmd>BufferMoveNext<cr>", { desc = "Buffer: Swap with next" })
vim.keymap.set("n", "<C-S-h>", "<cmd>BufferMovePrevious<cr>", { desc = "Buffer: Swap with previous" })

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv")

vim.keymap.set("x", "<leader>p", [["_dP]]) -- greatest remap ever
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.api.nvim_set_keymap("n", "<leader>w", "<C-w>", { desc = "Windows" })

-- LSP
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP: Rename variable" })
vim.keymap.set("n", "<leader>ga", vim.lsp.buf.code_action, { desc = "LSP: Code Action" })
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "LSP: Go to definition" })
vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, { desc = "LSP: Go to implementation" })
vim.keymap.set("n", "<leader>cr", require("telescope.builtin").lsp_references, { desc = "LSP: Telescope references" })
vim.keymap.set("n", "<leader>K", vim.lsp.buf.hover, { desc = "LSP: Show definition" })

vim.keymap.set("n", "<leader>l", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled(), { bufnr })
end, { desc = "LSP: enable inlay hints" })

-- WhichKey LDR Keys
local which_key_status, which_key = pcall(require, "which-key")
if which_key_status then
	which_key.add({
		{ "<leader>b",   group = "Buffers" },
		{ "<leader>bc",  "<cmd>BufferClose<cr>",            desc = "Buffer: Close" },
		{ "<leader>bC",  "<cmd>BufferClose!<cr>",           desc = "Buffer: Force close" },
		{ "<leader>bs",  group = "Sort" },
		{ "<leader>bsd", "<cmd>BufferOrderByDirectory<cr>", desc = "Buffer: Sort by directory" },
		{ "<leader>bsl", "<cmd>BufferOrderByLanguage<cr>",  desc = "Buffer: Sort by language" },

		{ "<leader>f",   group = "Telescope" },
		{ "<leader>ff",  "<cmd>Telescope find_files<cr>",   desc = "Telescope: Find file" },
		{ "<leader>fg",  "<cmd>Telescope git_files<cr>",    desc = "Telescope: Find git files" },
		{ "<leader>ft",  "<cmd>Telescope live_grep<cr>",    desc = "Telescope: Find text" },
		{ "<leader>fr",  "<cmd>Telescope oldfiles<cr>",     desc = "Telescope: Recent files" },
		{ "<leader>fl",  "<cmd>Telescope resume<cr>",       desc = "Telescope: Resume last search" },
	})
end
