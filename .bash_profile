alias git='LANG=en_GB git'

alias publishromes='npm run build; cd alt-romes.github.io; git init; git add .; git commit -m "update build"; git push -f https://github.com/alt-romes/alt-romes.github.io.git; cd ..'
alias clear='[ $[$RANDOM % 5] = 0 ] && gtimeout 6 cbeams -o; clear || clear'
alias love='/Applications/love.app/Contents/MacOS/love'

alias matrix='perl -e "$|++; while (1) { print \" \" x (rand(35) + 1), int(rand(2)) }"'
alias whatismyip='curl ifconfig.me;echo '

alias weather='curl wttr.in'

alias dunnet='emacs -batch -l dunnet'

alias deutsch="sentences -o -c -t deutsch"
alias japanese="sentences -o -c -t japanese"

alias jplookup="python3 -m jamdict.tools lookup"

alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'

alias emulicious='java -jar /Applications/Emulicious/Emulicious.jar'

# Default termdown font
alias termdown='termdown -f standard'

# Nativescript-Vue Environment
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-15.jdk/Contents/Home
nankicards="$()"
export ANDROID_HOME=/usr/local/share/android-sdk
export ANDROID_SDK_ROOT=/usr/local/share/android-sdk
# Homebrew's sbin
export PATH="/usr/local/sbin:$PATH"
# Cargo
export PATH="$HOME/.cargo/bin:$PATH"
# Haskell Stack builds uses this directory
export PATH="$HOME/.local/bin:$PATH"
# Haskell Environment
export PATH="$HOME/.cabal/bin:/Users/romes/.ghcup/bin:$PATH"
# Control (custom scripts)
export PATH="$HOME/control:$PATH"


# Start countdown and when done log time into time log
# Termdown with logging to log file
tasktimer(){
    if [ "$1" == "" ] || [ "$2" == "" ]; then
        echo "Usage: tasktimer task time"
        return
    fi
    termdown -s -T $1 $2 && logtime.sh $1 $2
}


colors[0]="\[\033[31m\]"
colors[1]="\[\033[32m\]"
colors[2]="\[\033[33m\]"
index=$(($RANDOM % 3))
randomcolor=${colors[index]}
#randomcolor="\[\033[0m\]"

# Choose random color from prompt and costumize it
# export PS1="${randomcolor}\W \u\$ \[\033[0m\]"
export PS1="\[\033[01;32m\][\[\033[0m\]\W\[\033[01;32m\]] λ\[\033[00m\] " # prompt do david

# default browser is lynx (used by ddgr) 
export BROWSER=lynx

# Make sure bashrc is run as well
# [[ -f ~/.bashrc ]] && source ~/.bashrc # ghcup-env

# when u fuck up, execute previous command as root
alias fuck='sudo $(history -p \!\!)'


# ---- clean up



#   +----oOO-{%}-OOo---------------------+
#   - Base config                        -
#   +-----------------------------------*/

# don't overwrite by default when moving
alias mv='mv -i'

# don't put duplicates in history
HISTCONTROL=ignoredups

# default editor is vim
export EDITOR="vim"

#   +----oOO-{&}-OOo---------------------+
#   - Commands / Functions / Aliases    -
#   +-----------------------------------*/

alias marco="pushd ."
alias polo="popd"


#   +----oOO-{&}-OOo---------------------+
#   - Extras with dependencies in       -
#   - control/docs/dependencies.sh      -
#   +-----------------------------------*/

# override ls with exa
alias ls='exa'
alias ll='exa --git --tree --level=2 -la --header --group'

# always use translate-shell in interactive mode
alias trans='trans -I'



#   +----oOO-{/}-OOo---------------------+
#   - Dotfiles                           -
#   +-----------------------------------*/

# Initialize a repository first as:
# git init --bare $HOME/.myconf
# config config status.showUntrackedFiles no
alias config='/usr/bin/env git --git-dir=$HOME/control/dotfiles.git --work-tree=$HOME'
# Pull remote submodule changes with
# config submodule update --remote
