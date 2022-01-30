#!/usr/bin/fish

function add_user
    # Arguments check
    if test -z "$argv[1]"
        echo "Usage: add-user [id]"
        return 1
    end

    # Add user via useradd
    useradd -g users -G sudo -m -s /usr/bin/fish $argv[1]

    # Fish shell settings
    su - $argv[1] -c "mkdir -p ~/.config/fish; and \
                     cp /static/config.fish ~/.config/fish/config.fish"

    # Neovim settings
    su - $argv[1] -c "curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
                         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim; and \
                     mkdir -p ~/.config/nvim; and \
                     cp /static/init.vim ~/.config/nvim/init.vim; and \
                     nvim -c PlugInstall -c qa!"

    # Install pwndbg
    su - $argv[1] -c "echo 'source /pwndbg/gdbinit.py' > ~/.gdbinit"

    echo "Don't forget to set the password"
    return 0
end
