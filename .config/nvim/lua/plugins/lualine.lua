-- lualine.lua: Stylish statusline

return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    options = {
      theme = "codedark"
    },
    tabline = {
      lualine_a = {'buffers'},
    }
  }
}
