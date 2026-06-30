local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { gh 'nvimtools/none-ls.nvim' }

local null_ls = require 'null-ls'
null_ls.setup {
  sources = {
    null_ls.builtins.formatting.stylua,
  },
}

-- vim: ts=2 sts=2 sw=2 et
