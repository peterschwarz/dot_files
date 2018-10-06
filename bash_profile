if [ -f ~/.bashrc ]; then
    source ~/.bashrc
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

# Google Cloud SDK
if [ -f '/opt/homebrew-cask/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc' ]; then
    source '/opt/homebrew-cask/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc'
fi
if [ -f '/opt/homebrew-cask/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc' ]; then
    source '/opt/homebrew-cask/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc'
fi

# Git completion
if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi

# ASDF
if [ -f /usr/local/opt/asdf/asdf.sh ]; then
    source /usr/local/opt/asdf/asdf.sh
fi

fixbluetooth(){
    sudo kextunload -b com.apple.iokit.BroadcomBluetoothHostControllerUSBTransport
    sudo kextload -b com.apple.iokit.BroadcomBluetoothHostControllerUSBTransport
}

export PATH="$HOME/.cargo/bin:$PATH"
