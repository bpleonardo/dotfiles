-- Brief: A collection of various small independent plugins/modules
local function gh(repo) return 'https://github.com/' .. repo end

-- [[ mini.nvim ]]
vim.pack.add { gh 'nvim-mini/mini.nvim' }

-- If a nerd font is available, load the icons module for pretty icons in various plugins.
if vim.g.have_nerd_font then
  require('mini.icons').setup()
  -- Used for backwards compatibility with plugins that require `nvim-web-devicons` (e.g. telescope.nvim)
  MiniIcons.mock_nvim_web_devicons()
end

-- vim: ts=2 sts=2 sw=2 et
