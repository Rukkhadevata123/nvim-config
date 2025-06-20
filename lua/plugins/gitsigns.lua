return {
    "lewis6991/gitsigns.nvim",
    opts = function(_, opts)
        return {
            on_attach = function(bufnr)
                local gitsigns = require('gitsigns')

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                -- Navigation
                map('n', ']c', function()
                    if vim.wo.diff then
                        vim.cmd.normal({ ']c', bang = true })
                    else
                        gitsigns.nav_hunk('next')
                    end
                end, { desc = 'Next git hunk' })

                map('n', '[c', function()
                    if vim.wo.diff then
                        vim.cmd.normal({ '[c', bang = true })
                    else
                        gitsigns.nav_hunk('prev')
                    end
                end, { desc = 'Previous git hunk' })

                -- Actions
                map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'Stage hunk' })
                map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'Reset hunk' })
                map('v', '<leader>hs', function()
                    gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
                end, { desc = 'Stage selected hunk' })
                map('v', '<leader>hr', function()
                    gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
                end, { desc = 'Reset selected hunk' })

                map('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'Stage entire buffer' })
                map('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'Reset entire buffer' })
                map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'Preview hunk' })
                map('n', '<leader>hb', function()
                    gitsigns.blame_line({ full = true })
                end, { desc = 'Show git blame' })
                map('n', '<leader>hd', gitsigns.diffthis, { desc = 'Diff this file' })

                -- Toggles
                map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = 'Toggle git blame line' })
                map('n', '<leader>td', gitsigns.toggle_deleted, { desc = 'Toggle show deleted lines' })

                -- Text object
                map({ 'o', 'x' }, 'ih', gitsigns.select_hunk, { desc = 'Select git hunk' })
            end
        }
    end,
}
