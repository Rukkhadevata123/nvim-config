# My Neovim Configuration

This repository contains my Neovim configuration for C++, Python, Go, Rust, TypeScript, Bash, and Java (with LSP support). Follow the instructions below to set it up.

## Prerequisites

Ensure you have the following installed:

- Neovim (version 0.11.0+)
- Git
- [Nerd Fonts](https://www.nerdfonts.com/) (for themes)

## Installation

### Step 1: Backup Existing Neovim Configuration

Backup your current Neovim configuration:

```bash
mv ~/.config/nvim ~/.config/nvim_backup
```

### Step 2: Clone This Repository

Clone the repository into your Neovim configuration directory:

```bash
git clone https://github.com/Rukkhadevata123/nvim-config ~/.config/nvim
```

### Step 3: Install Language Servers

Install language servers for your preferred languages:

```bash
yay -S luajit-tiktoken-bin python-pip lua-language-server bash-language-server clang pyright gopls rustup typescript-language-server rust-analyzer flake8 eslint prettier delve codelldb-bin zathura-cb zathura-djvu zathura-pdf-mupdf zathura-ps zathura nodejs npm cppcheck cpplint markdownlint --needed
```

### Step 4 Complete

Just type `nvim` and all things are done automatically.

```bash
nvim
```

## Keybindings

### Core Navigation and Editing

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Normal | `<leader>nh` | `:nohl<CR>` | Clear search highlights |
| Visual | `J` | `:m '>+1<CR>gv=gv` | Move selected lines down |
| Visual | `K` | `:m '<-2<CR>gv=gv` | Move selected lines up |
| Normal | `<leader>sv` | `<C-w>v` | Split window vertically |
| Normal | `<leader>sh` | `<C-w>s` | Split window horizontally |
| Normal | `zc` | `:foldclose<CR>` | Close fold |
| Normal | `zo` | `:foldopen<CR>` | Open fold |

### Buffer Management

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Normal | `<Tab>` | `:bnext<CR>` | Next buffer |
| Normal | `<S-Tab>` | `:bprevious<CR>` | Previous buffer |

### File Explorer (nvim-tree)

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Normal | `<leader>e` | `NvimTreeToggle` | Toggle file explorer |
| Normal | `<leader>ef` | `NvimTreeFindFile` | Find current file in tree |
| Normal | `<leader>er` | `NvimTreeRefresh` | Refresh file tree |
| Normal | `<leader>ec` | `NvimTreeCollapse` | Collapse file tree |
| Normal (in tree) | `?` | `toggle_help` | Show help |
| Normal (in tree) | `<C-v>` | `open.vertical` | Open in vertical split |
| Normal (in tree) | `<C-h>` | `open.horizontal` | Open in horizontal split |

### Telescope (File Search)

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Normal | `<leader>ff` | `find_files` | Find files |
| Normal | `<leader>fg` | `live_grep` | Live grep |
| Normal | `<leader>fb` | `buffers` | Find buffers |
| Normal | `<leader>fh` | `help_tags` | Help tags |
| Normal | `<leader>fr` | `oldfiles` | Recent files |
| Normal | `<leader>fc` | `commands` | Commands |
| Normal | `<leader>fk` | `keymaps` | Show keymaps |
| Normal | `<leader>fs` | `grep_string` | Grep string under cursor |

### Git (Telescope)

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Normal | `<leader>gc` | `git_commits` | Git commits |
| Normal | `<leader>gb` | `git_branches` | Git branches |
| Normal | `<leader>gs` | `git_status` | Git status |

### LSP (Telescope)

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Normal | `<leader>lr` | `lsp_references` | LSP references |
| Normal | `<leader>ld` | `lsp_definitions` | LSP definitions |
| Normal | `<leader>ls` | `lsp_document_symbols` | Document symbols |
| Normal | `<leader>lw` | `lsp_workspace_symbols` | Workspace symbols |

### LSP Navigation and Actions

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Normal | `gd` | `vim.lsp.buf.definition` | Go to definition |
| Normal | `gr` | `vim.lsp.buf.references` | Show references |
| Normal | `K` | `vim.lsp.buf.hover` | Show hover information |
| Normal | `<leader>rn` | `vim.lsp.buf.rename` | Rename symbol |
| Normal | `<leader>ca` | `vim.lsp.buf.code_action` | Code actions |
| Normal | `<leader>fm` | `vim.lsp.buf.format` | Format code |
| Normal | `<leader>d` | `vim.diagnostic.open_float` | Show diagnostics |
| Normal | `[d` | `vim.diagnostic.goto_prev` | Previous diagnostic |
| Normal | `]d` | `vim.diagnostic.goto_next` | Next diagnostic |

### Git Signs

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Normal | `]c` | `nav_hunk('next')` | Next git hunk |
| Normal | `[c` | `nav_hunk('prev')` | Previous git hunk |
| Normal | `<leader>hs` | `stage_hunk` | Stage hunk |
| Normal | `<leader>hr` | `reset_hunk` | Reset hunk |
| Visual | `<leader>hs` | `stage_hunk` | Stage selected hunk |
| Visual | `<leader>hr` | `reset_hunk` | Reset selected hunk |
| Normal | `<leader>hS` | `stage_buffer` | Stage entire buffer |
| Normal | `<leader>hR` | `reset_buffer` | Reset entire buffer |
| Normal | `<leader>hp` | `preview_hunk` | Preview hunk |
| Normal | `<leader>hb` | `blame_line` | Show git blame |
| Normal | `<leader>hd` | `diffthis` | Diff this file |
| Normal | `<leader>tb` | `toggle_current_line_blame` | Toggle git blame line |
| Normal | `<leader>td` | `toggle_deleted` | Toggle show deleted lines |
| Object/Visual | `ih` | `select_hunk` | Select git hunk |

### Terminal (ToggleTerm)

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Normal | `<c-t>` | `ToggleTerm` | Toggle terminal |
| Normal | `<leader>tf` | `ToggleTerm direction=float` | Float terminal |
| Normal | `<leader>th` | `ToggleTerm direction=horizontal` | Horizontal terminal |
| Normal | `<leader>tv` | `ToggleTerm direction=vertical` | Vertical terminal |
| Terminal | `<esc>` | `<C-\><C-n>` | Exit terminal mode |
| Terminal | `jk` | `<C-\><C-n>` | Exit terminal mode |
| Terminal | `<C-h>` | `wincmd h` | Move to left window |
| Terminal | `<C-j>` | `wincmd j` | Move to bottom window |
| Terminal | `<C-k>` | `wincmd k` | Move to top window |
| Terminal | `<C-l>` | `wincmd l` | Move to right window |

### Debugging (DAP)

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Normal | `<F5>` | `dap.continue` | Start/Continue debugging |
| Normal | `<F10>` | `dap.step_over` | Step over |
| Normal | `<F11>` | `dap.step_into` | Step into |
| Normal | `<F12>` | `dap.step_out` | Step out |
| Normal | `<leader>b` | `dap.toggle_breakpoint` | Toggle breakpoint |
| Normal | `<leader>B` | `dap.set_breakpoint` | Set conditional breakpoint |
| Normal | `<leader>lp` | `dap.set_breakpoint` | Set log point |
| Normal | `<leader>dr` | `dap.repl.open` | Open REPL |
| Normal | `<leader>dh` | `require('dap.ui.widgets').hover` | Debug hover |
| Normal | `<leader>du` | `require('dapui').toggle` | Toggle debug UI |

### Code Completion (nvim-cmp)

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Insert | `<C-n>` | `select_next_item` | Next completion item |
| Insert | `<C-p>` | `select_prev_item` | Previous completion item |
| Insert | `<C-d>` | `scroll_docs(-4)` | Scroll docs up |
| Insert | `<C-f>` | `scroll_docs(4)` | Scroll docs down |
| Insert | `<C-Space>` | `complete()` | Trigger completion |
| Insert | `<C-e>` | `abort()` | Abort completion |
| Insert | `<CR>` | `confirm()` | Confirm selection |
| Insert | `<Tab>` | Next item/Expand snippet | Next completion or snippet |
| Insert | `<S-Tab>` | Previous item/Jump back | Previous completion or snippet |

### Comments

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Normal | `gcc` | Toggle line comment | Comment/uncomment line |
| Normal | `gbc` | Toggle block comment | Block comment toggle |
| Normal/Visual | `gc` | Line comment operator | Comment operator |
| Normal/Visual | `gb` | Block comment operator | Block comment operator |
| Normal | `gcO` | Comment above | Add comment above |
| Normal | `gco` | Comment below | Add comment below |
| Normal | `gcA` | Comment end of line | Add comment at end of line |

### Outline

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Normal | `<leader>o` | `Outline` | Toggle outline window |

### Leader Key

The leader key is set to `<Space>` (spacebar) for all leader-based keybindings.

### Notes

- `<C-x>` means Ctrl + x
- `<S-x>` means Shift + x  
- `<leader>` refers to the space key
- Some keybindings are only available when the corresponding LSP server is attached to the buffer
- Terminal keybindings only work within terminal buffers created by ToggleTerm
