-- 插件管理
require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- 插件管理器
  use 'nvim-treesitter/nvim-treesitter' -- 语法高亮和增量解析
  use 'neovim/nvim-lspconfig' -- LSP 配置
  use 'hrsh7th/nvim-cmp' -- 自动补全框架
  use 'hrsh7th/cmp-nvim-lsp' -- LSP 补全源
  use 'L3MON4D3/LuaSnip' -- 代码片段引擎
  use 'saadparwaiz1/cmp_luasnip' -- LuaSnip 补全源
  use 'jose-elias-alvarez/null-ls.nvim' -- 代码格式化和诊断
  use 'nvim-lua/plenary.nvim' -- 一些 Lua 函数的库，其他插件的依赖
  use 'kyazdani42/nvim-tree.lua' -- 文件浏览器
  use 'mfussenegger/nvim-dap' -- Neovim 的调试插件
  use 'mfussenegger/nvim-jdtls' -- Java LSP 客户端
  use 'mfussenegger/nvim-dap-python' -- Python 调试支持
  use 'leoluz/nvim-dap-go' -- Go 调试支持
  use 'simrat39/rust-tools.nvim' -- Rust 开发支持
  use 'jose-elias-alvarez/nvim-lsp-ts-utils' -- TypeScript 相关工具
  use 'folke/tokyonight.nvim' -- 主题
  use 'numToStr/Comment.nvim' -- 注释支持
  use 'windwp/nvim-autopairs' -- 自动配对括号
  use 'akinsho/bufferline.nvim' -- 标签页管理
  use 'lewis6991/gitsigns.nvim' -- Git 状态提示
  use 'rcarriga/nvim-dap-ui' -- DAP 调试 GUI
  use 'nvim-neotest/nvim-nio' -- DAP GUI 依赖

  -- Telescope: 模糊搜索插件
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Lualine: 状态栏
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
end)
