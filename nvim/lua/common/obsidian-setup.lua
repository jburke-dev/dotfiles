local M = {}

--- @class Workspace A representation of an Obsidian workspace, which is generally a looser abstraction / superset of Obsidian's concept of a vault.
--- @field name string Title of the workspace
--- @field path string Absolute path of the workspace.  Typically going to be somewhere within my home directory
--- @param workspaces Workspace[]
--- Sets up common configs for obsidian with the given workspaces.
function M.setup(workspaces)
    require("obsidian").setup({
        ui = { enable = false },
        workspaces = workspaces,
        follow_url_func = function(url)
            vim.fn.jobstart({ 'xdg-open', url })
        end,
        templates = {
            folder = "obsidian-templates",
            date_format = "%Y-%m-%d",
            time_format = "%H:%M"
        },
        note_id_func = function(title)
            local updated_title = ""
            if title ~= nil then
                updated_title = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", "")
            else
                for _ = 1, 4 do
                    updated_title = updated_title .. string.char(math.random(65, 90))
                end
            end
            return updated_title
        end,
        preferred_link_style = "markdown",
        note_frontmatter_func = function(note)
            if note.title then
                local processed_title = note.title:gsub("-", " "):gsub("(%w)(%w*)", function(first, rest)
                    return first:upper() .. rest
                end)
                note:add_alias(processed_title)
            end
            local out = { id = note.id, aliases = note.aliases, tags = note.tags }
            if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
                for k, v in pairs(note.metadata) do
                    out[k] = v
                end
            end
            return out
        end,
        daily_notes = {
            folder = "time-slices/daily",
            template = "daily.md"
        }
    })
    local api = require("common.api")
    api.keymap_group({
        group_name = "Obsidian",
        group_shortcut = "o",
        keymaps = {
            {
                shortcut = "f",
                action = ":ObsidianQuickSwitch<CR>"
            },
            {
                shortcut = "g",
                action = ":ObsidianSearch<CR>"
            },
            {
                shortcut = "o",
                action = ":ObsidianWorkspace<CR>"
            },
            {
                shortcut = "nn",
                action = ":ObsidianNew<CR>"
            },
            {
                shortcut = "d",
                action = ":ObsidianToday<CR>"
            }
        }
    })
end

return M
