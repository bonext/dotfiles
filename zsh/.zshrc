# everything defined in this file will only be used
# in interactive shells

# Source global definitions
if [[ -f /etc/zshrc ]]; then
    . /etc/zshrc
fi

# Source aliases
if [[ -f ~/.alias ]]; then
    . ~/.alias
fi

# history
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY
## for sharing history between zsh processes
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
## Do not keep cmds starting with space
setopt HIST_IGNORE_SPACE
## remove duplicates all over history
setopt HIST_IGNORE_ALL_DUPS

# colors
autoload -U colors

setopt autocd beep
unsetopt extendedglob notify

# use emacs bindings
bindkey -e
# Make Vi mode transitions faster (KEYTIMEOUT is in hundredths of a second)
export KEYTIMEOUT=1
# incremental search in insert mode
bindkey "^F" history-incremental-search-forward
bindkey "^R" history-incremental-search-backward

#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

zstyle :compinstall filename '/home/bonext/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_ALL_DUPS

PROMPT='%~%# '
# indicate vifm shell
if [[ "$(ps -ocommand= $PPID)" =~ '^vifm.*' ]]
then
        export PROMPT="[vifm] $PROMPT"
fi

# kubectl completion
if type kubectl &>/dev/null; then
    source <(kubectl completion zsh)
fi

if type helm &>/dev/null; then
    source <(helm completion zsh)
fi

autoload -U +X bashcompinit && bashcompinit
