require("nvim-surround").setup({
  surrounders = {
    ["b"] = {
      add = { "\\left{", "\\right}"},
    },
    ["B"] = {
      add = { "\\left(", "\\right)"},
    },
  },
  aliases = {
    ["b"] = false,
    ["B"] = false,
  }
})
