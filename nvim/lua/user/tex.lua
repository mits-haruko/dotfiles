require("nvim-surround").buffer_setup({
  delimiters = {
    ["b"] = {
      add = { "\\left(", "\\right)" },
    },
    ["B"] = {
      add = { "\\left{", "\\right}" },
    },
  },
  aliases = {
    ["b"] = false,
    ["B"] = false,
  },
})
