vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.barbar_auto_setup = false
vim.o.timeout = true
vim.o.timeoutlen = 300
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

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
vim.opt.expandtab = true

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
vim.opt.background = "dark"

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
