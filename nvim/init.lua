require("user.options")
require("user.keymaps")
require("user.plugins")
require("user.cmp")
require("user.lsp")
require("user.telescope")
require("user.treesitter")
require("user.nvim-tree")
require("user.barbar")
require("user.lualine")
require("user.whichkey")
require("user.alpha")
-- require("user.surround")

-- Colorscheme options
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }
vim.cmd[[colorscheme tokyonight]]

-- Colorizer setup
require 'colorizer'.setup()

-- Telescope file browser
require("telescope").load_extension("file_browser")

-- Trying to make surround work
-- vim.api.nvim_exec(
--   [[
--   runtime macros/sandwich/keymap/surround.vim
--
--   autocmd FileType tex let b:surround_{char2nr("i")} = "\\textit{\r}"
--   ]],
--   false
-- )
