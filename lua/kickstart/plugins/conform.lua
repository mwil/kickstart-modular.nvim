-- conform.nvim
return {
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          -- prefer tool formatting over LSP for Python (ruff)
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,

      -- Keep your logic, but make Python use tool formatters (no LSP fallback)
      format_on_save = function(bufnr)
        local ft = vim.bo[bufnr].filetype
        local disable_filetypes = { c = true, cpp = true }
        if disable_filetypes[ft] then
          return nil
        end
        -- For python, we explicitly turn off LSP fallback (we have ruff)
        if ft == 'python' then
          return { timeout_ms = 3000, lsp_format = false }
        end
        return { timeout_ms = 500, lsp_format = 'fallback' }
      end,

      formatters_by_ft = {
        lua = { 'stylua' },

        -- 🔁 Make Ruff match your pre-commit: fix, then format
        -- If your hook only runs ruff-format (no --fix), use { "ruff_format" } instead.
        python = { 'ruff_fix', 'ruff_format' },

        markdown = { 'prettier' },
        json = { 'prettier' },
      },
    },
  },
}
