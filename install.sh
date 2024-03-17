#!/bin/bash

# Install required packages
echo "Installing required packages..."
sudo pacman -Syu neovim neofetch alacritty zsh git|| {
  echo "Error: Package installation failed. Please check your network connection or package repositories."
  exit 1
}

# Alacritty configuration
echo "Installing Alacritty configuration..."
cp -r alacritty ~/.config || {
  echo "Error: Failed to copy Alacritty configuration."
  exit 1
}

# Neofetch configuration
echo "Installing Neofetch configuration..."
cp -r neofetch ~/.config || {
  echo "Error: Failed to copy Neofetch configuration."
  exit 1
}

# Neovim configuration prompt (Y/N)
echo "Install Default NVChad configuration (Recommended)?"
read -r -p "(Y/n) " install_nvchad

if [[ $install_nvchad =~ ^[Yy]$ ]]; then
  echo "Installing NVChad..."
  git clone https://github.com/NvChad/starter ~/.config/nvim || {
    echo "Error: Failed to clone NVChad configuration."
    exit 1
  }
else
  echo "Installing Custom Noevim configuration"
  cp -r nvim ~/.config || {
    echo "Error: Failed to copy Neovim configuration"
    exit 1
  }
fi

# ZSH configuration
# ...

echo "Installation complete!"

