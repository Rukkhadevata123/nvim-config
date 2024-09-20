-- 插件管理
require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- 插件管理器
  use 'nvim-treesitter/nvim-treesitter' -- 语法高亮
  use 'neovim/nvim-lspconfig' -- LSP 配置
  use 'hrsh7th/nvim-cmp' -- 补全框架
  use 'hrsh7th/cmp-nvim-lsp' -- LSP 补全源
  use 'L3MON4D3/LuaSnip' -- 代码片段引擎
  use 'saadparwaiz1/cmp_luasnip' -- LuaSnip 补全源
  use 'jose-elias-alvarez/null-ls.nvim' -- 代码格式化
  use 'nvim-lua/plenary.nvim' -- null-ls.nvim 依赖库
  use 'kyazdani42/nvim-tree.lua' -- 文件浏览
  use 'mfussenegger/nvim-dap'  -- Neovim 的调试插件
  use 'mfussenegger/nvim-jdtls' -- Java LSP 客户端
  use 'mfussenegger/nvim-dap-python' -- Python 调试支持
  use 'leoluz/nvim-dap-go' -- Go 调试支持
  use 'simrat39/rust-tools.nvim' -- Rust 工具
  use 'jose-elias-alvarez/nvim-lsp-ts-utils' -- TypeScript 工具
end)
