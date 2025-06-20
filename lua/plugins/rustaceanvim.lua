return {
    'mrcjkb/rustaceanvim',
    version = '^6',
    lazy = false,
    config = function()
        vim.g.rustaceanvim = {
            -- Plugin configuration
            tools = {
                -- Use neotest as test executor (if you have neotest installed)
                -- test_executor = 'background', -- Run tests in background and show diagnostics
                code_actions = {
                    ui_select_fallback = true, -- Fallback to vim.ui.select if no grouped code actions
                },
            },
            -- LSP configuration
            server = {
                on_attach = function(client, bufnr)
                    -- Rust-specific keybindings (only active in Rust files)
                    local bufopts = { noremap = true, silent = true, buffer = bufnr }

                    -- Override default hover keymap to use rustaceanvim's hover actions
                    vim.keymap.set('n', 'K', function()
                        vim.cmd.RustLsp({ 'hover', 'actions' })
                    end, bufopts)

                    -- Rust-specific keybindings
                    vim.keymap.set('n', '<leader>ra', function()
                        vim.lsp.buf.code_action()
                    end, { desc = 'Rust code actions', buffer = bufnr })

                    vim.keymap.set('n', '<leader>rr', function()
                        vim.cmd.RustLsp('runnables')
                    end, { desc = 'Rust runnables', buffer = bufnr })

                    vim.keymap.set('n', '<leader>rt', function()
                        vim.cmd.RustLsp('testables')
                    end, { desc = 'Rust testables', buffer = bufnr })

                    vim.keymap.set('n', '<leader>rd', function()
                        vim.cmd.RustLsp('debuggables')
                    end, { desc = 'Rust debuggables', buffer = bufnr })

                    vim.keymap.set('n', '<leader>re', function()
                        vim.cmd.RustLsp('explainError')
                    end, { desc = 'Explain Rust error', buffer = bufnr })

                    vim.keymap.set('n', '<leader>rD', function()
                        vim.cmd.RustLsp('renderDiagnostic')
                    end, { desc = 'Render diagnostic', buffer = bufnr })

                    vim.keymap.set('n', '<leader>rm', function()
                        vim.cmd.RustLsp('expandMacro')
                    end, { desc = 'Expand macro', buffer = bufnr })

                    vim.keymap.set('n', '<leader>rc', function()
                        vim.cmd.RustLsp('openCargo')
                    end, { desc = 'Open Cargo.toml', buffer = bufnr })

                    vim.keymap.set('n', '<leader>rp', function()
                        vim.cmd.RustLsp('parentModule')
                    end, { desc = 'Parent module', buffer = bufnr })

                    vim.keymap.set('n', '<leader>rj', function()
                        vim.cmd.RustLsp('joinLines')
                    end, { desc = 'Join lines', buffer = bufnr })

                    vim.keymap.set('n', '<leader>rs', function()
                        vim.cmd.RustLsp('ssr')
                    end, { desc = 'Structural search replace', buffer = bufnr })

                    vim.keymap.set('n', '<leader>rh', function()
                        vim.cmd.RustLsp { 'view', 'hir' }
                    end, { desc = 'View HIR', buffer = bufnr })

                    vim.keymap.set('n', '<leader>rM', function()
                        vim.cmd.RustLsp { 'view', 'mir' }
                    end, { desc = 'View MIR', buffer = bufnr })

                    vim.keymap.set('n', '<leader>rg', function()
                        vim.cmd.RustLsp('crateGraph')
                    end, { desc = 'Crate graph', buffer = bufnr })

                    vim.keymap.set('n', '<leader>rS', function()
                        vim.cmd.RustLsp('syntaxTree')
                    end, { desc = 'Syntax tree', buffer = bufnr })

                    vim.keymap.set('n', '<leader>rf', function()
                        vim.cmd.RustLsp('flyCheck')
                    end, { desc = 'Fly check', buffer = bufnr })

                    vim.keymap.set('n', '<leader>ro', function()
                        vim.cmd.RustLsp('openDocs')
                    end, { desc = 'Open docs.rs', buffer = bufnr })

                    -- Move items
                    vim.keymap.set('n', '<leader>rmu', function()
                        vim.cmd.RustLsp { 'moveItem', 'up' }
                    end, { desc = 'Move item up', buffer = bufnr })

                    vim.keymap.set('n', '<leader>rmd', function()
                        vim.cmd.RustLsp { 'moveItem', 'down' }
                    end, { desc = 'Move item down', buffer = bufnr })

                    -- Re-run last commands
                    vim.keymap.set('n', '<leader>rR', function()
                        vim.cmd.RustLsp { 'runnables', bang = true }
                    end, { desc = 'Re-run last runnable', buffer = bufnr })

                    vim.keymap.set('n', '<leader>rT', function()
                        vim.cmd.RustLsp { 'testables', bang = true }
                    end, { desc = 'Re-run last testable', buffer = bufnr })

                    vim.keymap.set('n', '<leader>rDD', function()
                        vim.cmd.RustLsp { 'debuggables', bang = true }
                    end, { desc = 'Re-run last debuggable', buffer = bufnr })
                end,
                default_settings = {
                    -- rust-analyzer language server configuration
                    ['rust-analyzer'] = {
                        cargo = {
                            allFeatures = true,
                            loadOutDirsFromCheck = true,
                            buildScripts = {
                                enable = true,
                            },
                        },
                        -- Enable clippy lints for Rust
                        check = {
                            command = "clippy",
                            extraArgs = { "--all", "--", "-W", "clippy::all" },
                        },
                        procMacro = {
                            enable = true,
                            ignored = {
                                ["async-trait"] = { "async_trait" },
                                ["napi-derive"] = { "napi" },
                                ["async-recursion"] = { "async_recursion" },
                            },
                        },
                        -- Enable inlay hints
                        inlayHints = {
                            enable = true,
                            chainingHints = {
                                enable = true,
                            },
                            parameterHints = {
                                enable = true,
                            },
                            typeHints = {
                                enable = true,
                            },
                        },
                    },
                },
            },
            -- DAP configuration
            dap = {
                adapter = {
                    type = "executable",
                    command = "codelldb", -- Use your existing codelldb
                    name = "rt_lldb",
                },
            },
        }
    end,
}
