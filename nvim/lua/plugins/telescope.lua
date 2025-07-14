-- Fuzzy finder
return {
    -- https://github.com/nvim-telescope/telescope.nvim
    'nvim-telescope/telescope.nvim',
    lazy = true,
    dependencies = {
        -- https://github.com/nvim-lua/plenary.nvim
        { 'nvim-lua/plenary.nvim' },
        {
            -- https://github.com/nvim-telescope/telescope-fzf-native.nvim
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            cond = function()
                return vim.fn.executable 'make' == 1
            end,
        },
    },
    opts = {
        defaults = {
            file_ignore_patterns = {
                "node_modules",
                "target",
                "vendor"
            },
            layout_config = {
                vertical = {
                    width = 0.75
                }
            },
            path_display = {
                filename_first = {
                    reverse_directories = true
                }
            },
        }
    }
}
