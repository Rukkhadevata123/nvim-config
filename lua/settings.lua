-- 基础设置
vim.opt.compatible = false
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.mouse = "a"
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.number = true
vim.opt.wildmode = { "longest", "list" }
vim.opt.clipboard = "unnamedplus"
vim.opt.ttyfast = true
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false

-- 启用插件和语法高亮
vim.cmd("filetype plugin indent on")
vim.cmd("syntax on")

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
