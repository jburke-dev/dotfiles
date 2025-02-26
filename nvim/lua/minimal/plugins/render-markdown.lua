return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    file_types = { 'markdown', 'copilot-chat' },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
}
