local null_ls = require("null-ls")
local eslint = require("eslint")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.clang_format,      -- C/C++ 格式化
    null_ls.builtins.formatting.prettier,          -- JavaScript/TypeScript/HTML/CSS 格式化
    null_ls.builtins.formatting.black,             -- Python 格式化
    null_ls.builtins.code_actions.gitsigns,        -- Git 符号操作
    null_ls.builtins.diagnostics.pylint,           -- Python 诊断
    require("none-ls.diagnostics.eslint"),         -- ESLint 诊断
  },
})

eslint.setup({
  bin = 'eslint', -- or `eslint_d`
  code_actions = {
    enable = true,
    apply_on_save = {
      enable = true,
      types = { "directive", "problem", "suggestion", "layout" },
    },
    disable_rule_comment = {
      enable = true,
      location = "separate_line", -- or `same_line`
    },
  },
  diagnostics = {
    enable = true,
    report_unused_disable_directives = false,
    run_on = "type", -- or `save`
  },
})
