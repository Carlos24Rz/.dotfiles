-- treesitter.lua: Syntax highlighting plugin

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function ()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
      highlight = {
        enable = true
      }
    })
  end
}