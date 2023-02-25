# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd beep
unsetopt extendedglob notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/bonext/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_ALL_DUPS

PROMPT='%~%# '
# indicate vifm
# via https://wiki.vifm.info/index.php/How_to_indicate_that_shell_session_is_running_inside_Vifm#Variant_.231._Demonstrated_using_zsh
if [ $(ps -ocommand= $(ps -oppid= -p $$)) = "vifm" ]
then
        export PROMPT="[vifm] $PROMPT"
fi
