JAVA_HOME=`/usr/libexec/java_home -v 11`
ANDROID_HOME=~/Library/Android/sdk
export APPENGINE_SDK=/usr/local/appengine-java-sdk

PATH=~/bin:/usr/local/bin:$PATH
# PATH=$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH
PATH=$APPENGINE_SDK/bin:$PATH
PATH=$JAVA_HOME/bin:$PATH

if which ruby >/dev/null && which gem >/dev/null; then
    PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi

REACT_EDITOR=vi

HOMEBREW_NO_ANALYTICS=1

VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /usr/local/bin/virtualenvwrapper.sh
