local M = {}

local api = require("common.api")

--- @enum ProfileNames
M.ProfileNames = {
    Complete = "complete",
    Minimal = "minimal",
    Git = "git",
    Notetaking = "notetaking",
    WorkNotetaking = "work-notetaking"
}

--- @alias Profiles ProfileNames[]
--- @return Profiles|nil If NVIM_CUSTOM_ENV is defined in environment variables, returns a table containing its space separated entries.  Otherwise returns nil
local function parse_custom_env()
    local custom_env = os.getenv("NVIM_CUSTOM_ENV")

    if custom_env then
        return api.split_str(custom_env)
    end
    return nil
end

--- @type Profiles
local default_env = { M.ProfileNames.Complete, M.ProfileNames.Minimal
}

local resolved_env = parse_custom_env() or default_env

-- this will be iterated through based on the env that gets resolved.  note that each
-- profile loaded will also have an entry included with plugins
--- @type { [ProfileNames]: string[] }
local all_profiles = {
    [M.ProfileNames.Minimal] = { "opts", "mappings", "autocmds" },
    [M.ProfileNames.Complete] = { "ui", "autocmds" },
    [M.ProfileNames.Git] = {},
    [M.ProfileNames.Notetaking] = {},
    [M.ProfileNames.WorkNotetaking] = {}
}

-- from resolved_env and all_profiles, we want to return two fields on the module: -- imports, which is just a set of modules to require()
-- plugins, which is a table of plugin config directories

M.imports = {}
M.plugins = {}
for _, profile_name in ipairs(resolved_env) do
    for _, sub_module in ipairs(all_profiles[profile_name]) do
        table.insert(M.imports, profile_name .. "." .. sub_module)
    end
    table.insert(M.plugins, { import = profile_name .. ".plugins" })
end

return M
