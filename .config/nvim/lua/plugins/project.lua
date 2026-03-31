return {
    'DrKJeff16/project.nvim',
    cmd = { -- Lazy-load by commands
        'Project',
        'ProjectAdd',
        'ProjectConfig',
        'ProjectDelete',
        'ProjectFzf', -- If using `fzf-lua` integration
        'ProjectRecents',
        'ProjectRoot',
        'ProjectSession',
        'ProjectTelescope', -- If using `telescope.nvim` integration
    },
    opts = {},

    config = function()
        require("project").setup({
            patterns = {".git"},
            fzf_lua = { enabled = true },
        })
        require('telescope').load_extension('projects')
    end
}
