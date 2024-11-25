local config = {}

require("copilot").setup({
  suggestion = { enabled = false },
  panel = { enabled = false },
})

-- require("copilot.panel").accept()
-- require("copilot.panel").jump_next()
-- require("copilot.panel").jump_prev()
-- require("copilot.panel").open({position, ratio})
-- require("copilot.panel").refresh()
-- require("copilot.suggestion").toggle_auto_trigger()

-- local cmp = require("cmp")

-- cmp.event:on("menu_opened", function()
--   vim.b.copilot_suggestion_hidden = true
-- end)

-- cmp.event:on("menu_closed", function()
--   vim.b.copilot_suggestion_hidden = false
-- end)

-- require("copilot.suggestion").is_visible()
-- require("copilot.suggestion").accept(modifier)
-- require("copilot.suggestion").accept_word()
-- require("copilot.suggestion").accept_line()
-- require("copilot.suggestion").next()
-- require("copilot.suggestion").prev()
-- require("copilot.suggestion").dismiss()
-- require("copilot.suggestion").toggle_auto_trigger()

-- Setup for CopilotChat
require("CopilotChat").setup {
  debug = false,  -- Enable debugging; set to true for verbose logging
  proxy = nil,  -- Proxy settings if needed
  allow_insecure = false,  -- Allow insecure server connections

  -- System prompt and model configuration
  system_prompt = 'Your name is Github Copilot and you are an AI assistant for developers.',
  model = 'gpt-4o',  -- Choose model: 'gpt-3.5-turbo', 'gpt-4', or 'gpt-4o'
  temperature = 0.1,  -- Controls the randomness of responses

  -- Headers and separators for chat
  question_header = '## User ',
  answer_header = '## Copilot ',
  error_header = '## Error ',
  separator = '───',

  -- Chat window options
  window = {
    layout = 'float',  -- Layout of the chat window
    relative = 'cursor',  -- Positioning relative to cursor
    width = 1,  -- Width of the window
    height = 0.4,  -- Height of the window
    title = 'Copilot Chat',  -- Title of the chat window
    border = 'single',  -- Border style
  },

  -- Mappings for various actions
  mappings = {
    complete = {
      detail = 'Use @<Tab> or /<Tab> for options.',
      insert = '<Tab>',  -- Mapping for completion in insert mode
    },
    close = {
      normal = 'q',  -- Close in normal mode
      insert = '<C-c>',  -- Close in insert mode
    },
    reset = {
      normal = '<C-l>',  -- Reset in normal mode
      insert = '<C-l>',  -- Reset in insert mode
    },
    submit_prompt = {
      normal = '<CR>',  -- Submit in normal mode
      insert = '<C-s>',  -- Submit in insert mode
    },
    accept_diff = {
      normal = '<C-y>',  -- Accept difference in normal mode
      insert = '<C-y>',  -- Accept difference in insert mode
    },
    yank_diff = {
      normal = 'gy',  -- Yank the difference
      register = '"',
    },
    show_diff = {
      normal = 'gd',  -- Show differences
    },
    show_system_prompt = {
      normal = 'gp',  -- Show system prompt
    },
    show_user_selection = {
      normal = 'gs',  -- Show user selection
    },
  },

  -- Default prompts
  prompts = {
    Explain = {
      prompt = '/COPILOT_EXPLAIN Write an explanation for the active selection as paragraphs of text.',
    },
    Review = {
      prompt = '/COPILOT_REVIEW Review the selected code.',
      callback = function(response, source)
        -- Implementation in config.lua
      end,
    },
    Fix = {
      prompt = '/COPILOT_GENERATE There is a problem in this code. Rewrite it to show the fix.',
    },
    Optimize = {
      prompt = '/COPILOT_GENERATE Optimize the selected code to improve performance and readability.',
    },
    Docs = {
      prompt = '/COPILOT_GENERATE Please add documentation comments for the selection.',
    },
    Tests = {
      prompt = '/COPILOT_GENERATE Please generate tests for my code.',
    },
    Commit = {
      prompt = 'Write a commit message for the change with commitizen convention. Title max 50 chars, wrap message at 72 chars.',
      selection = require('CopilotChat.select').gitdiff,
    },
  },

  -- History and selection configuration
  history_path = vim.fn.stdpath('data') .. '/copilotchat_history',  -- Path to stored history
  selection = function(source)
    return require('CopilotChat.select').visual(source) or require('CopilotChat.select').line(source)
  end,
}

-- Autocommand to adjust settings for Copilot Chat buffers
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = 'copilot-*',
  callback = function()
    vim.opt_local.relativenumber = true

    -- C-p to print last response
    vim.keymap.set('n', '<C-p>', function()
      print(require("CopilotChat").response())
    end, { buffer = true, remap = true })
  end
})

-- Lazy.nvim keybindings for quick chat and help actions
vim.keymap.set('n', '<leader>ccq', function()
  local input = vim.fn.input("Quick Chat: ")
  if input ~= "" then
    require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
  end
end, { desc = "CopilotChat - Quick chat" })

vim.keymap.set('n', '<leader>cch', function()
  local actions = require("CopilotChat.actions")
  require("CopilotChat.integrations.telescope").pick(actions.help_actions())
end, { desc = "CopilotChat - Help actions" })

vim.keymap.set('n', '<leader>ccp', function()
  local actions = require("CopilotChat.actions")
  require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
end, { desc = "CopilotChat - Prompt actions" })

-- Register CopilotChat source with nvim-cmp
config.chat_autocomplete = true