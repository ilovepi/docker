FROM debian:latest

MAINTAINER Paul Kirth

ENV DEBIAN_FRONTEND noninteractive

#get and install packages
RUN apt-get update &&                \
        apt-get upgrade -y &&        \
        apt-get install -y apt-utils \
        software-properties-common   \
        build-essential              \
        sudo                         \
        vim-gtk                      \
        neovim                       \
        zsh                          \
        git                          \
        git-extras                   \
        git-flow                     \
        gcc                          \
        g++                          \
        golang-go                    \
        bison                        \
        flex                         \
        wget                         \
        curl                         \
        libcurl4-openssl-dev         \
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
        ack-grep                     \
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
        lld                          \
        llvm                         \
        llvm-dev                     \
        openssh-server               \
        emacs                        \
        man                          \
        keychain                     \
        locales                      \
        locales-all                  \
        locate                       \
        fd-find                      \
        ripgrep                      \
        && apt-get autoremove -y     \
        && apt-get clean             \
        && rm -rf /var/lib/apt/lists/*
       #lsb                          \
       #nodejs-legacy                \


## Set the locale
RUN locale-gen "en_US.UTF-8"
ENV LANG "en_US.UTF-8"
ENV LANGUAGE "en_US:en"
ENV LC_ALL "en_US.UTF-8"
RUN update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8


# Run zsh as login shell
ENTRYPOINT ["/usr/bin/zsh"]
CMD ["--login"]
