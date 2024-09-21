local cmp = require'cmp'
local luasnip = require('luasnip')

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    -- 取消补全文档滚动快捷键，设置为上下选择补全项
    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(), -- 在插入模式下按下 `C-e` 取消补全
      c = cmp.mapping.close(), -- 在命令行模式下按下 `C-e` 关闭补全
    }),
    -- 确认选择
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = false, -- 不自动选择，手动确认补全项
    }),
    -- 使用 Tab 补全
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
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
    { name = 'path' },
  }),

  -- 更好的补全窗口视觉效果
  formatting = {
    fields = { "abbr", "kind", "menu" },
    format = function(entry, vim_item)
      local kind_icons = {
        Text = "", Method = "", Function = "", Constructor = "", Field = "",
        Variable = "[]", Class = "", Interface = "", Module = "", Property = "",
        Unit = "", Value = "", Enum = "", Keyword = "", Snippet = "",
        Color = "", File = "", Reference = "", Folder = "", EnumMember = "",
        Constant = "", Struct = "", Event = "", Operator = "", TypeParameter = "",
      }
      vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        luasnip = "[Snippet]",
        buffer = "[Buffer]",
        path = "[Path]",
      })[entry.source.name]
      return vim_item
    end,
  },

  -- 设置补全窗口行为
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  -- 启用实验功能，增强体验
  experimental = {
    ghost_text = true, -- 在行尾显示补全提示文字
  }
})

-- 为命令行模式设置补全
-- cmp.setup.cmdline(':', {
--   mapping = cmp.mapping.preset.cmdline(),
--   sources = cmp.config.sources({
--     { name = 'path' }
--   }, {
--     { name = 'cmdline' }
--   })
-- })

-- 为搜索模式设置补全
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})
