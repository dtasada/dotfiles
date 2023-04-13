local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Packer Manager
  use 'neovim/nvim-lspconfig' -- LSP
  use 'hrsh7th/nvim-cmp' -- Autocompletion
  use 'nvim-treesitter/nvim-treesitter' -- Syntax Highlighting
  use 'nvim-telescope/telescope.nvim' -- Fuzzy Finding
  use 'kyazdani42/nvim-tree.lua' -- Tree File Manager
  use 'pluffie/neoproj' -- Project Manager
  use 'catppuccin/nvim' -- Color Theme (Catppuccin)
  use 'nvim-lualine/lualine.nvim' -- Current Line Bar
  use 'romgrk/barbar.nvim' -- Bottom Status Bar
  use 'yamatsum/nvim-cursorline' -- Highlight Word on Cursor
  use 'glepnir/dashboard-nvim' -- Greeter Dashboard
  use 'kyazdani42/nvim-web-devicons' -- DevIcons
  use 'jghauser/mkdir.nvim' -- Auto-mkdir
  use 'CRAG666/code_runner.nvim' -- Code Runner
  use 'lewis6991/gitsigns.nvim' -- Git Integration
  use 'folke/which-key.nvim' -- Conky-like Keybind display
  use 'karb94/neoscroll.nvim' -- Smooth Scrolling
  use 'dstein64/nvim-scrollview' -- Scrollbar
  use 'numToStr/Comment.nvim' -- Commenting utility

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
