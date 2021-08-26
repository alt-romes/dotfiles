#!/usr/bin/env bash

echo "Setting up public dotfiles..."

echo "On creating symlinks:"
echo "This may overwrite existing files in your home directory."
read -p "Create symlinks? (y/n) " -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	HERE=$(pwd)

	# create dotfiles symlinks
	cd $HOME
	ln -si ${HERE}/.bash_profile
	ln -si ${HERE}/.gitconfig
	ln -si ${HERE}/.gitignore_global
	ln -sFi ${HERE}/.vim/
	ln -sFi ${HERE}/.iterm/

	cd ${HERE}
fi
