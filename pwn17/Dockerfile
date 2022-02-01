FROM ubuntu:17.10

LABEL name g3un
LABEL email g3un98@gmail.com

ENV TZ Asia/Seoul
ENV PYTHONIOENCODING UTF-8

# Copy static files
RUN mkdir -p /static
COPy config.fish /static/config.fish
COPy vim_plugins /static/vim_plugins
COPy vimrc /static/vimrc
COPY add_user.fish /static/add_user.fish

# Set locale and timezone
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime &&\
    echo $TZ > /etc/timezone
COPY locale /etc/default/locale

# Replace apt server to "old-releases.ubuntu.com"
RUN sed -i "s/[a-z\.]*\.com/old-releases.ubuntu.com/g" /etc/apt/sources.list

# Install 32bit dependency packages
RUN dpkg --add-architecture i386 &&\
    apt-get update &&\
    apt-get install -y libc6:i386 libncurses5:i386 libstdc++6:i386

# Install packages
RUN apt-get install -y fish git curl wget gdb vim sudo openssh-server \
                       python3 python3-pip python3-dev git libssl-dev libffi-dev build-essential

# Fish shell settings
RUN mkdir -p ~/.config/fish &&\
    cp /static/config.fish ~/.config/fish/config.fish

# Neovim settings
RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &&\
    cp /static/vim_plugins ~/.vimrc &&\
    vim -c PlugInstall -c qa! &&\
    cp /static/vimrc ~/.vimrc

# Install python plugins
RUN python3 -m pip install --upgrade pip &&\
    python3 -m pip install --upgrade pwntools

# Install pwndbg
RUN git clone https://github.com/pwndbg/pwndbg /pwndbg &&\
    cd /pwndbg &&\
    ./setup.sh

RUN apt-get update &&\
    apt-get upgrade -y &&\
    apt-get autoremove -y

CMD [ "fish" ]
