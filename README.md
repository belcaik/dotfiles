# DOTFILES COLLECTION

Arch Linux (Wayland/Hyprland) dotfiles. Use at your own pace and adapt as needed.

## Quick Start

Clone to `~/.dotfiles` (or your preferred path), then preview and apply symlinks with GNU Stow from the repo root:

```bash
stow -nvt ~ zsh config   # dry-run preview
stow -vt ~ zsh config    # apply
```

Check your current running configuration and links:

```bash
bash scripts/check-config.sh
```

See `docs/linux/README.MD` for the full list of tools/programs and Arch installation commands (`pacman`/`paru`).

Made with ❤️ by [belcaik](https://github.com/belcaik)
