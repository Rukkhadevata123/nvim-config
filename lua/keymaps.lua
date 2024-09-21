-- 设置 leader 键
vim.g.mapleader = " "

-- 快捷键函数
local keymap =  vim.keymap.set

-- ---------- 插入模式 ---------- --
-- jk 快速切换到正常模式
keymap("i", "jk", "<ESC>")

-- ---------- 视觉模式 ---------- --
-- 单行或多行移动
keymap("v", "J", ":m '>+1<CR>gv=gv")  -- 向下移动选中的行
keymap("v", "K", ":m '<-2<CR>gv=gv")  -- 向上移动选中的行

-- ---------- 正常模式 ---------- --
-- 窗口管理
keymap("n", "<leader>sv", "<C-w>v") -- 垂直分屏
keymap("n", "<leader>sh", "<C-w>s") -- 水平分屏

-- 取消高亮搜索
keymap("n", "<leader>nh", ":nohl<CR>")

-- 切换 buffer
keymap("n", "<C-L>", ":bnext<CR>")    -- 切换到下一个 buffer
keymap("n", "<C-H>", ":bprevious<CR>") -- 切换到上一个 buffer

-- 折叠代码
keymap("n", "zc", ":foldclose<CR>")  -- 关闭折叠
keymap("n", "zo", ":foldopen<CR>")   -- 打开折叠

-- ---------- 插件快捷键 ---------- --
-- nvim-tree 文件浏览器
keymap("n", "<leader>e", ":NvimTreeToggle<CR>")  -- 打开或关闭文件树

-- LSP 相关
keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>")  -- 格式化代码
keymap("n", "<leader>d", "<cmd>lua vim.diagnostic.open_float()<CR>")           -- 显示诊断信息
keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")                   -- 跳转到上一个诊断
keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")                   -- 跳转到下一个诊断

-- telescope相关
local builtin = require('telescope.builtin')
keymap('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
keymap('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
keymap('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
keymap('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- local dap = require('dap')

-- -- 设置常见调试快捷键
-- keymap('n', '<F5>', dap.continue, { noremap = true, silent = true })
-- keymap('n', '<F10>', dap.step_over, { noremap = true, silent = true })
-- keymap('n', '<F11>', dap.step_into, { noremap = true, silent = true })
-- keymap('n', '<F12>', dap.step_out, { noremap = true, silent = true })
-- keymap('n', '<Leader>b', dap.toggle_breakpoint, { noremap = true, silent = true })
-- keymap('n', '<Leader>B', function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, { noremap = true, silent = true })
-- keymap('n', '<Leader>lp', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, { noremap = true, silent = true })
-- keymap('n', '<Leader>dr', dap.repl.open, { noremap = true, silent = true })
-- keymap('n', '<Leader>dr', dap.repl.open, { noremap = true, silent = true })
-- keymap('n', '<Leader>dh', function() require('dap.ui.widgets').hover() end, { noremap = true, silent = true })
-- keymap('n', '<Leader>du', function() require('dapui').toggle() end, { noremap = true, silent = true })
-- keymap('n', '<Leader>B', function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, { noremap = true, silent = true })





