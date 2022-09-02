local ls = require("luasnip")

ls.filetype_extend("latex")

require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets/"})

ls.config.set_config({
  history = true, -- keep around last snippet local to jump back
  updateevents = "TextChanged,TextChangedI", -- update changes as you type
  enable_autosnippets = true,
})

-- keymaps
-- shortcut to source luasnip files which will reload snippets
-- vim.keymap.set("n", "<leader>r s", "<cmd>source ~/.config/nvim/lua/user/luasnip.lua<CR>" )
