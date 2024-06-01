-- Move between buffers
vim.keymap.set('n', "<C-j>", vim.cmd.bprev, { desc = "Previous Buffer" })
vim.keymap.set('n', "<C-k>", vim.cmd.bnext, { desc = "Next Buffer" })

-- [NvimTree] Toogle explorer
vim.keymap.set('n', "<Leader>e",  vim.cmd("NvimTreeToggle"), { desc = "Toogle Explorer" })


-- [Telescope]
local builtin = require("telescope.builtin")
vim.keymap.set('n', "<Leader>ff", builtin.find_files, { desc = "Find files" }) -- Find files in project
vim.keymap.set('n', "<Leader>fs", builtin.grep_string, { desc = "Find selected string in files" }) -- Find selected string in project
vim.keymap.set('n', "<Leader>fg", builtin.live_grep, { desc = "Find string in files" }) -- Find string in project
vim.keymap.set('n', "<Leader>ft", builtin.lsp_document_symbols, { desc = "Find symbol in file" }) -- Find symbol in file
vim.keymap.set('n', "<Leader>gr", builtin.lsp_references, { desc = "Go to references" }) -- Show references

-- [LSP Keymaps]
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function (ev)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = ev.buf })
    vim.keymap.set('n', '<Leader>d', vim.diagnostic.open_float, { buffer = ev.buf })
  end
})
