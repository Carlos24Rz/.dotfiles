-- Move between buffers
vim.keymap.set('n', "<C-j>", vim.cmd.bprev, { desc = "Previous Buffer" }) -- Move to previous buffer
vim.keymap.set('n', "<C-k>", vim.cmd.bnext, { desc = "Next Buffer" }) -- Move to next buffer

-- Window Resizing
vim.keymap.set('n', "<S-j>", function() vim.cmd([[resize -5]]) end, { desc = "Decrease window height"}) -- Decrease height
vim.keymap.set('n', "<S-k>", function() vim.cmd([[resize +5]]) end, { desc = "Increase window height"}) -- Increase height
vim.keymap.set('n', "<S-h>", function() vim.cmd([[vertical resize -5]]) end, { desc = "Decrease window width"}) -- Decrease width
vim.keymap.set('n', "<S-l>", function() vim.cmd([[vertical resize +5]]) end, { desc = "Increase window width"}) -- Increase width

-- [NvimTree] Toogle explorer
vim.keymap.set('n', "<Leader>e", function() vim.cmd("NvimTreeToggle") end, { desc = "Toogle Explorer" })


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
