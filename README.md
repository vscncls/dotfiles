# dotfiles

Personal config managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Layout

Each top-level directory is a stow *package*. Inside each, files are arranged
relative to `$HOME`, so e.g. `nvim/.config/nvim/` symlinks to `~/.config/nvim/`.

| Package     | Symlinks                                              |
| ----------- | ----------------------------------------------------- |
| `bash`      | `~/.bashrc`, `~/.bash_profile`, `~/.bash_logout`      |
| `git`       | `~/.gitconfig`                                        |
| `nvim`      | `~/.config/nvim/`                                     |
| `kitty`     | `~/.config/kitty/`                                    |
| `hypr`      | `~/.config/hypr/`                                     |
| `waybar`    | `~/.config/waybar/`                                   |
| `fish`      | `~/.config/fish/`                                     |
| `zellij`    | `~/.config/zellij/`                                   |
| `zathura`   | `~/.config/zathura/`                                  |
| `htop`      | `~/.config/htop/`                                     |
| `gammastep` | `~/.config/gammastep/`                                |

## Install on a new machine

```sh
sudo pacman -S stow            # or your distro's equivalent
git clone <repo-url> ~/Documents/dotfiles
cd ~/Documents/dotfiles
stow -t ~ bash git nvim kitty hypr waybar fish zellij zathura htop gammastep
```

If a target file already exists and isn't a symlink, stow will refuse. Move or
delete it first, then re-run.

## Common commands

```sh
cd ~/Documents/dotfiles

stow -t ~ <package>            # link a package
stow -t ~ -D <package>         # unlink
stow -t ~ -R <package>         # restow (refresh links)
stow -t ~ -n -v <package>      # dry-run
```

## Adding a new package

1. `mkdir -p <pkg>/.config/<app>` (or place dotfiles directly in `<pkg>/`)
2. `mv ~/.config/<app> <pkg>/.config/<app>`
3. `stow -t ~ <pkg>`
