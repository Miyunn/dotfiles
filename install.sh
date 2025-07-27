#!/bin/bash

# Color codes
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

success_message() {
  echo -e "${GREEN}$1${NC}"
}

error_message() {
  echo -e "${RED}$1${NC}"
}

cat splash_art.txt

echo "Welcome to my Arch Linux setup script! Installations will begin shortly."    
echo "Check readme.md for packages" 
echo "Press any key to continue..."
read -n 1 -s

#check if the OS is arch linux 
if [ ! -f /etc/arch-release ]; then
  error_message "Error: This script is only for Arch Linux."
  exit 1
fi

cd ~/dotfiles || {
  error_message "Error: Failed to change directory to dotfiles."
  exit 1
}

# Install Plasma
echo "Setting up KDE Plasma..."
sudo pacman --noconfirm -Syu plasma && success_message "Plasma installed successfully." || error_message "Failed to install Plasma."
sudo systemctl enable sddm && success_message "SDDM enabled." || error_message "Failed to enable SDDM."

# Install required packages
echo "Installing main packages..."
sudo pacman --noconfirm -S stow mesa neovim tmux fastfetch alacritty chromium zsh git ttf-jetbrains-mono-nerd lazygit noto-fonts-cjk wl-clipboard dolphin ripgrep unzip zip zoxide && success_message "Main packages installed successfully." || {
  error_message "Error: Package installation failed. Please check your network connection or package repositories."
  exit 1
}

# Installing extra packages 
echo "Installing other packages packages..."
sudo pacman --noconfirm -S discord spotify-launcher kate krita spectacle lsp-plugins openssh  && success_message "Extra packages installed successfully." || {
error_message "Error: Package installation failed. Please check your network connection or package repositories."
}

# Symlinking dotfiles
stow alacritty && success_message "Alacritty configuration installed successfully." || error_message "Failed to copy Kitty configuration."
stow fastfetch && success_message "Fastfetch configuration installed successfully." || error_message "Failed to copy Fastfetch configuration."
stow nvim && success_message "Neovim configuration installed successfully." || error_message "Failed to copy Neovim configuration."
stow tmux && success_message "Tmux configuration installed successfully." || error_message "Failed to copy Tmux configuration."
git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier && success_message "Tmuxifier installed successfully." || error_message "Failed to install Tmuxifier."
sudo timedatectl set-local-rtc 1 && success_message "Hardware clock set as standard local time." || error_message "Failed to set hardware clock."

# Setting up yay
echo "Setting up Yay..."

# Setting up yay
echo "Setting up Yay..."
sudo pacman --noconfirm -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm && cd .. && rm -rf yay && success_message "Yay installed successfully." || error_message "Failed to install Yay."

# Removing KDE bloat 
echo "Removing unwanted packages..."
sudo pacman --noconfirm -R discover && success_message "Unwanted packages removed." || error_message "Failed to remove unwanted packages."

# ohmyzsh installation 
echo "Installing Oh My Zsh..."
RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && success_message "Oh My Zsh installed successfully." || error_message "Failed to install Oh My Zsh."

# Installing Starship prompt
echo "Installing Starship prompt..."
sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --yes && success_message "Starship installed successfully." || error_message "Failed to install Starship."

# symlinking more stuff
stow zsh --adopt --override=~  && success_message "Oh My Zsh configuration copied." || error_message "Failed to copy Oh My Zsh configuration."
stow starship 

# Installing dev packages
echo "Setting up development packages..."
sudo pacman --noconfirm -S npm && success_message "Development packages installed successfully." || error_message "Failed to install development packages."

echo ""
echo success_message "Installation complete!" 
echo "Rebbot your system to apply changes"
read -r -p "(Y/n)" reboot 
if [[ $reboot =~ ^[Yy]$ ]]; then
  sudo reboot
else
  echo "Please reboot your system to apply changes."
fi

