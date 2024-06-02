-- Colorscheme
vim.cmd("colorscheme onedark")

-- Lualine
require("lualine").setup({
  options = {
    theme = "dracula"
  },
  tabline = {
    lualine_a = { "buffers" },
    lualine_y = {
      {
        "filename",
        path = 1
      }
    },
  }
})
-- Which key
require("which-key").setup()

-- Directory Tree
require("nvim-tree").setup({
  diagnostics = {
    enable = true
  },
  update_focused_file = {
    enable = true
  }
})

-- Git gutter signs
require("gitsigns").setup()

-- Mason
require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = {
      "bashls",
      "clangd",
      "lua_ls",
      "pyright",
      "tsserver"
    },
}

-- LSP
local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities();
local lspconfig = require("lspconfig")

require("neodev").setup()

lspconfig.bashls.setup {
  capabilities = cmp_capabilities,
}
lspconfig.clangd.setup {
  capabilities = cmp_capabilities,
}
lspconfig.lua_ls.setup {
  capabilities = cmp_capabilities,
}
lspconfig.pyright.setup {
  capabilities = cmp_capabilities,
}
lspconfig.tsserver.setup {
  capabilities = cmp_capabilities,
}

-- Autocompletion
local cmp = require("cmp")
cmp.setup {
  sources = {
    { name = "nvim_lsp" },
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Move up in documentation
    ['<C-d>'] = cmp.mapping.scroll_docs(4),  -- Move down in documentation
    ['<CR>'] = cmp.mapping.confirm {         -- Autocomplete option
      behavior = cmp.ConfirmBehavior.Insert,
    },
    ['<Tab>'] = cmp.mapping(function(fallback) -- Move forwards in autocompletion items
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback) -- Move backwards in autocompletion items
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  window = {
    documentation = {
      border = {'╭', '─', '╮', '│', '╯', '─', '╰', '│'},
    },
    completion = {
      border = {'┌', '─', '┐', '│', '┘', '─', '└', '│'},
      side_padding = 1
    }
  }
}

-- Diagnostic settings
vim.diagnostic.config({
  virtual_text = false,
  float = {
    border = "rounded"
  }
})

require("noice").setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
    },
  },
  presets = {
    lsp_doc_border = true
  },
  cmdline = {
    enabled = false
  },
  messages = {
    enabled = false
  },
  popupmenu = {
    enabled = false
  },
  notify = {
    enabled = false
  }
})
-- require("lsp_signature").setup {
--   hint_enable = false,
--   zindex = 10,
--   wrap = true,
-- }

-- Autopairs
require("nvim-autopairs").setup {}

-- Treesitter
require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "bash",
    "c",
    "cpp",
    "lua",
    "python",
    "query",
    "tsx",
    "typescript",
    "vim",
    "vimdoc"
  },
  highlight = {
    enable = true
  }
})
