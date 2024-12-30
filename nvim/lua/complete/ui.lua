local M = {}

function M.setup()
    local api = require("common.api")
    local builtin = require("telescope.builtin")

    api.keymap_group({
        group_name = "telescope_advanced",
        group_shortcut = "f",
        keymaps = {
            {
                shortcut = "d",
                action = builtin.diagnostics,
            },
            {
                shortcut = "k",
                action = builtin.keymaps
            },
            {
                shortcut = "s",
                action = builtin.lsp_document_symbols
            },
            {
                shortcut = "r",
                action = builtin.lsp_references
            }
        }
    })
    api.keymap_group({
        group_name = "telescope_copilot",
        group_shortcut = "c",
        keymaps = {
            {
                shortcut = "p",
                action = function()
                    local actions = require("CopilotChat.actions")
                    require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
                end
            }
        }
    })
    local harpoon = require("harpoon")

    local telescope_conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
            table.insert(file_paths, item.value)
        end

        require("telescope.pickers").new({}, {
            prompt_title = "Harpoon",
            finder = require("telescope.finders").new_table({
                results = file_paths
            }),
            previewer = telescope_conf.file_previewer({}),
            sorter = telescope_conf.generic_sorter({})
        }):find()
    end

    api.keymap_group({
        group_name = "harpoon",
        group_shortcut = "h",
        keymaps = {
            {
                shortcut = "a",
                action = function()
                    harpoon:list():add()
                end
            },
            {
                shortcut = "l",
                action = function()
                    toggle_telescope(harpoon:list())
                end
            },
            {
                shortcut = "c",
                action = function()
                    harpoon:list():clear()
                end
            }
        }
    })
end

return M
