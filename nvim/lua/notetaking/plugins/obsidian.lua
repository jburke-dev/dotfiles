return {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    config = function()
        require("obsidian").setup({
            ui = { enable = false },
            workspaces = {
                {
                    name = "Knowledge",
                    path = "~/Code/personal-life/knowledge/"
                },
                {
                    name = "Tasks & Goals",
                    path = "~/Code/personal-life/tasks/"
                }
            },
            follow_url_func = function(url)
                vim.fn.jobstart({ 'xdg-open', url })
            end,
            templates = {
                folder = "obsidian-templates",
                date_format = "%Y-%m-%d",
                time_format = "%H:%M"
            },
            note_id_func = function(title)
                local updated_title = ""
                if title ~= nil then
                    updated_title = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", "")
                else
                    for _ = 1, 4 do
                        updated_title = updated_title .. string.char(math.random(65, 90))
                    end
                end
                return updated_title
            end,
            preferred_link_style = "markdown"
        })
        local api = require("common.api")
        api.keymap_group({
            group_name = "Obsidian",
            group_shortcut = "o",
            keymaps = {
                {
                    shortcut = "f",
                    action = ":ObsidianQuickSwitch<CR>"
                },
                {
                    shortcut = "g",
                    action = ":ObsidianSearch<CR>"
                },
                {
                    shortcut = "o",
                    action = ":ObsidianWorkspace<CR>"
                }
            }
        })
    end
}
