FROM debian:stretch

MAINTAINER Paul Kirth

ENV DEBIAN_FRONTEND noninteractive

#get and install packages
RUN apt-get update &&               \
       apt-get install -y apt-utils \
       software-properties-common   \
       build-essential              \
       sudo                         \
       lsb                          \
       vim                          \
       neovim                       \
       zsh                          \
       git                          \
       gcc                          \
       g++                          \
       bison                        \
       flex                         \
       wget                         \
       curl                         \
       python-pip                   \
       byobu                        \
       tmux                         \
       autotools-dev                \
       autoconf                     \
       ninja-build                  \
       python3                      \
       python3-dev                  \
       python3-pip                  \
       exuberant-ctags              \
       ruby                         \
       rake                         \
       nodejs                       \
       nodejs-legacy                \
       ack-grep                     \
       silversearcher-ag            \
       apt-transport-https          \
       cmake                        \
       docker                       \
       libgmp-dev                   \
       libmpc-dev                   \
       libmpfr-dev                  \
       nasm                         \
       texinfo                      \
       openssl                      \
       libssl-dev                   \
       libxml2-dev                  \
       stow                         \
       libpcre3-dev                 \
       clang                        \
       clang-format                 \
       clang-tidy                   \
       openssh-server               \
       emacs                        \
       man                          \
       keychain                     \
       locales                      \
       locales-all                  \
       vim-gtk                      \
    && apt-get autoremove


## Set the locale
RUN locale-gen "en_US.UTF-8"
ENV LANG "en_US.UTF-8"
ENV LANGUAGE "en_US:en"
ENV LC_ALL "en_US.UTF-8"
RUN update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8


## Add the paul user, with passwordless sudo
RUN useradd --user-group \
            --create-home \
            --shell /usr/bin/zsh \
            paul && \
            echo 'paul ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

#switch to paul user and /home/paul directory
USER paul
ENV HOME /home/paul
ENV USER paul
WORKDIR /home/paul


RUN mkdir .zsh
RUN curl -sL zplug.sh/installer | zsh
RUN git clone https://github.com/syl20bnr/spacemacs $HOME/.emacs.d
RUN git clone https://github.com/ilovepi/dotfiles.git

WORKDIR /home/paul/dotfiles
RUN stow --target=$HOME zsh git vim spacemacs

WORKDIR /home/paul

# install spf13 vim
RUN sh <(curl https://j.mp/spf13-vim3 -L)

# Run zsh as login shell
ENTRYPOINT ["/usr/bin/zsh"]
CMD ["--login"]
