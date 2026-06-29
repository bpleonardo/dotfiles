-- Brief: Automatically detect the indentation style used in a buffer.

local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { gh 'NMAC427/guess-indent.nvim' }
require('guess-indent').setup {}

-- vim: ts=2 sts=2 sw=2 et
