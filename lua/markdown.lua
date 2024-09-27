-- markdown.lua

-- Automatically start the preview window upon entering a Markdown buffer
vim.g.mkdp_auto_start = 0

-- Automatically close the preview window when switching buffers
vim.g.mkdp_auto_close = 1

-- Refresh Markdown preview when saving or leaving insert mode
vim.g.mkdp_refresh_slow = 0

-- Allow MarkdownPreview command to be used globally
vim.g.mkdp_command_for_global = 0

-- Make the preview server accessible over the network
vim.g.mkdp_open_to_the_world = 0

-- Specify custom IP for previewing, useful for remote setups
vim.g.mkdp_open_ip = ''

-- Specify the browser for opening the preview page
vim.g.mkdp_browser = ''

-- Echo the preview page URL in the command line
vim.g.mkdp_echo_preview_url = 0

-- Custom function for opening the preview page
vim.g.mkdp_browserfunc = ''

-- Options for Markdown rendering
vim.g.mkdp_preview_options = {
    mkit = {},
    katex = {},
    uml = {},
    maid = {},
    disable_sync_scroll = 0,
    sync_scroll_type = 'middle',
    hide_yaml_meta = 1,
    sequence_diagrams = {},
    flowchart_diagrams = {},
    content_editable = false,
    disable_filename = 0,
    toc = {}
}

-- Use custom styles for Markdown and highlight (absolute paths)
vim.g.mkdp_markdown_css = ''
vim.g.mkdp_highlight_css = ''

-- Specify a custom port for the server or leave empty for random
vim.g.mkdp_port = ''

-- Preview page title template
vim.g.mkdp_page_title = '「${name}」'

-- Custom location for images
vim.g.mkdp_images_path = '/home/user/.markdown_images'

-- Recognized filetypes for the plugin
vim.g.mkdp_filetypes = {'markdown'}

-- Set the default theme for the preview (dark or light)
vim.g.mkdp_theme = 'dark'

-- Combine preview window setting
vim.g.mkdp_combine_preview = 0

-- Auto refetch combined preview contents when changing Markdown buffer
vim.g.mkdp_combine_preview_auto_refresh = 1

-- Key mappings for the preview commands
vim.api.nvim_set_keymap('n', '<C-s>', '<Plug>MarkdownPreview', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-s>', '<Plug>MarkdownPreviewStop', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-p>', '<Plug>MarkdownPreviewToggle', { noremap = true, silent = true })


