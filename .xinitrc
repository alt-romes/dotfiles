if test "$(hostname)" = "void"
then
    setxkbmap -layout pt
    xrdb ~/.Xresources
    exec openbox-session
fi
