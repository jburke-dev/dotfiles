return {
    'nvim-telescope/telescope.nvim',
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local api = require("common.api")
        local builtin = require("telescope.builtin")

        api.keymap_group({
            group_name = "telescope",
            group_shortcut = "f",
            keymaps = {
                {
                    shortcut = "f",
                    action = function()
                        builtin.find_files({
                            find_command = {
                                "rg", "--files", "--hidden", "-g", "!.git/"
                            }
                        })
                    end
                },
                {
                    shortcut = "g",
                    action = function()
                        builtin.live_grep({
                            additional_args = { "--hidden" },
                            glob_pattern = "!.git/"
                        })
                    end
                },
                {
                    shortcut = "h",
                    action = builtin.help_tags
                }
            }
        })
        api.keymap_group({
            group_name = "telescope edit",
            group_shortcut = "e",
            keymaps = {
                {
                    shortcut = "p",
                    action = function()
                        builtin.find_files {
                            cwd = vim.fs.joinpath(vim.fn.stdpath('data'), "lazy")
                        }
                    end
                }
            }
        })

        local telescope = require("telescope")
        telescope.setup({
            pickers = {
                find_files = {
                    theme = "ivy"
                }
            },
            extensions = {
                fzf = {}
            }
        })
        -- telescope.load_extension('fzf')
    end
}
