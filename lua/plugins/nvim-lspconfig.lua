return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        local lspconfig = require('lspconfig')

        local on_attach = function(client, bufnr)
            local bufopts = { noremap = true, silent = true, buffer = bufnr }
            
            -- LSP Navigation and actions
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
        end

        vim.keymap.set("n", "<leader>fm", function() 
            vim.lsp.buf.format({ async = true }) 
        end, { desc = "Format code" })
        vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show diagnostics" })
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })

        -- Python
        vim.lsp.enable('pyright')
        lspconfig.pyright.setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })

        -- C/C++
        vim.lsp.enable('clangd')
        lspconfig.clangd.setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })

        -- Bash
        vim.lsp.enable('bashls')
        lspconfig.bashls.setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })

        -- Go
        vim.lsp.enable('gopls')
        lspconfig.gopls.setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })

        -- Java
        vim.lsp.enable('jdtls')
        lspconfig.jdtls.setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })

        -- Lua
        vim.lsp.enable('lua_ls')
        lspconfig.lua_ls.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' },
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                    },
                    telemetry = {
                        enable = false,
                    },
                },
            },
        })

        -- TypeScript/JavaScript
        vim.lsp.enable('ts_ls')
        lspconfig.ts_ls.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            init_options = {
                plugins = {
                    {
                        name = "@vue/typescript-plugin",
                        location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
                        languages = { "javascript", "typescript", "vue" },
                    },
                },
            },
            filetypes = { "javascript", "typescript", "vue" },
        })
    end
}