# oh-my-arch

---

You need doing something manually.

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

## Install LSP servers required by neovim

Refer to `~/.config/nvim/lua/plugin/lspconfig.lua` and this [help page](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md).

## Clone oh-my-zsh

oh-my-zsh

```bash
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.config/zsh/ohmyzsh
```
zsh-autosuggestions

```bash
prosocks git clone https://github.com/zsh-users/zsh-autosuggestions ~/.config/zsh/ohmyzsh/custom/plugins/zsh-autosuggestions
```

powerlevel10k

```bash
prosocks git clone --depth=1 https://github.com/romkatv/powerlevel10k ~/.config/zsh/ohmyzsh/custom/themes/powerlevel10k
```
