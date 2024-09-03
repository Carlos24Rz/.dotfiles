-- trouble.lua: Show diagnostics in a styled list

return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  config = true,
  keys = {
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Show buffer diagnostics",
    }
  }
}
