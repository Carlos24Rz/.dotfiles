-- nvim-cmp.lua: Autocompletion menu

local cmp_kinds = {
  Text = " ",
  Method = " ",
  Function = " ",
  Constructor = " ",
  Field = " ",
  Variable = " ",
  Class = " ",
  Interface = " ",
  Module = " ",
  Property = " ",
  Unit = " ",
  Value = " ",
  Enum = " ",
  Keyword = " ",
  Snippet = " ",
  Color = " ",
  File = " ",
  Reference = " ",
  Folder = " ",
  EnumMember = " ",
  Constant = " ",
  Struct = " ",
  Event = " ",
  Operator = " ",
  TypeParameter = " ",
}

local cmp_sources = {
  nvim_lsp = "[LSP]",
}

local function formatMenu (entry, vim_item)
  vim_item.kind = string.format("%s %s", cmp_kinds[vim_item.kind], vim_item.kind)
  vim_item.abbr = string.format("%s%s", vim_item.abbr, vim_item.menu or "")
  vim_item.menu = cmp_sources[entry.source.name]
  return vim_item
end

return {
  "L3MON4D3/LuaSnip",
  "hrsh7th/cmp-nvim-lsp",
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter" },
    config = function ()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end
        },
        formatting = {
          format = formatMenu,
          fields = { "abbr", "kind", "menu" },
          expandable_indicator = false
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
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
        window = {
          completion = {
            border = { "╔", "═" ,"╗", "║", "╝", "═", "╚", "║" }
          }
        },
        sources = {
          { name = "nvim_lsp" },
        }
      })
    end
  },
}

