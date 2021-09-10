if test "$(hostname)" = "void"
then
    # Set portuguese keyboard
    setxkbmap -layout pt

    # Load Xresources
    xrdb ~/.Xresources

    # Background
    hsetroot -fill ~/backgrounds/b-0.jpeg -blur 1 &

    # Openbox session
    exec openbox-session
fi
