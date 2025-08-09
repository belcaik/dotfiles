I currently use Arch Linux as my main operating system. This repository contains my personal dotfiles and Wayland rice. Feel free to use them as you like.

## Tools & Programs

| Tool | Role | Notes |
|------|------|-------|
| [Hyprland](https://hyprland.org) | Wayland compositor/WM | Config: `config/.config/hypr` (hyprland, hyprlock, hyprpaper)
| [Waybar](https://github.com/Alexays/Waybar) | Status bar | Config: `config/.config/waybar`
| [eww](https://elkowar.github.io/eww/) | Widgets | Config: `config/.config/eww`
| [wlogout](https://github.com/ArtsyMacaw/wlogout) | Logout menu | Config: `config/.config/wlogout`
| [kitty](https://sw.kovidgoyal.net/kitty) | Terminal | Config: `config/.config/kitty`
| [zsh](https://www.zsh.org) + [Oh‑My‑Zsh](https://ohmyz.sh) | Shell | Main file: `zsh/.zshrc`
| [Neovim](https://neovim.io) | Editor | If used, link under `~/.config/nvim`
| [paru](https://github.com/Morganamilo/paru) | AUR helper | Package management
| [fnm](https://github.com/Schniz/fnm) | Node.js manager | Optional
| [pyenv](https://github.com/pyenv/pyenv) | Python manager | Optional
| [espanso](https://espanso.org) | Text expander | Optional
| GTK (gtk-3.0) / [qt5ct](https://qt5ct.sourceforge.io/) | Theming | Config: `config/.config/gtk-3.0`, `config/.config/qt5ct`

## Setup

- Preview links: `stow -nvt ~ zsh config`
- Apply links: `stow -vt ~ zsh` and `stow -vt ~ config`
- Check status: `bash scripts/check-config.sh`

## Installation (Arch)

Install core packages from official repos:

```bash
sudo pacman -S --needed hyprland hyprpaper hyprlock waybar wlogout kitty zsh neovim stow pyenv qt5ct gtk3
```

Install AUR packages with paru (optional tools):

```bash
# If you need paru:
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/paru.git
cd paru && makepkg -si && cd ..

# AUR-managed tools
paru -S --needed eww-wayland espanso-bin fnm-bin
```
