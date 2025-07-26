if status is-interactive
    # Commands to run in interactive sessions can go here

    # https://direnv.net/docs/hook.html#fish
    direnv hook fish | source

    # https://junegunn.github.io/fzf/shell-integration/#setting-up-shell-integration
    fzf --fish | source
    
    # abbr gets expanded to a full command before execution
    abbr -a irc tmux new-session -A -s irc weechat

    # override (potentially) inherited $VISUAL and $SUDO_EDITOR
    set --global --export VISUAL nvim
    set --global --export SUDO_EDITOR nvim
end
