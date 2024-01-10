---------------------------------------
-- Leaders
---------------------------------------
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

------------------------------
-- Settings
------------------------------
vim.o.expandtab = true
vim.o.list = true
vim.o.number = true
vim.o.signcolumn = "yes"
vim.o.smartindent = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.background = "dark"

vim.opt.listchars = {
  tab = '-▸',
  trail = '·',
}

------------------------------
-- Plugin setup
------------------------------

-- Enable Lazy Package Manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

-- Lualine
require("lualine").setup {
  options = {
    theme = 'gruvbox-material',
  },
  tabline = {
    lualine_a = {'buffers'},
  },
}

-- LSP

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require('lspconfig')
lspconfig.clangd.setup{
  capabilities = capabilities,
}

local luasnip = require("luasnip")

local cmp = require("cmp")
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
    ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
    -- C-b (back) C-f (forward) for snippet placeholder navigation.
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}
------------------------------
-- Colorscheme
------------------------------
vim.cmd [[colorscheme gruvbox-material]]
