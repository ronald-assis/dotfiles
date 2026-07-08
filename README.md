# Dotfiles

Personal dotfiles managed with GNU Stow for clean, reproducible workstation setup on macOS.

## 1. Overview
This repository mirrors the layout of `$HOME` directly (e.g. `.zshrc`, `.tmux.conf`, `.config/nvim`), so a single `stow .` symlinks everything into place. GNU Stow makes it easy to add, remove, or update configs without copying files around.

Currently managed configs:
- **Zsh** (`.zshrc`) — Oh My Zsh + Powerlevel10k theme
- **Tmux** (`.tmux.conf`) — custom prefix (`C-a`), vim-style pane navigation/resizing, TPM-managed plugins (`vim-tmux-navigator`, `tmux-themepack`, `tmux-resurrect`, `tmux-continuum`)
- **Neovim** (`.config/nvim`) — Lua config using [lazy.nvim](https://github.com/folke/lazy.nvim), with custom modules under `lua/ronald/` (core options/keymaps, plugin specs for LSP, Telescope, Treesitter, CopilotChat, and more)

## 2. Requirements
- macOS
- Xcode Command Line Tools (for basic build utilities)  
  Install: `xcode-select --install`
- Homebrew (package manager)  
  Install: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
- GNU Stow  
  Install: `brew install stow`
- Neovim  
  Install: `brew install neovim`
- Tmux (with [TPM](https://github.com/tmux-plugins/tpm) installed at `~/.tmux/plugins/tpm`)  
  Install: `brew install tmux`
- Zsh + [Oh My Zsh](https://ohmyz.sh/) + [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
- Git

## 3. Clone Repository
    git clone https://github.com/ronald-png/dotfiles.git ~/dotfiles
    cd ~/dotfiles

## 4. Stow Configurations
To symlink the configuration files to your home directory, use GNU Stow:

    stow .

## 5. Additional Setup
- **Tmux plugins**: once `.tmux.conf` is symlinked and TPM is installed, launch tmux and press `prefix + I` to fetch plugins.
- **Neovim plugins**: open `nvim` and lazy.nvim will bootstrap itself and install plugins on first launch.
- Some applications may require additional setup steps beyond symlinking. Refer to the individual config files for specifics.

## 6. Updating Dotfiles
To update your dotfiles, pull the latest changes from the repository:

    cd ~/dotfiles
    git pull origin main
    stow .

## Warning
If the appearance looks off, install the Caskaydia Cove Nerd Fonts.
