#!/usr/bin/env bash

set -e

cd `dirname $0`
export DOTFILES=`pwd`
source $DOTFILES/install_functions.sh

echo "Symlinking dotfiles..."

link_with_backup .ackrc
link_with_backup .aspell.en.pws
link_with_backup .bash_aliases
link_with_backup .bash_profile
link_with_backup .bashrc
link_with_backup .chars
link_with_backup .clj_completions
link_with_backup .emacs.d
link_with_backup .gemrc
link_with_backup .gitconfig
link_with_backup .gitignore_global
link_with_backup .inputrc
link_with_backup .irbrc
link_with_backup .profile
link_with_backup .rdebugrc
link_with_backup .tmux.conf

mkdir -p $HOME/.ssh
if [ ! -r "$HOME/.ssh/config" ]; then
  ln -s "$HOME/src/dotfiles/.sshconfig" "$HOME/.ssh/config"
fi

echo "Remember to rename the .emacs.d/redinger folder if you are not redinger"
