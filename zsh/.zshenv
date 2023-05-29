typeset -U path PATH
path=(~/.local/bin/platform-tools ~/.local/bin $path)
export PATH
. "$HOME/.cargo/env"

# Note: -c waits for termination (-n does not)
export VISUAL="emacsclient -c"
# edit everything with emacs using sudo -e or sudoedit
export SUDO_EDITOR="emacsclient -c"
