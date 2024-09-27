vim.opt.termguicolors = true

require("bufferline").setup {
    options = {
        diagnostics = "nvim_lsp", -- Use built-in LSP for diagnostics
        diagnostics_indicator = function(count, level)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
        end,
        offsets = {{
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left"
        }},
        show_buffer_icons = true,        -- Show buffer file icons
        show_buffer_close_icons = true,  -- Show buffer close icons
        show_close_icon = false,         -- Hide close window icon
        show_tab_indicators = true,      -- Show tab indicators
        separator_style = "slant",       -- Separator style: "slant", "thick", "thin"
        max_name_length = 18,            -- Max buffer name length
        max_prefix_length = 15,          -- Max prefix length
        tab_size = 18,                   -- Tab size
        enforce_regular_tabs = true,     -- Enforce regular tabs
        always_show_bufferline = true,   -- Always show bufferline

        custom_filter = function(buf_number)
            -- Filter out unreadable buffers
            return vim.bo[buf_number].filetype ~= "dashboard"
        end,

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
                guibg = '#282c34', -- Ensure background color matches
            },
            separator = {
                guifg = '#282c34', -- Ensure consistent colors
                guibg = '#282c34',
            },
        },
    }
}
