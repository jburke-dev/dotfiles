local numberToggleGroup = vim.api.nvim_create_augroup("NumberToggle", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "WinEnter" }, {
    group = numberToggleGroup,
    command = "lua if vim.api.nvim_get_mode().mode ~= 'i' then vim.opt.relativenumber = true end",
})
vim.api.nvim_create_autocmd(
    { "BufLeave", "FocusLost", "InsertEnter", "WinLeave" },
    { group = numberToggleGroup, command = "lua vim.opt.relativenumber = false" }
)

vim.api.nvim_create_autocmd("VimEnter", {

    callback = function()
        if vim.fn.argv(0) == "" then
            vim.defer_fn(function()
                vim.cmd("Oil")
            end, 0)
        end
    end
})

