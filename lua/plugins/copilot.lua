return {
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            { "zbirenbaum/copilot.lua" },                   -- or github/copilot.vim
            { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
        },
        build = "make tiktoken",                            -- Only on MacOS or Linux
        config = function()
            require("copilot").setup({
                suggestion = { enabled = true },
                panel = { enabled = true },
            })
            require("CopilotChat").setup({
                model = 'claude-sonnet-4',
                -- Chat window options
                window = {
                    layout = 'float', -- Layout of the chat window
                    relative = 'cursor', -- Positioning relative to cursor
                    width = 1, -- Width of the window
                    height = 0.4, -- Height of the window
                    title = 'Copilot Chat', -- Title of the chat window
                    border = 'single', -- Border style
                },
                mappings = {
                    complete = {
                        insert = '<Tab>',
                    },
                    close = {
                        normal = 'q',
                        insert = '<C-c>',
                    },
                    reset = {
                        normal = '<C-l>',
                        insert = '<C-l>',
                    },
                    submit_prompt = {
                        normal = '<CR>',
                        insert = '<C-s>',
                    },
                    toggle_sticky = {
                        normal = 'grr',
                    },
                    clear_stickies = {
                        normal = 'grx',
                    },
                    accept_diff = {
                        normal = '<C-y>',
                        insert = '<C-y>',
                    },
                    jump_to_diff = {
                        normal = 'gj',
                    },
                    quickfix_answers = {
                        normal = 'gqa',
                    },
                    quickfix_diffs = {
                        normal = 'gqd',
                    },
                    yank_diff = {
                        normal = 'gy',
                        register = '"', -- Default register to use for yanking
                    },
                    show_diff = {
                        normal = 'gd',
                        full_diff = false, -- Show full diff instead of unified diff when showing diff window
                    },
                    show_info = {
                        normal = 'gi',
                    },
                    show_context = {
                        normal = 'gc',
                    },
                    show_help = {
                        normal = 'gh',
                    },
                },
            })
        end,
        -- See Commands section for default commands if you want to lazy load on them
    },
}
