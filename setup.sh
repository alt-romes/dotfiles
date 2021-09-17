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
	ln -sFi "${HERE}/.iterm/" .

    echo "TODO: Linux only?"
    mkdir -p .config
    ln -sFi "${HERE}/.config/openbox/" ./.config/
    ln -si "${HERE}/.config/picom.conf" ./.config/
    ln -sFi "${HERE}/.config/gtk-3.0/" ./.config/
    
    ln -sFi "${HERE}/.themes/" .
    # extract openbox themes to .themes
    find "${HERE}.themes/openbox-theme-collections/" -maxdepth 1 -type d -exec cp -R -t "${HERE}/.themes/" {} +

    ln -sFi "${HERE}/.icons/" .

    ln -si "${HERE}/.xinitrc" .
    ln -si "${HERE}/.Xresources" .


	cd "${HERE}" || exit 1
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
