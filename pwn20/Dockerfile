FROM ubuntu:20.04

LABEL name g3un
LABEL email g3un98@gmail.com

ENV TZ Asia/Seoul
ENV PYTHONIOENCODING UTF-8

# Locale and timezone settings
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
RUN apt-get install -y fish git curl wget gdb neovim \
                       python3 python3-pip python3-dev git libssl-dev libffi-dev build-essential \
                       ruby &&\
    python3 -m pip install -U pip pwntools neovim &&\
    gem install one_gadget

# Install pwndbg
RUN git clone https://github.com/pwndbg/pwndbg ~/.pwndbg &&\
    cd ~/.pwndbg &&\
    ./setup.sh

# Neovim settings
RUN sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
          https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' &&\
    mkdir -p /root/.config/nvim
COPY init.vim /root/.config/nvim/init.vim
RUN nvim -c PlugInstall -c qa!

# Fish shell settings
RUN chsh -s `which fish`
COPY config.fish /root/.config/fish/config.fish

RUN apt-get update &&\
    apt-get upgrade -y &&\
    apt-get autoremove -y

CMD ["fish"]
