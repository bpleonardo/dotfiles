-- Enable faster startup by caching compiled Lua modules.
vim.loader.enable()

-- Set <space> as the leader key.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Enable Nerd Fonts.
vim.g.have_nerd_font = true

-- Show relative line numbers.
vim.o.relativenumber = true
-- But also keep the current one visible.
vim.o.number = true

-- Enable mouse mode.
vim.o.mouse = 'a'

-- Don't show the mode, since it's already in the status line.
vim.o.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
vim.schedule(function() vim.o.clipboard = 'unnamedplus' end)

-- Enable break indent.
vim.o.breakindent = true

-- Follow current line indentation.
vim.o.autoindent = true

-- Enable undo/redo changes even after closing and reopening a file.
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term.
vim.o.ignorecase = true
vim.o.smartcase = true

-- Disable signcolumn.
vim.o.signcolumn = 'no'

-- Decrease update time.
vim.o.updatetime = 250

-- Decrease mapped sequence wait time.
-- Displays which-key popup sooner.
vim.o.timeoutlen = 300

-- Configure how new splits should be opened.
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how Neovim will display certain whitespace characters in the editor.
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live.
vim.o.inccommand = 'split'

-- Show which line your cursor is on.
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- Minimal number of lines to keep to the left and right side of the cursor.
vim.o.sidescrolloff = 5

-- If performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- raise a dialog asking if you wish to save the current file(s).
vim.o.confirm = true

-- Disable line wrapping.
vim.o.wrap = false

-- Change default shell.
vim.o.shell = '/usr/bin/fish'

-- Set highlight on search.
vim.o.hlsearch = true

-- Keep folds open by default
vim.o.foldlevel = 99

-- vim: ts=2 sts=2 sw=2 et
