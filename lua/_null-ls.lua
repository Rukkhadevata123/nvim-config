local null_ls = require("null-ls")
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
