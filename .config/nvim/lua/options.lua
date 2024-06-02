-- Global Options
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Options
vim.opt.termguicolors = true -- Enable true color support
vim.opt.number = true -- Enable number line gutter
vim.opt.relativenumber = true -- Enable relative number line
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.tabstop = 2 -- Use 2 spaces for tab
vim.opt.shiftwidth = 2 -- Use 2 spaces when autoindenting
vim.opt.list = true -- Enable tab and trailing space characters
vim.opt.listchars = {
  tab = '>-',
  trail = '-'
}
vim.opt.pumheight = 10 -- Show only 10 items in pop-up menus
