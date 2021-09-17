if test "$(hostname)" = "void"
then

    # Set portuguese keyboard
    setxkbmap -layout pt

    # Load Xresources
    xrdb ~/.Xresources

    # Audio
    pipewire &
    pipewire-pulse & # pulseaudio replacement

    # Openbox session
    exec openbox-session

elif test "$(hostname)" = "rdebian"
then
    # set cursor
    xsetroot -cursor_name heart

    # launch moving background
    paperview /home/romes/backgrounds/sakura 6 &

    # window manager xmonad (it launches xmobar)
    exec xmonad
fi
