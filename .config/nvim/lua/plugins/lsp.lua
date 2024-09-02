-- lsp.lua: Language Server Protocol configurations for Nvim

local installed_servers = {
  "clangd",
}

return {
  "neovim/nvim-lspconfig",
  {
    "williamboman/mason.nvim",
    config = true
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function ()
      local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()

      require("mason-lspconfig").setup({
        ensure_installed = installed_servers,
      })

      require("mason-lspconfig").setup_handlers {
        -- The first entry (without a key) will be the default handler
        -- and will be called for each installed server that doesn't have
        -- a dedicated handler.
        function (server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup {
            capabilities = cmp_capabilities
          }
        end,
        -- Next, you can provide a dedicated handler for specific servers.
        -- ["lsp-server"] = function ()
        -- ["clangd"] = function()
        --   require("lspconfig").clangd.setup {
        --     cmd = {
        --       "clangd",
        --       "--completion-style=detailed",
        --       "--function-arg-placeholders"
        --     },
        --     capabilities = cmp_capabilities
        --   }
        -- end,
      }
    end
  },
}
