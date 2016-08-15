JAVA_HOME=`/usr/libexec/java_home -v 1.8`
ANDROID_HOME=~/Library/Android/sdk
export APPENGINE_SDK=/usr/local/appengine-java-sdk

PATH=~/bin:/usr/local/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$APPENGINE_SDK/bin:$PATH

if which ruby >/dev/null && which gem >/dev/null; then
    PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi

REACT_EDITOR=vi

HOMEBREW_NO_ANALYTICS=1
