-- Generic
vim.keymap.set("n", "<leader>e", "<cmd>wqa<CR>", { desc = "Save all and exit" })
vim.keymap.set("n", "<leader>w", "<cmd>wa<CR>", { desc = "Save all" })

vim.api.nvim_set_keymap("n", "<leader>w", "<C-w>", { desc = "Windows" })

-- BarBar
vim.keymap.set("n", "<leader>l", "<cmd>BufferNext<CR>", { desc = "Buffer: Cycle to next" })
vim.keymap.set("n", "<leader>h", "<cmd>BufferPrevious<CR>", { desc = "Buffer: Cycle to previous" })
vim.keymap.set("n", "<leader>L", "<cmd>BufferMoveNext<CR>", { desc = "Buffer: Swap with next" })
vim.keymap.set("n", "<leader>H", "<cmd>BufferMovePrevious<CR>", { desc = "Buffer: Swap with previous" })
vim.keymap.set("n", "<leader>bc", "<cmd>BufferClose<CR>", { desc = "Buffer: Close" })

vim.keymap.set("n", "<leader>bsd", "<cmd>BufferOrderByDirectory<CR>", { desc = "Buffer: Sort by directory" })
vim.keymap.set("n", "<leader>bsl", "<cmd>BufferOrderByLanguage<CR>", { desc = "Buffer: Sort by language" })

-- NeoTree
vim.keymap.set("n", "<leader>tt", "<cmd>Neotree focus<CR>", { desc = "NvimTree: Focus" })
vim.keymap.set("n", "<leader>tc", "<cmd>Neotree close<CR>", { desc = "NvimTree: Close" })
vim.keymap.set("n", "<leader>tr", "<cmd>Neotree refresh<CR>", { desc = "NvimTree: Refresh" })
vim.keymap.set("n", "<leader>tW", "<cmd>Neotree collapse<CR>", { desc = "NvimTree: Collapse" })

-- LSP
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})	
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
-- vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})

-- Telescope
vim.keymap.set('n', '<leader>ff', "<cmd>Telescope find_files<CR>", { desc = "Telescope: Find files in directory" })
vim.keymap.set('n', '<leader>f<forwardslash>', "<cmd>Telescope live_grep<CR>", { desc = "Telescope: Live grep in directory" })
vim.keymap.set('n', '<leader>fb', "<cmd>Telescope buffers<CR>", { desc = "Telescope: Find buffers" })
