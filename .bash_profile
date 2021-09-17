# Make sure bashrc is run as well
# [[ -f ~/.bashrc ]] && source ~/.bashrc

# +----oOO-{%}-OOo---------------------+
# - Base config                        -
# +-----------------------------------*/

# $PATH
export PATH="/usr/local/sbin:$PATH" # Homebrew's sbin
export PATH="$HOME/.local/bin:$PATH" # .local/bin
export PATH="$HOME/.cabal/bin:/Users/romes/.ghcup/bin:$PATH" # Haskell Platform
export PATH="$HOME/.cargo/bin:$PATH" # Rust Platform
export PATH="$HOME/control/util/bin:$PATH" # Control (custom scripts)

# $PS1
function setps1() {
    white="\[\[\033[0m\]"
    colors=("\[\033[01;31m\]" "\[\033[01;32m\]" "\[\033[01;33m\]" "\[\033[01;34m\]" "\[\033[01;35m\]" "\[\033[01;36m\]" "\[\033[01;37m\]")
    kaomoji=("(・_・)ノ" "(^_^♪)" "(>_<)" "(o^ ^o)" "(„• ᴗ •„)" "(๑˃ᴗ˂)ﻭ" "(*^.^*)" "ヾ(๑╹◡╹)ﾉ\"" "（╹◡╹）♡ " "(๑╹ω╹๑ )" "(( ͡° ͜ʖ ͡°)" "ᕦ(ò_óˇ)ᕤ " "Σ(-᷅_-᷄๑)" "(ง'̀-'́)ง" "ʕ•ᴥ•ʔ")
    randomcolor=${colors[$((RANDOM % 7))]}
    export PS1="${randomcolor}(${white}\W${randomcolor}) ${kaomoji[$((RANDOM % 15))]}${white} "
}
setps1

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

# disable homebrew analytics
export HOMEBREW_NO_ANALYTICS=1

# +----oOO-{&}-OOo---------------------+
# - Commands / Functions / Aliases    -
# +-----------------------------------*/

# I mistype this too often
alias makek="make"

function fastpush() {
    git add .
    git commit -m "$1"
    git push
}

function uninstallfind() {
    find $HOME -iname "*$1*" 2> /dev/null
    launchctl list | grep -i "$1"
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

alias wal='wal --saturate 0.88'
alias walb='wal -i ~/Pictures/backgrounds'

# use fzf (fuzzy find) by default with bat and to edit in vim
alias fzf="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"

alias cvlc="vlc -I rc"
alias nvlc="vlc -I ncurses"
alias servevlc='vlc -I rc -vvv --sout "#transcode{vcodec=mp1v,acodec=mpga,soverlay}:std{access=udp{caching=1000},dst=192.168.1.102:25565,mux=ts}"'

# qemu on mac should be run with -accel hvf
