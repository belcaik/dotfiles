# Repository Guidelines

## Project Structure & Module Organization
- `config/.config/`: App configs (hyprland, waybar, eww, kitty, etc.).
- `zsh/.zshrc`: Zsh shell configuration.
- `docs/linux/`: Linux-specific notes and setup.
- `README.md`: Repo overview and quick start.

## Build, Test, and Development Commands
- `stow -nvt ~ zsh config`: Dry-run symlinks to preview changes.
- `stow -vt ~ zsh` and/or `stow -vt ~ config`: Apply symlinks into your home.
- `stow -Dvt ~ zsh`: Unstow (remove) symlinks for a package.
- Tip: Run from the repo root. Use specific packages (e.g., `zsh`, `config`) to scope changes.

## Coding Style & Naming Conventions
- Indentation: 2 spaces for shell, 2 spaces for YAML/TOML.
- Shell: lower_snake_case for functions/variables; comment intent over mechanics.
- Filenames: lowercase with hyphens (e.g., `aliases.zsh`, `kitty.conf`).
- No enforced linter; prefer `shellcheck` and `shfmt` locally before PRs.

## Testing Guidelines
- Validate stow: `stow -nvt ~ <pkg>` shows planned links without touching files.
- Smoke checks: open a new shell to confirm `.zshrc` loads; restart affected apps (kitty/polybar/leftwm) to verify config.
- Scope: keep OS-specific changes within the matching branch; avoid breaking defaults for other OSes.

## Commit & Pull Request Guidelines
- Commits: Prefer Conventional Commits (e.g., `feat(zsh): add git aliases`, `fix(leftwm): correct workspace keybind`).
- PRs: Target the correct OS branch, include a concise description, before/after notes or screenshots (for UI), and reference any issue/decision.
- Keep changes minimal and reversible; split unrelated changes into separate PRs.

## Security & Configuration Tips
- Never commit secrets. Keep machine-specific overrides in files outside this repo (e.g., `~/.zshrc.local`) and ensure they’re sourced conditionally.
- Use `.stow-local-ignore` to prevent linking files that must remain local.
