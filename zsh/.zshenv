# Generic shell setup
# everything defined in this file can be used in any shell
# this is run before .zprofile and .zshrc

# common $PATH setup
typeset -U path PATH
if [[ -d ~/.local/bin ]]; then
    path=(~/.local/bin $path)
fi

# cargo
CARGO_ENV="$HOME/.cargo/env"
if [[ -f $CARGO_ENV ]]; then
    source $CARGO_ENV
fi

CARGO_BIN="$HOME/.cargo/bin"
if [[ -d $CARGO_BIN ]]; then
    path=($CARGO_BIN $path)
fi

export PATH

export GPG_TTY=$(tty)

if [ -e /home/bonext/.nix-profile/etc/profile.d/nix.sh ]; then . /home/bonext/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
