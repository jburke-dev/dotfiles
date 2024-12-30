return {
    'mfussenegger/nvim-lint',
    config = function()
        require('lint').linters_by_ft = {
            go = { 'golangcilint' },
            svelte = { 'eslint_d' },
            typescript = { 'eslint_d' }
        }
    end
}
