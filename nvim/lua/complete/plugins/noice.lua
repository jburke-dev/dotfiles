return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("noice").setup({
            presets = {
                command_palette = true,
                long_message_to_split = true,
            }
        })
        require("telescope").load_extension("noice")
    end
}
