-- Treesitter 配置
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "java", "cpp", "c", "lua", "go", "bash", "python", "rust", "javascript", "typescript", "html", "css", "json", "yaml", "markdown", "cmake" },

  highlight = {
    enable = true, -- 启用语法高亮
    additional_vim_regex_highlighting = false, -- 禁用 Vim 的额外正则高亮，避免冲突
  },

  -- 启用增量选择
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn", -- 开始选择
      node_incremental = "grn", -- 增加选择范围
      scope_incremental = "grc", -- 增加作用域选择
      node_decremental = "grm", -- 减少选择范围
    },
  },

  -- 启用代码缩进
  indent = {
    enable = true
  },

  -- 启用代码折叠
  fold = {
    enable = true,
  },
}

