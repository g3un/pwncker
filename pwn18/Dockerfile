FROM ubuntu:18.04

LABEL name g3un
LABEL email g3un98@gmail.com

ENV TZ Asia/Seoul
ENV PYTHONIOENCODING UTF-8

# Copy static files
RUN mkdir -p /static
COPy config.fish /static/config.fish
COPy init.vim /static/init.vim
COPY add_user.fish /static/add_user.fish

# Set locale and timezone
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime &&\
    echo $TZ > /etc/timezone
COPY locale.conf /etc/locale.conf

# Replace apt server to "mirror.kakao.com"
RUN sed -i "s/[a-z\.]*\.com/mirror.kakao.com/g" /etc/apt/sources.list

# Install 32bit dependency packages
RUN dpkg --add-architecture i386 &&\
    apt-get update &&\
    apt-get install -y libc6:i386 libncurses5:i386 libstdc++6:i386

# Install packages
RUN apt-get install -y fish git curl wget gdb neovim sudo openssh-server \
                       python3 python3-pip python3-dev git libssl-dev libffi-dev build-essential \
                       ruby &&\
    python3 -m pip install -U pip &&\
    python3 -m pip install -U pwntools &&\
    python3 -m pip install -U neovim &&\
    gem install one_gadget

# Fish shell settings
RUN fish -c "mkdir -p ~/.config/fish; and \
            cp /static/config.fish ~/.config/fish/config.fish"

# Neovim settings
RUN fish -c "curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
                https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim; and \
            mkdir -p ~/.config/nvim; and \
            cp /static/init.vim ~/.config/nvim/init.vim; and \
            nvim -c PlugInstall -c qa!"

# Install pwndbg
RUN fish -c "git clone https://github.com/pwndbg/pwndbg /pwndbg; and \
            cd /pwndbg; and \
            ./setup.sh"

RUN apt-get update &&\
    apt-get upgrade -y &&\
    apt-get autoremove -y

CMD ["fish"]
