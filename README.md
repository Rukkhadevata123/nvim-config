# My Neovim Configuration

This repository contains my Neovim configuration, designed for various languages including C++, Python, Go, Rust, TypeScript, Bash, and Java (with LSP support). Below are the instructions to set it up.

## Prerequisites

Make sure you have the following tools installed:

- Neovim (version 0.5+)
- Git
- wget (for Java LSP setup)
- [Nerd Fonts](https://www.nerdfonts.com/) (for themes)

## Installation

### Step 1: Backup Existing Neovim Configuration

Before proceeding, it is recommended to backup your existing Neovim configuration:

```bash
mv ~/.config/nvim ~/.config/nvim_backup
```

### Step 2: Clone This Repository

Clone this repository directly into your Neovim configuration directory:

```bash
git clone https://github.com/Rukkhadevata123/nvim-config ~/.config/nvim
```

### Step 3: Install Plugin Manager (Packer)

To manage Neovim plugins, this configuration uses Packer. Install it with the following command:

```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
### Step 4: Install GitHub Copilot

To use GitHub Copilot, clone its Vim plugin:

```bash
git clone https://github.com/github/copilot.vim.git \
  ~/.config/nvim/pack/github/start/copilot.vim
```
Then start Vim/Neovim and invoke `:Copilot setup`

### Step 5: Install Java LSP (jdtls)

If you are developing Java applications, you'll need to install the `jdtls` (Java Development Tools Language Server) manually:

```bash
mkdir -p ~/.local/share/nvim/lsp_servers/jdtls/plugins/
wget -O ~/.local/share/nvim/lsp_servers/jdtls/jdtls.tar.gz https://download.eclipse.org/jdtls/snapshots/jdt-language-server-latest.tar.gz
cd ~/.local/share/nvim/lsp_servers/jdtls
tar -xzvf jdtls.tar.gz
rm jdtls.tar.gz
```

### Step 6: Install Other Language Servers

Make sure to install language servers for the languages you are working with. For example: 

```bash
sudo pacman -S lua-language-server bash-language-server clang pyright gopls rustup typescript-language-server rust-analyzer flake8 eslint
```
Alternatively you may use `npm` to install language servers: 

```bash
npm install -g pyright bash-language-server typescript-language-server
```

### Step 7: Install Tokyonight Theme

You should install the theme before launching `neovim` , or `:PackerSync` can't be executed.

```bash
git clone https://github.com/folke/tokyonight.nvim \
  ~/.local/share/nvim/site/pack/packer/start/tokyonight.nvim
```

### Step 8: Install Plugins and Sync Configuration

Once everything is set up, open Neovim and run the following command to install all plugins:

```bash
:PackerSync
```

## Complete Shell Script

```bash
mv ~/.config/nvim ~/.config/nvim_backup
git clone https://github.com/Rukkhadevata123/nvim-config ~/.config/nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
git clone https://github.com/github/copilot.vim.git ~/.config/nvim/pack/github/start/copilot.vim
mkdir -p ~/.local/share/nvim/lsp_servers/jdtls/plugins/
wget -O ~/.local/share/nvim/lsp_servers/jdtls/jdtls.tar.gz https://download.eclipse.org/jdtls/snapshots/jdt-language-server-latest.tar.gz
cd ~/.local/share/nvim/lsp_servers/jdtls
tar -xzvf jdtls.tar.gz
rm jdtls.tar.gz
cd
sudo pacman -S lua-language-server bash-language-server clang pyright gopls rustup typescript-language-server rust-analyzer flake8 eslint prettier
git clone https://github.com/folke/tokyonight.nvim ~/.local/share/nvim/site/pack/packer/start/tokyonight.nvim
nvim
```

