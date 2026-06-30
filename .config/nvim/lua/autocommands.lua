-- [[ Basic Autocommands ]]

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function() vim.hl.on_yank() end,
})

-- Disable relative numbering when in insert mode.
local NumberToggle = vim.api.nvim_create_augroup('NumberToggle', { clear = true })
vim.api.nvim_create_autocmd({ 'BufEnter', 'FocusGained', 'InsertLeave', 'WinEnter' }, {
  group = NumberToggle,
  callback = function()
    if vim.wo.number then vim.wo.relativenumber = true end
  end,
})

vim.api.nvim_create_autocmd({ 'BufLeave', 'FocusLost', 'InsertEnter', 'WinLeave' }, {
  group = NumberToggle,
  callback = function() vim.wo.relativenumber = false end,
})

-- Disable tmux status while inside nvim. Susceptible to race conditions.
local TmuxStatus = vim.api.nvim_create_augroup('TmuxStatus', { clear = true })
vim.api.nvim_create_autocmd({ 'VimEnter' }, {
  callback = function()
    if vim.fn.getenv 'TMUX' then
      vim.fn.jobstart 'tmux set status off'
    else
      vim.api.nvim_del_augroup_by_id(TmuxStatus)
    end
  end,
  once = true,
  group = TmuxStatus,
})

vim.api.nvim_create_autocmd({ 'VimLeave' }, {
  callback = function() vim.fn.jobstart('tmux set status on', { detach = true }) end,
  once = true,
  group = TmuxStatus,
})

-- Open nvim-tree on directories.
vim.api.nvim_create_autocmd({ 'VimEnter' }, {
  callback = function(data)
    -- buffer is a directory
    local directory = vim.fn.isdirectory(data.file) == 1

    if not directory then return end

    -- change to the directory
    vim.cmd.cd(data.file)

    -- open the tree
    require('nvim-tree.api').tree.open()
  end,
})

-- vim: ts=2 sts=2 sw=2 et
