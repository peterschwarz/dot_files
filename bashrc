JAVA_HOME=`/usr/libexec/java_home -v 1.8`
ANDROID_HOME=~/Library/Android/sdk

PATH=~/bin:/usr/local/bin:$PATH

if which ruby >/dev/null && which gem >/dev/null; then
    PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi
