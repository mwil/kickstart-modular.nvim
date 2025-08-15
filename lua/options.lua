-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.o.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
-- vim.o.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.o.breakindent = true

vim.o.tabstop = 4 -- show n spaces for each tab encountered
vim.o.softtabstop = 4 -- replace 4 spaces with one tab/tabsize when inserting/pasting
vim.o.shiftwidth = 4 -- one tab is four steps/number of steps used in autoindent
vim.o.expandtab = true -- replace tabs with spaces, more sane option
vim.o.shiftround = true -- use multiple of shiftwidth when indenting with < and >

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-options-guide`
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- Show which line your cursor is on
vim.o.cursorline = true
vim.o.cursorcolumn = true
vim.o.colorcolumn = '110'

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

vim.o.wildmenu = true -- visual auto-complete for command menu
vim.o.wildmode = 'list:longest,full' -- Only complete to unique prefixes, but complete when insisting

vim.o.wildignore = '*.swp,*.bak,*.pyc,*.class,*.o,.DS_Store,*.egg-info/,*/__pycache__/'

-- Better handling of Japanese file encodings, fall back to common encodings used there
vim.o.fileencoding = 'utf-8'
vim.o.fileencodings = 'ucs-bom,utf8,iso-2022-jp,euc-jp,cp932,sjis,default,latin1'

vim.opt.shortmess:append 'S'

-- Uvim: ts=2 sts=2 sw=2 et
