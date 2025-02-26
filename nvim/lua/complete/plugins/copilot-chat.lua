return {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
        "zbirenbaum/copilot.lua",
        "nvim-lua/plenary.nvim",
    },
    build = "make tiktoken",
    opts = {
        debug = true
    },
    config = function()
        require("CopilotChat").setup({
            highlight_headers = false,
            separator = '---',
            error_header = '> [!Error] Error',
        })
    end,
}
