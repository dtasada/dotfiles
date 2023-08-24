-- return {
-- 	'akinsho/bufferline.nvim',
-- 	version = "*",
-- 	dependencies = { 'nvim-tree/nvim-web-devicons' },
-- 	opts = {
-- 		options = {
-- 			mode = "buffers",
-- 			-- style_preset = bufferline.style_preset.default,
-- 			themable = true,
-- 			close_command = "bdelete! %d",
-- 			right_mouse_command = nil,
-- 			left_mouse_command = "buffer %d",
-- 			middle_mouse_command = "bdelete! %d",
--
-- 			indicator = {
-- 				icon = '| ',
-- 				style = 'icon',
-- 			},
--
-- 			buffer_close_icon = '󰅖',
-- 			modified_icon = '●',
-- 			close_icon = '',
-- 			left_trunc_marker = '',
-- 			right_trunc_marker = '',
--
-- 			tab_size = 18,
-- 			diagnostics = "nvim_lsp",
--
-- 			-- offsets = {
-- 			-- 	{
-- 			-- 		filetype = "NvimTree",
-- 			-- 		text = "File Explorer",
-- 			-- 		text_align = "center",
-- 			-- 		separator = true
-- 			-- 	},
-- 			-- },
--
-- 			color_icons = true
--
-- 		},
-- 	},
-- }

return {
  'romgrk/barbar.nvim',
    -- version = '^1.0.0', -- optional: only update when a new 1.x version is released

	dependencies = {
		'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
		'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
	},

	init = function()
		vim.g.barbar_auto_setup = false
	end,

	opts = {
		-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
		-- animation = true,
		-- insert_at_start = true,
		-- …etc.
	},
}
