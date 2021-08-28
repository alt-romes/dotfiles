# Make sure bashrc is run as well
# [[ -f ~/.bashrc ]] && source ~/.bashrc

# +----oOO-{%}-OOo---------------------+
# - Base config                        -
# +-----------------------------------*/

# $PATH
export PATH="/usr/local/sbin:$PATH" # Homebrew's sbin
export PATH="$HOME/.local/bin:$PATH" # .local/bin
export PATH="$HOME/.cabal/bin:/Users/romes/.ghcup/bin:$PATH" # Haskell Platform
export PATH="$HOME/.cargo/bin:$PATH" # Cargo
export PATH="$HOME/control/util:$PATH" # Control (custom scripts)

# $PS1
white="\[\[\033[0m\]"
colors=("\[\033[01;31m\]" "\[\033[01;32m\]" "\[\033[01;33m\]")
kaomoji=("(・_・)ノ" "(^_^♪)" "(>_<)" "(o^ ^o)" "(„• ᴗ •„)" "(๑˃ᴗ˂)ﻭ" "(*^.^*)")
randomcolor=${colors[$(($RANDOM % 3))]}
export PS1="${randomcolor}(${white}\W${randomcolor}) ${kaomoji[$(($RANDOM % 7))]}${white} "
# export PS1="\[\033[01;32m\][\[\033[0m\]\W\[\033[01;32m\]] λ\[\033[00m\] " # prompt do david

# don't overwrite by default when moving or copying
alias mv='mv -i'
alias cp='cp -i'

# don't put duplicates in history
HISTCONTROL=ignoredups

# default editor is vim
export EDITOR="vim"

# load bash completion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# use wal colorscheme
if [[ -f ~/.cache/wal/sequences ]]
then
    (cat ~/.cache/wal/sequences &)
fi

# +----oOO-{&}-OOo---------------------+
# - Commands / Functions / Aliases    -
# +-----------------------------------*/

# I mistype this too often
alias makek="make"

# Set a "mark" in a directory, and then go back to it from anywhere
alias marco="pushd ."
alias polo="popd"

function fastpush() {
    git add .
    git commit -m "$1"
    git push
}

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

# use fzf (fuzzy find) by default with bat and to edit in vim
alias fzf="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
