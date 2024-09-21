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
})
