-- lsp.lua: Language Server Protocol configurations for Nvim

local installed_servers = {
  "clangd", "pyright",
}

return {
  {
    "williamboman/mason-lspconfig.nvim",
    config = function ()
      local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()

      vim.lsp.config('*', {
        capabilities = cmp_capablities,
      })

      require("mason-lspconfig").setup({
        ensure_installed = installed_servers,
      })
    end,
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  },
}
