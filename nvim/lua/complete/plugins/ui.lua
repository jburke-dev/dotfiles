return {
    {
        'nvim-lualine/lualine.nvim',
        lazy = false,
        priority = 999,
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        config = function()
            require('lualine').setup()
        end
    },
    {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
        config = function()
            require('harpoon').setup()
        end
    }
}
