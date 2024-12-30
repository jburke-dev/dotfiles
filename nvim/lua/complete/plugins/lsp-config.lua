return {
    'neovim/nvim-lspconfig',
    dependencies = { 'saghen/blink.cmp' },
    config = function(_, opts)
        opts = {
            servers = {
                dockerls = require("complete.lsp.dockerls"),
                lua_ls = require("complete.lsp.lua_ls"),
                ts_ls = require("complete.lsp.typescript"),
                gopls = require("complete.lsp.gopls"),
                omnisharp = require("complete.lsp.csharp"),
                svelte = require("complete.lsp.svelte"),
                tailwindcss = require("complete.lsp.tailwindcss"),
                yamlls = require("complete.lsp.yamlls")
            }
        }
        local lspconfig = require("lspconfig")
        for server, config in pairs(opts.servers) do
            config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
            lspconfig[server].setup(config)
        end

        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                local api = require("common.api")
                api.keymap({
                    shortcut = "gd",
                    action = vim.lsp.buf.definition
                })
                api.keymap({
                    shortcut = "gD",
                    action = vim.lsp.buf.declaration
                })
                api.keymap({
                    shortcut = "gi",
                    action = vim.lsp.buf.implementation
                })
                api.keymap_group({
                    group_name = "lsp actions",
                    group_shortcut = "a",
                    keymaps = {
                        {
                            shortcut = "c",
                            action = vim.lsp.buf.code_action,
                            opts = { buffer = args.buf }
                        },
                        {
                            shortcut = "r",
                            action = vim.lsp.buf.rename,
                            opts = { buffer = args.buf }
                        }
                    }
                })
            end
        })
    end
}
