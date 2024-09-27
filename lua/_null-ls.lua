local null_ls = require("null-ls")
local eslint = require("eslint")
local venv = os.getenv("VIRTUAL_ENV") or "~/.local/venv/nvim"

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.clang_format,      -- C/C++ 格式化
    null_ls.builtins.formatting.prettier,          -- JavaScript/TypeScript/HTML/CSS 格式化
    null_ls.builtins.formatting.black.with({
      command = "bash",
      args = {
        "-c",
        -- 先激活虚拟环境，运行 black 后，自动退出虚拟环境
        "source ~/.local/venv/nvim/bin/activate && black --fast - && deactivate"
      },
      extra_args = { "--fast" },
    }),             -- Python 格式化
    null_ls.builtins.diagnostics.flake8,           -- Python 诊断
    null_ls.builtins.diagnostics.eslint,           -- JavaScript 诊断
    null_ls.builtins.code_actions.gitsigns,        -- Git 符号操作
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
