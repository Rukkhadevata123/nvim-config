# My Neovim Configuration

> This repository also has a `zsh` config, you can use it as you wish.

This repository contains my Neovim configuration for C++, Python, Go, Rust, TypeScript, Bash, and Java (with LSP support). Follow the instructions below to set it up.

## Prerequisites

Ensure you have the following installed:

- Neovim (version 0.9.5+)
- Git
- wget (for Java LSP setup)
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

### Step 3: Install Plugin Manager (Packer)

Install Packer for managing plugins:

```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

### Step 4: Install Java LSP and Debugger

For Java development, install `jdtls` and the Java Debugger:

```bash
mkdir -p ~/.local/share/nvim/lsp_servers/jdtls/plugins/
wget -O ~/.local/share/nvim/lsp_servers/jdtls/jdtls.tar.gz https://download.eclipse.org/jdtls/snapshots/jdt-language-server-latest.tar.gz
cd ~/.local/share/nvim/lsp_servers/jdtls
tar -xzvf jdtls.tar.gz
rm jdtls.tar.gz

git clone https://github.com/microsoft/java-debug ~/.local/share/nvim/lsp_servers/java-debug
cd ~/.local/share/nvim/lsp_servers/java-debug/
./mvnw clean install
```

### Step 5: Install Other Language Servers

Install language servers for your preferred languages:

```bash
yay -S luajit-tiktoken-bin python-pip lua-language-server bash-language-server clang pyright gopls rustup typescript-language-server rust-analyzer flake8 eslint prettier delve codelldb-bin zathura-cb zathura-djvu zathura-pdf-mupdf zathura-ps zathura nodejs npm --needed
```
Or use npm for some:

```bash
sudo npm install -g pyright bash-language-server typescript-language-server
```

### Step 6: Install Tokyonight Theme

Install the Tokyonight theme:

```bash
git clone https://github.com/folke/tokyonight.nvim \
  ~/.local/share/nvim/site/pack/packer/start/tokyonight.nvim
```

### Step 7: Install Python Formatter and Debugger

Set up Python formatting with black and install debugpy:

```bash
mkdir -p ~/.local/venv && cd ~/.local/venv
python3 -m venv nvim
cd nvim
. ./bin/activate
pip install pynvim black
cd ~/.local/venv
python -m venv debugpy
debugpy/bin/python -m pip install debugpy
```

### Step 8: Install Plugins and Sync Configuration

Open Neovim and run:

```bash
:PackerSync
```

## Complete Shell Script

```bash
mv ~/.config/nvim ~/.config/nvim_backup
git clone https://github.com/Rukkhadevata123/nvim-config ~/.config/nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
mkdir -p ~/.local/share/nvim/lsp_servers/jdtls/plugins/
wget -O ~/.local/share/nvim/lsp_servers/jdtls/jdtls.tar.gz https://download.eclipse.org/jdtls/snapshots/jdt-language-server-latest.tar.gz
cd ~/.local/share/nvim/lsp_servers/jdtls
tar -xzvf jdtls.tar.gz
rm jdtls.tar.gz
git clone https://github.com/microsoft/java-debug ~/.local/share/nvim/lsp_servers/java-debug
cd ~/.local/share/nvim/lsp_servers/java-debug/
./mvnw clean install
cd
mkdir -p ~/.local/venv && cd ~/.local/venv
python3 -m venv nvim
cd nvim
. ./bin/activate
pip install pynvim black
cd ~/.local/venv
python -m venv debugpy
debugpy/bin/python -m pip install debugpy
cd
yay -S luajit-tiktoken-bin python-pip lua-language-server bash-language-server clang pyright gopls rustup typescript-language-server rust-analyzer flake8 eslint prettier delve codelldb-bin zathura-cb zathura-djvu zathura-pdf-mupdf zathura-ps zathura nodejs npm --needed
git clone https://github.com/folke/tokyonight.nvim ~/.local/share/nvim/site/pack/packer/start/tokyonight.nvim
nvim
```

