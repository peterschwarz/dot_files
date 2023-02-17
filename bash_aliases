
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
    alias vi=$(brew --prefix vim)/bin/vim

    # JavasciptCore
    alias jsc="/System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Helpers/jsc"
fi

# local gem installs
alias gemi="gem install --user-install"
alias gemu="gem update --user-install"
alias gemr="gem uninstall --user-install"

# Development

alias cdp="cd ~/Development/projects"

alias figwheel="rlwrap lein figwheel"
alias rebl="clojure -A:rebl"

nrepl () {
    LEIN_REPL_PORT=$1 lein repl;
}

alias ptest="python -m unittest discover"

if hash bat 2>/dev/null
then
    alias cat=bat
fi

# alias clj="rlwrap java -Djava.net.preferIPv4Stack=true -jar ~/.m2/repository/org/clojure/clojure/1.7.0/clojure-1.7.0.jar"

# fun
alias kexp="mpg123 http://50.31.180.202:80/ 2>/dev/null $1 > /dev/null"
alias now-playing-kexp='curl -s "https://api.kexp.org/v2/plays/?format=json&limit=1&offset=0&ordering=-airdate" | jq "{ artist: .results[].artist, song: .results[].song, album: .results[].album }"'
alias thecurrent="mpg123 http://current.stream.publicradio.org/kcmp.mp3 2>/dev/null $1 > /dev/null"
alias classical="mpg123 http://cms.stream.publicradio.org/cms.mp3 2>/dev/null $1 > /dev/null"
alias stopstream="killall -HUP mpg123"

srcsearch () {
    find $1 -type f -name "$2" \
        -not -path "*.pyc" \
        -not -path "*/build/*" \
        -not -path "*/.git/*" \
        -not -path "*/target/*" \
        -not -path "*/node_modules/*" \
        -not -path "*/protobuf/*" \
        | xargs grep -n "$3"
}

rssearch () {
    srcsearch "$1" "*.rs" "$2"
}

mknote () {
    local name=$1
    if [[ -z "$name" ]]; then
        name=note
    fi
    touch "$name-$(date -u +"%Y-%m-%dT%H-%M-%SZ").md"
}
