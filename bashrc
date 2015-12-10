JAVA_HOME=`/usr/libexec/java_home -v 1.8`
ANDROID_HOME=~/Library/Android/sdk

PATH=~/bin:/usr/local/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH

if which ruby >/dev/null && which gem >/dev/null; then
    PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi

REACT_EDITOR=vi
