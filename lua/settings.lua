-- 基础设置
local opt = vim.opt

-- 禁用兼容模式
opt.compatible = false

-- 匹配、搜索和鼠标
opt.showmatch = true              -- 匹配括号
opt.ignorecase = true             -- 忽略大小写
opt.smartcase = true              -- 智能大小写
opt.hlsearch = true               -- 高亮搜索
opt.incsearch = true              -- 增量搜索
opt.mouse = "a"                   -- 启用鼠标支持

-- 缩进设置
opt.tabstop = 4                   -- Tab 宽度为 4 个空格
opt.softtabstop = 4               -- 插入模式下 Tab 键的宽度
opt.shiftwidth = 4                -- 自动缩进时每一级的宽度
opt.expandtab = true              -- 将 Tab 转换为空格
opt.autoindent = true             -- 自动缩进

-- 行号
opt.number = true                 -- 显示行号
opt.relativenumber = true         -- 相对行号

-- 窗口拆分
opt.splitright = true             -- 垂直分屏时，新窗口在右侧
opt.splitbelow = true             -- 水平分屏时，新窗口在下方

-- 代码折叠
opt.foldmethod = 'expr'           -- 使用表达式折叠
opt.foldexpr = 'nvim_treesitter#foldexpr()'  -- 使用 Treesitter 进行折叠
opt.foldenable = false            -- 默认不折叠

-- 系统剪贴板
opt.clipboard = "unnamedplus"     -- 使用系统剪贴板

-- 光标行高亮
opt.cursorline = true             -- 高亮光标所在行

-- 防止文本换行
opt.wrap = false                  -- 禁用自动换行

-- 设置终端支持 true colors
opt.termguicolors = true          -- 启用 24-bit 颜色支持
opt.signcolumn = "yes"            -- 始终显示符号列

-- 启用文件类型插件和缩进
vim.cmd("filetype plugin indent on")

-- 设置配色方案
vim.cmd[[colorscheme tokyonight-moon]]

-- 禁用背景高亮
vim.cmd [[
  hi NonText ctermbg=NONE guibg=NONE
  hi Normal guibg=NONE ctermbg=NONE
  hi NormalNC guibg=NONE ctermbg=NONE
  hi SignColumn ctermbg=NONE ctermfg=NONE guibg=NONE
  hi Pmenu ctermbg=NONE ctermfg=NONE guibg=NONE
  hi FloatBorder ctermbg=NONE ctermfg=NONE guibg=NONE
  hi NormalFloat ctermbg=NONE ctermfg=NONE guibg=NONE
  hi TabLine ctermbg=NONE ctermfg=NONE guibg=NONE
]]

-- 在退出时自动更新插件
vim.cmd [[
  augroup PackerSyncOnExit
    autocmd!
    autocmd VimLeavePre * lua require('packer').sync()
  augroup END
]]
