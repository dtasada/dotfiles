vim.opt.clipboard = "unnamedplus"

vim.opt.completeopt = { "menu", "menuone", "noselect" }

vim.opt.cursorline = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.signcolumn = "yes"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.expandtab = false

vim.opt.wrap = false
vim.opt.colorcolumn = "99"
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.ignorecase = true

vim.opt.updatetime = 50

vim.opt.termguicolors = true

vim.opt.mouse = "a"

vim.opt.winborder = 'rounded'

vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", {}),
	desc = "Hightlight selection on yank",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
	end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.mcc",
	callback = function()
		vim.bo.filetype = "mcc"
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "gleam",
	callback = function()
		vim.bo.shiftwidth  = 2
		vim.bo.tabstop     = 2
		vim.bo.softtabstop = 2
	end,
})
