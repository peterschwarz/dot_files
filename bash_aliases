
# General
alias ls="ls -G"

alias findswp="find . -type f -name \"*.swp\""
alias rmswp="find . -type f -name \"*.swp\" | xargs rm"

# OS X
if [[ "$OSTYPE" == "darwin"* ]]; then
    alias qlp="qlmanage -p 2>/dev/null $1 > /dev/null"
    alias lockscrean="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
    alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
    # use the homebrew version
    alias vi=/usr/local/bin/vim
fi

# local gem installs
alias gemi="gem install --user-install"
alias gemu="gem update --user-install"
alias gemr="gem uninstall --user-install"

# Development

alias cdp="cd ~/Development/projects"

alias figwheel="rlwrap lein figwheel"

alias ptest="python -m unittest discover"


# alias clj="rlwrap java -Djava.net.preferIPv4Stack=true -jar ~/.m2/repository/org/clojure/clojure/1.7.0/clojure-1.7.0.jar"
