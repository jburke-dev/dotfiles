return {
    'saghen/blink.cmp',
    lazy = false,
    dependencies = {
        'giuxtaposition/blink-cmp-copilot'
    },
    version = 'v0.*',
    opts = {
        keymap = {
            preset = 'default',
        },
        appearance = {
            nerd_font_variant = 'mono'
        },
        signature = {
            enabled = true,
            window = {
                border = "rounded"
            }
        },
        completion = {
            accept = {
                auto_brackets = {
                    enabled = false
                }
            },
            menu = {
                border = "rounded",
                draw = {
                    columns = {
                        { "label",     "label_description", gap = 2 },
                        { "kind_icon", "kind" }
                    }
                }
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 500,
                window = {
                    border = "rounded"
                }
            }
        },
        sources = {
            default = { 'lsp', 'path', 'buffer', 'copilot' },
            cmdline = {},
            providers = {
                copilot = {
                    name = 'copilot',
                    module = 'blink-cmp-copilot',
                    score_offset = 100,
                    async = true
                }
            }
        }
    }
}
