-- 插件管理
require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- 插件管理器
  use 'nvim-treesitter/nvim-treesitter' -- 语法高亮和增量解析
  use 'nvim-treesitter/nvim-treesitter-context' -- 语法上下文
  use 'neovim/nvim-lspconfig' -- LSP 配置

  -- 自动补全框架
  use 'hrsh7th/nvim-cmp' -- 自动补全框架
  use 'hrsh7th/cmp-nvim-lsp' -- LSP 补全源
  use 'hrsh7th/cmp-buffer' -- 缓冲区补全
  use 'hrsh7th/cmp-path' -- 路径补全
  use 'hrsh7th/cmp-cmdline' -- 命令行补全
  -- use 'hrsh7th/cmp-vsnip' -- Vsnip 代码片段引擎
  use 'L3MON4D3/LuaSnip' -- LuaSnip 代码片段引擎 (可以启用)
  -- use 'SirVer/ultisnips' -- UltiSnips 代码片段引擎 (可以启用)
  -- use 'dcampos/nvim-snippy' -- Snippy 代码片段引擎 (可以启用)

  -- 代码格式化和诊断
  use 'jose-elias-alvarez/null-ls.nvim' -- 代码格式化和诊断
  use 'MunifTanjim/eslint.nvim' -- ESLint 支持

  -- 其他插件
  use 'nvim-lua/plenary.nvim' -- Lua 函数库
  use 'kyazdani42/nvim-tree.lua' -- 文件浏览器
  use 'mfussenegger/nvim-dap' -- Neovim 的调试插件
  use 'mfussenegger/nvim-jdtls' -- Java LSP 客户端
  use 'mfussenegger/nvim-dap-python' -- Python 调试支持
  use 'leoluz/nvim-dap-go' -- Go 调试支持
  use 'mrcjkb/rustaceanvim' -- Rust 开发支持
  use 'jose-elias-alvarez/nvim-lsp-ts-utils' -- TypeScript 相关工具
  use 'folke/tokyonight.nvim' -- 主题
  use 'numToStr/Comment.nvim' -- 注释支持
  use 'windwp/nvim-autopairs' -- 自动配对括号
  use 'akinsho/bufferline.nvim' -- 标签页管理
  use 'lewis6991/gitsigns.nvim' -- Git 状态提示
  use 'rcarriga/nvim-dap-ui' -- DAP 调试 GUI
  use 'nvim-neotest/nvim-nio' -- DAP GUI 依赖
  use "lervag/vimtex" -- TeX 支持
  use "CopilotC-Nvim/CopilotChat.nvim" -- Copilot Chat
  use "zbirenbaum/copilot.lua" -- Copilot
  use {
    "echasnovski/mini.animate",
    config = function()
      require("mini.animate").setup()
    end
  } -- 动画
  use {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function ()
      require("copilot_cmp").setup()
    end
  }
  use "onsails/lspkind-nvim" -- LSP 图标
  use {
    'rcarriga/nvim-notify', -- 通知
    config = function()
      vim.notify = require("notify")
    end
  }
  use({
    "iamcco/markdown-preview.nvim", 
    run = "cd app && npm install", 
    setup = function() 
      vim.g.mkdp_filetypes = { "markdown" } 
    end, 
    ft = { "markdown" },
  })
  
  -- Telescope: 模糊搜索插件
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  
  use {
    "hedyhli/outline.nvim",
    config = function()
      -- 示例映射来切换大纲
      vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>",
        { desc = "Toggle Outline" })
  
      require("outline").setup {
        -- 这里是您的设置选项（留空以使用默认设置）
      }
    end,
  } -- Outline: 大纲
  
  use({
    'MeanderingProgrammer/render-markdown.nvim',
    after = { 'nvim-treesitter' },
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }, -- 如果您喜欢 nvim-web-devicons
    config = function()
        require('render-markdown').setup({render_modes = { 'n', 'v', 'i', 'c' }})
    end,
  })

  -- Lualine: 状态栏
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
end)

-- 自动更新插件
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])
