# Dotfiles

Personal dotfiles managed with GNU Stow for clean, reproducible workstation setup on macOS.

## 1. Overview
These dotfiles are organized into per\-application (or per\-tool) directories. Each directory contains the configuration files laid out exactly as they should appear in `$HOME`. GNU Stow creates symlinks, allowing easy addition, removal, or update of configs.

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
- Git

## 3. Clone Repository
    git clone https://github.com/ronald-png/dotfiles.git ~/dotfiles
    cd ~/dotfiles

## 4. Stow Configurations
To symlink the configuration files to your home directory, use GNU Stow. For example,

    stow .

## 5. Additional Setup
Some applications may require additional setup steps. Refer to the individual directories for specific instructions.


## 6. Updating Dotfiles
To update your dotfiles, pull the latest changes from the repository:       
    cd ~/dotfiles
    git pull origin main
    stow .


## Warning
If the appearance looks off, install the Caskaydia Cove Nerd Fonts.