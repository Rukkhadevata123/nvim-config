return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = function(_, opts)
        vim.keymap.set('n', '<Tab>', ':bnext<CR>', { desc = 'Next buffer', silent = true })
        vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', { desc = 'Previous buffer', silent = true })
    end,
}
