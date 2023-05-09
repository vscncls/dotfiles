vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- empty setup using defaults
require("nvim-tree").setup({
    on_attach = "enabled"
})

local api = require("nvim-tree.api")

vim.keymap.set("n", "<leader>n", api.tree.toggle)
