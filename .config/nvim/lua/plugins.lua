return {
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
  },
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  "folke/neodev.nvim",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim" },
  },
--  "ray-x/lsp_signature.nvim",
  "nvim-treesitter/nvim-treesitter",
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  "nvim-tree/nvim-tree.lua",
  "lewis6991/gitsigns.nvim"
}
