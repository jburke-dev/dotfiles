local M = {}

function M.setup()
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
        callback = function ()
            require("lint").try_lint()
        end
    })
end

return M
