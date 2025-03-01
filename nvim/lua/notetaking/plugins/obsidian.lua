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
                name = "Knowledge",
                path = "~/Code/personal-life/knowledge/"
            },
            {
                name = "Tasks & Goals",
                path = "~/Code/personal-life/tasks/"
            },
            {
                name = "Notes",
                path = "~/Notes/"
            }
        })
    end

}
