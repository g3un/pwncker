# Pwncker

Dockerfiles for pwnable.

## pwn20

Ubuntu 20.04 based image.

### Features

- fish shell
    - add_user function (`/static/adduser_.fish`)
        - please execute `source /static/add_user.fish`, before use the function
        - usage: `add_user [id]`
        - **don't forget to set password** (`passwd [id]`)
- [neovim](https://github.com/neovim/neovim)
    - [vim-plug](https://github.com/junegunn/vim-plug)
        - [nerdtree](https://github.com/preservim/nerdtree)
        - [vim-buffergator](https://github.com/jeetsukumaran/vim-buffergator)
        - [vim-buftabline](https://github.com/ap/vim-buftabline)
        - [indentLine](https://github.com/Yggdroot/indentLine)
        - [vim-easymotion](https://github.com/easymotion/vim-easymotion)
        - [seoul256.vim](https://github.com/junegunn/seoul256.vim)
        - [vim-nerdtree-syntax-highlight](https://github.com/tiagofumo/vim-nerdtree-syntax-highlight)
- gdb
    - [pwndbg](https://github.com/pwndbg/pwndbg) (`/pwndbg`)
- python3
    - [pwntools](https://github.com/Gallopsled/pwntools)
    - neovim (execute `:checkhealth provider` via neovim)
- ruby
    - [one_gadget](https://github.com/david942j/one_gadget)
- etc.
    - git
    - wget
    - curl
    - sudo
    - openssh server
    - 32bit depedency packages

## pwn18

Ubuntu 18.04 based image.
