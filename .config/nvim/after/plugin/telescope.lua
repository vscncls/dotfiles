local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-f>', function()
	if not pcall(builtin.git_files) then
		builtin.find_files()
	end
end)
vim.keymap.set('n', '<leader>F', builtin.find_files, {})
vim.keymap.set('n', '<leader>f', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

require("telescope").load_extension "file_browser"
vim.api.nvim_set_keymap(
  "n",
  "<leader>m",
  ":Telescope file_browser<CR>",
  { noremap = true }
)
