#!/bin/bash

set $GIT_USER_NAME = yout-user-name-here
set $GIT_USER_EMAIL = your-email-here

# minimal
# -------
sudo apt-get install neovim curl pm-utils

# vscode - https://code.visualstudio.com/docs/setup/linux
# ------
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install code

# git - https://git-scm.com/download/linux
# ----
sudo apt-get install git
git config --global user.name "$GIT_USER_NAME"
git config --global user.email "$GIT_USER_EMAIL"
git config --global alias.s "status"
git config --global alias.l "log -n 5"

curl -L https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh > ~/.bash_git

# ssh-key - https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/
# -------
ssh-keygen -t rsa -b 4096 -C "$GIT_USER_EMAIL" -N "" -f "~/.ssh/id_rsa"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

# .bash_aliases
# -------------
cp .bash_aliases ~/
