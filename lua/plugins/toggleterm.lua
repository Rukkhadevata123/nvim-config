return {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = function(_, opts)
        function _G.set_terminal_keymaps()
            local opts = { buffer = 0 }
            vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
            vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
            vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
            vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
            vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
            vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
        end

        vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')

        local keymap = vim.keymap.set

        keymap('n', '<c-t>', '<cmd>ToggleTerm<CR>', { desc = 'Toggle terminal' })
        keymap('n', '<leader>tf', '<cmd>ToggleTerm direction=float<CR>', { desc = 'Float terminal' })
        keymap('n', '<leader>th', '<cmd>ToggleTerm direction=horizontal<CR>', { desc = 'Horizontal terminal' })
        keymap('n', '<leader>tv', '<cmd>ToggleTerm direction=vertical size=80<CR>', { desc = 'Vertical terminal' })
    end,
}
