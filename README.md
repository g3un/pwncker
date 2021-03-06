# Pwncker

Dockerfiles for pwnable.

## Versions

- pwn16 (ubuntu 16.04 LTS)
  - without ruby plugins
- pwn17 (ubuntu 17.10)
  - without ruby plugins
- pwn18 (ubuntu 18.04 LTS)
- pwn19 (ubuntu 19.10)
- pwn20 (ubuntu 20.04 LTS)
- pwn21 (ubuntu 21.10)
- pwn22 (ubuntu 22.04 LTS)

## Intalled packages

- zsh shell
  - [Oh My Zsh](https://ohmyz.sh)
  - add\_user script (`/static/add_user.zsh`)
    - usage: `/static/add_user.zsh [id]`
    - **don't forget to set password** (`passwd [id]`)
- vim
  - [vim-plug](https://github.com/junegunn/vim-plug)
    - [preservim/nerdtree](https://github.com/preservim/nerdtree)
    - [vim-airline/vim-airline](https://github.com/vim-airline/vim-airline)
    - [jeetsukumaran/vim-buffergator](https://github.com/jeetsukumaran/vim-buffergator)
    - [Yggdroot/indentLine](https://github.com/Yggdroot/indentLine)
    - [dracula/vim](https://github.com/dracula/vim)
- gdb
  - [pwndbg](https://github.com/pwndbg/pwndbg) (`/pwndbg`)
- python3
  - [pwntools](https://github.com/Gallopsled/pwntools)
  - [ROPgadget](https://github.com/JonathanSalwan/ROPgadget)
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
