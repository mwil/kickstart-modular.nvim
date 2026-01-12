return {

  { -- Linting
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lint = require 'lint'

      -- Define markdownlint-cli2 as a custom linter (reuses markdownlint output format)
      lint.linters.markdownlint_cli2 = {
        name = 'markdownlint-cli2',
        cmd = 'markdownlint-cli2',
        stdin = false,
        args = {},
        stream = 'stdout',
        ignore_exitcode = true,
        parser = function(output, bufnr)
          local diagnostics = {}
          local regex = '^(.+):(%d+):(%d+) (%b[%]) (.+)$'
          for line in output:gmatch('[^\r\n]+') do
            local file, line_num, col_num, code, message = line:match(regex)
            if file and line_num and col_num and message then
              table.insert(diagnostics, {
                lnum = tonumber(line_num) - 1,
                col = tonumber(col_num) - 1,
                end_lnum = tonumber(line_num) - 1,
                end_col = tonumber(col_num) - 1,
                severity = vim.diagnostic.severity.WARN,
                message = message,
                source = 'markdownlint',
              })
            end
          end
          return diagnostics
        end,
      }

      -- Use markdownlint-cli2 if available, otherwise fall back to markdownlint
      local markdown_linter = 'markdownlint'
      if vim.fn.executable('markdownlint-cli2') == 1 then
        markdown_linter = 'markdownlint_cli2'
      end

      lint.linters_by_ft = {
        markdown = { markdown_linter },
      }

      -- To allow other plugins to add linters to require('lint').linters_by_ft,
      -- instead set linters_by_ft like this:
      -- lint.linters_by_ft = lint.linters_by_ft or {}
      -- lint.linters_by_ft['markdown'] = { 'markdownlint' }
      --
      -- However, note that this will enable a set of default linters,
      -- which will cause errors unless these tools are available:
      -- {
      --   clojure = { "clj-kondo" },
      --   dockerfile = { "hadolint" },
      --   inko = { "inko" },
      --   janet = { "janet" },
      --   json = { "jsonlint" },
      --   markdown = { "vale" },
      --   rst = { "vale" },
      --   ruby = { "ruby" },
      --   terraform = { "tflint" },
      --   text = { "vale" }
      -- }
      --
      -- You can disable the default linters by setting their filetypes to nil:
      -- lint.linters_by_ft['clojure'] = nil
      -- lint.linters_by_ft['dockerfile'] = nil
      -- lint.linters_by_ft['inko'] = nil
      -- lint.linters_by_ft['janet'] = nil
      -- lint.linters_by_ft['json'] = nil
      -- lint.linters_by_ft['markdown'] = nil
      -- lint.linters_by_ft['rst'] = nil
      -- lint.linters_by_ft['ruby'] = nil
      -- lint.linters_by_ft['terraform'] = nil
      -- lint.linters_by_ft['text'] = nil

      -- Create autocommand which carries out the actual linting
      -- on the specified events.
      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function()
          -- Only run the linter in buffers that you can modify in order to
          -- avoid superfluous noise, notably within the handy LSP pop-ups that
          -- describe the hovered symbol using Markdown.
          if vim.bo.modifiable then
            lint.try_lint()
          end
        end,
      })
    end,
  },
}
