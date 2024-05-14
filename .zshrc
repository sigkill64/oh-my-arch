P10K_PROMPT="${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
[[ -r "$P10K_PROMPT" ]] && source "$P10K_PROMPT"

CONFIG_ROOT="${XDG_CONFIG_ROOT:-$HOME/.config}/zsh"

export ZSH="$CONFIG_ROOT/ohmyzsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

zstyle ':omz:update' mode reminder
zstyle ':omz:update' frequency 15

plugins=(git zsh-autosuggestions)

source "$ZSH/oh-my-zsh.sh"
for SH_FILE in $CONFIG_ROOT/zshrc.d/*; do
    source "$SH_FILE"
done
