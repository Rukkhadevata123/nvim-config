-- Set terminal colors to match the Neovim theme
vim.opt.termguicolors = true

-- Keymaps to toggle terminal windows
vim.api.nvim_create_autocmd("TermEnter", {
    pattern = "term://*toggleterm#*",
    command = [[tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>]],
})

-- Key mappings to open specific terminal windows with counts
vim.keymap.set('n', '<c-t>', '<Cmd>exe v:count1 . "ToggleTerm"<CR>', { silent = true })
vim.keymap.set('i', '<c-t>', '<Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>', { silent = true })

-- ToggleTerm setup
require("toggleterm").setup({
    size = function(term)
        if term.direction == "horizontal" then
            return 15
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
        end
    end,
    open_mapping = [[<c-\>]], -- Mapping to open a terminal
    hide_numbers = true,      -- Hide line numbers in terminal buffers
    shade_terminals = true,   -- Apply shading to terminal windows
    shading_factor = 2,       -- Shading factor for terminals
    start_in_insert = false,   -- Start terminal in insert mode
    insert_mappings = true,   -- Apply terminal open mappings in insert mode
    terminal_mappings = true, -- Apply terminal open mappings in terminal mode
    persist_size = true,      -- Remember terminal window sizes
    direction = 'horizontal', -- Default direction of terminals (can be 'vertical', 'float', 'tab')
    close_on_exit = true,     -- Close terminal window on process exit
    shell = vim.o.shell,      -- Use default shell
    auto_scroll = true,       -- Auto scroll terminal output to bottom
    float_opts = {
        border = 'curved',    -- Border style for floating terminals
        winblend = 3,         -- Window transparency for floating terminals
    },
    winbar = {
        enabled = false,      -- Disable winbar for terminals
        name_formatter = function(term) return term.name end, -- Format terminal name in winbar
    },
    highlights = {
        -- Setting background for normal terminal
        Normal = { guibg = "#1e222a" }, -- Dark background to blend well with popular themes like "tokyonight" or "gruvbox"
        NormalFloat = { link = 'Normal' }, -- Link to Normal to keep consistency
        FloatBorder = {
            guifg = "#61afef",  -- Light blue border, matching a common accent color in themes like "tokyonight"
            guibg = "#1e222a",  -- Match background to the terminal's Normal background
        },
    },
})

-- Open a horizontal terminal with specific size and location
-- vim.cmd([[ToggleTerm size=10 dir=~ direction=horizontal name=home]])

-- Keymap to send selected lines to terminal
local trim_spaces = true
vim.keymap.set("v", "<space>s", function()
    require("toggleterm").send_lines_to_terminal("single_line", trim_spaces, { args = vim.v.count })
end)

-- Send text selected by motion to terminal
vim.keymap.set("n", [[<leader><c-\>]], function()
    set_opfunc(function(motion_type)
        require("toggleterm").send_lines_to_terminal(motion_type, false, { args = vim.v.count })
    end)
    vim.api.nvim_feedkeys("g@", "n", false)
end)

-- Double mapping to send current line to terminal
vim.keymap.set("n", [[<leader><c-\><c-\>]], function()
    set_opfunc(function(motion_type)
        require("toggleterm").send_lines_to_terminal(motion_type, false, { args = vim.v.count })
    end)
    vim.api.nvim_feedkeys("g@_", "n", false)
end)

-- Send the entire file to the terminal
vim.keymap.set("n", [[<leader><leader><c-\>]], function()
    set_opfunc(function(motion_type)
        require("toggleterm").send_lines_to_terminal(motion_type, false, { args = vim.v.count })
    end)
    vim.api.nvim_feedkeys("ggg@G''", "n", false)
end)
