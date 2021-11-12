#!/usr/bin/env bash

HERE=$(pwd)

echo "Setting up public dotfiles..."

echo "On creating symlinks:"
echo "This may overwrite existing files in your home directory."
read -p "Create symlinks? (y/n) " -r
if [[ $REPLY =~ ^[Yy]$ ]]
then

	# create dotfiles symlinks
	ln -si "${HERE}/.bash_profile" "$HOME"
	ln -si "${HERE}/.gitconfig" "$HOME"
	ln -si "${HERE}/.gitignore_global" "$HOME"
	ln -sFi "${HERE}/.vim/" "$HOME"
	ln -sFi "${HERE}/.emacs.d/" "$HOME" && echo "To install emacspeak run: cd .emacs.d && ./install-emacspeak.sh"
	ln -sFi "${HERE}/.iterm/" "$HOME"

    # linux specific dotfiles
    if [[ $(uname) == "Linux" ]]
    then
        mkdir -p "$HOME/config"
        ln -sFi "${HERE}/.config/openbox/" "$HOME/.config/"
        ln -si "${HERE}/.config/picom.conf" "$HOME/.config/"
        ln -sFi "${HERE}/.config/tint2/" "$HOME/.config/"
        ln -sFi "${HERE}/.config/sway/" "$HOME/.config/"

        ln -si "${HERE}/.xinitrc" "$HOME"
        ln -si "${HERE}/.Xresources" "$HOME"
    fi

fi

read -p "Run pywal once? (y/n) " -r
if [[ $REPLY =~ ^[Yy]$ ]]
then

    mkdir -p "$HOME/Pictures/backgrounds"
    echo "Move at least one background image to ~/Pictures/backgrounds"
    echo "(Example: curl -L https://i.imgur.com/V2eZQPm.jpeg > ~/Pictures/backgrounds/b1.jpeg)"
    read -r -p "Input any key afterwards... "

    echo "Running pywal once (generating pywal files)"
    wal --saturate 0.88 -i "$HOME/Pictures/backgrounds"

fi

# Linux only
if [[ $(uname) == "Linux" ]]
then
    read -p "Install walbox -- openbox pywal extension? (y/n) " -r
    if [[ $REPLY =~ ^[Yy]$ ]]
    then

        echo "Installing walbox (pywal + openbox)"
        cd build-dependencies/ || exit 1
        ./fetch-walbox.sh
        cd walbox || exit 1
        echo "Copying user template to .config/wal/templates/"
        mkdir -p "$HOME/.config/wal/templates/"
        cp -i themerc "$HOME/.config/wal/templates/"
        echo "Copying openbox pywal theme to ~/.themes"
        mkdir -p "$HOME/.themes/"
        cp -ri Walbox "$HOME/.themes/Walbox"
        echo "Creating symlink in openbox theme to pywal user template generated theme (theme dependency)"
        ln -s "$HOME/.cache/wal/themerc" "$HOME/.themes/Walbox/openbox-3/themerc"

    fi
fi

# macOS only
if [[ $(uname) == "Darwin" ]]
then

    echo "Updating the terminfo database..."
	ln -sFi "${HERE}/.terminfo/" "$HOME"
    tic -o "$HOME/.terminfo" "$HOME/.terminfo/tmux.terminfo"
    tic -o "$HOME/.terminfo" "$HOME/.terminfo/tmux-256color.terminfo"
    tic -o "$HOME/.terminfo" "$HOME/.terminfo/xterm-256color.terminfo"

    read -p "Overwrite iTerm preferences? (y/n) " -r
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        echo "TODO: Change this to a soft link?"
        cp -i .iterm/com.googlecode.iterm2.plist "$HOME/Library/Preferences/"

        echo
        echo "Important => Required manual actions:"
        echo "  iTerm: Go to 'Preferences > General > Preferences'"
        echo "  iTerm: Select 'Load preferences from a custom folder or URL'"
        echo "  iTerm: Input '~/.iterm'"
        echo "  iTerm: Note, if a required font isn't installed, some profiles might revert to the default font"
    fi
fi

