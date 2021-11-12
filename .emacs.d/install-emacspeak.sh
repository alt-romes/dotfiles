#!/usr/bin/env bash


read -p "Install emacspeak (>200M)? (y/n) " -r
if [[ $REPLY =~ ^[Yy]$ ]]
then


if test ! -d emacspeak; then
    git clone "git@github.com:tvraman/emacspeak.git" && \
    cd emacspeak && \
    make config && \
    make && \
    cd ..
fi

sed -E -i".bak" 's/^;; (\(load-file.*emacspeak-setup.el"\))/\1/' init.el && rm init.el.bak

fi
