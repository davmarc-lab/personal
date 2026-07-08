vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("config.settings")
require("config.keybinds")

require("config.lazy")

require("config.colorscheme")
require("config.lsp")

-- require custom extensions/plugins
require("custom")
