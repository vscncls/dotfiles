-- nvim tree recommends this
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("vscncls.packer")
require("vscncls.remap")
require("vscncls.settings")
require("vscncls.plugin-setup")

vim.o.background = "dark"
--vim.cmd.colorscheme("gruvbox")
vim.cmd.colorscheme("catppuccin")
