-- Import Dashboard-nvim
local dashboard = require('dashboard-nvim')

-- Set the header text
dashboard.section.header.val = {'Welcome to my dashboard'}

-- Set the footer text
dashboard.section.footer.val = {'created by Me'}

-- Add some custom text to the first section
dashboard.custom_section.a.val = {
  'Custom text',
  'In the first section'
}

-- Add some custom text to the second section
dashboard.custom_section.b.val = {
  'Custom text',
  'In the second section'
}

-- Set the default mode to be the dashboard
vim.g.dashboard_default_executive = 'telescope'

-- Map a key to open the dashboard
vim.api.nvim_set_keymap('n', '<leader>db', ':Dashboard<CR>', { noremap = true, silent = true })
