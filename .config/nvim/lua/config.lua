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
vim.o.termguicolors = true
vim.o.updatetime = 500

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

require("lazy").setup("plugins", {
  dev = {
    path = vim.fn.stdpath("config") .. "/my-plugins",
  },
})

-- Telescope
local telescope = require('telescope')
telescope.setup {
  extensions = {
    helpgrep = {
      ignore_paths = {
        vim.fn.stdpath("state") .. "/lazy/readme",
      },
    },
  }
}
telescope.load_extension('helpgrep')

-- Lualine
require("lualine").setup {
  options = {
    theme = 'dracula',
  },
  tabline = {
    lualine_a = {'buffers'},
  },
}

-- Linter

local lint = require("lint")

lint.linters_by_ft = {
  c = {'clangtidy',}
}

vim.api.nvim_create_autocmd({"BufWritePost", "BufReadPost"}, {
  callback = function()
    lint.try_lint()
  end
})

-- Lsp

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require('lspconfig')

lspconfig.clangd.setup {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("CursorHold", {
      buffer = bufnr,
      callback = function()
        local opts = {
          focusable = false,
          close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
          border = 'rounded',
          source = 'always',
          prefix = ' ',
          scope = 'cursor',
        }
        vim.diagnostic.open_float(nil, opts)
      end
    })
  end
}

-- Autocompletion + snippets

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

-- Diagnostics settings
vim.diagnostic.config({
  virtual_text = false,
  update_in_insert = true,
})

-- Autosave files

local autosave = require("autosave")

autosave.setup(5000)

------------------------------
-- Colorscheme
------------------------------
vim.cmd [[colorscheme dracula]]
