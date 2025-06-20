return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-ui-select.nvim',
    },
    config = function()
        local telescope = require('telescope')
        local builtin = require('telescope.builtin')

        telescope.setup({
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown()
                }
            }
        })

        telescope.load_extension("ui-select")

        local keymap = vim.keymap.set

        keymap('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
        keymap('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep' })
        keymap('n', '<leader>fb', builtin.buffers, { desc = 'Find buffers' })
        keymap('n', '<leader>fh', builtin.help_tags, { desc = 'Help tags' })

        keymap('n', '<leader>fr', builtin.oldfiles, { desc = 'Recent files' })
        keymap('n', '<leader>fc', builtin.commands, { desc = 'Commands' })
        keymap('n', '<leader>fk', builtin.keymaps, { desc = 'Keymaps' })
        keymap('n', '<leader>fs', builtin.grep_string, { desc = 'Grep string under cursor' })

        keymap('n', '<leader>gc', builtin.git_commits, { desc = 'Git commits' })
        keymap('n', '<leader>gb', builtin.git_branches, { desc = 'Git branches' })
        keymap('n', '<leader>gs', builtin.git_status, { desc = 'Git status' })

        keymap('n', '<leader>lr', builtin.lsp_references, { desc = 'LSP references' })
        keymap('n', '<leader>ld', builtin.lsp_definitions, { desc = 'LSP definitions' })
        keymap('n', '<leader>ls', builtin.lsp_document_symbols, { desc = 'Document symbols' })
        keymap('n', '<leader>lw', builtin.lsp_workspace_symbols, { desc = 'Workspace symbols' })
    end,
}
