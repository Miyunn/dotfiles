# Miyuun Dot Files

## Compatibility

- **Arch Linux** (for installation scripts)

## Disclaimer

The primary purpose of this repository is to serve as a personal archive for my dotfiles. While others are welcome to explore or reuse them, distribution is not a priority. As such, the installation scripts are not thoroughly tested, and the configurations are primarily tailored for my setup. They may work on other distributions or desktop environments, but some adjustments might be necessary

## Installation

Clone the repository:

```sh
git clone https://github.com/Miyunn/dotfiles.git ~/dotfiles
```

Run `install.sh` in the dotfiles directory:

```sh
cd ~/dotfiles && ./install.sh
```

Not all the packages but a list to just give you an idea

## Packages

Not a complete list, just a little taste of what’s in my setup

- Alacritty (terminal emulator)
- KDE Plasma (desktop environment)
- neovim
- neofetch
- noto-fonts-cjk
- tff-jetbrains-mono-nerd
- Ripgrep
- Stow (symlink manager)
- wl-clipboard
- Yay (AUR helper)
- Tmux
- zip and unzip
- zsh(Oh My Zsh)
- Chromium
- Discord
- Spotify (spotify-launcher)
- Spectacle
- VLC
- OBS

## Updating

- To update the dotfiles you can run `git pull` in the dotfiles directory
- To update the packages you can run `yay -Syu` or `sudo pacman -Syu`
