FROM debian:latest

MAINTAINER Paul Kirth

ENV DEBIAN_FRONTEND noninteractive

#get and install packages
RUN apt-get update &&                        \
        apt-get upgrade -y &&                \
        apt-get install -y apt-utils         \
            ack-grep                         \
            apt-transport-https              \
            autoconf                         \
            autoconf2.13                     \
            autotools-dev                    \
            bison                            \
            build-essential                  \
            byobu                            \
            ccache                           \
            clang                            \
            clang-format                     \
            clang-tidy                       \
            cmake                            \
            curl                             \
            docker                           \
            emacs                            \
            exuberant-ctags                  \
            fd-find                          \
            flex                             \
            g++                              \
            gcc                              \
            git                              \
            git-extras                       \
            git-flow                         \
            golang-go                        \
            gperf                            \
            keychain                         \
            libbz2-dev                       \
            libcurl4-openssl-dev             \
            libdbus-1-dev                    \
            libegl1-mesa-dev                 \
            libfreetype6-dev                 \
            libgl1-mesa-dri                  \
            libgles2-mesa-dev                \
            libglib2.0-dev                   \
            libglu1-mesa-dev                 \
            libgmp-dev                       \
            libgstreamer-plugins-bad1.0-dev  \
            libgstreamer-plugins-base1.0-dev \
            libgstreamer1.0-dev              \
            libharfbuzz-dev                  \
            liblzma-dev                      \
            libmpc-dev                       \
            libmpfr-dev                      \
            libosmesa6-dev                   \
            libpcre3-dev                     \
            libssl-dev                       \
            libunwind-dev                    \
            libx11-dev                       \
            libxml2-dev                      \
            libxmu-dev                       \
            libxmu6                          \
            lld                              \
            llvm                             \
            llvm-dev                         \
            locales                          \
            locales-all                      \
            locate                           \
            man                              \
            nasm                             \
            neovim                           \
            ninja-build                      \
            nodejs                           \
            openssh-server                   \
            openssl                          \
            python                           \
            python-dev                       \
            python-pip                       \
            python-virtualenv                \
            python3                          \
            python3-dev                      \
            python3-pip                      \
            rake                             \
            ripgrep                          \
            ruby                             \
            software-properties-common       \
            stow                             \
            sudo                             \
            texinfo                          \
            tmux                             \
            vim-gtk                          \
            virtualenv                       \
            wget                             \
            xorg-dev                         \
            zsh                              \
        && apt-get autoremove -y             \
        && apt-get clean                     \
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
