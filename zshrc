export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
ulimit -S -n 20480

bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

autoload -Uz compinit && compinit
source ~/.bash_aliases
eval "$(starship init zsh)"

if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi
