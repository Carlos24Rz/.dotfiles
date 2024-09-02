-- options.lua: Nvim options

vim.opt.expandtab = true          -- use spaces instead of tabs
vim.opt.list = true               -- show tabs and trailing spaces
vim.opt.listchars = {             -- list characters
  tab = "▶-",
  trail = "•",
  nbsp = "⎵",
}
vim.opt.number = true             -- number line column
vim.opt.pumheight = 10            -- show 10 items in a popup menu at a time
vim.opt.relativenumber = true     -- relative number line column
vim.opt.smartindent = true        -- smart identation
vim.opt.shiftwidth = 2            -- Insert 2 spaces when using tab on new line
vim.opt.splitbelow = true         -- below horizontal splits
vim.opt.splitright = true         -- right vertical splits
vim.opt.tabstop = 2               -- use 2 spaces for tabs
vim.opt.termguicolors = true      -- enable terminal true color
vim.opt.timeout = true            -- key sequence timeout 
vim.opt.timeoutlen = 300          -- timeout after 300ms
vim.opt.updatetime = 100          -- update swap file time
