return {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    config = function()
        require("common.obsidian-setup").setup({
            {
                name = "Universe",
                path = "~/universe/"
            }
        })
    end
}
