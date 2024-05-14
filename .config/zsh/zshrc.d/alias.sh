# proxy
pro_host='proxy.lanhost.top'
alias prosocks="all_proxy=socks5h://$pro_host:10086"
alias prohttp="all_proxy=http://$pro_host:20080"

# system
alias pm='pacman'
alias spm='sudo pacman'
alias ls='ls --color=tty -F'

# kitty
alias icat='kitty +kitten icat'
alias kssh='kitty +kitten ssh'

# app
alias trans='trans -x proxy.lanhost.top:10080'
alias nvide='neovide --no-fork 2>/dev/null'
alias vid='neovide --no-fork 2>/dev/null'
