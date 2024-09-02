-- telescope.lua: Fuzzyfinding in Nvim

return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = 'make'
    }
  },
  config = function ()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")

    telescope.setup({
      extensions = {
        fzf = {
          fuzzy = false
        }
      }
    })

    telescope.load_extension("fzf")

    -- keymaps
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep workspace" })
    vim.keymap.set("n", "<leader><leader>", builtin.current_buffer_fuzzy_find, { desc = "Live grep buffer" })
    vim.keymap.set("n", "<leader>t", builtin.lsp_document_symbols, { desc = "List document symbols" })
    vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = "Go to definition" })
    vim.keymap.set("n", "gi", builtin.lsp_implementations, { desc = "Go to implementation" })
    vim.keymap.set("n", "gr", builtin.lsp_references, { desc = "List references" })
  end
}
