return {
  {
    'morhetz/gruvbox',
    priority = 1000, -- Make sure to load this before all the other start plugins.

    config = function()
      vim.cmd.colorscheme 'gruvbox'
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
