return {
    "stevearc/oil.nvim",
    config = function()
        require("oil").setup()

        local api = require("common.api")

        api.keymap({
            shortcut = "-",
            action = ":Oil<CR>"
        })
    end
}
