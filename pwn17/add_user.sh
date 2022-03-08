#!/usr/bin/zsh

# Arguments check
if [ 1 -ne $# ]; then
    echo "Usage: /static/add_user.sh [id]"
    exit 1
fi

# Add user via useradd
useradd -g users -G sudo -m -s /usr/bin/zsh $1

# Zsh shell settings
su - $1 -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sed 's/exec zsh -l//') &&\
            cp /static/zshrc ~/.zshrc"

# Neovim settings
su - $1 -c "curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
                https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &&\
            cp /static/vim_plugins ~/.vimrc &&\
            vim -c PlugInstall -c qa! &&\
            cp /static/vimrc ~/.vimrc"

# Install pwndbg
su - $1 -c "echo 'source /pwndbg/gdbinit.py' > ~/.gdbinit"

# Install themes
su - $1 -c "cp /dracula-git/config/gitconfig ~/.gitconfig &&\
            ln -sf /dracula-zsh/dracula.zsh-theme ~/.oh-my-zsh/themes/dracula.zsh-theme"

echo "Don't forget to set the password"
exit 0
