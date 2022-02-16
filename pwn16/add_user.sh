#!/bin/bash

# Arguments check
if [ -z $1 ]; then
    echo "Usage: /static/add_user.sh [id]"
    exit 1
fi

# Add user via useradd
useradd -g users -G sudo -m -s `which zsh` $1

# Zsh shell settings
su - $1 -c "cp /static/zshrc ~/.zshrc"

# Neovim settings
su - $1 -c "curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
                     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
                 cp /static/vim_plugins ~/.vimrc && \
                 vim -c PlugInstall -c qa! && \
                 cp /static/vimrc ~/.vimrc"

# Install pwndbg
su - $1 -c "echo 'source /pwndbg/gdbinit.py' > ~/.gdbinit"

echo "Don't forget to set the password"
exit 0
