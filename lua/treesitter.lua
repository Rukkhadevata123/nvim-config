-- Treesitter 配置
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
      "java", "cpp", "c", "lua", "go", "bash", "python", "rust",
      "javascript", "typescript", "html", "css", "json", "yaml",
      "markdown", "cmake", "ruby", "php", "vimdoc", "kotlin", "perl",
      "r", "dart", "scala", "haskell", "elixir", "erlang",
      "markdown_inline", "query", "regex", "tsx", "vim", "dockerfile", 
      "git_config", "gitcommit", "git_rebase", "gitignore", "gitattributes",
      "gomod", "gowork", "gosum", "json5", "c_sharp"
  },

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

require'treesitter-context'.setup{
  enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
  max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
  min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
  line_numbers = true,
  multiline_threshold = 20, -- Maximum number of lines to show for a single context
  trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
  mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
  -- Separator between context and content. Should be a single character string, like '-'.
  -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
  separator = nil,
  zindex = 20, -- The Z-index of the context window
  on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
}

