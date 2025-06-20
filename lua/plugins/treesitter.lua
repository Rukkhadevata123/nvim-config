return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        branch = 'master',
        lazy = false,
        opts = {
            ensure_installed = {
                "java", "cpp", "c", "lua", "go", "bash", "python", "rust",
                "javascript", "typescript", "html", "css", "json", "yaml",
                "markdown", "cmake", "ruby", "php", "vimdoc", "kotlin", "perl",
                "r", "dart", "scala", "haskell", "elixir", "erlang",
                "markdown_inline", "query", "regex", "tsx", "vim", "dockerfile",
                "git_config", "gitcommit", "git_rebase", "gitignore", "gitattributes",
                "gomod", "gowork", "gosum", "json5", "c_sharp"
            },
            auto_install = true,
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        opts = {
            enable = true,
        },
    }
}
