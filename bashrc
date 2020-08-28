JAVA_HOME=`/usr/libexec/java_home -v 11`

PATH=~/bin:$PATH
PATH=/usr/local/bin:$PATH
PATH=/usr/local/opt/grep/libexec/gnubin:$PATH
PATH=$JAVA_HOME/bin:$PATH

if which ruby >/dev/null && which gem >/dev/null; then
    PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi

REACT_EDITOR=vi

HOMEBREW_NO_ANALYTICS=1

VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
