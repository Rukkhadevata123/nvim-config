local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.clang_format,      -- C/C++ 格式化
    null_ls.builtins.formatting.prettier,          -- JavaScript/TypeScript/HTML/CSS 格式化
    null_ls.builtins.formatting.black,             -- Python 格式化
    null_ls.builtins.diagnostics.flake8,           -- Python 诊断
    null_ls.builtins.diagnostics.eslint,           -- JavaScript 诊断
    null_ls.builtins.code_actions.gitsigns,        -- Git 符号操作
  },
})
