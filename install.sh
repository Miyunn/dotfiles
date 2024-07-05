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

echo "Welcome to my custom Arch Linux dot files installation script for KDE Plasma(You can skip Plasma installation if you want)."    
echo "Check readme.md for packages" 
echo "Press any key to continue..."
read -n 1 -s

#check if the OS is arch linux 
if [ ! -f /etc/arch-release ]; then
  error_message "Error: This script is only for Arch Linux."
  exit 1
fi

echo ""

# Plasma installation prompt 
echo "Install KDE Plasma"
read -r -p "(Y/n) " install_plasma

echo ""
# Neovim configuration prompt 
echo "Install Neovim configs?"
read -r -p "(Y/n) " install_nvim

echo ""
# Tmux installations and config prompt
echo "Do you want to install tmux and configs?"
read -r -p "(Y/n)" install_tmux

echo ""
# Extra packages prompt 
echo "Install extra packages?"
read -r -p "(Y/n) " install_optional

echo ""
echo "Do you want to set the hardware clock as local time?"
read -r -p "(Y/n) " set_hwclock 

echo ""
echo "Reboot after installation?"
read -r -p "(Y/n) " reboot 

# Install Plasma
if [[ $install_plasma =~ ^[Yy]$ ]]; then
  echo "Installing plasma..."
  sudo pacman --noconfirm -Syu plasma && success_message "Plasma installed successfully." || error_message "Failed to install Plasma."
else
  echo "Skipping installing Plasma."
fi

# Install required packages
echo "Installing required packages..."
sudo pacman --noconfirm -S stow neovim neofetch alacritty chromium zsh git ttf-jetbrains-mono-nerd noto-fonts-cjk wl-clipboard dolphin ripgrep unzip zip && success_message "Required packages installed successfully." || {
  error_message "Error: Package installation failed. Please check your network connection or package repositories."
  exit 1
}

# Installing extra packages 
echo "Installing extra packages..."
if [[ $install_optional =~ ^[Yy]$ ]]; then
  sudo pacman --noconfirm -Syu discord spotify-launcher kate spectacle easyeffects lsp-plugins && success_message "Extra packages installed successfully." || {
  error_message "Error: Package installation failed. Please check your network connection or package repositories."
}
fi

# Alacritty configuration
cp -r alacritty ~/.config && success_message "Alacritty configuration installed successfully." || error_message "Failed to copy Alacritty configuration."

# Kitty config
stow kitty && success_message "Kitty configuration installed successfully." || error_message "Failed to copy Kitty configuration."

# Neofetch configuration
cp -r neofetch ~/.config && success_message "Neofetch configuration installed successfully." || error_message "Failed to copy Neofetch configuration."

# Neovim configuration installation
if [[ $install_nvim =~ ^[Yy]$ ]]; then
  cp -r nvim ~/.config && success_message "Neovim configuration installed successfully." || error_message "Failed to copy Neovim configuration."
fi

# Set hardware clock as local time 
if [[ $set_hwclock =~ ^[Yy]$ ]]; then
  sudo timedatectl set-local-rtc 1 && success_message "Hardware clock set as standard local time." || error_message "Failed to set hardware clock."
fi

# Installing TPM (temux plugin manager)
if [[ $install_tmux =~ ^[Yy]$ ]]; then
  sudo pacman --noconfirm -Syu tmux  && success_message "Installed tmux"

  #tmux symlinks
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Removing unwanted packages
sudo pacman --noconfirm -R discover && success_message "Unwanted packages removed." || error_message "Failed to remove unwanted packages."

# ohmyzsh installation 
echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && success_message "Oh My Zsh installed successfully." || error_message "Failed to install Oh My Zsh."

# ohmyzsh config
cp ohmyzsh/.zshrc ~ && success_message "Oh My Zsh configuration copied." || error_message "Failed to copy Oh My Zsh configuration."

sudo systemctl enable sddm && success_message "SDDM enabled." || error_message "Failed to enable SDDM."

# Reboot prompt
if [[ $reboot =~ ^[Yy]$ ]]; then
  reboot 
fi
