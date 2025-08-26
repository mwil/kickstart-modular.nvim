return {
  'HiPhish/rainbow-delimiters.nvim',
  config = function()
    -- You can customize behavior here if you want
    local rainbow_delimiters = require 'rainbow-delimiters'

    vim.api.nvim_set_hl(0, 'RainbowDelimiterRed', { fg = '#ff1744' })
    vim.api.nvim_set_hl(0, 'RainbowDelimiterOrange', { fg = '#ff9100' })
    vim.api.nvim_set_hl(0, 'RainbowDelimiterYellow', { fg = '#ffd600' })
    vim.api.nvim_set_hl(0, 'RainbowDelimiterGreen', { fg = '#00e676' })
    vim.api.nvim_set_hl(0, 'RainbowDelimiterCyan', { fg = '#1de9b6' })
    vim.api.nvim_set_hl(0, 'RainbowDelimiterBlue', { fg = '#2979ff' })
    vim.api.nvim_set_hl(0, 'RainbowDelimiterViolet', { fg = '#d500f9' })

    vim.g.rainbow_delimiters = {
      strategy = {
        [''] = rainbow_delimiters.strategy['global'],
        commonlisp = rainbow_delimiters.strategy['local'],
      },
      query = {
        [''] = 'rainbow-delimiters',
      },
      highlight = {
        'RainbowDelimiterRed',
        'RainbowDelimiterYellow',
        'RainbowDelimiterBlue',
        'RainbowDelimiterOrange',
        'RainbowDelimiterGreen',
        'RainbowDelimiterViolet',
        'RainbowDelimiterCyan',
      },
    }
  end,
}
