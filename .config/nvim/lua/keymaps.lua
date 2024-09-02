-- keymaps.lua: Nvim keymaps

vim.keymap.set('n', '<leader>ul',
  function ()
    vim.cmd([[
      set number!
      set relativenumber!
    ]])
  end,
  { desc = "Toggle line numbers" }
)

vim.keymap.set('n', ']]', '<cmd>bn<cr>', { desc = "Switch to next buffer" })
vim.keymap.set('n', '[[', '<cmd>bp<cr>', { desc = "Switch to previous buffer" })
