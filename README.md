# Pwncker

Dockerfiles for pwnable.

## Versions

- pwn16 (ubuntu 16.04 LTS)
  - without ruby
- pwn17 (ubuntu 17.10)
  - without ruby
- pwn18 (ubuntu 18.04 LTS)
- pwn19 (ubuntu 19.10)
- pwn20 (ubuntu 20.04 LTS)
- pwn21 (ubuntu 21.10)

## Features

- fish shell
  - add\_user function (`/static/add_user.sh`)
    - please execute `source /static/add_user.fish`, before use the function
    - usage: `/static/add_user [id]`
    - **don't forget to set password** (`passwd [id]`)
- vim
  - [vim-plug](https://github.com/junegunn/vim-plug)
    - [nerdtree](https://github.com/preservim/nerdtree)
    - [vim-buffergator](https://github.com/jeetsukumaran/vim-buffergator)
    - [vim-buftabline](https://github.com/ap/vim-buftabline)
    - [indentLine](https://github.com/Yggdroot/indentLine)
    - [seoul256.vim](https://github.com/junegunn/seoul256.vim)
    - [vim-easymotion](https://github.com/easymotion/vim-easymotion)
    - [vim-nerdtree-syntax-highlight](https://github.com/tiagofumo/vim-nerdtree-syntax-highlight)
- gdb
  - [pwndbg](https://github.com/pwndbg/pwndbg) (`/pwndbg`)
- python3
  - [pwntools](https://github.com/Gallopsled/pwntools)
- ruby
  - [OneGadget](https://github.com/david942j/one_gadget)
  - [Seccomp Tools](https://github.com/david942j/seccomp-tools)
- etc.
  - git
  - wget
  - curl
  - sudo
  - openssh server
  - 32bit depedency packages
