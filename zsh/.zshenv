# Generic shell setup
typeset -U path PATH

if [[ -d ~/.local/bin ]]; then
    path=(~/.local/bin $path)
fi

if [[ -d ~/.local/bin/platform-tools ]]; then
    path=(~/.local/bin/platform-tools $path)
fi
export PATH

if [[ -f ~/.cargo/env ]]; then
    source ~/.cargo/env
fi

# Note: -c waits for termination (-n does not)
export VISUAL="emacsclient -c"
# edit everything with emacs using sudo -e or sudoedit
export SUDO_EDITOR="emacsclient -c"

export GPG_TTY=$(tty)
