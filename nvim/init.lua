local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",  -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local profile = require("common.profiles")

vim.g.mapleader = " "
vim.g.maplocalleader = ","

require("lazy").setup({
    spec = profile.plugins
})

for _, import_str in ipairs(profile.imports) do
    local profile_module = require(import_str)
    if type(profile_module) == "table" and profile_module.setup then
        profile_module.setup()
    end
end
