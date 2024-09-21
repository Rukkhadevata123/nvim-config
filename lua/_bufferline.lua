vim.opt.termguicolors = true

require("bufferline").setup {
    options = {
        -- 使用 nvim 内置 LSP 显示诊断信息
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
        end,

        -- 为 nvim-tree 让出左侧的空间，并加上文件管理器的标题
        offsets = {{
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left"
        }},

        -- 通过缩略名展示文件路径，显示buffer编号
        show_buffer_icons = true,        -- 显示缓冲区文件图标
        show_buffer_close_icons = true,  -- 显示缓冲区关闭图标
        show_close_icon = false,         -- 显示窗口关闭图标
        show_tab_indicators = true,      -- 显示Tab页指示器
        separator_style = "slant",       -- 设置分隔符样式，可选 "slant", "thick", "thin"

        -- 最大显示的 buffer 数量
        max_name_length = 18,
        max_prefix_length = 15,
        tab_size = 18,

        -- 修改不同缓冲区状态的外观
        enforce_regular_tabs = true,
        always_show_bufferline = true,

        -- 自定义键盘映射快捷键
        custom_filter = function(buf_number)
            -- 过滤掉不可读的 buffer
            if vim.bo[buf_number].filetype ~= "dashboard" then
                return true
            end
        end,

        -- 使用颜色来区分活跃的 buffer
        highlights = {
            fill = {
                guifg = '#abb2bf',
                guibg = '#282c34',
            },
            background = {
                guifg = '#abb2bf',
                guibg = '#282c34',
            },
            buffer_selected = {
                guifg = '#61afef',
                guibg = '#282c34',
                gui = "bold",
            },
            separator_selected = {
                guifg = '#61afef',
            },
        }
    }
}
