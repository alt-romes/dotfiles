# Make sure bashrc is run as well
# [[ -f ~/.bashrc ]] && source ~/.bashrc

# +----oOO-{%}-OOo---------------------+
# - Base config                        -
# +-----------------------------------*/

# $PATH
eval "$(/opt/homebrew/bin/brew shellenv)" # Set PATH, MANPATH, etc., for Homebrew.
export PATH="/opt/homebrew/opt/llvm@15/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH" # Java
export PATH="/opt/homebrew/opt/sphinx-doc/bin:$PATH" # sphinx-docs
export PATH="$HOME/.cabal/bin:/Users/romes/.ghcup/bin:$PATH" # Haskell Platform
export PATH="$HOME/.cargo/bin:$PATH" # Rust Platform
export PATH="$HOME/.local/bin:$PATH" # .local/bin
export PATH="$HOME/control/util/bin:$PATH" # Control scripts
export PATH="$HOME/ghc-dev/ghc-utils:$PATH" # ghc-util scripts, e.g. ghc-docker-jobs.sh aarch64-linux-deb10-validate
export PATH="$HOME/.opam/CP.2023.03+b1~8.17~2023.03+beta1/bin:$PATH"

# Library path
export LIBRARY_PATH="$LIBRARY_PATH:$(brew --prefix)/lib"
# Include path
export CPATH="$CPATH:$(brew --prefix)/include"

# JAVA
export JAVA_HOME="$(/usr/libexec/java_home 2> /dev/null)"
export PATH="$JAVA_HOME/bin:$PATH" # use java found in $JAVA_HOME first
alias java-versions="/usr/libexec/java_home -V"

# $PS1
function setps1() {
    white="\[\[\033[0m\]"
    colors=("\[\033[01;31m\]" "\[\033[01;32m\]" "\[\033[01;33m\]" "\[\033[01;34m\]" "\[\033[01;35m\]" "\[\033[01;36m\]")
    kaomoji=("(・_・)ノ" "(^_^♪)" "(>_<)" "(o^ ^o)" "(„• ᴗ •„)" "(๑˃ᴗ˂)ﻭ" "(*^.^*)" "ヾ(๑╹◡╹)ﾉ\"" "（╹◡╹）♡ " "(๑╹ω╹๑ )" "ᕦ(ò_óˇ)ᕤ " "Σ(-᷅_-᷄๑)" "(ง'̀-'́)ง" "ʕ•ᴥ•ʔ" "(>^.^<)" "⚑")
    randomcolor=${colors[$((RANDOM % 7))]}
    export PS1="${randomcolor}(${white}\W${randomcolor}) ${kaomoji[$((RANDOM % 16))]}${white} "
}
setps1

# don't overwrite by default when moving or copying
alias mv='mv -i'
alias cp='cp -i'

# vim + fzf
alias vif='vim "$(fzf)"'
# fzf <== ripgrep
# since we already use ripgrep, we might as well use by default with fzf.
# (by default, `find`)
export FZF_DEFAULT_COMMAND='rg --files --ignore-vcs --hidden'

# don't put duplicates in history
HISTCONTROL=ignoredups

# default editor is vim
export EDITOR="vim"

# load bash completion
[[ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]] && . "$(brew --prefix)/etc/profile.d/bash_completion.sh"

# use wal colorscheme
if [[ -f ~/.cache/wal/sequences ]]
then
    # (cat ~/.cache/wal/sequences &)
    true
fi

# +----oOO-{&}-OOo---------------------+
# - Commands / Functions / Aliases    -
# +-----------------------------------*/

# I mistype this too often
alias makek="make"
alias maek="make"
alias mak="make"
alias mkae="make"

alias g="git"

alias clear='[ $[$RANDOM % 5] = 0 ] && gtimeout 6 cbeams -o; clear || clear'
alias matrix='perl -e "$|++; while (1) { print \" \" x (rand(35) + 1), int(rand(2)) }"'
alias whatismyip='curl ifconfig.me;echo '
alias weather='curl wttr.in'
alias dunnet='emacs -batch -l dunnet'
alias deutsch="sentences -o -c -t deutsch"
alias japanese="sentences -o -c -t japanese"

# +----oOO-{&}-OOo---------------------+
# - Extras with dependencies in       -
# - control/docs/dependencies.sh      -
# - (outdated -- todo: redo)          -
# +-----------------------------------*/

# override ls with exa
alias ls='exa'
alias ll='exa --git --tree --level=2 -la --header --group'

# always use translate-shell in interactive mode
alias trans='trans -I'

alias wal='wal --saturate 0.8'
alias walb='wal -i ~/Pictures/backgrounds'

# use fzf (fuzzy find) by default with bat and to edit in vim
alias fzf="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"

alias cvlc="vlc -I rc"
alias nvlc="vlc -I ncurses"
alias servevlc='vlc -I rc -vvv --sout "#transcode{vcodec=mp1v,acodec=mpga,soverlay}:std{access=udp{caching=1000},dst=192.168.1.102:25565,mux=ts}"'

alias bah=setps1
alias bahb=walb

alias walf="wal -f"

alias anime="ani-cli"
alias httpserver="python -m http.server 25565"
alias python="$(brew --prefix)/bin/python3"

alias ghc-shell="nix-shell ~/ghc-dev/ghc.nix/"

alias ghci-core="ghci -ddump-simpl -dsuppress-idinfo \
-dsuppress-coercions -dsuppress-type-applications \
-dsuppress-uniques -dsuppress-module-prefixes"


alias docker-ghc-linux-deb10="~/ghc-dev/ghc-utils/ghc-docker-jobs.sh aarch64-linux-deb10-validate"


if [[ $(uname) == "Darwin" ]]
then

    # disable homebrew analytics
    export HOMEBREW_NO_ANALYTICS=1

    function ramdisk() { diskutil erasedisk APFS "RAMDisk" `hdiutil attach -nomount ram://$((2048*$1))`; }

    function uninstallfind() {
        find $HOME -iname "*$1*" 2> /dev/null
        launchctl list | grep -i "$1"
    }

elif [[ $(uname) == "Linux" ]]
then

    export XDG_RUNTIME_DIR="/tmp/$(id -u)-runtime-dir" # Required by some essential programs (pipewire~, wayland, ...)"
    if ! test -d "${XDG_RUNTIME_DIR}"; then
        mkdir -m 0700 -p "${XDG_RUNTIME_DIR}"
    fi

fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Append always to history
# and increase its size
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
HISTSIZE=5000
HISTFILESIZE=5000


. "$HOME/.cargo/env"

# Enable/disable coreutils installed by homebrew
export PATH="$(brew --prefix)/opt/coreutils/libexec/gnubin:$PATH"
export PATH="$(brew --prefix)/opt/gnu-tar/libexec/gnubin:$PATH"
export PATH="$(brew --prefix)/opt/gnu-sed/libexec/gnubin:$PATH"

