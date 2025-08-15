vim.keymap.set('n', '<leader>c', function()
  require('CopilotChat').toggle()
end, { desc = 'Open Copilot Chat' })

return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { 'nvim-lua/plenary.nvim', branch = 'master' },
    },
    build = 'make tiktoken',
    opts = {
      -- See Configuration section for options
      model = 'claude-sonnet-4',
    },
  },
}
