-- indent-blankline.lua: Identation lines on files

return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {
    indent = {
      char = "▏",
    },
    scope = {
      show_start = false,
      show_end = false
    }
  },
  config = function (_, opts)
    require("ibl").setup(opts)

    vim.keymap.set("n", "<leader>ui", "<cmd>IBLToggle<cr>", { desc = "Toggle identation" })
  end
}
