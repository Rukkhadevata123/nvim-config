return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvimtools/none-ls-extras.nvim",
    },
    config = function()
        require("null-ls").setup {
            sources = {
                require("null-ls").builtins.completion.spell,
                require("null-ls").builtins.formatting.stylua,
                require("null-ls").builtins.formatting.black,
                require("null-ls").builtins.formatting.clang_format,
                require("null-ls").builtins.formatting.gofmt,
                require("null-ls").builtins.formatting.prettier,
                require("null-ls").builtins.formatting.markdownlint,

                require("null-ls").builtins.code_actions.gitsigns,
                require("null-ls").builtins.diagnostics.pylint,
                require("null-ls").builtins.diagnostics.cppcheck,
                require("none-ls.diagnostics.eslint"),
                require("none-ls.diagnostics.cpplint"),
                require("none-ls.formatting.jq"),
                require("none-ls.code_actions.eslint"),
            },
        }
    end

}
