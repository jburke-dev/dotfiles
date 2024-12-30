return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("tokyonight").setup({
            style = "night",
            styles = {
                comments = { italic = false },
                keywords = { italic = false }
            },
            dim_inactive = true
        })
        vim.cmd([[colorscheme tokyonight]])
    end
}
