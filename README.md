# oh-my-arch

---

You need do something manually.

## Install requirements

```bash
sudo pacman -S $(cat ~/.requirements)
```

## Setup profile-sync-daemon

Add the following files in `/usr/share/psd/browsers/`:

`others`

```text
DIRArr[0]="$HOME/.cache"
PSNAME="$browser"
```

## Install LSP required by neovim

Refer to `~/.config/nvim/lua/plugin/lspconfig.lua` and this [help page](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md).

## Clone oh-my-zsh

Clone [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh.git) to `~/.config/zsh/ohmyzsh/`:

```bash
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.config/zsh/ohmyzsh
```
