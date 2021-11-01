local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', '<leader>bn', ':bn<cr>')
map('n', '<leader>bp', ':bp<cr>')
map('n', '<leader>v', ':e $MYVIMRC<CR>')
map('', '<C-w>m', ':MaximizerToggle!<CR>')
