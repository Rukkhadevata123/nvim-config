local cmp = require('cmp')
local luasnip = require('luasnip')
local lspkind = require('lspkind')

-- Set highlight for Copilot
vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })

-- Setup lspkind for icon display in completions
lspkind.init({
  mode = 'symbol_text',  -- Show both symbols and text
  preset = 'codicons',   -- Use codicon preset for icons
  symbol_map = {
    Text = "󰉿", Method = "󰆧", Function = "󰊕", Constructor = "", Field = "󰜢",
    Variable = "󰀫", Class = "󰠱", Interface = "", Module = "", Property = "󰜢",
    Unit = "󰑭", Value = "󰎠", Enum = "", Keyword = "󰌋", Snippet = "",
    Color = "󰏘", File = "󰈙", Reference = "󰈇", Folder = "󰉋", EnumMember = "",
    Constant = "󰏿", Struct = "󰙅", Event = "", Operator = "󰆕", TypeParameter = "", Copilot = "",
  },
})

-- Setup nvim-cmp
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)  -- Use LuaSnip for snippet expansion
      -- Uncomment for other snippet engines as needed:
      -- vim.fn["vsnip#anonymous"](args.body)  -- For `vsnip` users
      -- require('snippy').expand_snippet(args.body)  -- Snippy
      -- vim.fn["UltiSnips#Anon"](args.body)  -- UltiSnips
    end,
  },
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),  -- In insert mode, abort completion
      c = cmp.mapping.close(),   -- In command mode, close completion
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),  -- Accept selected item
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
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = "copilot", group_index = 2 },  -- Copilot completion
    { name = 'luasnip' },  -- LuaSnip snippets
  }, {
    { name = 'buffer' },
    { name = 'path' },
  }),
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol',  -- Show only symbol annotations
      maxwidth = 50,
      ellipsis_char = '...',
      before = function(entry, vim_item)
        return vim_item
      end,
    }),
    fields = { "abbr", "kind", "menu" },
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  experimental = {
    ghost_text = true,  -- Enable ghost text
  },
})

-- Command line completion
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'path' },
    { name = 'cmdline' },
  },
})

-- Search mode completion
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' },
  },
})

-- Set up LSP capabilities
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
--   capabilities = capabilities
-- }
