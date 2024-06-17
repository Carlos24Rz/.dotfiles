-- Lazy.nvim setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Set Local leader
vim.g.mapleader = " "

-- Load modules
require("lazy").setup("plugins", {
  install = {
    colorscheme = { "onedark" }
  }
})
require("config")
require("options")
require("mappings")
