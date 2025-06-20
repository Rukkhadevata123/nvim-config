return {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio", "folke/lazydev.nvim" },
    config = function()
        require("lazydev").setup({
            library = { "nvim-dap-ui" },
        })
        local dap = require('dap')
        local dapui = require('dapui')
        dapui.setup({
            icons = { expanded = "▾", collapsed = "▸" },
            mappings = {
                expand = { "<CR>", "<2-LeftMouse>" },
                open = "o",
                remove = "d",
                edit = "e",
                repl = "r",
                toggle = "t",
            },
        })

        dap.adapters.codelldb = {
            type = "executable",
            command = "codelldb", -- or if not in $PATH: "/absolute/path/to/codelldb"

        }
        dap.configurations.cpp = {
            {
                name = "Launch file",
                type = "codelldb",
                request = "launch",
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
            },
        }
        dap.configurations.c = dap.configurations.cpp
        dap.configurations.rust = dap.configurations.cpp
        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        vim.keymap.set('n', '<F5>', dap.continue, { noremap = true, silent = true })
        vim.keymap.set('n', '<F10>', dap.step_over, { noremap = true, silent = true })
        vim.keymap.set('n', '<F11>', dap.step_into, { noremap = true, silent = true })
        vim.keymap.set('n', '<F12>', dap.step_out, { noremap = true, silent = true })
        vim.keymap.set('n', '<Leader>b', dap.toggle_breakpoint, { noremap = true, silent = true })
        vim.keymap.set('n', '<Leader>B', function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end,
            { noremap = true, silent = true })
        vim.keymap.set('n', '<Leader>lp',
            function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end,
            { noremap = true, silent = true })
        vim.keymap.set('n', '<Leader>dr', dap.repl.open, { noremap = true, silent = true })
        vim.keymap.set('n', '<Leader>dh', function() require('dap.ui.widgets').hover() end,
            { noremap = true, silent = true })
        vim.keymap.set('n', '<Leader>du', function() require('dapui').toggle() end, { noremap = true, silent = true })
    end
}
