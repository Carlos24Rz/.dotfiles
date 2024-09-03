-- colorschemes.lua: Nvim colorscheme plugins

return {
  {
    "rockyzhang24/arctic.nvim",
    dependencies = { "rktjmp/lush.nvim" },
    name = "artic",
    branch = "main",
    config = function ()
      vim.cmd("colorscheme arctic")
    end
  },
  {
    "olimorris/onedarkpro.nvim",
    lazy = true
  },
  {
    "oxfist/night-owl.nvim",
    lazy = true
  },
  {
    "alexmozaidze/palenight.nvim",
    lazy = true
  },
}
