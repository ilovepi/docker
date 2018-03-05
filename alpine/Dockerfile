FROM alpine:latest

MAINTAINER Paul Kirth


#ENV DEBIAN_FRONTEND noninteractive

#get and install packages
RUN apk add --update &&     \
    apk add                 \
        ack                 \
        alpine-sdk          \
        autoconf            \
        autoconf            \
        automake            \
        binutils            \
        bison               \
        build-base          \
        byobu               \
        clang               \
        cmake               \
        coreutils           \
        ctags               \
        curl                \
        docker              \
        emacs               \
        findutils           \
        flex                \
        g++                 \
        gcc                 \
        git                 \
        gmp                 \
        grep                \
        libtool             \
        man                 \
        man-pages           \
        mpc                 \
        musl-dev            \
        nasm                \
        ncurses             \
        ncurses-dev         \
        ncurses-libs        \
        ncurses-terminfo    \
        neovim              \
        ninja               \
        nodejs              \
        openssh             \
        openssl             \
        pciutils            \
        py-pip              \
        python3             \
        ruby                \
        ruby-rake           \
        stow                \
        texinfo             \
        the_silver_searcher \
        tmux                \
        usbutils            \
        util-linux          \
        vim                 \
        wget                \
        zsh

## Set the locale
#RUN locale-gen en_US.UTF-8
#ENV LANG en_US.UTF-8
#ENV LANGUAGE en_US:en
#ENV LC_ALL en_US.UTF-8


RUN adduser -S paul -s /usr/bin/zsh -D
RUN echo 'paul ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

## Add the paul user, with passwordless sudo
# RUN useradd --user-group \
#             --create-home \
#             --shell /usr/bin/zsh \
#             paul && \
#             echo 'paul ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

#switch to paul user and /home/paul directory
USER paul
ENV HOME /home/paul
ENV USER paul
WORKDIR /home/paul


RUN mkdir -p .zsh .config
RUN curl -sL zplug.sh/installer | zsh
RUN git clone https://github.com/syl20bnr/spacemacs $HOME/.emacs.d
RUN git clone --recursive https://github.com/ilovepi/dotfiles.git

WORKDIR /home/paul/dotfiles
#RUN stow --target=$HOME zsh git vim spacemacs tmux byobu
RUN git remote set-url origin git@github.com:/ilovepi/dotfiles.git

WORKDIR /home/paul

# install spf13 vim
RUN curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && zsh spf13-vim.sh
RUN ln -s ~/.vim/ ~/.config/nvim
RUN ln -s ~/.vimrc ~/.config/nvim/init.vim

RUN sudo updatedb

# Run zsh as login shell
ENTRYPOINT ["/bin/zsh"]
CMD ["--login"]
