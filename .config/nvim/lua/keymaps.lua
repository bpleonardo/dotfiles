-- [[ Basic Keymaps ]]

local map = vim.keymap.set

-- Clear highlights on search when pressing <Esc> in normal mode
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic Config & Keymaps
vim.diagnostic.config {
  update_in_insert = false,
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = { min = vim.diagnostic.severity.WARN } },

  -- Can switch between these as you prefer
  virtual_text = true, -- Text shows up at the end of the line
  virtual_lines = false, -- Text shows up underneath the line, with virtual lines

  -- Auto open the float, so you can easily read the errors when jumping with `[d` and `]d`
  jump = {
    on_jump = function(_, bufnr)
      vim.diagnostic.open_float {
        bufnr = bufnr,
        scope = 'cursor',
        focus = false,
      }
    end,
  },
}

map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier.
-- NOTE: This won't work in all terminal emulators/tmux/etc.
-- You may also use <C-\><C-n> to exit terminal mode.
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make tabs navigation easier
map('n', 'gh', 'gT', { desc = 'Go to previous tab page' })
map('n', 'gl', 'gt', { desc = 'Go to next tab page' })

-- Keybinds to make split navigation easier.
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Manipulate nvim-tree
map('n', '<C-n>', '<cmd>NvimTreeToggle<CR>', { desc = 'nvim-tree: Toggle window' })
map('n', '<leader>e', '<cmd>NvimTreeFocus<CR>', { desc = 'nvim-tree: Focus window' })

-- Keybinds to emulate <C-Arrow> from VS Code.
map('n', '<A-k>', '<cmd> m .-2 <CR>==', { desc = 'Move 1 line up.' })
map('i', '<A-k>', '<Esc> <cmd> m .-2 <CR>==gi', { desc = 'Move 1 line up.' })
map('v', '<A-k>', ":m '<-2 <CR>gv=gv", { desc = 'Move 1 line up.' })

map('n', '<A-j>', '<cmd> m .+1 <CR>==', { desc = 'Move 1 line down.' })
map('i', '<A-j>', '<Esc> <cmd> m .+1 <CR>==gi', { desc = 'Move 1 line down.' })
map('v', '<A-j>', ":m '>+1 <CR>gv=gv", { desc = 'Move 1 line down.' })

-- vim: ts=2 sts=2 sw=2 et
