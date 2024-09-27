-- LSP 配置
local nvim_lsp = require('lspconfig')

-- 通用 on_attach 函数
local on_attach = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  -- LSP 相关的快捷键
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
end

-- 配置 clangd
nvim_lsp.clangd.setup {
  on_attach = on_attach,
}

-- 配置 pyright
nvim_lsp.pyright.setup {
  on_attach = on_attach,
}

-- 配置 gopls
nvim_lsp.gopls.setup {
  on_attach = on_attach,
}

-- 配置 TypeScript 语言服务器
nvim_lsp.ts_ls.setup {
  on_attach = on_attach,
}

-- 配置 Bash 语言服务器
nvim_lsp.bashls.setup {
  on_attach = on_attach,
}

-- 配置 Lua 语言服务器
nvim_lsp.lua_ls.setup {
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        version = 'LuaJIT'
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
        }
      }
    })
  end,
  settings = {
    Lua = {}
  },
  on_attach = on_attach,
}
