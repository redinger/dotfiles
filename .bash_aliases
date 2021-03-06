alias ls="ls -G"

alias emacs="open -a /Applications/Emacs.app/"
alias e="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -n"
alias emacsclient=e
alias eterm="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"

alias ll="ls -lh"
alias la="ls -a"
alias l="ls"
alias lla="ls -al"
alias ltr="ls -altr"

alias grep="grep --color=auto"

alias c="curl"
alias f="find"
alias g="git"
alias r="rgrep"
alias s="ssh"

# git
alias gst="git status"
alias gbv="git branch -v"
alias gb="git branch"
alias gco="git checkout"
alias glt="git log -n 10"

alias datomic-free=$HOME/.datomic-free/bin/datomic-free

alias sourcecode="truecrypt -t -k '' --protect-hidden=no $HOME/sourcecode.tc $HOME/src"