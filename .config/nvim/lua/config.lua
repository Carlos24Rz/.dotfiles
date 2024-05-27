
-- Lualine
require("lualine").setup({
  options = {
    theme = "dracula"
  },
  tabline = {
    lualine_a = { "buffers" }
  }
})
