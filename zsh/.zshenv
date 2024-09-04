# Generic shell setup
# everything defined in this file can be used in any shell
# this is run before .zprofile and .zshrc

# common $PATH setup
typeset -U path PATH
if [[ -d ~/.local/bin ]]; then
    path=(~/.local/bin $path)
fi

if [[ -d ~/.local/bin/platform-tools ]]; then
    path=(~/.local/bin/platform-tools $path)
fi

export PATH

CARGO_ENV="$HOME/.cargo/env"
if [[ -f $CARGO_ENV ]]; then
    source $CARGO_ENV
fi

export VISUAL='emacsclient --alternate-editor='""' -c'

export SUDO_EDITOR='emacsclient --alternate-editor='""' -c'

export GPG_TTY=$(tty)

# secret stuff
if [[ -f ~/.local-secrets ]]; then
    source ~/.local-secrets
fi
