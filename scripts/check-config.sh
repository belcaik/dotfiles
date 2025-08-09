#!/usr/bin/env bash
set -euo pipefail

# Dotfiles Configuration Checker (Linux/Wayland focus)
# Usage: bash scripts/check-config.sh

REPO_ROOT=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd -P)

pass=0; fail=0
ok() { printf "[OK]  %s\n" "$1"; ((pass++)) || true; }
bad() { printf "[ERR] %s\n" "$1"; ((fail++)) || true; }

check_cmd() {
  local name=$1; shift
  local cmd=${1:-$name}
  if command -v "$cmd" >/dev/null 2>&1; then
    local ver
    ver=$({ "$cmd" --version 2>/dev/null || "$cmd" -v 2>/dev/null || true; } | head -n1)
    ok "command '$cmd' present${ver:+ ($ver)}"
  else
    bad "command '$cmd' missing"
  fi
}

check_symlink() {
  local target=$1 dest=$2
  if [ -L "$dest" ]; then
    local resolved
    resolved=$(readlink -f -- "$dest" 2>/dev/null || true)
    if [ "$resolved" = "$target" ]; then
      ok "link ok: $dest -> $target"
    else
      bad "link mismatch: $dest -> $resolved (expected $target)"
    fi
  elif [ -e "$dest" ]; then
    bad "exists but not a symlink: $dest (expected link to $target)"
  else
    bad "missing: $dest (expected link to $target)"
  fi
}

echo "== Environment =="
if [ "${XDG_SESSION_TYPE:-}" = "wayland" ]; then
  ok "Wayland session"
else
  bad "Not on Wayland (XDG_SESSION_TYPE=${XDG_SESSION_TYPE:-unset})"
fi

if [ -n "${HYPRLAND_INSTANCE_SIGNATURE:-}" ] || pgrep -x hyprland >/dev/null 2>&1; then
  ok "Hyprland running"
else
  bad "Hyprland not detected"
fi

echo "\n== Commands =="
check_cmd hyprland
check_cmd waybar
check_cmd eww
check_cmd wlogout
check_cmd kitty
check_cmd zsh
check_cmd neovim nvim
check_cmd stow
check_cmd paru
check_cmd fnm
check_cmd pyenv
check_cmd espanso espanso

echo "\n== Symlinks (stow targets) =="
# zsh
check_symlink "$REPO_ROOT/zsh/.zshrc" "$HOME/.zshrc"

# ~/.config/* dirs managed by this repo
cfg_root="$REPO_ROOT/config/.config"
if [ -d "$cfg_root" ]; then
  while IFS= read -r entry; do
    name=$(basename -- "$entry")
    [ -z "$name" ] && continue
    check_symlink "$entry" "$HOME/.config/$name"
  done < <(find "$cfg_root" -mindepth 1 -maxdepth 1 -type d | sort)
else
  bad "missing repo path: $cfg_root"
fi

echo "\n== Summary =="
printf "Passed: %d, Failed: %d\n" "$pass" "$fail"
if [ "$fail" -gt 0 ]; then
  echo "Hints:"
  echo " - Use 'stow -nvt ~ zsh config' to preview symlinks."
  echo " - Apply with 'stow -vt ~ zsh' and/or 'stow -vt ~ config'."
  exit 1
fi
exit 0

