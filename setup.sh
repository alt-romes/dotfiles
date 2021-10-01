#!/usr/bin/env bash

echo "Setting up public dotfiles..."

echo "On creating symlinks:"
echo "This may overwrite existing files in your home directory."
read -p "Create symlinks? (y/n) " -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	HERE=$(pwd)

	# create dotfiles symlinks
	cd "$HOME" || exit 1
	ln -si "${HERE}/.bash_profile" .
	ln -si "${HERE}/.gitconfig" .
	ln -si "${HERE}/.gitignore_global" .
	ln -sFi "${HERE}/.vim/" .
	ln -sFi "${HERE}/.emacs.d/" .
	ln -sFi "${HERE}/.iterm/" .

    echo "TODO: Linux only?"
    mkdir -p .config
    ln -sFi "${HERE}/.config/openbox/" ./.config/
    ln -si "${HERE}/.config/picom.conf" ./.config/
    ln -sFi "${HERE}/.config/gtk-3.0/" ./.config/
    
    ln -sFi "${HERE}/.themes/" .

    ln -sFi "${HERE}/.icons/" .

    ln -si "${HERE}/.xinitrc" .
    ln -si "${HERE}/.Xresources" .


	cd "${HERE}" || exit 1
fi

read -p "Run pywal once and install extensions (e.g. for openbox)? (y/n) " -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	HERE=$(pwd)

    mkdir -p "$HOME/Pictures/backgrounds"
    echo "Move at least one background image to ~/Pictures/backgrounds"
    echo "(Example: curl -L https://i.imgur.com/COg47x2.png > ~/Pictures/backgrounds/b1.png)"
    echo "(... https://i.imgur.com/KlhtVEY.png > ~/Pictures/backgrounds/b2.png)"
    read -r -p "Input any key afterwards... "

    echo "Installing walbox (pywal + openbox)"
    cd build-dependencies/walbox/
    echo "Copying user template to .config/wal/templates/"
    mkdir -p "$HOME/.config/wal/templates/"
    cp -i themerc "$HOME/.config/wal/templates/"
    echo "Copying openbox pywal theme to ~/.themes"
    cp -ri Walbox "$HOME/.themes/Walbox"
    echo "Creating symlink in openbox theme to pywal user template generated theme (theme dependency)"
    ln -s "$HOME/.cache/wal/themerc" "$HOME/.themes/Walbox/openbox-3/themerc"

    cd "${HERE}" || exit 1

    echo "TODO: pywal must be run on a terminal emulator rather than in the tty console"
    echo "Running pywal once (generating pywal files)"
    wal --saturate 0.88 -i "$HOME/Pictures/backgrounds"
fi


read -p "Overwrite iTerm preferences? (y/n) " -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
    cp -i .iterm/com.googlecode.iterm2.plist "$HOME/Library/Preferences/"

    echo
    echo "Important => Required manual actions:"
    echo "  iTerm: Go to 'Preferences > General > Preferences'"
    echo "  iTerm: Select 'Load preferences from a custom folder or URL'"
    echo "  iTerm: Input '~/.iterm'"
    echo "  iTerm: Note, if a required font isn't installed, some profiles might revert to the default font"
fi
