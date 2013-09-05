# .bashrc

if [ -f ~/.profile ]; then
  source ~/.profile
fi

# prompt coloring
if [ `/usr/bin/whoami` = "root" ] ; then
  # root has a red prompt
  export PS1="\[\033[1;31m\]\u@\h \w \$ \[\033[0m\]"
elif [ `hostname` = "serenity.local" ] ; then
  # the hosts I use on a daily basis have blue
  export PS1="\[\033[1;36m\]\u@\h \w \$ \[\033[0m\]"
elif [ `hostname` == domU* ]; then
  # green on VMs (EC2, vbox, etc)
  export PS1="\[\033[1;32m\]\u@\h \w \$ \[\033[0m\]"
else
  # purple for unknown hosts
  export PS1="\[\033[1;35m\]\u@\h \w \$ \[\033[0m\]"
fi

if [ -f $HOME/bin/tat.sh ]; then
  source $HOME/bin/tat.sh # tmux completion
fi

# Source from elsewhere
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

PROJECT_PARENT_DIRS[0]="$HOME/src"

if [ -f $ETC_PATH/bash/aliases.sh ]; then
    . $ETC_PATH/bash/aliases.sh
fi

if [ -f $ETC_PATH/bash/git.sh ]; then
    . $ETC_PATH/bash/git.sh
fi

if [ -f $ETC_PATH/bash/git_prompt.sh ]; then
    . $ETC_PATH/bash/git_prompt.sh
fi

if [ -f $ETC_PATH/bash/exports.sh ]; then
. $ETC_PATH/bash/exports.sh
fi

if [ -f $ETC_PATH/bash/rails.sh ]; then
    . $ETC_PATH/bash/rails.sh
fi

if [ -f $ETC_PATH/bash/ssh_autocompletion.sh ]; then
    . $ETC_PATH/bash/ssh_autocompletion.sh
fi

if [ -f $ETC_PATH/bash/reagent.sh ]; then
    . $ETC_PATH/bash/reagent.sh
fi

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

if [ -f $HOME/.bash_aliases ]; then
  . $HOME/.bash_aliases
fi

if [ -f $HOME/src/leiningen/bash_completion.bash ]; then
  . $HOME/src/leiningen/bash_completion.bash
fi

if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
    . `brew --prefix`/etc/bash_completion.d/git-completion.bash
fi

function realias {
  . $ETC_PATH/bash/project_aliases.sh
}

if [ -f ~/.more_env.sh ]; then
  . ~/.more_env.sh
fi

export CC=/usr/bin/gcc

HISTCONTROL=ignoreboth:erasedups
shopt -s histappend
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
export JAVA_CMD=/usr/bin/java
