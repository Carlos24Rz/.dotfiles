-- Move between buffers
vim.keymap.set('n', "<C-j>", function() vim.cmd.bnext() end)
vim.keymap.set('n', "<C-k>", function() vim.cmd.bprev() end)
