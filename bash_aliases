
# General
alias ls="ls -G"

# OS X
alias qlp="qlmanage -p"

# local gem installs
alias gemi="gem install --user-install"
alias gemu="gem update --user-install"
alias gemr="gem uninstall --user-install"

# Development
alias cdp="cd ~/Development/projects"

alias figwheel="rlwrap lein figwheel"

alias ptest="python -m unittest discover"

alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

alias clj="rlwrap java -Djava.net.preferIPv4Stack=true -jar ~/.m2/repository/org/clojure/clojure/1.7.0/clojure-1.7.0.jar"
