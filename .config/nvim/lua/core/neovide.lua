if vim.g.neovide then
    vim.o.guifont = "CaskaydiaCove Nerd Font"
    vim.g.neovide_padding_top = 20
    vim.g.neovide_padding_bottom = 20
    vim.g.neovide_padding_right = 20
    vim.g.neovide_padding_left = 20
    vim.g.neovide_title_background_color = string.format(
        "%x",
        vim.api.nvim_get_hl(0, {id=vim.api.nvim_get_hl_id_by_name("Normal")}).bg
    )
    vim.g.bg_color = 'auto'
    vim.g.neovide_detach_on_quit = 'prompt'
    vim.g.neovide_highlight_matching_pair = true
    vim.g.neovide_input_macos_option_key_is_meta = 'only_left'
    vim.g.neovide_scale_factor = 1.5
    local function save() vim.cmd.write() end
    local function copy() vim.cmd([[normal! "+y]]) end
    local function paste() vim.api.nvim_paste(vim.fn.getreg("+"), true, -1) end

    vim.keymap.set({ "n", "i", "v" }, "<D-s>", save, { desc = "Save" })
    vim.keymap.set("v", "<D-c>", copy, { silent = true, desc = "Copy" })
    vim.keymap.set({ "n", "i", "v", "c", "t" }, "<D-v>", paste, { silent = true, desc = "Paste" })
    vim.g.neovide_refresh_rate = 120
    vim.g.neovide_cursor_animation_length = 0.075
    vim.g.neovide_scroll_animation_length = 0.150
end
