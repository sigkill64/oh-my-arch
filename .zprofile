export PATH="$HOME/.local/bin:$HOME/.local/bin/common:$HOME/.local/bin/webapp:$PATH"

if [ -z "${DISPLAY}" ] && [ "$(tty)" = '/dev/tty1' ]; then
    echo 'waiting for psd.service'
    while [ ! -L "$HOME/.cache" ]; do
        sleep 1
    done

    #exec startx

    export XMODIFIERS='@im=fcitx'
    export GTK_IM_MODULE=fcitx
    export QT_IM_MODULE=fcitx
    #export _JAVA_AWT_WM_NONREPARENTING=1
    export CHRM_CMD=chromium
    exec Hyprland
fi
