FROM ubuntu:22.04

LABEL name g3un
LABEL email g3un98@gmail.com

ENV TZ Asia/Seoul
ENV PYTHONIOENCODING UTF-8

# Copy static files
RUN mkdir -p /static
COPY zshrc /static/zshrc
COPY vim_plugins /static/vim_plugins
COPY vimrc /static/vimrc
COPY add_user.sh /static/add_user.sh
COPY start.sh /start.sh

# Set locale and timezone
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime &&\
    echo $TZ > /etc/timezone
COPY locale /etc/default/locale

# Replace apt server to "mirror.kakao.com"
RUN sed -i "s/[a-z\.]*\.com/mirror.kakao.com/g" /etc/apt/sources.list

# Install 32bit dependency packages
RUN dpkg --add-architecture i386 &&\
    apt-get update &&\
    apt-get install -y libc6:i386 libncurses5:i386 libstdc++6:i386

# Install packages
RUN apt-get install -y curl gcc gdb git openssh-server sudo vim wget zsh \
                       build-essential libffi-dev libssl-dev \
                       python3 python3-pip python3-dev \
                       ruby-dev

# Zsh shell settings
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sed 's/exec zsh -l//')" &&\
    ln -s /dracula-zsh/dracula.zsh-theme ~/.oh-my-zsh/themes/dracula.zsh-theme &&\
    cp /static/zshrc ~/.zshrc

# Neovim settings
RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &&\
    cp /static/vim_plugins ~/.vimrc &&\
    vim -c PlugInstall -c qa! &&\
    cp /static/vimrc ~/.vimrc

# Install python plugins
RUN pip3 install -U pip &&\
    pip3 install -U pwntools

# Install ruby plugins
RUN gem install one_gadget &&\
    gem install seccomp-tools

# Install pwndbg
RUN git clone https://github.com/pwndbg/pwndbg /pwndbg &&\
    cd /pwndbg &&\
    ./setup.sh

# Install themes
RUN git clone https://github.com/dracula/git.git /dracula-git &&\
    git clone https://github.com/dracula/zsh.git /dracula-zsh

RUN cp /dracula-git/config/gitconfig ~/.gitconfig &&\
    ln -sf /dracula-zsh/dracula.zsh-theme ~/.oh-my-zsh/themes/dracula.zsh-theme

RUN apt-get update &&\
    apt-get upgrade -y &&\
    apt-get autoremove -y

EXPOSE 22
CMD [ "/start.sh" ]
