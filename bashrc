export PATH=~/bin:$PATH
export PATH=/usr/local/bin:$PATH

export JAVA_HOME=$(brew --prefix openjdk)

REACT_EDITOR=vi

HOMEBREW_NO_ANALYTICS=1

if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
    export WORKON_HOME=$HOME/.virtualenvs
    source /usr/local/bin/virtualenvwrapper.sh
fi

if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

if [ -f ~/.local_aliases ]; then
    source ~/.local_aliases
fi

if [ -f ~/.secure_variables ]; then
    source ~/.secure_variables
fi

# Git completion
if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi

. "$HOME/.cargo/env"
eval "$(/opt/homebrew/bin/brew shellenv)"

# For running splinter tests
ulimit -S -n 20480
