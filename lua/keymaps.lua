-- 快捷键绑定
vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'zc', ':foldclose<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'zo', ':foldopen<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
