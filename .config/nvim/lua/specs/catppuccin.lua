-- Brief: catppuccin color scheme.

local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { gh 'catppuccin/nvim' }

vim.cmd.colorscheme 'catppuccin-mocha'

-- vim: ts=2 sts=2 sw=2 et
