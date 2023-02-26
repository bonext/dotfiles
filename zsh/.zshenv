typeset -U path PATH
path=(~/.local/bin $path)
export PATH
. "$HOME/.cargo/env"

export VISUAL="emacsclient -c"
