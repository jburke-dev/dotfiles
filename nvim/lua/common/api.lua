local M = {}

---@enum modes
M.Modes = {
    Normal = "n",
    Visual = "v",
    StrictVisual = "x",
    Select = "s",
    Operator = "o",
    Insert = "i",
    Command = "c",
    Terminal = "t",
}

--- @class KeymapArgs
--- @field mode? modes The vim mode the map applies to.  Defaults to normal mode ('n')
--- @field shortcut string
--- @field action string|function
--- @field opts? table
--- @param args KeymapArgs
function M.keymap(args)
    local options = { noremap = true }
    if type(args.shortcut) ~= "string" then
        error("missing shortcut")
    elseif type(args.action) ~= "string" and type(args.action) ~= "function" then
        error("missing action")
    end

    if args.opts then
        options = vim.tbl_extend("force", options, args.opts)
    end

    vim.keymap.set(args.mode or M.Modes.Normal, args.shortcut, args.action, options)
end

--- @class KeymapGroupArgs
--- @field group_name string
--- @field group_shortcut string
--- @field keymaps KeymapArgs[]
--- @param args KeymapGroupArgs
function M.keymap_group(args)
    for _, keymap in ipairs(args.keymaps) do
        keymap.shortcut = "<leader>" .. args.group_shortcut .. keymap.shortcut
        M.keymap(keymap)
    end
end

--- @param input_str string
--- @param sep string|nil
function M.split_str(input_str, sep)
    if sep == nil then
        sep = "%s"
    end
    local t = {}
    for str in string.gmatch(input_str, "([^" .. sep .. "]+)") do
        table.insert(t, str)
    end
    return t
end

return M
