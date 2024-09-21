require('lualine').setup({
  options = {
    theme = 'tokyonight',      -- 主题设置
    component_separators = '|', -- 组件之间的分隔符
    section_separators = '',    -- 分区之间的分隔符（这里设置为空）
    icons_enabled = true,       -- 是否启用图标
    disabled_filetypes = {      -- 禁用特定文件类型的 lualine
      'NvimTree',
      'packer',
    },
    always_divide_middle = true -- 总是将状态栏分成左右两部分
  },
  sections = {
    lualine_a = {'mode'},       -- 显示当前模式
    lualine_b = {'branch', 'diff', 'diagnostics'}, -- 显示 Git 分支、差异和诊断信息
    lualine_c = {'filename'},   -- 显示文件名
    lualine_x = {'encoding', 'fileformat', 'filetype'}, -- 显示文件编码、格式和类型
    lualine_y = {'progress'},   -- 显示进度
    lualine_z = {'location'}    -- 显示光标位置
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},                 -- 配置标签栏
  extensions = {'fugitive'}     -- 启用扩展，如 fugitive
})