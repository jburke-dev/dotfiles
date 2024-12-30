local api = require("common.api")

api.keymap({ mode = api.Modes.Insert, shortcut = "jj", action = "<esc>" })

-- easily moves lines up and down
api.keymap({ mode = api.Modes.Visual, shortcut = "J", action = ":m '>+1<CR>gv=gv" })
api.keymap({ mode = api.Modes.Visual, shortcut = "K", action = ":m '<-2<CR>gv=gv" })

api.keymap({ shortcut = "J", action = "mzJ`z" })
api.keymap({ shortcut = "<C-d>", action = "<C-d>zz" })
api.keymap({ shortcut = "<C-u>", action = "<C-u>zz" })
api.keymap({ shortcut = "n", action = "nzzzv" })
api.keymap({ shortcut = "N", action = "Nzzzv" })

-- retain register contents after pasting over a highlight
api.keymap({ mode = api.Modes.StrictVisual, shortcut = "<leader>p", action = "\"_dP" })

-- yank to system clipboard
api.keymap({ shortcut = "<leader>y", action = "\"+y" })
api.keymap({ shortcut = "<leader>Y", action = "\"+Y" })
api.keymap({ mode = api.Modes.Visual, shortcut = "<leader>y", action = "\"+y" })

-- delete to the void!
api.keymap({ shortcut = "<leader>d", action = "\"_d" })
api.keymap({ mode = api.Modes.Visual, shortcut = "<leader>d", action = "\"_d" })

api.keymap({ shortcut = "Q", action = "<nop>" })
