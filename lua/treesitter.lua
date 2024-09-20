-- Treesitter 配置
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "java", "cpp", "c", "lua", "go", "bash", "python", "rust", "javascript", "typescript", "html", "css", "json", "yaml", "markdown" },
  highlight = {
    enable = true, -- 启用语法高亮
    additional_vim_regex_highlighting = false,
  },
}
