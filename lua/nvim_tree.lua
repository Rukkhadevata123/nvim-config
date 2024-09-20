-- nvim-tree 配置
require'nvim-tree'.setup {
  disable_netrw       = true,  -- 禁用 netrw
  hijack_netrw        = true,  -- 接管 netrw 的功能
  open_on_tab         = false, -- 在新标签页中打开时不自动打开 nvim-tree
  hijack_cursor       = false, -- 不劫持光标
  update_cwd          = true,  -- 更新当前工作目录
  update_focused_file = {
    enable      = true,        -- 启用文件聚焦更新
    update_cwd  = true,        -- 更新当前工作目录
    ignore_list = {}           -- 忽略的文件列表
  },
  system_open = {
    cmd  = nil,                -- 系统打开命令
    args = {}                  -- 系统打开命令的参数
  },
  view = {
    width = 30,                -- 侧边栏宽度
    side = 'left',             -- 侧边栏位置
  },
  filters = {
    dotfiles = false,          -- 显示隐藏文件
    custom = {}                -- 自定义过滤器
  },
  git = {
    enable = true,             -- 启用 Git 集成
    ignore = false,            -- 显示 Git 忽略的文件
    timeout = 500,             -- Git 命令超时时间
  },
  actions = {
    open_file = {
      quit_on_open = false,    -- 打开文件时不关闭 nvim-tree
    },
  },
}
