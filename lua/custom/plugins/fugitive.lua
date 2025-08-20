vim.keymap.set('n', '<Leader>gg', '<Cmd>Git<CR>', { desc = 'Git Status' })
vim.keymap.set('n', '<Leader>gu', '<Cmd>Git push<CR>', { desc = 'Git Push' })
vim.keymap.set('n', '<Leader>gp', '<Cmd>Git pull<CR>', { desc = 'Git Pull' })
vim.keymap.set('n', '<Leader>go', '<Cmd>Git checkout<CR>', { desc = 'Git Checkout' })

return {
  {
    'tpope/vim-fugitive',
  },
}
